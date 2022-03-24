(setq x (read-line))

	(defvar counter 0);
	(setf inp (coerce x 'list))
(defun loop-id-kw (inp temp_list)
	(loop
		
	)

)
(defun kw-iterate (inp)
	
	(setf counter (+ counter 1))
	(setf check_val 0)
		(if (equal (alpha-char-p (car inp)) t)
					(setf temp_list (push (car inp) temp_list))
	    )
	;loop fonksiyonu koy 
	;counteri arttir loop icinde 
	; identifier conditionlarini koy 

		(cond 
			  ( 
			    (and(equal '(#\e #\q #\u #\a #\l) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_EQUAL")
						(setf check_val 1)
					)
			  )	
			  ( 
			    (and(equal '(#\a #\n #\d) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_AND")
						(setf check_val 1)
					)
			  )

			  ( 
			    (and(equal '(#\o #\r) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_OR")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\n #\o #\t) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_NOT")
						(setf check_val 1)
					)
			  )

			  ( 
			    (and(equal '(#\l #\e #\s #\s) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_LESS")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\n #\i #\l) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_NIL")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\l #\i #\s #\t) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_LIST")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\a #\p #\p #\e #\n #\d) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_APPEND")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\c #\o #\n #\c #\a #\t) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_CONCAT")
						(setf check_val 1)
					)
			  )

			  ( 
			    (and(equal '(#\s #\e #\t) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_SET")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\d #\e #\f #\f #\u #\n) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_DEFFUN")
						(setf check_val 1)
					)
			  )	
			
			  ( 
			    (and(equal '(#\f #\o #\r) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_FOR")
						(setf check_val 1)
					)
			  )	
			  
			  ( 
			    (and(equal '(#\i #\f) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_IF")
						(setf check_val 1)
					)
			  )

			  ( 
			    (and(equal '(#\e #\x #\i #\t) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_EXIT")
						(setf check_val 1)
					)
			  )

			  ( 
			    (and(equal '(#\l #\o #\a #\d) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_LOAD")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\d #\i #\s #\p) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_DISP")
						(setf check_val 1)
					)
			  )	

			  ( 
			    (and(equal '(#\t #\r #\u #\e) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_TRUE")
						(setf check_val 1)
					)
			  )

			  ( 
			    (and(equal '(#\f #\a #\l #\s #\e) (reverse temp_list))(equal (alpha-char-p (car inp)) t))
					(progn			  		
						(print "KW_FALSE")
						(setf check_val 1)
					)
			  )	

		)
												; recursion kaldir 
	(if (equal (alpha-char-p (car (cdr inp))) t)
			(kw-iterate (cdr inp))
			(setf inp (cdr inp))			
	)
)
(defun value-iterate (inp)

			(if(equal(and(> (char-code (car inp)) 47)(< (char-code (car inp))58)) t)
				(loop 
						(setf inp (cdr inp))
						(setf temp_list (push (car inp) temp_list))
					(cond (
							(equal(and(> (char-code (car inp)) 39)(< (char-code (car inp))48)) t)
							(return inp)
						  )
						  (
							(equal (alpha-char-p (car inp)) t)
							(error "SYNTAX_ERROR")
						  )
						  (
							(equal #\Space (car inp))
							(return inp)							
						  )
					)		
				)
			)	
) 

(defun rec-lex (inp)

	;counter 0 a esitle 

	(setf temp_list nil)
	(if
		(equal(and(> (char-code (car inp)) 47) (< (char-code (car inp)) 58))t)
			(progn
				(setf inp (value-iterate inp))
				(print "KW_VALUE")
			)
	)
	(if
		(equal (alpha-char-p (car inp)) t)
		(progn
			(setf inp (kw-iterate inp))
				;inp counter kadar ilerlet 
		)
	)
	
	(cond (
			(equal #\( (car inp))
			(print "OP_OP")
		  )
		  
		  (
			(equal #\+ (car inp))
			(print "OP_PLUS")
		  )

		  (
			(equal #\- (car inp))
			(print "OP_MINUS")
		  )

		  (
			(equal #\/ (car inp))
			(print "OP_DIV")
		  )
		  (
			(equal #\/ (car inp))
			(print "OP_DIV")
		  )

		  (
			(equal #\: (car inp))
			(print "OP_DIV2")
		  )

		  (
			(equal #\* (car inp))
			(print "OP_MULT")
		  )

		  (
			(equal #\) (car inp))
			(print "OP_CP")
		  )

		  (
			(equal #\, (car inp))
			(print "OP_COMMA")
		  )

		  (
			(equal #\{ (car inp))
			(print "OP_OC")
		  )
		  (
			(equal #\} (car inp))
			(print "OP_CC")
		  )

	)


	(if (not (equal (car inp) nil))
	(rec-lex (cdr inp))	
	)
)

(rec-lex inp)






