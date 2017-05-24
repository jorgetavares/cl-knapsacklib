;;;;
;;;; cl-knapsacklib
;;;;

(in-package :cl-knapsacklib)

;;;
;;; base 
;;;

(defparameter *mkp-datasets-types* '(:gk :cb :ccp :literature))


;;;
;;; protocol and definitions for parsing 
;;; and handling a single instance
;;;

;; protocol

(defgeneric name (instance)
  (:documentation "Knapsack instance name."))

(defgeneric objects-number (instance)
  (:documentation "Number of objects."))

(defgeneric knapsacks-number (instance)
  (:documentation "Number of knapsacks."))

(defgeneric profits (instance)
  (:documentation "Profits of each object."))

(defgeneric constraints (instance)
  (:documentation "Constraints of the knapsacks."))

(defgeneric capacities (instance)
  (:documentation "Capacities of each knapsack."))

(defgeneric best-value (instance)
  (:documentation "Optimum or best known solution."))

(defgeneric constraint (instance n m)
  (:documentation "Return constraint at N object and M knapsack."))

(defgeneric capacity (instance m)
  (:documentation "Return capacity of knapsack M."))

(defgeneric profit (instance n)
  (:documentation "Return profit of object N."))


;; classes 

(defclass knapsack ()
  ((name        :initarg :name             :reader name)
   (objects     :initarg :objects-number   :reader objects-number)
   (profits     :initarg :profits          :reader profits)
   (constraints :initarg :constraints      :reader constraints)
   (capacities  :initarg :capacities       :reader capacities)
   (best-value  :initarg :best-value       :reader best-value)))
  
(defclass multi-knapsack (knapsack)
  ((knapsacks   :initarg :knapsacks-number :reader knapsacks-number)))


;; methods

(defmethod profit ((instance knapsack) n)
  (aref (profits instance) n))

(defmethod constraint ((instance multi-knapsack) n m)
  (aref (constraints instance) n m))

(defmethod capacity ((instance multi-knapsack) m)
  (aref (capacities instance) m))

(defmethod print-object ((instance multi-knapsack) stream)
   (print-unreadable-object (instance stream :type t)
    (with-slots (name objects knapsacks best-value) instance
      (format stream "~a ~a ~a ~a" name objects knapsacks best-value)))) 
  

;; functions

(defun make-multi-knapsack (name n m profits constraints capacities best-value)
  (make-instance 'multi-knapsack 
		 :name name
		 :objects-number n
		 :knapsacks-number m
		 :profits profits
		 :constraints constraints
		 :capacities capacities 
		 :best-value best-value))
