Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 125ct9-0004bF-00
	for mtd-list@infradead.org; Tue, 04 Jan 2000 22:57:15 +0000
Received: from ctam160.prophecy.com.au
	([203.21.127.160] helo=k9.prophecy.com.au ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 125ct5-0004b9-00
	for mtd@infradead.org; Tue, 04 Jan 2000 22:57:12 +0000
Received: from ctam.com.au (brendan@localhost [127.0.0.1])
	by k9.prophecy.com.au (8.8.7/8.8.7) with ESMTP id JAA03560
	for <mtd@infradead.org>; Wed, 5 Jan 2000 09:06:07 +1100
Message-ID: <38726ECE.D3E3AAEE@ctam.com.au>
Date: Wed, 05 Jan 2000 09:06:06 +1100
From: Brendan J Simon <Brendan.Simon@ctam.com.au>
Reply-To: Brendan.Simon@ctam.com.au
MIME-Version: 1.0
CC: linux-mtd <mtd@infradead.org>
Subject: Re: DiskOnChip for PowerPC embedded system.
References: <38719CC6.93FB5729@ctam.com.au> <E125Qft-0007VY-00@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> Brendan.Simon@ctam.com.au said:
> >  1) Do I need to reprogram the firmware on the DOC device or is the
> > Linux driver software all I need ?
>
> Some kind of firmware is required to get the machine booting off the
> DiskOnChip, but the normal firmware doesn't work very happily with LILO or
> grub. Apparently it works OK with syslinux though.

I'm using a PowerPC embedded system.  There is no floppy and it is obviously
non-Intel.  From what I know, lilo, grub and syslinux are Intel specific.
I can currently run a linux kernel out of a linear flash SIMM.  If this kernel
has the DOC drivers compiled in then I should be able to use the DOC without
having to touch the firmware.  Is this correct ?
I would have to write the low-end driver for the DOC I assume.


> I'd like to add code to grub to drive the DiskOnChip directly and replace the
> standard firmware. But I want to get the Linux drivers working first.

I thought they were working ?
Is it useable for a production system ?
What else needs to be done ?
I'm using kernel 2.2.5 at the moment.  Is this OK ?


> > 2) Can I use the firmware/ROM space to put own bootloader code ?  How
> > big is it ?
>
> 48K by default IIRC. You can use that as a first stage and load more though.

This could be handy :)


> > 3) Is there an FAQ for DOCs that aren't Intetl PC specific ?
>
> None of the stuff I've done so far is ia32-specific. The DiskOnChip Linux
> driver has been tested on Alpha, and although I don't have a big-endian box
> with an ISA slot I can fit the eval board in, I believe it should also work.
>
> Booting's a different problem - but I haven't addressed that yet.

I guess I could write some simple boot code that could read ext2 filesystem and
load the kernel into memory from the DOC, then boot the kernel.  I'm not sure
how much work is involved in that though.  M-Systems have on OS Adaption Kit
which has ANSI source for the TrueFFS, FAT FS, etc.  This may be worth
considering but I imagine it might be expensive, but I guess there is no harm in
enquiring.


> The firmware is _only_ required for booting the kernel. In DOS, it also
> provides INT 13h (Disk BIOS) services to access the DiskOnChip as a normal
> DASD, but under Linux we don't need that because we drive the hardware
> directly.

When you say the "firmware is _only_ required for booting the kernel", I take it
you mean only required when boot a kernel that is actually stored on the DOC
itself.  Sorry if this sounds like a dumb question.

Brendan Simon.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
