# cl-knapsacklib
This is a simple library that allows to parse Knapsack dataset files to be
used inside a Common Lisp program. The Knapsack datasets are from the Knapsacklib,
a collection from different types of datasets available in the web, and hopefully,
of different knapsack problem variants. At the moment only the Multidimensional
Knapsack Problem (MKP) is available.


# Install
1. if you have Quicklisp installed just extract the contents of cl-knapsacklib to
a source directory of your liking and recognized by Quicklisp. After that just
do (ql:quickload "cl-knapsacklib") and it's ready to be used.

2. Otherwise just use ASDF directly: (asdf:oos 'asdf:load-op :cl-knapsacklib)

3. This library does not depend on any other library and is written in pure CL
so it should run in any CL implementation.


# Quick Usage
From the REPL just call (cl-knapsacklib:parse-mkp <instance-file> :dataset <type>) to
parse a single MKP file. 

It will return an object containing the instance name, the
number of objects, number of knapsacks, a vector with the profits, a vector with the
capacities and a matrix with the constraints. If the instance has the known optimum 
or best-value, it will also include it (otherwise it is zero). 

The current available MKP datasets are :gk, :cb, :ccp and :literature. The knapsacklib 
containing the different datasets is available for the moment in the compressed file
knapsacklib.tar.gz.


# License
This project is licensed under the MIT license, see the LICENSE file for more details.
