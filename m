Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12YVG0-0007u8-00
	for mtd-list@infradead.org; Fri, 24 Mar 2000 14:40:12 +0000
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12YVFx-0007u2-00
	for mtd@infradead.org; Fri, 24 Mar 2000 14:40:09 +0000
Message-ID: <38DB7EB8.5C134211@zentropix.com>
Date: Fri, 24 Mar 2000 14:42:00 +0000
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: Dvir Oren <dviro@lucidvon.com>
CC: MTD <mtd@infradead.org>
Subject: Re: [Fwd: MTD with 2.2.14 kernel]
References: <38DB3B0E.FCA11C16@zentropix.com> <38DB6125.D9A95166@lucidvon.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren wrote:
> 
> Trevor Woolven wrote:
> 
> > I tried initialising the MTD drivers via blk_dev_init() (ll_rw_blk.c) by
> > taking code out of init/main.c and putting it verbatim at the end of the
> > function, blk_dev_init(). This seemed most logical to me as the driver
> 
> This is what I did, and it indeeds doesn't work.  I think one of the
> reasons maybe in the mtd code itself.  When I compared it to the
> M-Systems code (the one c file they gave), they do it differently
> there.  I think for 2.2 kernels, you should do it as M-Systems did, and
> not as David did.  However, if you do it as you should for 2.2 kernels,
> it wouldn't really work for 2.3 kernels.  I think that what happens is
> that the driver does not get registered correctly.  Perhaps calling the
> init functions before blk_dev_init() somehow bypasses this problem.
> 
> > I can't understand why your patched LILO doesn't work either, it works
> > fine for me! As you're also getting file system corruption, why don't
> > you try using a new device, if you have one. I've found that once a DOC
> > goes bad, you just can't trust it at all but good ones are good all the
> > time.
> 
> I want to start off with a new DoC, however I'm afraid that I'll destroy
> it.
> I still haven't figured out a way to recover a problematic DoC, without
> using docpmap /e.  I can indeed boot off using the patched lilo with a
> hard disk.  I think the problem is with the file system that gets
> corrupted (and then LILO can't find its files).  I don't understand why
> it gets corrupted though.  And I don't understand how you can work with
> a file system formatted with dformat using MTD.
> 
> --
> Dvir Oren <dviro@lucidvon.com>
> Lucid VON Ltd.     <http://www.lucidvon.com>
> 9 Saloniki St.,        Tel-Aviv       Israel
> Tel:  +972 3 644 3038  Fax:  +972 3 644 3039
I think that so long as you don't do docpmap /e you won't destroy the
DOC but I understand why you're reluctant to use a new one!

I think we may need to compare detailed notes regarding development
system set-up, lilo.conf, DOC formatting etc before we can find the
subtle difference between what you're doing and what I'm doing and so
find out why your system doesn't seem to work whereas mine does! Do you
always do an 'rdev' before running lilo?

As for the M-Systems: dformat, dupdate utilities...I just use them as
directed by M-Systems in their document: IM-DOC-021 Using the DiskOnCHip
with Linux OS, and then both the MTD driver and the M-System driver can
access the DOCs.

Have you got the latest MTD code from David via cvs?
What version of the M-Systems utilities are you using?

Here's an outline of what I do:

insert M-Systems utilities boot floppy & reboot
docpmap /i to get the memory window address (on my system e400)
dformat /win:e400 /s:doc2.fff
reboot
dupdate /win:e400 /s:doc121.exb
reboot
dinfo - just to check
remove floppy & reboot into a Linux kernel with the MTD driver installed
fdisk /dev/nftla
	delete the FAT partition
	add a linux native partition
	write and quit
shutdown -r now
mke2fs /dev/nftla1
mount -t ext2 /dev/nftla1 /mnt/diskonchip
cd /mnt/diskonchip
tar -zxvf /home/trevw/doc_root_fs.tgz 
cd
rdev /mnt/diskonchip/boot/bzImage /dev/nftla1
/sbin/your-patched-lilo -C /mnt/diskonchip/etc/lilo.conf 
			-i /mnt/diskonchip/boot/your-boot.b 
			-m /mnt/diskonchip/boot/map

(Usually, this tells me that /dev/nftla1 is not on the first disk in the
system but I know that...)
shutdown -r now & insert M-Systems utilities boot floppy
dupdate /win:e400 /s:doc121.exb /first
remove floppy and reboot, watch it all burst into life from the DOC!!

Hope this helps,

Cheers

Trevor.
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
