#lang info
(define collection "racket-quandl")
(define deps '("base"
               "rackunit-lib"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/racket-quandl.scrbl" ())))
(define pkg-desc "Grab data from Quandl with racket for fun and profit")
(define version "0.1")
(define pkg-authors '(mstill))