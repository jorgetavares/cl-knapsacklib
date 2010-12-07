;;;;
;;;; cl-knapsack package
;;;;

(defpackage #:cl-knapsacklib
  (:use #:cl)
  (:export #:*mkp-datasets-types*
	   #:name
	   #:objects-number
	   #:knapsacks-number
	   #:profits
	   #:constraints
	   #:capacities
	   #:best-value
	   #:profit
	   #:constraint
	   #:capacity
	   #:make-multi-knapsack
	   #:parse-mkp
	   ))


