Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14JQCu-0001f7-00
	for mtd-list@infradead.org; Fri, 19 Jan 2001 01:19:12 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.home)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14JQCt-0001f1-00
	for mtd@infradead.org; Fri, 19 Jan 2001 01:19:11 +0000
Date: Thu, 18 Jan 2001 20:19:05 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Gregory Schallert <gschallert@dawning.com>
cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: mtdblock: module -vs- kernel
In-Reply-To: <3A677BD2.421F2332@dawning.com>
Message-ID: <Pine.LNX.4.30.0101182017080.21027-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 18 Jan 2001, Gregory Schallert wrote:

> I have hacked physmap.c and jedec.c (my chips do not support CFI) and can now
> mount a filesystem on my flash device.  Everything works wonderful as a
> modules ( both block and char devices)....
>
> Now I want to make the flash device a root filesystem.  I have edited
> init/main.c and added the /dev/flash I node number and init_mtd function.

Why adding init_mtd?

> When I boot with mtdblock0 as my boot device It will uncompress the kernel and
> load it.  It then recognizes /dev/mtdblock0 as the boot device, but when it
> tries to load the filesystem it crashes.
>
> If  I do not set mtdblock0 as my boot device( and boot from floppy), the mtd
> char driver seems to be working fine when compiled into the kernel but I can
> not mount a block device. The proc/dev/ dir contains both mtd and mtdblock.
> the /proc/mtd dir only contains mtd0, and will not recognize mtdblock0 as a
> valid block device. (that means I can not mount any flash chips)

What does /proc/devices say?


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
