Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from tmmi196-012.telusvelocity.net
	([209.115.196.12] helo=Wakko.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 1198n7-0001Px-00
	for mtd@infradead.org; Tue, 27 Jul 1999 16:05:17 +0100
Date: Tue, 27 Jul 1999 09:04:35 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: dony <dony.he@huawei.com.cn>
cc: mtd@infradead.org
Subject: Re: embedded linux help...
In-Reply-To: <001801bed8da$edaa8c80$34750981@huawei.com.cn>
Message-ID: <Pine.LNX.3.96.990727085212.19337A-100000@Wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 28 Jul 1999, dony wrote:

> > >    I want to build embedded linux into FLASHROM . But I some questions
> > > to ask: 
> > 
> > I have been working on exactly this problem and then some for the past
> > little while. Hopefully I'll release a first draft of my stuff to the MTD group sometime this week (http://www.linux-mtd.infradead.org/). 
 
> QUESTIONS:  I can not visit this Web Page
> http://www.linux-mtd.infradead.org . Is this right?  BTW, what does MTD
> means? 

Yes, that is the correct path, MTD stands for Memory Technolgy Devices and
covers flash, ROMs and RAMs.

> QUESTIONS:
> 1  What is a FFS2 file system? Fast File System or Flash File System? 
>     Does the  linux kernel support it? 
>     Do you mean you can build a FFS2 file system in FLASHROM , just the same way 
>     as building ext2 file system in HardDisk using "mke2fs" command? Right?
>     And Do I have to write a linux driver to support FFS2 in order to use FFS2 file 
>     system ? Is it difficult to do so? 

FFS2 is the Flash File System Version 2 - I have written most of a Linux
implemenation, but it still needs some work - right now it acts more like
a WORM system than a full read/write :|. That is part of the stuff I hope
to release this week. 

> 2  Yes, I have tried etherboot package. It seems to boot kernel and then mount root
>     fs from a server via BOOTP,  TFTP, NFS protocols in order. 
>     But my goal is boot the mini-linux locally all from FLASHROM which contains  
>     BootLoader  , compressed kernel image and compressed root file system image. 
>     How can I modify its original boot loader? Can you help me in detail?
>     And why do I  need map an 8k region of my flash into upper memory? 

The etherboot package is a good starting place for getting a boot loader.
You need an 8k memory window to place your boot code in, assuming you
don't have someplace else to stick a 8k bios extension. One of the first
things I did was to make my board etherboot with the etherboot code placed
in it's flash instead of on a floppy.

> BIOS->boot loader->decompress kernel.image and run it.
> At this time we have started the kernel , then how can it find rootfs.image and decompress it into RAM? 
> Do I have to modify the kernel source files to serve this purpose?  
> Does your BootLoader can implement it directly and need not modify kernel sources?

My implementation creates a /dev/mtd0 block device that represents the
flash media. The kernel boots directly to that just as it normally does
and mounts a FFS2 filesystem to continue booting. Although I have not
implemented compression yet, the filesystem is able to store compressed
blocks for the file data - using a compressed root image is generally not
a good idea if you have only a small amount of memory.

In my system I have a 2meg flash that contains the boot loader, the system
bios and the root filesystem. The device starts up, boots the bios from
the flash and then maps th first 32k of flash into 0xe8000 which make a
bios extension visible to the bios. As the bios boots it finds that
extension and runs it which activates the boot loader that then reads
directly from the FFS2 partition the file '/linux' into memory and
executes it which boots the kernel. The kernel boots, and is told that
it's root is '/dev/mtd1' and it then mounts the FFS2 root file system and
then runs /sbin/init which is my statically linked program. After all this
is done I will have about 900k worth of flash left to store various bits
of state information for the device.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
