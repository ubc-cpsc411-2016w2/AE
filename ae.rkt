#lang plai

; Code to accompany "lec-operational"

; BNF of arithmetic expressions:
;
;  <AE> ::= <num>
;         | {+ <AE> <AE>}
;         | {- <AE> <AE>}

; Abstract syntax of arithmetic expressions:
(define-type AE
  [Num (n number?)]
  [Add (lhs AE?) (rhs AE?)]
  [Sub (lhs AE?) (rhs AE?)]
  )

; Parser for arithmetic expressions:
(define (parse-ae sexp)
  (cond
    [(number? sexp) (Num sexp)]
    [(list? sexp)
     (case (first sexp)
       [(+) (if (= (length sexp) 3)
               (Add (parse-ae (second sexp)) (parse-ae (third sexp)))
               (error "parse-ae: + needs exactly 2 arguments"))]
       [(-) (if (= (length sexp) 3)
               (Sub (parse-ae (second sexp)) (parse-ae (third sexp)))
               (error "parse-ae: - needs exactly 2 arguments"))]
       [else (error "parse-ae: I only understand + and -")])]
    [else (error "parse-ae: syntax error")]))

; Interpreter for arithmetic expressions:
;
; interp : AE -> number
;
; Given an ae, return the number n such that
;
;                 ae ⇓ n
;
; according to the rules in the lecture notes "04-operational"
; (Eval-num, Eval-add, Eval-sub).

; When following rules, don't be clever!
; The more clever you are, the more likely you'll make a mistake and end up with
; an interpreter that doesn't match the rules.
; (There will be times that you might want to be a little clever.  But not yet.)

(define (interp ae)
  (type-case AE ae
    
    [Num (n) n]
    
    [Add (ae1 ae2)
        (let ([n1 (interp ae1)]
              [n2 (interp ae2)])
          (+ n1 n2))
        ]
    
    [Sub (ae1 ae2)
        (let ([n1 (interp ae1)]
              [n2 (interp ae2)])
          (- n1 n2))
        ]
    ))








; Now, compare the interpreter we just wrote to the AE calc function from
; PLAI.

#|
(define (calc an-ae)
  (type-case AE an-ae
    [Num (n) n]
    [Add (l r) (+ (calc l) (calc r))]
    [Sub (l r) (- (calc l) (calc r))]))
|#