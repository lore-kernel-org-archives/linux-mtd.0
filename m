Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142EVq-0006Cm-00
	for mtd-list@infradead.org; Sat, 02 Dec 2000 15:23:42 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142EVp-0006Cg-00
	for mtd@infradead.org; Sat, 02 Dec 2000 15:23:41 +0000
Date: Sat, 2 Dec 2000 10:23:33 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Shane Nay <shane@agendacomputing.com>
cc: <mtd@infradead.org>
Subject: Re: Problems with cfi_cmdset_0001
In-Reply-To: <20001202050132.B4457@www.easysolutions.net>
Message-ID: <Pine.LNX.4.30.0012021004200.16670-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Sat, 2 Dec 2000, Shane Nay wrote:

> Okay, I've been reading the PDF for Strataflash, by Intel.  And I've traced
> my problems with the write routines in MTD down to two problems, the Block
> address, and the word write problem.  The command address isn't properly
> interpretted for this chip.  I'm not sure what the CFI spec is, but I
> think:
> cmd_adr=adr & ~(wbufsize-1);
> is wrong.  (Well, maybe it's different chip to chip, but I know it's wrong
> for this chip)
>
> It should compute the top of the block via the erasesize and size.
> cmd_adr=mtd->erasesize*((int)(adr/mtd->erasesize));

Please consider using the following for better efficiency instead:

	cmd_adr = addr & ~(mtd->erasesize-1);

This produces the same result but omits the division which is best to avoid
on some CPUs which don't have a native instruction for it.

> Now, this fixes the Block address.  The other problem though is
> significantly nastier.
>
> Okay, MTD seems to think that it can write twice as much data as it can to
> a device at a time in write_buffer mode, which is all together wrong.  My
> configuration is two x8 chips interleaved on a 16 bit bus.  Basically...,
> its thinking we have two x16 chips on a 32 bit bus before streaming, but
> then streams the data the right way, but twice as much as it said it would.

What kind of arrangement do the probe function find?  Does it actually tell
you: "Found 2 x8 CFI devices at location 0 in 8 bit mode"?  If not, you'll
have to look at the probe code in cfi-probe.c.  Carefully reordering the
probe sequence might be required (I had to do it for the 32-bit buswidth
case).

> However, my code is so removed at this point from MTD base since I had too
> many other things at play with MTD code to properly trace my problem, and
> now I have a cleaner version of the code for XIP.  So I'm not sure I'm
> going to roll all my changes into cfi_cmdset_0001.

My impression is that it had better advantages to be separate just to keep
things as simple as possible.

> Who is the maintainer
> of this file BTW?  I'll try to make patches for him/her to fix these
> problems.

Well... I don't know who is the official maintainer, but I think I
contributed the largest mods recently.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
