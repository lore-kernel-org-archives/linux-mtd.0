Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14T46F-0007Cl-00
	for mtd-list@infradead.org; Wed, 14 Feb 2001 15:44:11 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14T46C-0007Cf-00
	for mtd@infradead.org; Wed, 14 Feb 2001 15:44:08 +0000
Message-ID: <3A8AADF9.E7FD6C9F@danielind.com>
Date: Wed, 14 Feb 2001 10:10:33 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: Subodh Nijsure <subodh@best.com>
CC: mtd@infradead.org
Subject: Re: How is mtdblock created?
References: <200102140924.BAA24199@shell9.ba.best.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Oops! I'm glad that you asked that question. I forgot to include it into my howto.

In the mtd/util dir, there is a script file called, MAKEDEV.

Just run that scriptfile from /dev/ as:
sh /usr/src/mtd/util/MAKEDEV

This should create all your /dev/mtd0....n, /dev/mtdblock0....n, /dev/nftla,b,c,d
and /dev/nftla0,1,2,3 ... /dev/nftlb0,1,2,3 etc.

How did you create /dev/mtd0 in the first place?

Vipin


Subodh Nijsure wrote:

> > Then mount the file system by:
> > #mount -t jffs /dev/mtdblock0 /mnt/jffs (assuming /mnt/jffs exists, else
> > make it).
> >
> > *** Making partitions with CFI flash and working with multiple banks
> >     of FLASH:
> >
> > Unlike a "regular" block device, you cannot launch fdisk and create
> > partitions on /dev/mtdblock0,1,2,3...
> >
> > (As far as I know) CFI flash partitions have to be created and
> > compiled in the physmap.c file.
> >
>
> How are these /dev/mtdblock0...n devices created does one have to create
> them by hand are they are done as part of some module loading?
>
> When I do modprobe physmap I get following output
>
> sh-2.04# modprobe physmap
> physmap flash device: size 0x00400000 at address 0x28000000
> Call to cfi_probe received
> cfi_probe_new_chip  buswidth is 4 size 0x00400000
> Physically mapped flash: Found a coupled pair of CFI devices at location 0 in 16 bit mode
> cfip->qry[0] = '', cfip->qry[1] = '', cfip->qry[2] = ''
> Invalid CFI ident structure.
>
> cfi.chipsize is zero. This is bad. cfi.cfiq.DevSize is 0
> cfi_cfi_probe returned NULL

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If you got NULL here, how did your code proceed to below? Your modprobe physmap should have
failed.


>
> mtd: Giving out device 0 to Physically mapped flash
> mtd: Giving out device 1 to SkyStream boot firmware
> mtd: Giving out device 2 to SkyStream Flash Bank
> sh-2.04# cat /proc/mtd
> mtd0: 00400000 "Physically mapped flash"
> mtd1: 00040000 "SkyStream boot firmware"
> mtd2: 003a0000 "SkyStream Flash Bank"

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is showing that your flash was detected ok and assigned to /dev/mtd0,1,2
If you can read the flash contents then I guess you are ok, but I'm a bit mistified.

Vipin

>
>
> Now when I execute command od /dev/mtd0 to dump containts of the flash,
> they match correctly.
>
> But I want to create the jffs file system (mkfs.jffs) and mount them
> but howto says I need /dev/mtdblockXX to do something like this,
>
>         mount -t jffs /dev/mtdblock0 /mnt/jffs
>
> How is /dev/mtdblock0 created?
>
> /Subodh
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
