Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14XPWN-0004cN-00
	for mtd-list@infradead.org; Mon, 26 Feb 2001 15:25:07 +0000
Received: from duba04h04-0.dplanet.ch ([212.35.36.38])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14XPWL-0004cH-00
	for mtd@infradead.org; Mon, 26 Feb 2001 15:25:06 +0000
Received: from ntws (dialup-59-173.dplanet.ch [212.35.59.173])
	by duba04h04-0.dplanet.ch (8.9.3/8.9.3/1.01dplanet-smtp) with SMTP id QAA16566
	for <mtd@infradead.org>; Mon, 26 Feb 2001 16:24:51 +0100
Reply-To: <hamish@dplanet.ch>
From: "Hamish Guthrie" <hamish@dplanet.ch>
To: "Mtd@Infradead.Org" <mtd@infradead.org>
Subject: Could not find valid boot record
Date: Mon, 26 Feb 2001 16:30:21 +0100
Message-ID: <NEBBJKADBKFNCJOMHOAKMECOCGAA.hamish@dplanet.ch>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I trying to mount a root filesystem using LinuxBIOS on a DoC millenium.

I have formatted an nftl portion of the DoC using

# nftl_format /dev/mtd0 1048576

to create an nftl 'partition' at an offset of 1M from the beginning of the
device. I then fdisk this, create the partition, make it bootable (even if I
don't I get the same result). Then mke2fs on the device. Mount the device -
it is seen correctly - then populate it with some files an umount it. I then
burn in my IPL code, LinuxBIOS code and Kernel image (using 2.4.2 kernel).

I am also passing the command line argument 'root=/dev/nftla' to the kernel.

When I boot out of the DoC I get:

M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
NFTL_notify_add for DiskOnChip Millennium
mtd->read = c0193100, size = 8388608, erasesize = 8192
NFTL_setup
Could not find valid boot record
Could not mount NFTL device
NFTL_open
ENODEV: thisNFTL = 0, minor = 23808, ip = c0091780, fp = c0095f04
VFS: Cannot open root device "nftla" or 5d:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 5d:00

Any pointers as to where I may be screwing up please??

TIA

Hamish Guthrie



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
