Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mmaD-0002oY-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 02:04:37 +0100
Received: from 61-218-105-170.hinet-ip.hinet.net ([61.218.105.170] helo=maillog.sis.com.tw)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mma5-0002oM-00
	for mtd@infradead.org; Tue, 10 Apr 2001 02:04:35 +0100
Message-ID: <3AD25B85.DA815E88@sis.com.tw>
Date: Tue, 10 Apr 2001 09:01:57 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Chris Robson <robsonc@phocussystems.com>
CC: mtd@infradead.org
Subject: Re: DOC 2000 Boot Problem
References: <271FF2B6A3F203418C76438C8A5FDF871992@seven.phocussystems.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Chris Robson wrote:
> 
> Are there any issues w/ using a 8MB Disk on Chip 2000 (PN D2200-D08).
> I installed Kernel 2.4.3 w/ the MTD image from April 5.  And when the
> system boots from the DOC, I see two things:
> 
>         During the detection of something at the very start of the
> kernel, there is garbage displayed on the       screen.
> 
>         When the kernel is done booting, and it goes to mount root as
> /dev/nftla1 it says
> 
>         "VFS: Cannot open root device "" or 03:05
>         Please append a correct "root=" boot option
>         Kernel panic:  VFS: Unable to mount root fs on 03:05
> 

The kernel wants to mount root filesystem from /dev/hda1 rather
then /dev/nftla1. You have to issue kernel command line for
your lilo.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
