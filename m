Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12QHJE-0003yK-00
	for mtd-list@infradead.org; Wed, 01 Mar 2000 22:09:32 +0000
Received: from router.alerton.com ([206.63.253.200] helo=ls.alerton.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12QHJB-0003yE-00
	for mtd@infradead.org; Wed, 01 Mar 2000 22:09:30 +0000
Received: from alerton.com (IDENT:roman@songdog.alerton.com [192.168.1.47])
	by ls.alerton.com (8.9.3/8.9.3) with ESMTP id OAA06586
	for <mtd@infradead.org>; Wed, 1 Mar 2000 14:09:14 -0800
Message-ID: <38BD950A.AF21594E@alerton.com>
Date: Wed, 01 Mar 2000 14:09:14 -0800
From: Bill Roman <roman@alerton.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Booting from the flash
References: <E12QFbt-0003hv-00@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren wrote:
> 
> It appears that nftl_format deletes M-Systems' firmware.  I
> remember that David wrote something about fixing that.
> doc_loadbios seems to destroy the partition entirely.  Neither M-
> Systems' drivers nor MTD drivers can recognize anything on the
> flash after doc_loadbios.
> 
> Is there a way to boot from a DOC2000 flash using MTD drivers?

Yes, I've just gone through this.  I've had mixed results resurrecting devices
after destroying their firmware this way: a 4 MB DiskOnChip 2000 was
recoverable, while a 2 MB unit was not.

What I learned is that doc_loadbios seems to need an image captured by "dd
if=/dev/mtd0 ...".  Given this, I was able to destroy and reload the M-Systems
firmware on the 4 MB device.  I confess, after the lack of success with the 2 MB
unit, I didn't try too hard to explore the failure modes in this process, so I'm
not promising it's foolproof.

Of course if that firmware is already gone, you can't capture an image of it!  I
managed to get out of this situation by using the DOS utilities from M-Systems'
web site, and thrashing around booting Linux and DOS from a floppy.  First, I
used the firmware image (DOC121.EXB) and doc_loadbios to load it.  This isn't
enough to make the firmware work, but it's enough to persuade DUPDATE.EXE
(running under DOS, I didn't try dosemu) that the DiskOnChip is present so it
would write the firmware the right way.

After you've succeeded in restoring the boot code (or, preferably, before you've
destroyed it), dd it off of /dev/mtd0 to make an image that works with
doc_loadbios.

You avoid getting into this mess in the first place by supplying an offset of
49152 (48 * 1024) when doing nftl_format.  For example:

    nftl_format /dev/mtd0 49152

This leaves the firmware intact.  Then insmod nftl.o, run fdisk to create a
partition, make a DOS filesystem on it with mkdosfs, and use syslinux to boot.  

I put the necessary modules (doc2000.o, mtd.o, and nftl.o) on an initial RAM
disk image.  This way I can access the flash to update the RAM disk image stored
there.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
