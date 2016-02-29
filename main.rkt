#lang racket

(require net/url)
(require json)

(provide set-auth-token
         get)

(define authcode "")
(define dataurl "https://www.quandl.com/api/v3/datasets/")

(define (set-auth-token code)
  (set! authcode code))

(define (param->string param value)
  (if (string=? value "")
      ""
      (string-append param "=" value)))

(define (datestring->date s)
  (let ([date (string-split s "-")])
    (make-date 0
               0
               0
               (string->number (third date))
               (string->number (second date))
               (string->number (first date))
               0
               0
               0
               0)))
               
(define (get code #:collapse [collapse ""])
  (let ([query (read-json
               (get-pure-port
                (string->url
                 (string-append dataurl code ".json?"
                                (string-join
                                 (list
                                  (param->string "auth_token" authcode)
                                  (param->string "collapse" collapse))
                                 "&")))))])
    (if (hash-has-key? query 'quandl_error)
        (error (hash-ref (hash-ref query 'quandl_error) 'message))
        (let ([data (hash-ref (hash-ref query 'dataset) 'data)])
          (map (lambda (x)
                 (match x
                   [(list datestring value) (list (datestring->date datestring) value)]))
                  data)))))
  
; Example (get "EIA/PET_RWTC_D")