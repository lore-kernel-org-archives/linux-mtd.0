Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QDmf-0004CD-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 19:28:13 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14QDme-0004C6-00
	for mtd@infradead.org; Tue, 06 Feb 2001 19:28:12 +0000
Date: Tue, 6 Feb 2001 19:28:04 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: "Ian Eure <Ian Eure" <ieure@insynq.com>
cc: <mtd@infradead.org>,  <fabrice.bellard@netgem.com>
Subject: Re: doc2k: "formatting block"?
In-Reply-To: <14976.15973.43530.527006@pyramid.insynq.com>
Message-ID: <Pine.LNX.4.30.0102061909140.2237-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 6 Feb 2001, Ian Eure <Ian Eure wrote:

> while testing a 32mb doc2000, i see these messages:
> 
> -- snip --
> DiskOnChip 2000 found at address 0xD0000
> Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
> 2 flash chips found. Total DiskOnChip size: 32 Mb
> Block 807: referencing block 110 already in another chain
> Formatting chain at block 807
> Formatting block 807
> Unreferenced block 366, formatting it
> -- snip --

Eep. Can you reproduce it? Did this happen after the M-Systems drivers (or 
firmware) had been writing to the device, or is it purely our software? 
It's unlikely to be hardware.

I'm trying to grok that code - even if the block _is_ linked in another 
chain, we should be able to work out which chain it _ought_ to be in by 
its own VirtUnitNum entry. We still have to format the chain in which the 
block _isn't_ supposed to be, and there's definitely some data corruption 
happened, but we should be able to do a little better than we do ATM, I 
think.

I don't see how this could be caused by a fold in progress - we don't fold 
one chain into _another_, only into itself. But the comment implies 
otherwise...

	printk("Block %d: referencing block %d already in another chain\n", 
		block, rep_block);
	/* XXX: should handle correctly fold in progress chains */
	do_format_chain = 1;
	s->ReplUnitTable[block] = BLOCK_NIL;


-- 
dwmw2





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
