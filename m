Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14JOTJ-00012c-00
	for mtd-list@infradead.org; Thu, 18 Jan 2001 23:28:01 +0000
Received: from dawnmail.dawning.com ([24.93.23.251])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14JOTC-00012W-00
	for mtd@infradead.org; Thu, 18 Jan 2001 23:28:01 +0000
Received: from [192.168.0.142] by dawnmail.dawning.com (NTMail 4.30.0013/NY3896.00.832c5e1f) with ESMTP id jpwgaaaa for <mtd@infradead.org>; Thu, 18 Jan 2001 18:28:30 -0500
Message-ID: <3A677BD2.421F2332@dawning.com>
Date: Thu, 18 Jan 2001 18:27:14 -0500
From: Gregory Schallert <gschallert@dawning.com>
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: mtdblock: module -vs- kernel
References: <Pine.LNX.4.10.10011011431390.3482-100000@xanadu.vipswitch.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Ok I finally have the initial hardware to do some testing.

Short story...

I can get the mtd char and block drivers to work as modules, but when I
compile them into the kernel only the char device driver works. Any Ideas?

Long story...

I have hacked physmap.c and jedec.c (my chips do not support CFI) and can now
mount a filesystem on my flash device.  Everything works wonderful as a
modules ( both block and char devices)....

Now I want to make the flash device a root filesystem.  I have edited
init/main.c and added the /dev/flash I node number and init_mtd function.

When I boot with mtdblock0 as my boot device It will uncompress the kernel and
load it.  It then recognizes /dev/mtdblock0 as the boot device, but when it
tries to load the filesystem it crashes.

If  I do not set mtdblock0 as my boot device( and boot from floppy), the mtd
char driver seems to be working fine when compiled into the kernel but I can
not mount a block device. The proc/dev/ dir contains both mtd and mtdblock.
the /proc/mtd dir only contains mtd0, and will not recognize mtdblock0 as a
valid block device. (that means I can not mount any flash chips)

I have a good understanding about the kernel boot flags and really don't think
that is where the problem is...Is there something I am missing about booting
from the flash device?

Gregory Schallert
Dawning Technologies, Inc.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
