Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 125QZg-0004IJ-00
	for mtd-list@infradead.org; Tue, 04 Jan 2000 09:48:20 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 125QZf-0004ID-00
	for mtd@infradead.org; Tue, 04 Jan 2000 09:48:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38719CC6.93FB5729@ctam.com.au> 
References: <38719CC6.93FB5729@ctam.com.au> 
To: Brendan.Simon@ctam.com.au
Cc: linux-mtd <mtd@infradead.org>
Subject: Re: DiskOnChip for PowerPC embedded system. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 04 Jan 2000 09:54:45 +0000
Message-Id: <E125Qft-0007VY-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Brendan.Simon@ctam.com.au said:
>  1) Do I need to reprogram the firmware on the DOC device or is the
> Linux driver software all I need ?

Some kind of firmware is required to get the machine booting off the 
DiskOnChip, but the normal firmware doesn't work very happily with LILO or 
grub. Apparently it works OK with syslinux though.

I'd like to add code to grub to drive the DiskOnChip directly and replace the 
standard firmware. But I want to get the Linux drivers working first.

> 2) Can I use the firmware/ROM space to put own bootloader code ?  How
> big is it ?

48K by default IIRC. You can use that as a first stage and load more though.

> 3) Is there an FAQ for DOCs that aren't Intetl PC specific ? 

None of the stuff I've done so far is ia32-specific. The DiskOnChip Linux 
driver has been tested on Alpha, and although I don't have a big-endian box 
with an ISA slot I can fit the eval board in, I believe it should also work.

Booting's a different problem - but I haven't addressed that yet.

The firmware is _only_ required for booting the kernel. In DOS, it also 
provides INT 13h (Disk BIOS) services to access the DiskOnChip as a normal
DASD, but under Linux we don't need that because we drive the hardware 
directly.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
