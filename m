From: ilatypov@infradead.org (Ilguiz Latypov)
Date: Tue, 18 Feb 2003 09:53:23 -0500 (EST)
Subject: Grub 0.93 grub-2003-01-08-doc.patch DOC2000 trouble
In-Reply-To: <3E4E1345.9020806@c4solutions.net>
Message-ID: <Pine.LNX.4.44.0302180947080.11781-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sat, 15 Feb 2003, Jeb Campbell wrote:

> ./configure --exec-prefix=/ \
>          --disable-auto-linux-mem-opt \

What is this option for?

> But when I unplug the hd, grub fails on invalid MBR on the DOC2000-48M
> I can netboot and get a kernel from tftp and boot the chip fine.

What is the error message?  I believe there can be a conflict between the 
"netdisk" and "diskonchip" default drive selection in stage2/asm.S.

> But the strangest thing is grub will get the menu.lst from the DOC on 
> the first partition!  But then error out when trying to boot/load the 
> kernel.

Is this the same error as above?

Thanks,
Ilguiz
