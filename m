Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eE8l-00065O-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 11:08:39 +0100
Received: from polaris.uk.insnet.net ([194.177.174.245])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13eE8k-00065I-00
	for mtd@infradead.org; Wed, 27 Sep 2000 11:08:38 +0100
Received: from imladris.demon.co.uk (imladris.demon.co.uk [193.237.130.41])
	by polaris.uk.insnet.net (8.9.3/8.9.3) with ESMTP id KAA10545
	for <mtd@infradead.org>; Wed, 27 Sep 2000 10:20:43 +0100 (BST)
Date: Wed, 27 Sep 2000 10:17:57 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Kundrat <kundrat@pkx.sk>
cc: mtd@infradead.org
Subject: Re: journalled fs on partitioned flash
In-Reply-To: <20000927080515.A15228@napri.sk>
Message-ID: <Pine.LNX.4.21.0009271015050.4342-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 27 Sep 2000, Peter Kundrat wrote:

> When i tried to dd if=rootfs.jffs of=/dev/mtdblock/0 i got
> end_request: I/O error, dev 1f:00 (mtdblock) sector 0 
> end_request: I/O error, dev 1f:00 (mtdblock) sector 254
> etc. every 254 blocks
> and dd hung in D state (__wait_on_buffer+0x4c)
> 
> Is it a known problem ? 

Yep. The mtdblock device doesn't actually work, and it's used by JFFS
_only_ to get a handle on the underlying MTD device. Use the character
device to put your initial image on there instead.

I'm not sure how effective cloop on JFFS will be - if it's just
compression you're after, you'd probably be better off implementing
compression in JFFS - it's not too hard.

And JFFS doesn't work on the DiskOnChip yet, because the DiskOnChip uses
NAND flash. See sjhill's TODO list.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
