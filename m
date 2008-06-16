Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8FjV-0006uW-HZ
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 14:30:58 +0000
Date: Mon, 16 Jun 2008 23:32:25 +0900 (JST)
Message-Id: <20080616.233225.23009595.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtdpart: Do not shadow symbol 'i'
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch kills this sparse warning:

linux/drivers/mtd/mtdpart.c:448:8: warning: symbol 'i' shadows an earlier one
linux/drivers/mtd/mtdpart.c:338:6: originally declared here

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
This is broken-out patch from "[PATCH RESEND] mtdpart: Avoid
divide-by-zero on out-of-reach path" on Sat, 14 Jun 2008 23:45:40

 drivers/mtd/mtdpart.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a7a82c7..5732dc0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -445,18 +445,18 @@ int add_mtd_partitions(struct mtd_info *master,
 		}
 		if (master->numeraseregions>1) {
 			/* Deal with variable erase size stuff */
-			int i;
+			int j;
 			struct mtd_erase_region_info *regions = master->eraseregions;
 
 			/* Find the first erase regions which is part of this partition. */
-			for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
+			for (j=0; j < master->numeraseregions && slave->offset >= regions[j].offset; j++)
 				;
 
-			i--;
-			slave->mtd.erasesize = regions[i].erasesize;
-			for (; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
-				if (slave->mtd.erasesize < regions[i].erasesize) {
-					slave->mtd.erasesize = regions[i].erasesize;
+			j--;
+			slave->mtd.erasesize = regions[j].erasesize;
+			for (; j < master->numeraseregions && slave->offset + slave->mtd.size > regions[j].offset; j++) {
+				if (slave->mtd.erasesize < regions[j].erasesize) {
+					slave->mtd.erasesize = regions[j].erasesize;
 				}
 			}
 		} else {
