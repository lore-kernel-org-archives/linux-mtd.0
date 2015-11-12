Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwgLi-0003OA-JT
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 01:06:51 +0000
Received: by padhx2 with SMTP id hx2so46939998pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 17:06:30 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Foster <brian.foster@maximintegrated.com>
Subject: [PATCH] mtd: partitions: kill unused ecclayout struct
Date: Wed, 11 Nov 2015 17:05:56 -0800
Message-Id: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This field is not used.

Reported here:

http://lists.infradead.org/pipermail/linux-mtd/2015-October/062417.html

Reported-by: Brian Foster <brian.foster@maximintegrated.com>
Cc: Brian Foster <brian.foster@maximintegrated.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Depends on this for killing its last use:

  http://patchwork.ozlabs.org/patch/543159/

 include/linux/mtd/partitions.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 282644c0c5c0..34388ced421a 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -41,7 +41,6 @@ struct mtd_partition {
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
-	struct nand_ecclayout *ecclayout;	/* out of band layout for this partition (NAND only) */
 	struct device_node *of_node;	/* OF node attached to the partition */
 };
 
-- 
2.6.0.rc2.230.g3dd15c0
