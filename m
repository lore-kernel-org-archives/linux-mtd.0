Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131utS-0003ir-00
	for mtd-list@infradead.org; Tue, 13 Jun 2000 18:54:30 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 131utO-0003il-00
	for mtd@infradead.org; Tue, 13 Jun 2000 18:54:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000613104519.11182F-100000@wakko.deltatee.com> 
References: <Pine.LNX.3.96.1000613104519.11182F-100000@wakko.deltatee.com> 
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: mtd@infradead.org
Subject: Re: Common Flash Interface probe code. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Jun 2000 18:54:22 +0100
Message-ID: <19411.960918862@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
>  Well, that would be the point, you wouldn't make the page function
> callable outside the low level driver. If ever two EC's could get into
> the page function at once that would be a bug in the higher level
> drivers. 

I have a board here which has two flash chips in the same 'map'. I
definitely want to be able to talk to each one individually and
concurrently. Locking individual chips against concurrent access is
_different_ to locking the page register.


jgg@ualberta.ca said:
>  IMHO the driver should simply populate the structure with the
> functions it supports (either read/write/etc or page) and then pass
> that to a detect function which does all supported probes. Then you
> can compile in/out support for various kinds of devices if you want
> to.

> Having the drivers call seperate probe functions is not what I had in
> mind at all when I wrote that, I wanted to have a single probe
> function and a 'hint' structure.

We can do that quite simply, probably with an inline routine in map.h to 
call all known probe functions in a sensible order. Map drivers which know 
exactly what type of device they will contain can still call the right 
probe function directly.


jgg@ualberta.ca said:
>  What I am saying is that a good fraction of your low level drivers
> will look *exactly* the same:

It's close, but it's not exactly identical. You outlined one case - 'paged
or unpaged'. There's also 'which bus is it on' and strange things like the 
octagon board where the page register is actually shared by two devices. You 
can't handle a decent 'cache' of the currently-available page, you have to 
call the page function each time. That's an out-of-line function call at 
_every_ access rather than only the inline checks that it currently does.

It's _possible_ to make a generic mid-level map driver handle all those
cases  - but it means extra conditional jumps and/or indirect function calls
at runtime, which I'm trying to avoid.


jgg@ualberta.ca said:
> I think if you clarify that the low level driver routines will never
> be called concurrently with the same mtd structure that would be a
> suitably simple design..

Suitably simple perhaps, but it's a restriction which should be unnecessary. 
Concurrent access is fine. Locking may want to be done at a chip level for 
flash (not RAM or ROM) but not at the 'map' level except as is necessary 
for paging reasons.


jgg@ualberta.ca said:
> Pity both my boards share the IO window so they do need locking :<

This particular feature means that your hypothetical middle layer map 
driver cannot cache the last accessed page for any map device, as it may
change when the device in question hasn't been accessed.

That's an important optimisation which is being thrown away because we're 
trying to be too generic.

This is entirely my point - to handle that case and the other strange 
cases which will occur, the mid-level driver is going to have to be 
horribly ugly. All this special-casing is going to have to be done at 
runtime, rather than at compile-time as it is at the moment. 

I agree that the amount of redundancy is a little less than ideal, but the
alternative is reduced _runtime_ performance.

It's not difficult for an author of a new driver to cut'n'paste an existing 
one. Yes it'll be largely similar, but that's not a problem. That's why 
it's under GPL - it's not a problem to cut'n'paste.








--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
