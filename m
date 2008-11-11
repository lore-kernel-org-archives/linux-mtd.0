Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kzljs-0004BT-7v
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 05:24:43 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KA500G4RLNVAW@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 14:23:55 +0900 (KST)
Received: from localhost.localdomain ([107.108.214.120])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KA500INBLNRER@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 14:23:52 +0900 (KST)
Date: Tue, 11 Nov 2008 11:01:32 +0530
From: Rohit <h.rohit@samsung.com>
Subject: [RFC] [PATCH 2/2] [MTDPARTS] Support erase regions with odd numbered
	blocks
To: linux-mtd@lists.infradead.org
Message-id: <491918B4.6040005@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Cc: 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An erroneous partition spanning across erase regions with odd
number of blocks may go undetected.

Examples are:

     1. Region 0 has 1 block of 128KB, region 1 has blocks of 256KB.
	A partition with offset 0 and length 256KB (gets erase size 256KB)
	is invalid but passes all checks.

     2. Region 0 has 1 block of 128KB, region 1 has 1 block of 256KB
	and region 2 has 128KB blocks. A partition with offset 0
	and length 512KB (gets biggest erasesize ie 256KB) is invalid.
	Such a partition passes all checks.

The patch checks if the portion of a partition present in
each region is multiple of erase size of partition.

Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
---
 mtdpart.c |   25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3728913..f091943 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -425,7 +425,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	}
 	if (master->numeraseregions > 1) {
 		/* Deal with variable erase size stuff */
-		int i, max = master->numeraseregions;
+		int i, rgn, max = master->numeraseregions;
 		u32 end = slave->offset + slave->mtd.size;
 		struct mtd_erase_region_info *regions = master->eraseregions;
 
@@ -437,12 +437,35 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		i--;
 
 		/* Pick biggest erasesize */
+		rgn = i;
 		for (; i < max && regions[i].offset < end; i++) {
 			if (slave->mtd.erasesize < regions[i].erasesize) {
 				slave->mtd.erasesize = regions[i].erasesize;
 			}
 		}
 		BUG_ON(slave->mtd.erasesize == 0);
+
+		if (slave->mtd.flags & MTD_WRITEABLE) {
+			/* If partition spans many erase regions,
+			 * the partition portion present in each region
+			 * should be multiple of biggest erase size
+			 */
+			unsigned portion_start, portion_end, region_end;
+
+			for (i = rgn; i < max && regions[i].offset < end; i++) {
+				portion_start = max(regions[i].offset, slave->offset);
+				region_end = regions[i].offset +
+					     regions[i].erasesize * regions[i].numblocks;
+				portion_end = min(end, region_end);
+
+				if ((portion_end - portion_start) % slave->mtd.erasesize) {
+					slave->mtd.flags &= ~MTD_WRITEABLE;
+					printk(KERN_WARNING"mtd: partition \"%s\" is not erase block"
+						" aligned within erase region -- force read-only\n", part->name);
+					break;
+				}
+			}
+		}
 	} else {
 		/* Single erase size */
 		slave->mtd.erasesize = master->erasesize;
---
