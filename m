Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14DZxG-0001PF-00
	for mtd-list@infradead.org; Tue, 02 Jan 2001 22:30:54 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14DZxF-0001P9-00
	for mtd@infradead.org; Tue, 02 Jan 2001 22:30:53 +0000
Date: Tue, 2 Jan 2001 22:30:06 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: <mark.langsdorf@amd.com>,  <mtd@infradead.org>
Subject: Re: CFI ident problems with AMD chips.
In-Reply-To: <3A522396.510E91E5@mvista.com>
Message-ID: <Pine.LNX.4.30.0101022228090.612-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 2 Jan 2001, Alice Hennessy wrote:

> > Is there some way to tell the top-boot parts apart from the bottom-boot
> > parts?
>
> In the Am29DL322D/323D/324D spec, there's  a Top/Bottom Boot Sector Flag at
> the end of the Primary Vendor-Specific Extended Query at address 4F (word mode)
>
> where 02 = bottom, 03 = top.   I haven't tried it  yet.

Ah - hadn't found that bit, thanks. I'll poke at it in the morning.

So, are the chips violating the CFI spec by recording the blocks in a
strange order, or does the CFI spec not actually guarantee an _ordering_
on the erase regions? It's not clear which is the case - either way,
_someone_ seems to be on crack here.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
