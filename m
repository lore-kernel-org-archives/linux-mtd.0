Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W1Uw-0008B5-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 19:33:54 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14W1Uu-0008Ay-00
	for mtd@infradead.org; Thu, 22 Feb 2001 19:33:53 +0000
Message-ID: <3A957005.3400694E@danielind.com>
Date: Thu, 22 Feb 2001 14:01:09 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: Amit D Chaudhary <amitc@brocade.com>
CC: Vipin Malik <Vipin.Malik@daniel.com>,
 	"'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: Unable to mount compressed root f/s because init_mtd() does not r	 
 egister block device!
References: <30724FF712DFD2119E6200104B2448920119744A@mail1> <3A956884.2050504@brocade.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Bacause, the ram disk driver needs a registered block device to
decompress from. This code already exists in the linux kernel (see
drivers/block/rd.c)
(to uncompress a compressed root file system image). I don't want to
write it again.

Also, as far as reading goes, there is no real difference between the
mtd0 device and the block device (i.e. reading from
mtd0 does not get you anything extra).

Vipin



Amit D Chaudhary wrote:

> Hi,
>
> A question here, why not uncompress from the raw mtd device(that is
> /dev/mtd0, /dev/mtd1, etc) instead?
>
> Thanks
> Amit
>
> Vipin Malik wrote:
>
> > In 2.2.18 patched with the 2.2.18 patch, I'm trying to boot
> > a kernel from raw (CFI) flash and decompress an ext2 root
> > f/s image (from /dev/mtdblock0) into ramdisk and mount it as root.
> >



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
