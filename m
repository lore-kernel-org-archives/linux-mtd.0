Received: from bm-3a.paradise.net.nz ([202.0.58.22]
	helo=linda-3.paradise.net.nz)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CX2j6-00075E-Vj
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 14:22:56 -0500
Received: from smtp-2.paradise.net.nz (smtp-2b.paradise.net.nz [202.0.32.211])
	by linda-3.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0I7P006GV75XP4@linda-3.paradise.net.nz> for
	linux-mtd@lists.infradead.org; Thu, 25 Nov 2004 08:22:45 +1300 (NZDT)
Received: from hayes.bluewaternz.com
	(203-96-159-182.paradise.net.nz [203.96.159.182])	by
	smtp-2.paradise.net.nz
	(Postfix) with ESMTP id 93DC19E723	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Nov 2004 08:22:44 +1300 (NZDT)
Date: Thu, 25 Nov 2004 08:24:53 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
In-reply-to: <41A15A30.4070808@bluewatersys.com>
To: Brad Beveridge <bbeveridge@bluewatersys.com>
Message-id: <41A4E005.7040205@bluewatersys.com>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7bit
References: <41A143C4.2090304@bluewatersys.com>
	<41A15A30.4070808@bluewatersys.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: BUG at dcache.h:276! Causing oops when I rmmod a nand module
 having mulitple partitions (fix)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys, we've managed to track down my mtd problem.

Setup:
- Using CONFIG_MTD_BLOCK
- Compiling your nand driver as a module
- Having multiple partitions defined

Problem:
insmodding the driver works, but when you rmmod the nand driver the 
kernel will oops.  The oops is caused by line 276 in dcache.h
The problem looks to be in mtd_blkdevs.c.  Everytime that 
add_mtd_blktrans_dev is called, a new gendisk is allocated, and its 
gd->queue member is set to
gd->queue = tr->blkcore_priv->rq;
The tr->blkcore_priv->rq appears to only get setup once in 
tr->blkcore_priv->rq.

Later, when del_mtd_blktrans_dev is called del_gendisk unregisters its 
queue.  So multiple gendisks point to the same queue & on removal they 
all try to get de-allocated.

Fix:
The very, very dodgy fix is to add
 ((struct gendisk *)old->blkcore_priv)->queue = NULL;
to del_mtd_blktrans_dev, just before del_gendisk is called.  This 
appears to let me rmmod my module without breakage.  Though I have no 
clue as to what the implications of doing this might be.

Can someone who knows the mtd_block layer better offer a proper fix?

Cheers
Brad
