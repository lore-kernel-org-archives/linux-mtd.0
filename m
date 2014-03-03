Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKPoF-0001XM-Vn
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 10:09:22 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 1/4] mtd: nand: omap: ecc.hwctl: rename
 omap3_enable_hwecc_bch to omap_enable_hwecc_bch
Date: Mon, 3 Mar 2014 15:38:30 +0530
Message-ID: <1393841313-28214-2-git-send-email-pekon@ti.com>
In-Reply-To: <1393841313-28214-1-git-send-email-pekon@ti.com>
References: <1393841313-28214-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch
 - renames omap3_enable_hwecc_bch -> omap_enable_hwecc_bch to keep
   nomenclature independent of any device family.
 - using '__maybe_unused' instead of `ifdef based conditional compilation
   to suppress warning for un-used functions

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 7428ed0..efc94f1 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1034,9 +1034,8 @@ static int omap_dev_ready(struct mtd_info *mtd)
 	}
 }
 
-#if defined(CONFIG_MTD_NAND_ECC_BCH) || defined(CONFIG_MTD_NAND_OMAP_BCH)
 /**
- * omap3_enable_hwecc_bch - Program OMAP3 GPMC to perform BCH ECC correction
+ * omap_enable_hwecc_bch - Program GPMC to perform BCH ECC calculation
  * @mtd: MTD device structure
  * @mode: Read/Write mode
  *
@@ -1047,7 +1046,7 @@ static int omap_dev_ready(struct mtd_info *mtd)
  * eccsize0 = 0  (no additional protected byte in spare area)
  * eccsize1 = 32 (skip 32 nibbles = 16 bytes per sector in spare area)
  */
-static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
+static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 {
 	int nerrors;
 	unsigned int dev_width, nsectors;
@@ -1115,7 +1114,7 @@ static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	/* Clear ecc and enable bits */
 	writel(ECCCLEAR | ECC1, info->reg.gpmc_ecc_control);
 }
-#endif
+
 static u8  bch4_polynomial[] = {0x28, 0x13, 0xcc, 0x39, 0x96, 0xac, 0x7f};
 static u8  bch8_polynomial[] = {0xef, 0x51, 0x2e, 0x09, 0xed, 0x93, 0x9a, 0xc2,
 				0x97, 0x79, 0xe5, 0x24, 0xb5};
@@ -1769,7 +1768,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.size		= 512;
 		nand_chip->ecc.bytes		= 7;
 		nand_chip->ecc.strength		= 4;
-		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
+		nand_chip->ecc.hwctl		= omap_enable_hwecc_bch;
 		nand_chip->ecc.correct		= nand_bch_correct_data;
 		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		/* define ECC layout */
@@ -1809,7 +1808,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		/* 14th bit is kept reserved for ROM-code compatibility */
 		nand_chip->ecc.bytes		= 7 + 1;
 		nand_chip->ecc.strength		= 4;
-		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
+		nand_chip->ecc.hwctl		= omap_enable_hwecc_bch;
 		nand_chip->ecc.correct		= omap_elm_correct_data;
 		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		nand_chip->ecc.read_page	= omap_read_page_bch;
@@ -1844,7 +1843,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.size		= 512;
 		nand_chip->ecc.bytes		= 13;
 		nand_chip->ecc.strength		= 8;
-		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
+		nand_chip->ecc.hwctl		= omap_enable_hwecc_bch;
 		nand_chip->ecc.correct		= nand_bch_correct_data;
 		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		/* define ECC layout */
@@ -1885,7 +1884,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		/* 14th bit is kept reserved for ROM-code compatibility */
 		nand_chip->ecc.bytes		= 13 + 1;
 		nand_chip->ecc.strength		= 8;
-		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
+		nand_chip->ecc.hwctl		= omap_enable_hwecc_bch;
 		nand_chip->ecc.correct		= omap_elm_correct_data;
 		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		nand_chip->ecc.read_page	= omap_read_page_bch;
-- 
1.8.5.1.163.gd7aced9
