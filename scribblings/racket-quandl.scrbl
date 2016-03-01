#lang scribble/manual
@require[@for-label[racket-quandl
                    racket/base]]

@title{racket-quandl}
@author{Malcolm Still}

@defmodule[racket-quandl]

A wee library for grabbing data from Quandl.

@defproc[(get [code string?] [#:rows rows string? ""
             #:column-index column-index string? ""
             #:collapse collapse string? ""
             #:start-date start-date string? ""
             #:end-date end-date string? ""
             #:order order string? ""
             #:transform transform string? ""])
	     list?]{
	     Returns Quandl data for @racket[code]. @racket[collapse] takes one of the following options: @racket["none"], @racket["daily"], @racket["weekly"], @racket["montly"], @racket["quarterly"], @racket["annual"]. @racket[start-date] and @racket[end-date] have format @racket["yyyy-mm-dd"]. The data can be ordered by setting @racket[order] to @racket["asc"] or @racket["desc"].
}

@defproc[(set-auth-token [token string?]) void?]{
Set the Quandl API key to @racket[token].
}