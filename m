Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJsMO-0002UJ-Ph
	for linux-mtd@lists.infradead.org; Fri, 18 Jul 2008 15:59:09 +0000
Date: Sat, 19 Jul 2008 01:00:57 +0900 (JST)
Message-Id: <20080719.010057.89067542.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: [PATCH 3/5] [MTD][MTDPART] Cleanup and document the erase region
	handling
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mostly simplifying the loops.  Now everything fits into 80 columns,
is easier to read and the finer details have extra comments.

Signed-off-by: Joern Engel <joern@logfs.org>
Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
This is a patch against mtd-2.6 tree.

 drivers/mtd/mtdpart.c |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9cf73d3..5aac59c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -424,18 +424,24 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	}
 	if (master->numeraseregions > 1) {
 		/* Deal with variable erase size stuff */
-		int i;
+		int i, max = master->numeraseregions;
+		u32 end = slave->offset + slave->mtd.size;
 		struct mtd_erase_region_info *regions = master->eraseregions;
 
-		/* Find the first erase regions which is part of this partition. */
-		for (i = 0; i < master->numeraseregions && regions[i].offset <= slave->offset; i++)
+		/* Find the first erase regions which is part of this
+		 * partition. */
+		for (i = 0; i < max && regions[i].offset <= slave->offset; i++)
 			;
+		/* The loop searched for the region _behind_ the first one */
+		i--;
 
-		for (i--; i < master->numeraseregions && regions[i].offset < slave->offset + slave->mtd.size; i++) {
+		/* Pick biggest erasesize */
+		for (; i < max && regions[i].offset < end; i++) {
 			if (slave->mtd.erasesize < regions[i].erasesize) {
 				slave->mtd.erasesize = regions[i].erasesize;
 			}
 		}
+		BUG_ON(slave->mtd.erasesize == 0);
 	} else {
 		/* Single erase size */
 		slave->mtd.erasesize = master->erasesize;
