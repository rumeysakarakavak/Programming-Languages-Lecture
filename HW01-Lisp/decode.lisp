; *********************************************
; *  341 Programming Languages                *
; *  Fall 2019                                *
; *  Author: Yakup Genc                       *
; *  Name : Rumeysa KARAKAVAK                 *
; *  ID : 141044063                           *
; *********************************************

;;;;; i've tried to append spaces between characters so hard but i could not do

; (loop for ch in *readDoc* doing
  
;         (loop for i from 0 below (length (list-to-string ch))  doing
;               (progn
;                 (print(coerce (list-to-string ch)'list))
;                 )))


(load "include.lisp") ;; "c2i and "i2c"

(defparameter *readDoc* '())
(defparameter *listDoc* '())


(defun string-to-list (str)
        (if (not (streamp str))
           (string-to-list (make-string-input-stream str))
           (if (listen str)
               (cons (read str) (string-to-list str))
               nil)))
(defun read-as-list (filename)
  (tokenize filename))

(defun tokenize (string)
  (loop
     for start = 0 then (+ space 1)
     for space = (position #\space string :start start)
     for token = (subseq string start space)
     do (push (string-to-list token) *readDoc*)
     unless (string= token "") collect token
     until (not space)))

(defparameter *corpus*
   (with-open-file (stream "document1.txt" :direction :input)
     (loop for line = (read-line stream nil)
           while line
           append (tokenize line))))

(loop for x in *readDoc*
  do (push  x *listDoc*))


;; -----------------------------------------------------
;; HELPERS
;; *** PLACE YOUR HELPER FUNCTIONS BELOW ***

(defun spell-checker-0 (word)
  ;you should implement this function
)

(defun spell-checker-1 (word)
  ;you should implement this function
)


;; -----------------------------------------------------
;; DECODE FUNCTIONS

(defun Gen-Decoder-A (paragraph)
  ;you should implement this function
)

(defun Gen-Decoder-B-0 (paragraph)
    ;you should implement this function
)

(defun Gen-Decoder-B-1 (paragraph)
    ;you should implement this function
)

(defun Code-Breaker (document decoder)
    ;you should implement this function
)


;ENCODER PART
;********************************************************************************************************


(defun convert-alphabet (ch)
  ; takes a char, converts cipher char
  (case ch
    ('a 'd) ('b 'e) ('c 'f) ('d 'p) ('e 'q) ('f 'a) ('g 'b) ('h 'k) ('i 'l) 
    ('j 'c) ('k 'r) ('l 's) ('m 't) ('n 'g) ('o 'y) ('p 'z) ('q 'h) ('r 'i) 
    ('s 'j) ('t 'm) ('u 'n) ('v 'o) ('w 'u) ('x 'v) ('y 'w) ('z 'x)
  ))

(defun encode-word (word)
  (if (null word) ()
    (append (list (convert-alphabet (car word))) (encode-word (cdr word)))
  ))

(defun encode-list (lists)
  (if (null lists) ()
    (append (list (encode-word (car lists))) (encode-list (cdr lists)))))

(defun list-to-string (lst)
    (format nil "~{~A~}" lst))



;END OF ENCODER PART
;********************************************************************************************************

;********************************************************************************************************
;CONVERTER PART

(defun convertCharacter (x)
    (cond
      ((eq x 'a) 0) ((eq x 'b) 1) ((eq x 'c) 2) ((eq x 'd) 3) ((eq x 'e) 4) ((eq x 'f) 5)
      ((eq x 'g) 6) ((eq x 'h) 7) ((eq x 'i) 8) ((eq x 'j) 9) ((eq x 'k) 10) ((eq x 'l) 11)
      ((eq x 'm) 12) ((eq x 'n) 13) ((eq x 'o) 14) ((eq x 'p) 15) ((eq x 'q) 16) ((eq x 'r) 17)
      ((eq x 's) 18) ((eq x 't) 19) ((eq x 'u) 20) ((eq x 'v) 21) ((eq x 'w) 22) ((eq x 'x) 23)
      ((eq x 'y) 24) ((eq x 'z) 25)))

(defun convertInteger (x)
    (cond
      ((eq x 0) 'a) ((eq x 1) 'b) ((eq x 2) 'c) ((eq x 3) 'd) ((eq x 4) 'e) ((eq x 5) 'f)
      ((eq x 6) 'g) ((eq x 7) 'h) ((eq x 8) 'i) ((eq x 9) 'j) ((eq x 10) 'k) ((eq x 11) 'l)
      ((eq x 12) 'm) ((eq x 13) 'n) ((eq x 14) 'o) ((eq x 15) 'p) ((eq x 16) 'q) ((eq x 17) 'r)
      ((eq x 18) 's) ((eq x 19) 't) ((eq x 20) 'u) ((eq x 21) 'v) ((eq x 22) 'w) ((eq x 23) 'x)
      ((eq x 24) 'y) ((eq x 25) 'z)))

(defun convertList (fn l)
    (if (null l)
       ()
       (append (list (funcall fn (car l))) (apply-list fn (cdr l)))))
;END OF CONVERTER PART
;********************************************************************************************************

;********************************************************************************************************
;OCCURANCE PART

(defun letters-occurences (llist)
  (let* ((arr (make-array 26 :initial-element 0)))
    (loop for word in llist do
      (loop for item in word do
        (loop for ch in item do
          (setf (aref arr (convertCharacter ch)) (1+ (aref arr (convertCharacter ch)))))))
    arr))
    ; return result arr

;END OF OCCURANCE PART
;********************************************************************************************************
;TEST PART
;********************************************************************************************************
;; Test code...
(defun test_on_test_data ()
  (print "....................................................")
  (print "Testing ....")
  (print "....................................................")
  (format t "~%" )
  (let (doc (read-as-list "document1.txt"))
    
  )(format t "~a ~%" *listDoc*)

)

(defparameter *test-list* '((H E L L O)(T H I S)(I S)(A)(T E S T)))
(defun test-encode ()
  (format t "encoded list ~a : ~a ~%" *test-list* (encode-list *test-list*))
)


;; test code...
(test_on_test_data )
(test-encode)
(print " a b c d e f g h i j k l m n o p q r s t u v w x y z")
(print (letters-occurences (list *test-list*)))
; Test code...
;END OF TEST PART
;********************************************************************************************************
