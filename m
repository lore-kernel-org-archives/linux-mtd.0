Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 133QL6-00088Y-00
	for mtd-list@infradead.org; Sat, 17 Jun 2000 22:41:16 +0100
Received: from mailq.telia.com ([194.22.190.101] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 133QL4-00088S-00
	for mtd@infradead.org; Sat, 17 Jun 2000 22:41:15 +0100
Message-ID: <000701bfd8a4$cfba6a40$4d96143e@jocke>
From: "Joakim Tjernlund" <tjernlund@telia.com>
To: "Alexander Larsson" <alex@cendio.se>
Cc: <mtd@infradead.org>
References: <Pine.LNX.3.96.1000617181808.28964A-100000@biffen.cendio.se>
Subject: Re: HW platform
Date: Sat, 17 Jun 2000 23:41:35 +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> On Sat, 17 Jun 2000, Joakim Tjernlund wrote:
> > Well, that sounds pretty simple(pretty much the same I do today with
> > Enea OSE Delta kernel). But we also need to upgrade the kernel(download
> > new kernel, store in FS and reboot to new kernel)
> > I have read about GRUB and DOC and that sounds promising. Will that
> > work on custom board with PPC and plain Flash memory(with minor
adaptions)?
>
> Well. If you have plain flash memory the best way is to store the kernel
> image in a dedicated place in the flash. Then just let the boot code jump
> to it.
>
> Then you can reflash the kernel image when you need to upgrade the kernel.
> That can be done using i.e. the MTD char device.

Great! should be fairly easy to make the boot code to select
between 2 different images.

>
> > What about device drivers for PPC 860?
>
> What about them? Most of the build in devices in the 860 (the
> communication controller stuff) already has drivers. You will need to
> write flash (mtd) drivers (the recent CFI stuff might work though).

Good! I am manily intressted in ethernet, UART and HDLC drivers
(plus flash, but I expect to write that myself)

Do you know good distro start with or should I just take
the latest kernel release?

Many thanks for your patience and help!

      Jocke
>
> / Alex
>




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
