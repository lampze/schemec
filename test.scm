(define (f1 n)
  (if (= n 1)
      1
      (* n (f1 (- n 1)))))

(define (f2 n)
  (define (fi p c m)
    (if (> c m)
        p
        (fi (* c p)
            (+ c 1)
            m)))
  (fi 1 1 n))

(begin
  (display (time
            (f1 38)))
  (newline))
(begin
  (display (time
            (f2 38)))
  (newline))
