Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12DsU0-00023Y-00
	for mtd-list@infradead.org; Thu, 27 Jan 2000 17:13:24 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12DsTy-00023S-00
	for mtd@infradead.org; Thu, 27 Jan 2000 17:13:22 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12DseX-0004vm-00
	for mtd@infradead.org; Thu, 27 Jan 2000 17:24:17 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12DseX-0005jo-00; Thu, 27 Jan 2000 17:24:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Loading Grub from DiskOnChip.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 27 Jan 2000 17:24:17 +0000
Message-Id: <E12DseX-0005jo-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I've succeeded in installing Grub into the DiskOnChip, replacing the original 
firmware. See ftp://ftp.infradead.org/pub/mtd/doc-grub-20000121.tar.gz

You'll need an updated version of doc_loadbios.c, which I've included in that 
tar file as well.

You'll also need your very own copy of grub.

This was the easy part - getting Grub to start from the DiskOnChip. Grub still 
isn't actually capable of reading (and hence booting) a kernel from the 
DiskOnChip yet. That one is left as an exercise for the reader - unless 
nobody's managed it by the time I next get a chance to look at it, which will 
be a month or so.

devel2 /homes/dwmw2/working/mtd $ cat grub/README 
	$Id: README,v 1.1 2000/01/27 16:59:28 dwmw2 Exp $

HOW TO GET GRUB BOOTING FROM DiskOnChip
---------------------------------------

(0. You'll need the driver modules loaded and the utils built.)
 1. Build GRUB.
 2. Copy the 'stage2' file to this directory.
 3. make
 4. ../util/doc_loadbios /dev/mtd0 grub_firmware

This assumes that the DiskOnChip is the only (or first) memory device
for which the driver was loaded - and hence that it's /dev/mtd0


HOW IT WORKS
------------

The DiskOnChip has a built-in ROM which is recognised as a BIOS extension
by the system BIOS. This is called the 'IPL ROM', and it attempts to load 
0x2000 bytes of the next stage, called the 'SPL, from the DiskOnChip.

To make life complex, it doesn't just load the first 0x2000 bytes from the
DiskOnChip - it loads half of the first 0x4000 bytes instead. Of each 512-byte
block, it loads the first 256 bytes. 
This is because of the way that NAND flash blocks are divided into two pages,
and presumably it's done to save code space in the IPL ROM.

As it loads the SPL, it performs a checksum. Iff the checksum of the SPL is
equal to 0x55, then it will execute the SPL, which it has loaded to the 
address 0x2000:0000.

The SPL in turn is responsible for loading the rest of the firmware from the 
DiskOnChip. Normally, this steals some memory for itself, and installs an
INT 13h (Disk BIOS) handler to emulate disk access.

We change this. Instead of installing an INT 13h handler, we install an
INT 18h (bootstrap) handler. This is very small, and is held entirely
within the first 256 bytes of the SPL with the code which installs it. 

The INT 18h handler, when executed, loads GRUB Stage2 from the DiskOnChip
to the place where GRUB Stage1 would normally load it, and then passes 
control to it.

Clear as mud? 

DW 27/1/00






--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
