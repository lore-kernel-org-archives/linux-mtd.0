Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12fGiN-0000Ut-00
	for mtd-list@infradead.org; Wed, 12 Apr 2000 07:33:27 +0100
Received: from polaris.uk.insnet.net ([194.177.174.245])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12fGiM-0000Un-00
	for mtd@infradead.org; Wed, 12 Apr 2000 07:33:26 +0100
Received: from whiskey.fireplug.net (cr355197-a.poco1.bc.wave.home.com [24.112.113.88])
	by polaris.uk.insnet.net (8.9.3/8.9.3) with ESMTP id FAA00333
	for <mtd@infradead.org>; Wed, 12 Apr 2000 05:08:41 +0100 (BST)
Received: from sl by whiskey.fireplug.net with local (Exim 3.13 #2)
	id 12fE2e-0004MK-00
	for mtd@infradead.org; Tue, 11 Apr 2000 20:42:12 -0700
To: mtd@infradead.org
From: sl@whiskey.fireplug.net (Stuart Lynne)
Subject: Re: DOC2000 and Kernel 2.3 ??
Date: 11 Apr 2000 20:42:11 -0700
Message-ID: <8d0raj$gbm$1@whiskey.fireplug.net>
References: <f1c7fssr0pi4tvjhv4g10trhkqq28j0i6r@4ax.com>
Reply-To: sl@fireplug.net
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

In article <f1c7fssr0pi4tvjhv4g10trhkqq28j0i6r@4ax.com>,
Udi Finkelstein <udif@bigfoot.com> wrote:
>Hi,
>
>I'm new to this list (and to DiskOnChip 2000 in general).
>
>I have an embedded linux system running with a 2.0.x based kernel and =
>m-sys's
>drivers.
>
>I want to build a new 2.3 kernel based system with the following =
>structure:
>
>* /boot partition with a 2.3 Kernel containing
>  a ramdisk based root file system (initrd).
>* RAM disk contains a skeleton filesystem with
>  99% of the files pointing to a CRAMFS (the
>  2.3.x compressed ROM filesystem) based partition
>  in the doc2000.
>* Data is stored on a 3rd partition (e2fs ??).
>
>Advantages:
>1. All fixed data is compressed (kernel is compressed by nature, initrd
>compressed by gzip, CRAMFS compressed by design).
>2. RAM based root filesystem allows modifying anything in the system =
>without
>writing to the doc2000, preventing any corruption. Rebooting the system
>returns it to a clean state.
>3. Separate data partition is separate from the rest of the system and =
>can be
>easily reformatted without affecting system.
>
>Now the big Question: What is the best (any) way to get a doc2000 working=
> with
>the 2.3 kernel?
>
>I see 3 possible options:
>
>1. Hacking the original m-sys 2.2.x driver to work under 2.3.x. Is this
>possible? How much of the binary only portion depends on the 2.2.x kernel=
> API?
>Can it be adapted to 2.3.x by changing only the skeleton code around it?

Very little if any. You should be able to just modify the fldrvlnx.c file
appropriately and have it work.

I'm not to sure what CRAMFS is going to do for you. It's not too hard
to have a minimal system entirely on the RAM disk.


-- 
Stuart Lynne <sl@fireplug.net>                __O 
<http://www.thinlinux.org>                  _-\<,_               604-461-7532
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00   (_)/ (_)   88 EC A3 EE 2D 1C 15 68


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
