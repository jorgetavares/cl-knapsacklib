(defpackage #:cl-knapsacklib-system 
  (:use #:cl #:asdf))  
 
(in-package #:cl-knapsacklib-system)  
 
(defsystem :cl-knapsacklib
  :description "cl-knapsacklib: parsers and utilities for knapsack problem variants."  
  :version "0.1"  
  :author "Jorge Tavares <jorge.tavares@ieee.org>"  
  :licence "MIT"  
  :serial t
  :components ((:file "package")  
               (:file "knapsack")
	       (:file "parsers")))
