#lang racket

(require math)

; Problem #53
; There are exactly ten ways of selecting three from five, 12345:

; 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

; In combinatorics, we use the notation, 5C3 = 10.

; In general,
; C(n,r) = n! / r!(n−r)!
; where r ≤ n, n! = n*(n−1)*...*3*2*1, and 0! = 1.

; It is not until n = 23, that a value exceeds one-million: C(23,10) = 1144066.

; How many, not necessarily distinct, values of  C(n,r), for 1 ≤ n ≤ 100, are greater than one-million?

(define (combine n r)
  (and (<= r n)
       (/ (factorial n)
          (* (factorial r) (factorial (- n r))))))

; Solution
(length (filter (curry < 1000000)
                (filter-map (curry apply combine)
                            (cartesian-product (range 1 101) (range 0 100)))))