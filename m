Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO9MM-0003YO-Bw
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 21:09:51 +0000
Received: by mail-pf0-x244.google.com with SMTP id s66so4633407pfs.2
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 14:09:29 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: partitions: fixup some allocate_partition() whitespace
Date: Thu, 22 Jun 2017 14:09:18 -0700
Message-Id: <20170622210918.68280-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some recent patches caused churn around this area, and checkpatch
noticed the existing issues.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdpart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 2ad9493703f9..5736b0c90b33 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -402,7 +402,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
 {
-	int wr_alignment = (parent->flags & MTD_NO_ERASE) ? parent->writesize:
+	int wr_alignment = (parent->flags & MTD_NO_ERASE) ? parent->writesize :
 							    parent->erasesize;
 	struct mtd_part *slave;
 	u32 remainder;
@@ -480,8 +480,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 		slave->mtd._sync = part_sync;
 	if (!partno && !parent->dev.class && parent->_suspend &&
 	    parent->_resume) {
-			slave->mtd._suspend = part_suspend;
-			slave->mtd._resume = part_resume;
+		slave->mtd._suspend = part_suspend;
+		slave->mtd._resume = part_resume;
 	}
 	if (parent->_writev)
 		slave->mtd._writev = part_writev;
-- 
2.13.1.611.g7e3b11ae1-goog
