Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14VoKX-0001bT-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 05:30:17 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14VoKW-0001bM-00
	for mtd@infradead.org; Thu, 22 Feb 2001 05:30:17 +0000
Message-ID: <30724FF712DFD2119E6200104B2448920119744B@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: Vipin Malik <Vipin.Malik@daniel.com>, "''mtd@infradead.org' '"
	 <mtd@infradead.org>
Subject: RE: Unable to mount compressed root f/s because init_mtd() does n
	ot r egister block device!
Date: Wed, 21 Feb 2001 23:26:24 -0600
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ok, looking a bit more at it, it seems that all the init for 
the mtd stuff is happening when do_inicalls() gets called as
they are all declared as initcalls.

But looking at the other block device stuff (hd, floppy etc.)
they all get init'ed by calling blk_dev_init() from genhd.c which
gets called by device_setup() called from init/main.c
 

This guarantees that the block devices are registered before
the ramdisk load stuff gets called, hence allowing them to be used
to load compressed filesystems.

This should be quite important to all as flash memory is considerably
more expensive than DRAM, hence the need to load compressed root
file systems from flash into RAMDISK.

How to we fix this (as I'm not too familiar with the init stuff and 
how to change that)?

Thanks,

Vipin

-----Original Message-----
From: Vipin Malik
To: 'mtd@infradead.org'
Sent: 2/21/01 10:19 PM
Subject: Unable to mount compressed root f/s because init_mtd() does not r
egister block device!

In 2.2.18 patched with the 2.2.18 patch, I'm trying to boot
a kernel from raw (CFI) flash and decompress an ext2 root
f/s image (from /dev/mtdblock0) into ramdisk and mount it as root.

Everything goes fine, (kernel boots etc.) but when the load ramdisk
code runs, it fails with a -ENODEV when it tries to open
the root device (to load the compressed root file system, present
on /dev/mtdblock0- right after the kernel).

It fails because, even though init_mtd() has been already
called before the rd_load() call in init/main.c, init_mtd()
does NOT call init_mtdblock() which actually registers the
mtdblock device.
This is done much later when the file system is actually installed.

Why? Any particular reason or no one tried this before.

Thanks

Vipin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
