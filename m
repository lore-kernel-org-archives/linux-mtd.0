Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111YY9-0005Nj-00
	for mtd@infradead.org; Tue, 6 Jul 1999 17:58:31 +0100
Date: Tue, 6 Jul 1999 10:58:15 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
Reply-To: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <David.Woodhouse@mvhi.com>
cc: Alexander Larsson <alex@cendio.se>, mtd@infradead.org
Subject: Re: Flash drivers and filesystem (fwd) 
In-Reply-To: <E111YPg-00061T-00@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.990706105307.17432C-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 6 Jul 1999, David Woodhouse wrote:

> jgg@deltatee.com said:
> >  What is this applied against? This looks remarkably like it would fit
> > nicely with the more general chagnes I made... 
> 
> Against Alex's original patch, I believe.

Hm, I don't have that code, just the original MTD stuff that was posted on
lwn some weeks back.
 
> > Everyone rewriting the flash chip code for every new device is getting
> > old :> 
> 
> Indeed. I'm working on recombining them all into one - was yours based upon
> mine, or were they both based on something I can't find any more (I honestly
> can't remember)?

Well, mine is the most different of all of them and has a bit of a strange
history. I started with the MTD (which was originally derived from the
PCMICA code) stuff I mentioned above and wrote a complete working driver
for that then I talked to my friend Gergely who had written a from scratch
block driver for his flash board, I also needed a block driver so I took
his stuff and my stuff and re-arranged the two, then I wrote another
driver for another board here and we end up with my version. The entire
thing is from scratch and ended up pretty clean, I c+p'd ideas from
everywhere to get it going though.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
