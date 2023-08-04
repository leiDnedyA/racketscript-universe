#lang info
(define collection "racketscript-universe")
(define deps '("base"))
(define build-deps '("racketscript/base" "scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/racketscript-universe.scrbl" ())))
(define pkg-desc "Implementation of htdp/universe in RacketScript with PeerJS")
(define version "0.0")
(define pkg-authors '(leiDnedyA))
(define license '(Apache-2.0 OR MIT))
