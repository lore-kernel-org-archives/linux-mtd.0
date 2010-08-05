Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22u-0007VC-MP
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:51 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 7/7] mtd: Blackfin NFC: fix raw page write/read handling
Date: Thu,  5 Aug 2010 11:07:44 -0400
Message-Id: <1281020864-26842-7-git-send-email-vapier@gentoo.org>
In-Reply-To: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Barry Song <barry.song@analog.com>

Our write_buf/read_buf funcs always do ECC in HW ECC mode.  That is not
needed for raw funcs.  In fact, write_buf/read_buf should be a pure func
for data input/output while chip->ecc.hwctl controls ECC.  Unfortunately,
we can't separate ECC from normal data input/output in our NFC, so our DMA
write_buf/read_buf entries are coupled with ECC operations closely.

Thus we need to provide dedicated read_page_raw/write_page_raw funcs where
we do non-DMA transactions so as to avoid automatic ECC.

Signed-off-by: Barry Song <barry.song@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/nand/bf5xx_nand.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index b54f222..a382e3d 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -566,6 +566,22 @@ static void bf5xx_nand_dma_write_buf(struct mtd_info *mtd,
 		bf5xx_nand_write_buf(mtd, buf, len);
 }
 
+static int bf5xx_nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		uint8_t *buf, int page)
+{
+	bf5xx_nand_read_buf(mtd, buf, mtd->writesize);
+	bf5xx_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+	return 0;
+}
+
+static void bf5xx_nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		const uint8_t *buf)
+{
+	bf5xx_nand_write_buf(mtd, buf, mtd->writesize);
+	bf5xx_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+}
+
 /*
  * System initialization functions
  */
@@ -807,6 +823,8 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 		chip->ecc.correct   = bf5xx_nand_correct_data;
 		chip->ecc.mode	    = NAND_ECC_HW;
 		chip->ecc.hwctl	    = bf5xx_nand_enable_hwecc;
+		chip->ecc.read_page_raw = bf5xx_nand_read_page_raw;
+		chip->ecc.write_page_raw = bf5xx_nand_write_page_raw;
 	} else {
 		chip->ecc.mode	    = NAND_ECC_SOFT;
 	}
-- 
1.7.2
