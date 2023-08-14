#lang scribble/manual
@require[@for-label[racket/base
                    2htdp/universe]]

@title{RacketScript Universe}
@author[(author+email "Ayden Diel" "aydendiel@gmail.com")]

@defmodule[racketscript-universe]
@;{
    for some reason I can't link to the 2htdp/universe docs, so I just linked to the htdp docs instead
    }
Experimental implementation of Racket's @racket[2htdp/universe] library for @seclink["top" #:doc '(lib "racketscript/scribblings/racketscript.scrbl") "RacketScript"]. Used to create distributed programs where both the server and the clients run in the browser.

@itemlist[@item{@secref["getting-started"]}
          @item{@secref["how-it-works"]}
          @item{@secref["differences"]}]

@section[#:tag "getting-started"]{Getting Started}
Since this library is just an implementation of @hyperlink["https://docs.racket-lang.org/teachpack/2htdpuniverse.html"]{2htdp/universe}, use those docs as your main reference. These docs will contain info about how racketscript-universe works and how it differs from the original, but won't contain an in-depth API description.

@section[#:tag "how-it-works"]{How does it work?}

We use @hyperlink["https://peerjs.com/"]{PeerJS} under the hood to mimic client-server behavior where both the client and server run in browser tabs. In reality everything is done with peer connections.

@margin-note{PeerJS's @hyperlink["https://peerjs.com/peerserver"]{PeerServer Cloud Serrvice} handles all of the traffic behind the scenes so that you don't have to worry about it.}

To use the library, you need to be running a separate server (@racket[universe]) and client (@racket[big-bang]) instance at the same time, both in separate browser windows. You then need to pass the server's peer id (which is currently "server" by default but will be changed) to the client's @racket[big-bang] call, and a connection will be established. See @hyperlink["https://github.com/leiDnedyA/rs-universe-server-test/blob/master/src/app.rkt"]{this example} for one method of doing so where the user loads the page, and then picks whether to start a server or client session.

@section[#:tag "differences"]{Differences from 2htdp/universe}

In practice, this library only differs from @hyperlink["https://docs.racket-lang.org/teachpack/2htdpuniverse.html"]{2htdp/universe} when setting up connections (plus some slight differences in dependencies). Here's everything you need to know on top of the original docs.

@subsection{Differences for @racket[big-bang] Function}

@italic{Original @racket[big-bang] docs.}

Differences from the original @racket[big-bang] API include:
@nested[#:style 'inset]{@itemlist[
          @item{@racket[big-bang] takes and optional @italic{#:dom-root} keyword argument to specify a root element for the canvas that big-bang draws to.}
          @item{@racket[register] takes a @racket[peer-id] argument instead of an @racket[ip-expr].}
          @item{No @racket[on-pad] clause (as of now).}
          @item{No @racket[record?] clause.}
          @item{No @racket[close-on-stop] clause (yet).}
          @item{No @racket[display-mode] clause.}
          @item{No @racket[state] caluse.}
          @item{No @racket[port] clause.}]}

@defform[(register peer-id)#:contracts ([peer-id string?])]{
    Tells racket what the @racket[peer-id] of the @racket[universe] that you want your world to connect to, instead of an ip address. Because of this, racketscript-universe has no @racket[port] clauses, as they're not needed to connect via @racket[peer-id].
}

@margin-note{Because our peer connections are handled by one server in the cloud, clients can connect to servers on different networks as long as they know the server id.}

@subsection{Differences for @racket[universe] Function}

@italic{Original @racket[universe] docs.}

@nested[#:style 'inset]{@itemlist[
                                  @item{@racket[universe] takes and optional @italic{#:dom-root} keyword argument to specify a root element to insert the logging gui into.}
                                  @item{No @racket[port] clause.}
                                  @item{No @racket[state] clause (yet).}
                                  @item{No @racket[to-string] clause (yet).}
                                  @item{No @racket[check-with] clause (yet).}]}