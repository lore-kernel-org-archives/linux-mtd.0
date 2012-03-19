Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9l81-0008E5-W2
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:32:39 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] drivers/mtd: docg3 fix inbound calculations
Date: Mon, 19 Mar 2012 23:32:19 +0100
Message-Id: <1332196342-21545-2-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
References: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The last erase block was not accessible, as the out of bound
check was incorrectly rejecting the last block.
The read/write/erase offset checks were forbidding the usage of the
last block, because of the calculation which was considering the
byte after the last instead of the last byte.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   17 +++++------------
 1 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index db9a4b7..09d039d 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -872,11 +872,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	if (ooblen % DOC_LAYOUT_OOB_SIZE)
 		return -EINVAL;
 
-	ret = -EINVAL;
-	calc_block_sector(from + len, &block0, &block1, &page, &ofs,
-			  docg3->reliable);
-	if (block1 > docg3->max_block)
-		goto err;
+	if (from + len > mtd->size)
+		return -EINVAL;
 
 	ops->oobretlen = 0;
 	ops->retlen = 0;
@@ -1206,7 +1203,7 @@ static int doc_erase(struct mtd_info *mtd, struct erase_info *info)
 	calc_block_sector(info->addr + info->len, &block0, &block1, &page,
 			  &ofs, docg3->reliable);
 	ret = -EINVAL;
-	if (block1 > docg3->max_block || page || ofs)
+	if (info->addr + info->len > mtd->size || page || ofs)
 		goto reset_err;
 
 	ret = 0;
@@ -1442,12 +1439,8 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 	if (len && ooblen &&
 	    (len / DOC_LAYOUT_PAGE_SIZE) != (ooblen / oobdelta))
 		return -EINVAL;
-
-	ret = -EINVAL;
-	calc_block_sector(ofs + len, &block0, &block1, &page, &pofs,
-			  docg3->reliable);
-	if (block1 > docg3->max_block)
-		goto err;
+	if (ofs + len > mtd->size)
+		return -EINVAL;
 
 	ops->oobretlen = 0;
 	ops->retlen = 0;
-- 
1.7.5.4
