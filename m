Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140aK6-0001hR-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 02:16:46 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140aK4-0001hL-00
	for mtd@infradead.org; Tue, 28 Nov 2000 02:16:44 +0000
Date: Mon, 27 Nov 2000 21:16:37 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Louis Hamilton <hamilton@redhat.com>
cc: <mtd@infradead.org>
Subject: Re: Boot EBSA285 using root filesystem stored in flash
In-Reply-To: <001601c058b6$8792f060$151110ac@seado.wirespeed.com>
Message-ID: <Pine.LNX.4.30.0011272107120.6722-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 27 Nov 2000, Louis Hamilton wrote:

> Hello,
>
> I'm looking for information on moving our root filesystem (currently NFS
> mounted
> on a Linux host box) to flash memory on our EBSA285 (sa110) development
> card.

You need the dc21285 on top of all the other MTD modules.

> We would like to eliminate the step where the kernel uses NFS to mount the
> filesystem and instead boot the target using a filesystem stored in flash.

You may use the mtdblock interface and tell the kernel to mount its root
filesystem from it.  Any filesystems can be used.  However for a read-write
filesystem you should consider JFFS in priority.

> Do you know of any write-ups, urls, etc. to help achieve this goal?

Nope.

> I expect the MTD subsystem would (or could) be an important piece to
> solving the puzzle.

All pieces are already there.  You just need to know how to assemble them.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
