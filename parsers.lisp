;;;;
;;;; parsers (only MKP variant for now)
;;;;

(in-package :cl-knapsacklib)

;;;
;;; mkp
;;;

(defun parse-mkp (filename &key dataset)
  (multiple-value-bind (name n m profits constraints capacities best-value)
      (case dataset
	(:gk         (parse-gk-file filename))
	(:cb         (parse-cb/ccp-file filename "cb"))
	(:ccp        (parse-cb/ccp-file filename "ccp"))
	(:literature (parse-literature-file filename))
	(otherwise   (error "No dataset type specified.")))
    (make-multi-knapsack name n m profits constraints capacities best-value)))

(defun parse-gk-file (filename)
  (with-open-file (input filename :direction :input)
    (let* ((name (read input))
	   (n (read input))
	   (m (read input))
	   (profits (make-array n))
	   (capacities (make-array m))
	   (constraints (make-array `(,n ,m))))
      (loop for i below n
	 do (progn 
	      (setf (aref profits i) (read input))
	      (loop for j below m
		 do (setf (aref constraints i j) (read input)))))
      (loop for k below m
	 do (setf (aref capacities k) (read input)))
      (values name n m profits constraints capacities 0))))
	
(defun parse-cb/ccp-file (filename dataset)
  (with-open-file (input filename :direction :input)
    (let* ((n (read input))
	   (m (read input))
	   (best-value (read input))
	   (name (format nil "~a_~a_~a" dataset n m))
	   (profits (make-array n))
	   (capacities (make-array m))
	   (constraints (make-array `(,n ,m))))
      (loop for p below n
	 do (setf (aref profits p) (read input)))
      (loop for i below m
	 do (loop for j below n
	       do (setf (aref constraints j i) (read input))))
      (loop for k below m
	 do (setf (aref capacities k) (read input)))
      (values name n m profits constraints capacities best-value))))

(defun parse-literature-file (filename)
  (with-open-file (input filename :direction :input)
    (let* ((name (read input))
	   (m (read input))
	   (n (read input))
	   (profits (make-array n))
	   (capacities (make-array m))
	   (constraints (make-array `(,n ,m))))
      (loop for p below n
	 do (setf (aref profits p) (read input)))
      (loop for k below m
	 do (setf (aref capacities k) (read input)))
      (loop for i below m
	 do (loop for j below n
	       do (setf (aref constraints j i) (read input))))
      (values name n m profits constraints capacities (read input)))))
