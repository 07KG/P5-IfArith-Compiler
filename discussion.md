# Discussion and Reflection


The bulk of this project consists of a collection of five
questions. You are to answer these questions after spending some
amount of time looking over the code together to gather answers for
your questions. Try to seriously dig into the project together--it is
of course understood that you may not grasp every detail, but put
forth serious effort to spend several hours reading and discussing the
code, along with anything you have taken from it.

Questions will largely be graded on completion and maturity, but the
instructors do reserve the right to take off for technical
inaccuracies (i.e., if you say something factually wrong).

Each of these (six, five main followed by last) questions should take
roughly at least a paragraph or two. Try to aim for between 1-500
words per question. You may divide up the work, but each of you should
collectively read and agree to each other's answers.

[ Question 1 ] 

For this task, you will three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac)
--START--
((mov-lit r0 2)
  (mov-lit r1 3)
  (mov-lit r2 0)
  (add r2 r1)
  (add r2 r0)
  (print r2))

((mov-lit r0 1)
  (mov-lit r1 2)
  (mov-lit r2 0)
  (add r2 r1)
  (add r2 r0)
  (print r2))

((mov-lit r0 5)
  (mov-lit r1 2)
  (mov-lit r2 0)
  (add r2 r1)
  (add r2 r0)
  (print r2))

ir-virtual is a linearized assembly with virtual registers. It uses registers to compute all operations. Compared to x86, ir-virtual representation is simpler and generally allows for more flexibility through the ability to save more variables on the stack if there aren’t enough registers. However, in larger programs ir-virtual can greatly slow things down.
--END--

[ Question 2 ] 

For this task, you will write four new .ifa programs. Your programs
must be correct, in the sense that they are valid. There are a set of
starter programs in the test-programs directory now. Your job is to
create three new `.ifa` programs and compile and run each of them. It
is very much possible that the compiler will be broken: part of your
exercise is identifying if you can find any possible bugs in the
compiler.

For each of your exercises, write here what the input and output was
from the compiler. Read through each of the phases, by passing in the
`-v` flag to the compiler. For at least one of the programs, explain
carefully the relevance of each of the intermediate representations.

For this question, please add your `.ifa` programs either (a) here or
(b) to the repo and write where they are in this file.

--START--
Input: (print (/ (* 10 (- 3 2)) 5))
Output: hash-ref no value found for the key; key: /
   1.5 - Input: (print (*(* 10 (- 3 2)) 5))
Output: 50

Input: 
(let* ([a 1] [b 2])
(let* ([b 3] [c b])
(let* ([a 4] [d a])
   			(print (* a (+ b (- d c)))))))
Output: 16

Input: 
(if (not #f)
   	3
   	(let* ([a 2] [b 3])
 		(+ a b)))
Output: hash-ref: no value found for key
  key: 'not

Input: (print (>> 1 10))
Output: hash-ref: no value found for key
  key: '>>
--END--

[ Question 3 ] 

Describe each of the passes of the compiler in a slight degree of
detail, using specific examples to discuss what each pass does. The
compiler is designed in series of layers, with each higher-level IR
desugaring to a lower-level IR until ultimately arriving at x86-64
assembler. Do you think there are any redundant passes? Do you think
there could be more?

In answering this question, you must use specific examples that you
got from running the compiler and generating an output.

[ Question 4 ] 

This is a larger project, compared to our previous projects. This
project uses a large combination of idioms: tail recursion, folds,
etc.. Discuss a few programming idioms that you can identify in the
project that we discussed in class this semester. There is no specific
definition of what an idiom is: think carefully about whether you see
any pattern in this code that resonates with you from earlier in the
semester.

--START--
Folds are used in the functions translated-instrs, reachable-labels, reg->stackpos, and registers. All of these use foldl, which applies a procedure on n lists and traverses those lists from left to right.  Both this project and project 4 made us create match cases for a compiler in a new language.
--END--

[ Question 5 ] 

In this question, you will play the role of bug finder. I would like
you to be creative, adversarial, and exploratory. Spend an hour or two
looking throughout the code and try to break it. Try to see if you can
identify a buggy program: a program that should work, but does
not. This could either be that the compiler crashes, or it could be
that it produces code which will not assemble. Last, even if the code
assembles and links, its behavior could be incorrect.

To answer this question, I want you to summarize your discussion,
experiences, and findings by adversarily breaking the compiler. If
there is something you think should work (but does not), feel free to
ask me.

Your team will receive a small bonus for being the first team to
report a unique bug (unique determined by me).

--START--
For these bugs, we were at first confused whether they were bugs in the first place or simply not in the language. By looking through other test cases as well as operations within like bop and uop, we determined that yes, they should exist and have some form of simplification throughout the compiler but still result in an error.
No matching case for ‘false’
hash-ref: no value found for key
  key: 'not
hash-ref: no value found for key
  key: '>>
--END--

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

--START--
We saw some challenges in getting used to and learning the different linking and execution conventions alongside code analysis. Overall, getting used to a new project style proved to be a challenge throughout. Arranging times to meet while we each had different exam schedules proved to be an additional point of stress and we had struggles getting files to execute on different machines. This did prove to be a learning experience in and of itself.

It was interesting to see a more thoroughly developed compiler. Additionally, the breakdown of different levels helped us understand different levels of languages.

We learned how to work as a team as we divided up work amongst one another and persevered through different obstacles throughout the project.

Next time, the best improvement might just be to tackle the project as early as possible.
--END--

