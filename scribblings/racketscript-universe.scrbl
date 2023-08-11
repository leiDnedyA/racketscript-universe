#lang scribble/manual
@require[@for-label[racketscript-universe
                    racket/base]]

@title{RacketScript Universe}
@author[(author+email "Ayden Diel" "aydendiel@gmail.com")]

@defmodule[racketscript-universe]
@;{
    for some reason I can't link to the 2htdp/universe docs, so I just linked to the htdp docs instead
    }
Implementation of Racket's @hyperlink["https://docs.racket-lang.org/teachpack/2htdpuniverse.html"]{2htdp/universe library} for @seclink["top" #:doc '(lib "racketscript/scribblings/racketscript.scrbl") "RacketScript"]. Used to create distributed programs where both the server and the clients run in the browser.

@itemlist[@item{@secref["getting-started"]}
          @item{@secref["how-it-works"]}
          @item{@secref["deviations"]}]

@section[#:tag "getting-started"]{Getting Started}

Since this library is just an implementation of @hyperlink["https://docs.racket-lang.org/teachpack/2htdpuniverse.html"]{2htdp/universe}, use those docs as your main reference. These docs will contain info about how racketscript-universe works and how it differs from the original, but won't contain an in-depth API description.

@section[#:tag "how-it-works"]{How does it work?}

We use @hyperlink["https://peerjs.com/"]{PeerJS} under the hood to mimic client-server behavior where both the client and server run in browser tabs. In reality everything is done with peer connections. 

PeerJS's @hyperlink["https://peerjs.com/peerserver"]{PeerServer Cloud Serrvice} handles all of the traffic behind the scenes so that you don't have to worry about it. Thanks to this, the only setup that this library requires is a stable internet connection.

@section[#:tag "deviations"]{Deviations from 2htdp/universe}

