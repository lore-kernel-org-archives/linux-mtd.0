Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14DaoV-0001k6-00
	for mtd-list@infradead.org; Tue, 02 Jan 2001 23:25:55 +0000
Message-ID: <3A5263C6.31F5D67D@mvista.com>
Date: Tue, 02 Jan 2001 15:27:03 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mark.langsdorf@amd.com, mtd@infradead.org
Subject: Re: CFI ident problems with AMD chips.
References: <Pine.LNX.4.30.0101022228090.612-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> On Tue, 2 Jan 2001, Alice Hennessy wrote:
>
> > > Is there some way to tell the top-boot parts apart from the bottom-boot
> > > parts?
> >
> > In the Am29DL322D/323D/324D spec, there's  a Top/Bottom Boot Sector Flag at
> > the end of the Primary Vendor-Specific Extended Query at address 4F (word mode)
> >
> > where 02 = bottom, 03 = top.   I haven't tried it  yet.
>
> Ah - hadn't found that bit, thanks. I'll poke at it in the morning.
>
> So, are the chips violating the CFI spec by recording the blocks in a
> strange order, or does the CFI spec not actually guarantee an _ordering_
> on the erase regions? It's not clear which is the case - either way,
> _someone_ seems to be on crack here.
>
> --
> dwmw2

I don't see any specific language that states that the regions have to be in order
(too obvious to mention).

BTW,  I tried it and it gives the correct value for my top boot device.

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
