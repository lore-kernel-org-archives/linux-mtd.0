From: jebc@c4solutions.net (Jeb Campbell)
Date: Tue, 18 Feb 2003 20:50:10 -0500
Subject: Grub 0.93 grub-2003-01-08-doc.patch DOC2000 trouble
In-Reply-To: <Pine.LNX.4.44.0302180947080.11781-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
References: <Pine.LNX.4.44.0302180947080.11781-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
Message-ID: <3E52E2D2.5090801@c4solutions.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I will try without the netboot code,
but it is not supposed to do anything unless
you drop to command and use {dhcp,bootp,ifconfig}
to config the network, then pull a kernel from tftp.

To clarify, it finds /boot/grub/menu.lst on first
partition of the DOC2000 (I assume the first to grub,
because if there is nothing on the DOC, it gives the
searching for menu.lst message on every possible drive
and partition combination), but will not boot the kernel
with "invalid partition table" (the board is at the lab
now), and the tab completion for "kernel (hd0,tab " fails
with the same error.

Anyway thank for the response and I will let you know
what happens without the netboot code.

Jeb Campbell

Ilguiz Latypov wrote:
> On Sat, 15 Feb 2003, Jeb Campbell wrote:
> 
> 
>>./configure --exec-prefix=/ \
>>         --disable-auto-linux-mem-opt \
> 
> 
> What is this option for?
> 
> 
>>But when I unplug the hd, grub fails on invalid MBR on the DOC2000-48M
>>I can netboot and get a kernel from tftp and boot the chip fine.
> 
> 
> What is the error message?  I believe there can be a conflict between the 
> "netdisk" and "diskonchip" default drive selection in stage2/asm.S.
> 
> 
>>But the strangest thing is grub will get the menu.lst from the DOC on 
>>the first partition!  But then error out when trying to boot/load the 
>>kernel.
> 
> 
> Is this the same error as above?
> 
> Thanks,
> Ilguiz
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
