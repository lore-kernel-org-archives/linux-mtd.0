Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13iRUU-0006CN-00
	for mtd-list@infradead.org; Mon, 09 Oct 2000 02:12:30 +0100
Received: from ip-209-85-210-55.keyway.net ([209.85.210.55] helo=localhost.localdomain)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13iRUT-0006CH-00
	for mtd@infradead.org; Mon, 09 Oct 2000 02:12:29 +0100
Received: (from kevin@localhost)
	by localhost.localdomain (8.9.3/8.9.3) id SAA16567
	for mtd@infradead.org; Sun, 8 Oct 2000 18:13:49 -0700
Date: Sun, 8 Oct 2000 18:13:49 -0700
From: Kevin Moore <kevin@moore-and-moore.com>
To: mtd@infradead.org
Subject: Re: Grub support in DiskOnChip.
Message-ID: <20001008181349.C16501@flapjack>
Reply-To: kevin@moore-and-moore.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I have an Allwell STB1030N (small form-factor solid state x86 box)
with a 16 MB DOC Millenium, and I'm having difficulties getting grub
to work.  I can't get past the dreaded "DISK BOOT FAILURE..." message
after following essentially the same steps as outlined in the message
below.

I am using a 2.4.0-test9 kernel with "linux/drivers/mtd" and
"linux/include/linux/mtd" directories replaced with those from a
7 Oct, 2000 cvs checkout.  Everything seems fine for mounting, reading,
and writing with /dev/nftla1, so I assume that writing "grub_firmware"
is working.  I am using the grub version 0.5.95 to match the nftl patches
provided with mtd.  I'm using the recommended bios settings for booting
the DOC (SCSI,C), but I've tried the others as well.  Booting off
of a hard-drive or cdrom is no problem.

I tried changing the M-Systems lilo patches (major dev 62 -> 93),
loading doc-lilo, and using the mtd doc_loadbios to load the M-Sys
firmware (doc42.exb), but got the same result.  I need the 2.4.x kernels,
so going completely with their method is not an option.

This must be a problem with the stage1 loader and/or bios, but I'm
at a loss for how to proceed from here.  Any suggestions for what
to try next would be welcome.

Thanks,
Kevin Moore 

> 
> Hi,
> 
> i cant boot my DOC2000 with grub :-(
> 
> I did: (in this order)
> - patched grub with the 2 patches in mtd/grub/
> - make, make install (of grub)
> - copied the pre_stage2 to /mdt/grub
> - mdt/grub/make
> - doc_loadbios /dev/mtd0 grub_firmware
> - nftl_format /dev/mdt0 81920
> - fdisk /dev/nftla
> - mke2fs /dev/nftla1 -m 0
> - copied a kernel and /boot/grub to /nftla1
> 
> After rebooting, the grub shell comes up, but i can't access the DOC
> with something like root (dc0,0) etc.
> (Booting from (hd0) is possible)
> 
> Where I'm wrong ?
> 
> 
> > Grub patches to support NFTL properly have just been contributed.
> 
> > See mtd/patches/grub* and send virtual beer to void@dr.com
> 
> > --
> > dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
