Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zt4i-00035q-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 11:18:16 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Zt4h-00035k-00
	for mtd@infradead.org; Tue, 28 Mar 2000 11:18:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000313103341.32523B-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000313103341.32523B-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: More comments 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Tue, 28 Mar 2000 11:18:23 +0100
Message-ID: <18073.954238703@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
> On Mon, 13 Mar 2000, David Woodhouse wrote:
> > This has to be done somewhere. Where's best - in _every_ device driver
> > or in only those front ends which attempt non-block-aligned access?

> I don't know. You seem to think that it's better to have it in the
> front-ends, and I can accept that. I think the "_every_ driver" part
> is a bit of an overstatement though, as I would think many drivers are
> for fully memory-mapped flashes where this wouldn't be necessary
> (where, in fact, looping in the frontend is unnecessary overhead).
>  

OK. How about this:

You don't have to check the return from the mtd->write() function, it must 
always write the complete buffer or return failure.

_BUT_ you may never make a write request which crosses a block boundary.

So you still have to possibly issue more than one write request in the jffs 
code, but at least you can know beforehand and code accordingly, rather than 
having a naïve loop.

 (s/write/read/ throughout also applies, obviously.)


I'm putting together some documentation. 

	www.linux-mtd.infradead.org/tech/API.html
					/mtd_info.html
					/core.html
					/erase.html

This will contain some changes to what's currently implemented - most notably 
the notifier stuff will no longer have the horrible race conditions that it 
currently does.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
