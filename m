Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSnl2-0002wg-3s
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 14:57:29 +0000
Received: by pdob1 with SMTP id b1so27527406pdo.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 07:57:06 -0700 (PDT)
From: Peng Fan <van.freenix@gmail.com>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 van.freenix@gmail.com
Subject: [PATCH] mtd: blktrans: fix integer overflow
Date: Fri, 21 Aug 2015 22:57:31 +0800
Message-Id: <1440169051-13891-1-git-send-email-van.freenix@gmail.com>
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

Change the type of entry size of mtd_blktrans_dev to unsigned long long
to fix the overflow issue.

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/blktrans.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index e93837f..3853d74 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -38,7 +38,7 @@ struct mtd_blktrans_dev {
 	struct mutex lock;
 	int devnum;
 	bool bg_stop;
-	unsigned long size;
+	unsigned long long size;
 	int readonly;
 	int open;
 	struct kref ref;
-- 
1.8.4
