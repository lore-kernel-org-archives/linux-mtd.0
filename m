Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QYHZ-0001Oo-00
	for mtd-list@infradead.org; Wed, 07 Feb 2001 17:21:29 +0000
From: "Ian Eure <Ian Eure" <ieure@insynq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14977.33773.1956.20539@pyramid.insynq.com>
Date: Wed, 7 Feb 2001 09:20:45 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Re: doc2k: "formatting block"?
In-Reply-To: <Pine.LNX.4.30.0102061909140.2237-100000@imladris.demon.co.uk>
References: <14976.15973.43530.527006@pyramid.insynq.com>
	<Pine.LNX.4.30.0102061909140.2237-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse writes:
 > On Tue, 6 Feb 2001, Ian Eure <Ian Eure wrote:
 > 
 > > while testing a 32mb doc2000, i see these messages:
 > > 
 > > -- snip --
 > > DiskOnChip 2000 found at address 0xD0000
 > > Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
 > > 2 flash chips found. Total DiskOnChip size: 32 Mb
 > > Block 807: referencing block 110 already in another chain
 > > Formatting chain at block 807
 > > Formatting block 807
 > > Unreferenced block 366, formatting it
 > > -- snip --
 > 
 > Eep. Can you reproduce it? Did this happen after the M-Systems drivers (or 
 > firmware) had been writing to the device, or is it purely our software? 
 > It's unlikely to be hardware.
 > 
it's reproducible, but only with this one 32mb doc2000. i only have
this chip, and a 48mb doc2000 for testing right now.

the doc had been written to by the m-sys driver before.

 > I'm trying to grok that code - even if the block _is_ linked in another 
 > chain, we should be able to work out which chain it _ought_ to be in by 
 > its own VirtUnitNum entry. We still have to format the chain in which the 
 > block _isn't_ supposed to be, and there's definitely some data corruption 
 > happened, but we should be able to do a little better than we do ATM, I 
 > think.
 > 
 > I don't see how this could be caused by a fold in progress - we don't fold 
 > one chain into _another_, only into itself. But the comment implies 
 > otherwise...
 > 
 > 	printk("Block %d: referencing block %d already in another chain\n", 
 > 		block, rep_block);
 > 	/* XXX: should handle correctly fold in progress chains */
 > 	do_format_chain = 1;
 > 	s->ReplUnitTable[block] = BLOCK_NIL;
 > 
i'm an intermediate c programmer, and have no experience with kernel
programming. but, i'd like to try and help you, so i'm just gonna jump
in. some patches may (or may not) fly out in a few days or weeks. :)

-- 
 ___________________________________
| Ian Eure - <ieure@insynq.com>     | "You're living in a facist world...
|         -  Developer -            | Freedom is a luxury." -Front Line
|        -  InsynQ, Inc. -          | Assembly, "Digital Tension Dementia"
| Your Internet Utility Company.tm  |________________________________________


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
