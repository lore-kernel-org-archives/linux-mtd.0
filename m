Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14VnHH-0001KL-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 04:22:51 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14VnHF-0001KF-00
	for mtd@infradead.org; Thu, 22 Feb 2001 04:22:50 +0000
Message-ID: <30724FF712DFD2119E6200104B2448920119744A@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Unable to mount compressed root f/s because init_mtd() does not r
	egister block device!
Date: Wed, 21 Feb 2001 22:19:05 -0600
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

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
