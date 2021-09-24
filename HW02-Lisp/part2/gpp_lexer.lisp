;(comment

; Created by Rumeysa KARAKAVAK [141044063]

; -This is the implementation file of the lexer that does the
;  tokenization of a given G++ program in a file.
; -Lexer function should takes a file name and 
;  perform lexical analysis of the program contained within this file.
;)

(defparameter *my-parse* NIL)

; reads the file line by line
(defun read-file-function (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
          while line
          collect (string-trim '(#\Space #\Tab #\Newline) line))
    ))

; splits the string by space
(defun split-function (chars str &optional (lst nil) (accm ""))
  (cond
    ((= (length str) 0) (reverse (cons accm lst)))
    (t
     (let ((c (char str 0)))
       (if (member c chars)
      (split-function chars (subseq str 1) (cons accm lst) "")
      (split-function chars (subseq str 1) lst (concatenate 'string accm (string c)))
       )
     )
    )
  )
)

;lexer function who did the main task
(defun gppinterpreter (filename)
(setq x 0)
(setq y 0)
(setq z 0)
  (loop
    
    (setq y 0)
    (setq z (length (split-function '(#\space) (nth x (read-file-function filename)))))

    (loop

      (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0
                                1) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
      ;; if starts left paranthesis and there is no space between paranthesis and letter.
      (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 1)  "(")
        
        (progn (push  '("OP_OP") *my-parse*)

          (setq flag 0)

          (if (> (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1 )
            (progn  
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "deffun")
                (progn
                  (push  '("KW_DEFFUN") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "true")
                (progn
                  (push  '("KW_TRUE") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "false")
                (progn
                  (push  '("KW_FALSE") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "disp")
                (progn
                  (push  '("KW_DISP") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "and")
                (progn
                  (push  '("KW_AND") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "list")
                (progn
                  (push  '("KW_LIST") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "or")
                (progn
                  (push  '("KW_OR") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "not")
                (progn
                  (push  '("KW_NOT") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "equal")
                (progn
                  (push  '("KW_EQUAL") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "append")
                (progn
                  (push  '("KW_APPEND") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "concat")
                (progn
                  (push  '("KW_CONCAT") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "set")
                (progn
                  (push  '("KW_SET") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "for")
                (progn
                  (push  '("KW_FOR") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "while")
                (progn
                  (push  '("KW_WHILE") *my-parse*)
                  (setq flag 1)
                )
              ) 
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "if")
                (progn
                  (push  '("KW_IF") *my-parse*)
                  (setq flag 1)
                )
              ) 
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "load")
                (progn
                  (push  '("KW_LOAD") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "nil")
                (progn
                  (push  '("KW_NIL") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "less")
                (progn
                  (push  '("KW_LESS") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "exit")
                (progn
                  (push  '("KW_EXIT") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "+")
                (progn
                  (push  '("OP_PLUS") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "-")
                (progn
                  (push  '("OP_MINUS") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "/")
                (progn
                  (push  '("OP_DIV") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "*")
                (progn
                  (push  '("OP_MULT") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "**")
                (progn
                  (push  '("OP_DBLMULT") *my-parse*)
                  (setq flag 1)
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "0")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "1")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "2")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "3")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "4")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "5")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "6")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "7")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "8")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                )
              )
              (if (equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "9")
                (progn
                  (setq flag 1)
                  (push (list "VALUE"
                    ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                    ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                    ) *my-parse*)
                  (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                  
                )
                (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ";;")
                (progn (push (list "COMMENT") *my-parse*) ))
              )
            
              
              (if (= flag 0)

                (progn 
                (push (list "IDENTIFIER" 
                  ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 1 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))

                  )  *my-parse*)
                "(push (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) *my-parse*)"

                (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                  
              )
                )
                  ;(push (list "OP_CP") *my-parse*) 
            )
            
          )
          
      )
      ;; if there is space between ( and character.
          (progn
          (setq flag 0)
          (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  ")")
          (progn (setq flag 1)
                  (push  '("OP_CP") *my-parse*)))


          (cond ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "0")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "1")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "2")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "3")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "4")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "5")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "6")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "7")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "8")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) "")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) 0 1) "9")
              (push (list "VALUE"
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                ) *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
            )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "deffun")
                (progn
                  (push  '("KW_DEFFUN") *my-parse*)
                  (setq flag 1)
                )
              )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "equal")
                (progn
                  (push  '("KW_EQUAL") *my-parse*)
                  (setq flag 1)
                )
            )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "list")
                (progn
                  (push  '("KW_LIST") *my-parse*)
                  (setq flag 1)
                )
            )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "true")
                (progn
                  (push  '("KW_TRUE") *my-parse*)
                  (setq flag 1)
                )
            )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "false")
                (progn
                  (push  '("KW_FALSE") *my-parse*)
                  (setq flag 1)
                )
            )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "disp")
                (progn
                  (push  '("KW_DISP") *my-parse*)
                  (setq flag 1)
                )
            )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "and")
                (progn
                  (push  '("KW_AND") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "or")
                (progn
                  (push  '("KW_OR") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "not")
                (progn
                  (push  '("KW_NOT") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "equal")
                (progn
                  (push  '("KW_EQUAL") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "append")
                (progn
                  (push  '("KW_APPEND") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "concat")
                (progn
                  (push  '("KW_CONCAT") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "set")
                (progn
                  (push  '("KW_SET") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "for")
                (progn
                  (push  '("KW_FOR") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "while")
                (progn
                  (push  '("KW_WHILE") *my-parse*)
                  (setq flag 1)
                )
              ) 
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "if")
                (progn
                  (push  '("KW_IF") *my-parse*)
                  (setq flag 1)
                )
              ) 
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "nil")
                (progn
                  (push  '("KW_NIL") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "less")
                (progn
                  (push  '("KW_LESS") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "exit")
                (progn
                  (push  '("KW_EXIT") *my-parse*)
                  (setq flag 1)
                )
              )
            ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "load")
                (progn
                  (push  '("KW_LOAD") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "+")
                (progn
                  (push  '("OP_PLUS") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "-")
                (progn
                  (push  '("OP_MINUS") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "/")
                (progn
                  (push  '("OP_DIV") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "*")
                (progn
                  (push  '("OP_MULT") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  "**")
                (progn
                  (push  '("OP_DBLMULT") *my-parse*)
                  (setq flag 1)
                )
              )
              ((equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
                (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))  ";;")
                (progn
                  (push  '("COMMENT") *my-parse*)
                  (setq flag 1)
                )
              )
               
          ; i tried parse left paranthesis like an operator but time is up :(   
          ((if (= flag 0) 
            (if (<= 1 (length(nth y (split-function '(#\space) (nth x (read-file-function filename))))))
            (progn
              (setq i 0)
              (setq j 1)
              (loop 
                
                (progn
    
                (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) i j) " )")
                  (progn
                    ;(print "loop girdi")
                    (push (list "IDENTIFIER" 
                        ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 i)
                        ) *my-parse*)
                    (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))
                   
                    
                    (setq flag 1)
                  )
                )
                (progn
                  (setq i (+ i 1))
                  (setq j (+ j 1))
                )
                )
                (when (> j (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) (return j)))
              (if (= flag 0)
              (push (list "IDENTIFIER" 
                ;(subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) 0 
              ;(length (nth y (split-function '(#\space) (nth x (read-file-function filename))))))
                )  *my-parse*)
              (if (equal (subseq (nth y (split-function '(#\space) (nth x (read-file-function filename)))) (- (length (nth y (split-function '(#\space) (nth x (read-file-function filename))))) 1)
                                (length (nth y (split-function '(#\space) (nth x (read-file-function filename)))))) ")")
                (progn (push (list "OP_CP") *my-parse*) ))))
              ;(push (list "OP_CP") *my-parse*)))
              
            )
          )
          )


        )

    ) )
      
      (setq y (+ y 1))
      (when (>= y z) (return y))
    )
    
    (setq x (+ x 1))
    (when (>= x (length (read-file-function filename))) (return x))
  )
  ; reverse array
  ;(write (reverse *my-parse*))
  (defun print-list (elements)
    (cond
        ((null elements) '()) ;; Base case: There are no elements that have yet to be printed. Don't do anything and return a null list.
        (t
            ;; Recursive case
            ;; Print the next element.
            (write-line (write-to-string (car elements)))
            ;; Recurse on the rest of the list.
            (print-list (cdr elements))
        )
    )
)

(setq test-list (reverse *my-parse*))
(print-list test-list)
)

(gppinterpreter "filename.txt")

