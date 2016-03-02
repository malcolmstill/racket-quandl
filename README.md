# racket-quandl
Grab data from Quandl with racket for fun and profit

# Installation
```
raco pkg install racket-quandl
```

# Example usage
```
#lang racket

(require racket-quandl)
(require plot)
(require plot/utils)

; Set Quandl auth token from file
(set-auth-token (string-normalize-spaces (file->string "quandlkey.txt")))

; Grab daily spot prices from Quandl (EIA dataset)
(define crude (get "EIA/PET_RWTC_D")) ; WTI crude
(define gasoline (get "EIA/PET_EER_EPMRU_PF4_Y35NY_DPG_D")) ; gasoline
(define nat-gas (get "EIA/NG_RNGWHHD_D")) ; Henry hub natural gas

; Plot the historic price
(parameterize
      ([plot-x-ticks (date-ticks)]
       [plot-x-label "Date"]
       [plot-y-label "Price ($/unit)"])
  (plot (list
         (lines
          (map vector (map datetime->real (map car crude)) (map cadr crude))
          #:color 6 #:label "WTI crude")
         (lines
          (map vector (map datetime->real (map car gasoline)) (map cadr gasoline))
          #:color 7 #:label "RBOB gasoline")
         (lines
          (map vector (map datetime->real (map car nat-gas)) (map cadr nat-gas))
          #:color 8 #:label "Natural gas"))))
```
