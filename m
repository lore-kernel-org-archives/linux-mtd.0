Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14leB6-0006ks-00
	for mtd-list@infradead.org; Fri, 06 Apr 2001 22:54:00 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14leB3-0006km-00
	for mtd@infradead.org; Fri, 06 Apr 2001 22:53:59 +0100
Date: Fri, 6 Apr 2001 22:53:48 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: "Williams, Kevin M." <kevin.m.williams@marconi.com>
cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: using a portion of a FLASH device as FTL?
In-Reply-To: <A3E34B558F5CD211B4980008C7A4A99003163E42@sparrow.eng.gilbarco.com>
Message-ID: <Pine.LNX.4.30.0104062249500.2971-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 6 Apr 2001, Williams, Kevin M. wrote:

> Hello again,
> 
> I've figured out why FTL wasn't finding the header.  It was looking at the
> bottom section of the flash for the FTL data structure ("FTL100").  We store
> our bootloader and some other code at the base of the FLASH.  I need to only
> use part of the FLASH as FTL, the rest I want to leave alone.  The Flash
> chips (AMD29DL162, ) are detected properly by the CFI probe at location
> 0xFFC00000 thru 0xFFFFFFFF, but I only want the FTL to use from 0xFFF20000
> to FFFE0000. 
> 
> I can't see anywhere in the code where provisions for this have been added.
> Any advice on modifying the existing code to accomplish this?

No modification required - just use the 'ftl_format' program with 
appropriate arguments to make it start the FTL format at the offset you 
desire.

But are you in the Free World? FTL is patented, and in many places you may 
not use it except on PCMCIA devices or with a licence from M-Systems. 
Although there's nothing particularly non-obvious in the Linux code which 
implements FTL, so the patent is probably invalid - you might get to prove 
that in the EU if you're persued, but the US patent system is bad enough 
that there's some risk.

Why do you want use a pseudo-filesystem to emulate a block device on top 
of which you put a normal filesystem anyway? Why not just put a JFFS{2,} 
filesystem on the flash directly?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
