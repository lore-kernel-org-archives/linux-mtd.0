Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13rO20-0004cE-00
	for mtd-list@infradead.org; Thu, 02 Nov 2000 17:20:04 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13rO1k-0004c0-00
	for mtd@infradead.org; Thu, 02 Nov 2000 17:19:49 +0000
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA28536
	for <mtd@infradead.org>; Thu, 2 Nov 2000 11:19:05 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA06373
	for <mtd@infradead.org>; Thu, 2 Nov 2000 11:19:05 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F19F@txexmta8.amd.com>
To: mtd@infradead.org
Subject: RE: Problems with AMD CFI chips 
Date: Thu, 2 Nov 2000 11:19:02 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> mark.langsdorf@amd.com said:
> >  The Flash bank is found correctly, and loads, and I can 
> > write to it.
> > However, when I boot from it, I can't seem to get it to 
> > commit writes- either creating new files or altering old
> > ones.  Once I reboot the device, my changes are gone.
> 
> Please check using the /dev/mtd0 device directly to see 
> whether your writes are 'taking'. 

	I can write to /dev/mtd0, the writes through the char
interface are definitely consistent over power-outs.  It's
only when I use jffs on /dev/mtdblock0 that I run into problems.

> What 'map' driver are you using?

	Modified version of physmap, since the flash banks are
physically mapped at 0x2000000 but I needed to partition them
because the BIOS and kernel image are also stored on the same
banks.

> for me on the iPAQ because I wasn't enabling the Vpp voltage
> during write cycles. Is this necessary on your targer?
> 
> Other than that, poke the author and/or look at the code 
> yourself to see what's happening. What interleave/buswidth
> are you using?

	Interleave 2, 4 byte buswidth, to support 2 16 bit chips.
Again, that all looks pretty consistent.

	I think it may be some kind of interaction with jffs,
because I've had limited success with creating directories 
and deleting files, but not consistently.  I'm not sure where
I should look in the jffs code to get more information, though,
and would appreciate some pointers.
	Also, when does jffs attempt to clean out the dirty
space?  thread_should_wake reports upwards of 2 megs of
dirty space, which is about 16 sectors and 14% of the available
memory.  I'd think that should get returned to the free list
much earlier, especially during the reboots.

-Mark Langsdorf
AMD, Inc.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
