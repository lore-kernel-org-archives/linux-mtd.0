Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qxO2-0003yx-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 14:25:18 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qxO1-0003yr-00
	for mtd@infradead.org; Sat, 21 Apr 2001 14:25:17 +0100
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 14qxNt-0000Z8-00
	for mtd@infradead.org; Sat, 21 Apr 2001 14:25:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: some FAQs - DiskOnChip, CompactFlash, IDE stuff.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 21 Apr 2001 14:25:09 +0100
Message-ID: <2177.987859509@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I received a couple of questions - in private email so I won't quote it
here, but I do want my answers to go to the list so hopefully I don't get
asked again in the near future...

The questions were basically "is it possible to write a CompactFlash MTD 
driver" and "Why does the MTD driver for the DiskOnChip exist, since it 
supports INT 13h BIOS calls and works like a true IDE drive?"

The MTD drivers are for driving memory devices, including flash. Most of 
the code is for driving standard NOR flash chips attached (fairly) directly 
to the CPU's memory bus. 

CompactFlash devices are not flash, as far as the computer is concerned -
they _really_ are IDE drives, and electrically you cannot tell otherwise.

You may think they have flash chips inside them - we couldn't possibly
comment. They may as well be alien technology which allowed the manufacturer
to shrink a normal disk drive so it fits inside that package and stop you
from hearing the whirring sounds.

CompactFlash devices are driven by the existing IDE drivers in Linux. They 
can operate in 'True IDE' mode, or they can operate as PCMCIA IDE devices - 
mostly the latter is used. (CompactFlash is also used as a term for a 
slightly smaller form factor of PCMCIA socket. It has nothing to do with 
actual flash in that case either :)

CompactFlash devices do all the wear levelling internally. Like FTL and 
NFTL, they have a kind of pseudo-filesystem which they use for emulating a 
block device with normal-sized (512 byte) sectors. But they do it entirely 
internally, and you cannot see inside.

The DiskOnChip devices are _not_ IDE devices. They are real NAND flash 
devices, connected to the CPU's memory bus via a clever ASIC - and the 
computer actually has to deal with the flash chips directly - the emulation 
of a hard drive is done in software, not in hardware as in the case of 
CompactFlash. Hence they're driven by a special device driver which is part 
of the MTD system.

The DiskOnChip devices come with their own special BIOS extension to drive
the hardware (and the translation layer on the flash) and pretend to be a
block device via the standard INT 13h DOS interface. But once Linux is
running, that BIOS extension is useless. They have nothing to do with IDE.
_Any_ block device has to provide an INT 13h interface to DOS, including
SCSI drives and ramdisks. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
