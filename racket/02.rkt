#lang racket
; Problem #2
; Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

; 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

; By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

(define sum
  (lambda (l)
    (apply + l)))

(define fibonacci
  (lambda (i)
    (if (< i 2)
      i
      (+ (fibonacci (- i 1)) (fibonacci (- i 2))))))

(define generate-fibonacci-sequence
  (lambda (n)
    (letrec
      ((aux (lambda (lim in out)
              (let ((cur (fibonacci in)))
                (if (>= cur lim)
                  out
                  (aux lim (+ 1 in) (cons cur out)))))))
      (aux n 1 '()))))

(display (sum (filter even? (generate-fibonacci-sequence 4000000))))