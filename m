Received: from ppp118-210-9-147.lns20.adl2.internode.on.net ([118.210.9.147]
 helo=audi.shelbyville.oz)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdYrF-0004KK-0b
 for linux-mtd@lists.infradead.org; Fri, 25 Apr 2014 05:39:33 +0000
From: Ron <ron@debian.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] NAND_ECC_SOFT_BCH can support subpage reads too
Date: Fri, 25 Apr 2014 15:01:35 +0930
Message-Id: <1398403895-5176-1-git-send-email-ron@debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ron Lee <ron@debian.org>
---
 drivers/mtd/nand/nand_base.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9d01c4d..7f5b814 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4023,8 +4023,16 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->pagebuf = -1;
 
 	/* Large page NAND with SOFT_ECC should support subpage reads */
-	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
-		chip->options |= NAND_SUBPAGE_READ;
+	switch (ecc->mode) {
+	case NAND_ECC_SOFT:
+	case NAND_ECC_SOFT_BCH:
+		if (chip->page_shift > 9)
+			chip->options |= NAND_SUBPAGE_READ;
+		break;
+
+	default:
+		break;
+	}
 
 	/* Fill in remaining MTD driver data */
 	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
-- 
1.7.2.5
