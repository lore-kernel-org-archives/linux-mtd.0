Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ADSF-0006f8-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 16:20:43 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13ADSD-0006f2-00
	for mtd@infradead.org; Thu, 06 Jul 2000 16:20:41 +0100
Received: from evoserve.com (rogelio@txn2-21,evoserve.com [210.16.11.21] (may be forged))
	by athena.evoserve.com (8.9.3/8.9.3) with ESMTP id XAA29333
	for <mtd@infradead.org>; Thu, 6 Jul 2000 23:23:37 +0800
Message-ID: <3962EBC0.F16A20AF@evoserve.com>
Date: Wed, 05 Jul 2000 16:03:12 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: jffs super block
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Does the jffs also have a super block on disk?

I have been trying to use jffs on DOC but i just cant get it to mount.
The jffs code could not find a single valid jffs inode on the DOC and
then dumps the disk data and then hang when I mount it after i dd a jffs
image to the it. The second time I boot I dont get any kind of output
anymore and my machine hangs. For starters, How should I write the jffs
file system on the DOC then? Should  I add a superblock on the chip?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
