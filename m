Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SyBe-000593-00
	for mtd-list@infradead.org; Wed, 14 Feb 2001 09:25:22 +0000
Received: from shell9.ba.best.com ([206.184.139.140] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SyBd-00058x-00
	for mtd@infradead.org; Wed, 14 Feb 2001 09:25:21 +0000
Received: (from subodh@localhost)
	by shell9.ba.best.com (8.9.3/8.9.2/best.sh) id BAA24199
	for mtd@infradead.org; Wed, 14 Feb 2001 01:24:22 -0800 (PST)
From: Subodh Nijsure <subodh@best.com>
Message-Id: <200102140924.BAA24199@shell9.ba.best.com>
Subject: How is mtdblock created?
In-Reply-To: <3A8995B4.F3F3EBCA@danielind.com> from Vipin Malik at "Feb 13, 1 02:14:44 pm"
To: mtd@infradead.org
Date: Wed, 14 Feb 2001 01:24:22 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> Then mount the file system by:
> #mount -t jffs /dev/mtdblock0 /mnt/jffs (assuming /mnt/jffs exists, else
> make it).
> 
> *** Making partitions with CFI flash and working with multiple banks
>     of FLASH:
> 
> Unlike a "regular" block device, you cannot launch fdisk and create
> partitions on /dev/mtdblock0,1,2,3...
> 
> (As far as I know) CFI flash partitions have to be created and
> compiled in the physmap.c file.
> 

How are these /dev/mtdblock0...n devices created does one have to create 
them by hand are they are done as part of some module loading?

When I do modprobe physmap I get following output

sh-2.04# modprobe physmap
physmap flash device: size 0x00400000 at address 0x28000000
Call to cfi_probe received
cfi_probe_new_chip  buswidth is 4 size 0x00400000
Physically mapped flash: Found a coupled pair of CFI devices at location 0 in 16 bit mode
cfip->qry[0] = '', cfip->qry[1] = '', cfip->qry[2] = ''
Invalid CFI ident structure.
 
cfi.chipsize is zero. This is bad. cfi.cfiq.DevSize is 0
cfi_cfi_probe returned NULL
mtd: Giving out device 0 to Physically mapped flash
mtd: Giving out device 1 to SkyStream boot firmware
mtd: Giving out device 2 to SkyStream Flash Bank
sh-2.04# cat /proc/mtd
mtd0: 00400000 "Physically mapped flash"
mtd1: 00040000 "SkyStream boot firmware"
mtd2: 003a0000 "SkyStream Flash Bank"                                           

Now when I execute command od /dev/mtd0 to dump containts of the flash,
they match correctly. 

But I want to create the jffs file system (mkfs.jffs) and mount them 
but howto says I need /dev/mtdblockXX to do something like this,

	mount -t jffs /dev/mtdblock0 /mnt/jffs 

How is /dev/mtdblock0 created?

/Subodh


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
