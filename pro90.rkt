#lang racket

; implement the problem 92 of project Euler
(define convert-int-to-list (λ (x)
                              (map (lambda (x) (string->number (string x))) (string->list (number->string x)))
                              ))
(define sum-of-sq-of-list (λ (lst)
                            (apply +
                                   (map (λ (x) (* x x)) lst)
                                   )
                            )
  )



  
(define next-num (lambda (x)   (sum-of-sq-of-list ( convert-int-to-list x))))

(define contain-in-list (λ (x y) (
                                  not
                                  (empty?
                                   (filter
                                    (λ (x2) (= x x2)) y)
                                   )
                                 )
                           )
  )

(define (make-chain x [lst '()])
  (let ([nx (next-num x)])
    (if (empty? lst) (make-chain x (cons x lst))
        (begin
          (if (or (contain-in-list 1 lst) (contain-in-list 89 lst) ) lst
              (make-chain nx (cons nx lst))
              )
          )
        )
    )
  )




(define (main [x 100] [co 0])
  (if (> x 1)
      (begin
        (if (= 89 (first (make-chain x)))
        (main (- x 1) (+ co 1))
        (main (- x 1) co)
        )
        )
      co
      )
  )
               
          
        
  

