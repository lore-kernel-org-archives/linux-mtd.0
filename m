Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12URNB-0002zP-00
	for mtd-list@infradead.org; Mon, 13 Mar 2000 09:42:49 +0000
Date: Mon, 13 Mar 2000 10:42:45 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: More comments 
In-Reply-To: <26768.952938951@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000313103341.32523B-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 13 Mar 2000, David Woodhouse wrote:

> 
> alex@cendio.se said:
> >  That means i have to wrap all write and reads in a function that
> > loops over the read/write call.
> 
> This has to be done somewhere. Where's best - in _every_ device driver or in
> only those front ends which attempt non-block-aligned access?

I don't know. You seem to think that it's better to have it in the
front-ends, and I can accept that. I think the "_every_ driver" part is
a bit of an overstatement though, as I would think many drivers are
for fully memory-mapped flashes where this wouldn't be necessary (where,
in fact, looping in the frontend is unnecessary overhead).
 
/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
