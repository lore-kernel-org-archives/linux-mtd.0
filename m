Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 133LLZ-0007cE-00
	for mtd-list@infradead.org; Sat, 17 Jun 2000 17:21:25 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 133LLX-0007c8-00
	for mtd@infradead.org; Sat, 17 Jun 2000 17:21:23 +0100
Date: Sat, 17 Jun 2000 18:22:03 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: Joakim Tjernlund <tjernlund@telia.com>
cc: mtd@infradead.org
Subject: Re: HW platform
In-Reply-To: <000f01bfd875$cd7a97c0$3396143e@jocke>
Message-ID: <Pine.LNX.3.96.1000617181808.28964A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 17 Jun 2000, Joakim Tjernlund wrote:
> Well, that sounds pretty simple(pretty much the same I do today with
> Enea OSE Delta kernel). But we also need to upgrade the kernel(download
> new kernel, store in FS and reboot to new kernel)
> I have read about GRUB and DOC and that sounds promising. Will that
> work on custom board with PPC and plain Flash memory(with minor adaptions)?

Well. If you have plain flash memory the best way is to store the kernel
image in a dedicated place in the flash. Then just let the boot code jump
to it.

Then you can reflash the kernel image when you need to upgrade the kernel.
That can be done using i.e. the MTD char device.

> What about device drivers for PPC 860?

What about them? Most of the build in devices in the 860 (the
communication controller stuff) already has drivers. You will need to
write flash (mtd) drivers (the recent CFI stuff might work though).
 
/ Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
