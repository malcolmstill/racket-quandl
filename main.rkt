#lang racket

(require net/url)
(require json)

(define authcode "")
(define dataurl "https://www.quandl.com/api/v3/datasets/")

(define (set-auth-token code)
  (set! authcode code))

(define (param->string param value)
  (if (string=? value "")
      ""
      (string-append param "=" value)))

;(define (query-string code #:collapse [collapse ""]

(define (get code #:collapse [collapse ""])
  (let ([data (read-json
               (get-pure-port
                (string->url
                 (string-append dataurl code ".json?"
                                (string-join
                                 (list
                                  (param->string "auth_token" authcode)
                                  (param->string "collapse" collapse))
                                 "&")))))])
    (if (hash-has-key? data 'quandl_error)
        (error (hash-ref (hash-ref data 'quandl_error) 'message))
        (hash-ref (hash-ref data 'dataset) 'data))))
  

;(read-json
; (get-pure-port (string->url "https://www.quandl.com/api/v1/datasets.json?auth_token=bGydZiyLShYZidQ_sBuj")))

;EIA/PET_RWTC_D
;(read-json
 ;(get-pure-port (string->url "https://www.quandl.com/api/v3/datasets/EIA/PET_RWTC_D.json?auth_token=bGydZiyLShYZidQ_sBuj&collapse=annual")))

;(get "EIA/PET_RWTC_D")