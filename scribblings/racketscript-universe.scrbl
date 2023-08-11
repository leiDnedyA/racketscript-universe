#lang scribble/manual
@require[@for-label[racket/base
                    2htdp/universe]]

@title{RacketScript Universe}
@author[(author+email "Ayden Diel" "aydendiel@gmail.com")]

@defmodule[racketscript-universe]
@;{
    for some reason I can't link to the 2htdp/universe docs, so I just linked to the htdp docs instead
    }
Implementation of Racket's @racket[2htdp/universe] library for @seclink["top" #:doc '(lib "racketscript/scribblings/racketscript.scrbl") "RacketScript"]. Used to create distributed programs where both the server and the clients run in the browser.

@itemlist[@item{@secref["getting-started"]}
          @item{@secref["how-it-works"]}
          @item{@secref["differences"]}]

@section[#:tag "getting-started"]{Getting Started}
teachpack/teachpack.scrbl
Since this library is just an implementation of @hyperlink["https://docs.racket-lang.org/teachpack/2htdpuniverse.html"]{2htdp/universe}, use those docs as your main reference. These docs will contain info about how racketscript-universe works and how it differs from the original, but won't contain an in-depth API description.

@section[#:tag "how-it-works"]{How does it work?}

We use @hyperlink["https://peerjs.com/"]{PeerJS} under the hood to mimic client-server behavior where both the client and server run in browser tabs. In reality everything is done with peer connections.

@margin-note{PeerJS's @hyperlink["https://peerjs.com/peerserver"]{PeerServer Cloud Serrvice} handles all of the traffic behind the scenes so that you don't have to worry about it.}

@section[#:tag "differences"]{Differences from 2htdp/universe}

In practice, this library only differs from @hyperlink["https://docs.racket-lang.org/teachpack/2htdpuniverse.html"]{2htdp/universe} when setting up connections (plus some slight differences in dependencies). Here's everything you need to know on top of the original docs.

@subsection{Differences for @racket[big-bang] Function}

Original @racket[big-bang] docs.

@defform[#:id server-id #:literals (peer-id)
    (register [server-id peer-id?])]{
    Tells racket what the @racket[peer-id] of the @racket[universe] that you want your world to connect to, instead of an ip address. Because of this, racketscript-universe has no @racket[port] clauses, as they're not needed to connect via @racket[peer-id].
}

@margin-note{Because our peer connections are handled by one server in the cloud, clients can connect to servers on different networks as long as they know the server id.}

Other differences from the original @racket[big-bang] API include:
@nested[#:style 'inset]{@itemlist[@item{No @racket[on-pad] clause (as of now).}
          @item{No @racket[record?] clause.}
          @item{No @racket[close-on-stop] clause (yet).}
          @item{No @racket[display-mode] clause.}
          @item{No @racket[state] caluse.}
          @item{No @racket[port] clause.}]}

@subsection{Differences for @racket[universe] Function}

Original @racket[universe] docs.
