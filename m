Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K7WzI-0005Vu-EQ
	for linux-mtd@lists.infradead.org; Sat, 14 Jun 2008 14:44:18 +0000
Date: Sat, 14 Jun 2008 23:45:40 +0900 (JST)
Message-Id: <20080614.234540.102579992.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On "partition is out of reach" path, i.e. slave's offset was bigger
than the master's size, slave's erasesize will not be calculated and
it leads division by zero on following boundary checking.  This patch
makes calculation of the slave's erasesize more robust.

This patch also contains some cleanups.  Do not shadow symbol 'i',
fold long lines, etc.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/mtdpart.c |   25 +++++++++++++++----------
 1 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 07c7011..ff9ea3a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -445,17 +445,22 @@ int add_mtd_partitions(struct mtd_info *master,
 		}
 		if (master->numeraseregions>1) {
 			/* Deal with variable erase size stuff */
-			int i;
-			struct mtd_erase_region_info *regions = master->eraseregions;
-
-			/* Find the first erase regions which is part of this partition. */
-			for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
+			int j, num = master->numeraseregions;
+			struct mtd_erase_region_info *r = master->eraseregions;
+			/*
+			 * Find the first erase region which is part
+			 * of this partition.
+			 */
+			for (j = 0; j < num && slave->offset >= r[j].offset;
+				j++)
 				;
-
-			for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
-				if (slave->mtd.erasesize < regions[i].erasesize) {
-					slave->mtd.erasesize = regions[i].erasesize;
-				}
+			j--;
+			slave->mtd.erasesize = r[j].erasesize;
+			for (; j < num &&
+				slave->offset + slave->mtd.size > r[j].offset;
+				j++) {
+				if (slave->mtd.erasesize < r[j].erasesize)
+					slave->mtd.erasesize = r[j].erasesize;
 			}
 		} else {
 			/* Single erase size */
