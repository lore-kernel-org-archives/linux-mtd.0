Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaOa5-0006xg-Rq
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 13:41:34 +0000
Received: by oixx17 with SMTP id x17so42834951oix.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2015 06:41:12 -0700 (PDT)
From: Peng Fan <van.freenix@gmail.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Cc: van.freenix@gmail.com,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2] mtd: blktrans: fix multiplication overflow
Date: Fri, 11 Sep 2015 21:41:47 +0800
Message-Id: <1441978907-19520-1-git-send-email-van.freenix@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In drivers/mtd/mtd_blkdevs.c:
406	set_capacity(gd, (new->size * tr->blksize) >> 9);
The type of new->size is unsigned long and the type of tr->blksize is int,
the result of 'new->size * tr->blksize' may exceed ULONG_MAX on 32bit
machines.

I use nand chip MT29F32G08CBADBWP which is 4GB and the parameters passed
to kernel is 'mtdparts=gpmi-nand:-(user)', the whole nand chip will be
treated as a 4GB mtd partition. new->size is 0x800000 and tr->blksize is
0x200, 'new->size * tr->blksize' however is 0. This is what we do not want
to see.

Using type cast u64 to fix the multiplication overflow issue.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---

Changes V2:
 use type cast to avoid build break for platforms which does not support 64 bit multilplication.

 drivers/mtd/mtd_blkdevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 44dc965..cb47d79 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -399,7 +399,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 		snprintf(gd->disk_name, sizeof(gd->disk_name),
 			 "%s%d", tr->name, new->devnum);
 
-	set_capacity(gd, (new->size * tr->blksize) >> 9);
+	set_capacity(gd, ((u64)new->size * tr->blksize) >> 9);
 
 	/* Create the request queue */
 	spin_lock_init(&new->queue_lock);
-- 
1.8.4
