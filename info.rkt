#lang info
(define collection "racket-quandl")
(define deps '("base"
               "rackunit-lib"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/racket-quandl.scrbl" ())))
(define pkg-desc "Counters and cross-referencing for use with pollen")
(define version "0.1")
(define pkg-authors '(mstill))