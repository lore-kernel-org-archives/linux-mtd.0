Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 133L5V-0007Yw-00
	for mtd-list@infradead.org; Sat, 17 Jun 2000 17:04:49 +0100
Received: from mailq.telia.com ([194.22.190.101] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 133L5T-0007YZ-00
	for mtd@infradead.org; Sat, 17 Jun 2000 17:04:47 +0100
Message-ID: <000f01bfd875$cd7a97c0$3396143e@jocke>
From: "Joakim Tjernlund" <tjernlund@telia.com>
To: "Alexander Larsson" <alex@cendio.se>
Cc: <mtd@infradead.org>
References: <Pine.LNX.3.96.1000617152038.24260A-100000@biffen.cendio.se>
Subject: Re: HW platform
Date: Sat, 17 Jun 2000 18:04:56 +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


----- Original Message -----
From: "Alexander Larsson" <alex@cendio.se>
To: "Joakim Tjernlund" <tjernlund@telia.com>
Cc: <mtd@infradead.org>
Sent: den 17 juni 2000 15:24
Subject: Re: HW platform


> On Sat, 17 Jun 2000, Joakim Tjernlund wrote:
>
> > > The PPC 860 series is well supported by Linux. Several of our
customers
> > > use it and are satisfied.
> >
> > Good to hear! What type of HW do they use(besides the CPU). Is
> > is possible to run Linux on 'bare' HW(no BIOS, or ROM monitor)?
> > Is there some typical HW configuration which will run Linux without
> > to much tweaking of Linux?  Which distro(we are aming for Linux 2.2) ?
>
> Basically you need a cpu, memory, flash and some external i/o circuits
> depending on what i/o you need to use (ethernet transcievers etc). You can
> pretty easily write you own boot code (I've done it). Just set up the
> memory and stuff, then jump to the linux kernel image stored in flash.

Well, that sounds pretty simple(pretty much the same I do today with
Enea OSE Delta kernel). But we also need to upgrade the kernel(download
new kernel, store in FS and reboot to new kernel)
I have read about GRUB and DOC and that sounds promising. Will that
work on custom board with PPC and plain Flash memory(with minor adaptions)?

What about device drivers for PPC 860?

 >
> > I was hoping to buy the HW design and fit it in on our control board.
> > Is there such a beast available?
>
> There are some development boards availible, but I don't know much about
> them. I've worked mainly with custom boards.

Well, a development board will do to get started but we need fit
the CPU design on our own board in the end.

    Jocke
>
> / Alex
>
>
>




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
