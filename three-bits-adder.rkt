;Your Name: Aadeeb Rashid
;Course: CSE 240
; Use the template for your programming assignment

;Q1 (6 points)
(define OR-GATE (lambda (a b)
    (if (= a 1)
        1
        (if (= b 0)
            0
            1))
))
(define AND-GATE (lambda (a b)
    (if (= a 1)
        (if (= b 1)
            1
            0)
        0)
))
(define XOR-GATE (lambda (a b)
    (if (= a b)
        0
        1)
))
;Test cases
(AND-GATE 0 0)
(AND-GATE 0 1)
(AND-GATE 1 0)
(AND-GATE 1 1)
;0
;0
;0
;1
(newline)
(OR-GATE 0 0)
(OR-GATE 0 1)
(OR-GATE 1 0)
(OR-GATE 1 1)
;0
;1
;1
;1
(newline)
(XOR-GATE 0 0)
(XOR-GATE 0 1)
(XOR-GATE 1 0)
(XOR-GATE 1 1)
;0
;1
;1
;0

;Q2 
(define bitAdder (lambda (x a b) ;(5 points each)
    (cons (sum-bits x a b) (carry-out x a b))
))
(define sum-bits (lambda (x a b) ;(5 points each)
    (XOR-GATE x (XOR-GATE a b))
))
(define carry-out (lambda (x a b) ;(4 points each)
    (OR-GATE (AND-GATE a b) (AND-GATE x (OR-GATE a b)))
))
;Test cases
(newline)
(bitAdder 0 0 0) 	
(bitAdder 0 0 1) 	
(bitAdder 0 1 0) 	
(bitAdder 0 1 1)	
(bitAdder 1 0 0) 	
(bitAdder 1 0 1)	
(bitAdder 1 1 0) 	
(bitAdder 1 1 1) 
;(0 . 0)
;(1 . 0)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 1)


;Q3 ; (20 points)
(define (3-bit-adder A_List B_List Cin0) 
; A_List should consists of a A0A1A2 as a list
; B_List should consists of a B0B1B2 as a list
   (let((S0 (cdr (bitAdder Cin0 (list-ref A_List 0) (list-ref B_List 0)))))
   (let((Cin1 (car (bitAdder Cin0 (list-ref A_List 0) (list-ref B_List 0)))))
   (let((S1 (cdr (bitAdder Cin1 (list-ref A_List 1) (list-ref B_List 1)))))
   (let((Cin2 (car (bitAdder Cin1 (list-ref A_List 1) (list-ref B_List 1)))))
   (let((S2 (cdr (bitAdder Cin2 (list-ref A_List 2) (list-ref B_List 2)))))
   (let((C2Out (car (bitAdder Cin2 (list-ref A_List 2) (list-ref B_List 2)))))
   (list S0 S1 S2 C2Out)
)))))))
  
;Test Cases
(newline)
(3-bit-ADDER '(0 0 1) '(0 0 1) 0)
(3-bit-ADDER '(0 0 1) '(0 0 1) 1)
(3-bit-ADDER '(1 0 1) '(0 1 1) 0)
(3-bit-ADDER '(1 1 1) '(1 1 1) 0)
(3-bit-ADDER '(1 1 1) '(1 1 1) 1)
; (0 0 1 0)
; (0 0 1 1)
; (0 1 1 0)
; (1 1 1 0)
; (1 1 1 1)
