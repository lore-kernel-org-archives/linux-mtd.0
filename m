Received: from mo6-p04-ob.smtp.rzone.de ([2a01:238:20a:202:5304::6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zo47d-0004ZA-Ba
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2015 06:40:42 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/3 v3] mtd: nand: fsmc: Add BCH4 SW ECC support for SPEAr600
Date: Mon, 19 Oct 2015 08:40:13 +0200
Message-Id: <1445236813-26013-1-git-send-email-sr@denx.de>
In-Reply-To: <1443782422-4515-3-git-send-email-sr@denx.de>
References: <1443782422-4515-3-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for 4-bit ECC BCH4 for the SPEAr600 SoC. This can
be used by boards equipped with a NAND chip that requires 4-bit ECC
strength. The SPEAr600 HW ECC only supports 1-bit ECC strength.

To enable SW BCH4, you need to specify this in your nand controller
DT node:

	nand-ecc-mode = "soft_bch";
	nand-ecc-strength = <4>;
	nand-ecc-step-size = <512>;

Tested on a custom SPEAr600 board.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Brian Norris <computersforpeace@gmail.com>
---
v3:
- Rebased on top of l2-mtd.git
- Changed "dn" to "flash_node"

v2:
- Used nand_dt_init() to parse the ECC properties
- Added optional ECC bindings documentation
- Removed whitespace change from this patch, moved to a separate patch
- Removed setting of nand_bch_calculate_ecc / nand_bch_correct_data as its
  already done in nand_scan_tail()
- Moved ECC checking after nand_scan_ident()
- Removed addition of ecc_mode to platform_data as its not needed anymore

 .../devicetree/bindings/mtd/fsmc-nand.txt          |  3 ++
 drivers/mtd/nand/fsmc_nand.c                       | 57 ++++++++++++++++------
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
index 5235cbc..f861178 100644
--- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -30,6 +30,9 @@ Optional properties:
                  command is asserted. Zero means one cycle, 255 means 256
                  cycles.
 - bank: default NAND bank to use (0-3 are valid, 0 is the default).
+- nand-ecc-mode      : see nand.txt
+- nand-ecc-strength  : see nand.txt
+- nand-ecc-step-size : see nand.txt
 
 Example:
 
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 9e4fd0f..b50be0d 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1023,12 +1023,17 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->cmd_ctrl = fsmc_cmd_ctrl;
 	nand->chip_delay = 30;
 
+	/*
+	 * Setup default ECC mode. nand_dt_init() called from nand_scan_init()
+	 * can overwrite this value if the DT provides a different value.
+	 */
 	nand->ecc.mode = NAND_ECC_HW;
 	nand->ecc.hwctl = fsmc_enable_hwecc;
 	nand->ecc.size = 512;
 	nand->options = pdata->options;
 	nand->select_chip = fsmc_select_chip;
 	nand->badblockbits = 7;
+	nand->flash_node = np;
 
 	if (pdata->width == FSMC_NAND_BW16)
 		nand->options |= NAND_BUSWIDTH_16;
@@ -1070,11 +1075,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->ecc.correct = fsmc_bch8_correct_data;
 		nand->ecc.bytes = 13;
 		nand->ecc.strength = 8;
-	} else {
-		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
-		nand->ecc.correct = nand_correct_data;
-		nand->ecc.bytes = 3;
-		nand->ecc.strength = 1;
 	}
 
 	/*
@@ -1115,22 +1115,47 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 			goto err_probe;
 		}
 	} else {
-		switch (host->mtd.oobsize) {
-		case 16:
-			nand->ecc.layout = &fsmc_ecc1_16_layout;
+		switch (nand->ecc.mode) {
+		case NAND_ECC_HW:
+			dev_info(&pdev->dev, "Using 1-bit HW ECC scheme\n");
+			nand->ecc.calculate = fsmc_read_hwecc_ecc1;
+			nand->ecc.correct = nand_correct_data;
+			nand->ecc.bytes = 3;
+			nand->ecc.strength = 1;
 			break;
-		case 64:
-			nand->ecc.layout = &fsmc_ecc1_64_layout;
-			break;
-		case 128:
-			nand->ecc.layout = &fsmc_ecc1_128_layout;
+
+		case NAND_ECC_SOFT_BCH:
+			dev_info(&pdev->dev, "Using 4-bit SW BCH ECC scheme\n");
 			break;
+
 		default:
-			dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
-				 mtd->oobsize);
-			ret = -EINVAL;
+			dev_err(&pdev->dev, "Unsupported ECC mode!\n");
 			goto err_probe;
 		}
+
+		/*
+		 * Don't set layout for BCH4 SW ECC. This will be
+		 * generated later in nand_bch_init() later.
+		 */
+		if (nand->ecc.mode != NAND_ECC_SOFT_BCH) {
+			switch (host->mtd.oobsize) {
+			case 16:
+				nand->ecc.layout = &fsmc_ecc1_16_layout;
+				break;
+			case 64:
+				nand->ecc.layout = &fsmc_ecc1_64_layout;
+				break;
+			case 128:
+				nand->ecc.layout = &fsmc_ecc1_128_layout;
+				break;
+			default:
+				dev_warn(&pdev->dev,
+					 "No oob scheme defined for oobsize %d\n",
+					 mtd->oobsize);
+				ret = -EINVAL;
+				goto err_probe;
+			}
+		}
 	}
 
 	/* Second stage of scan to fill MTD data-structures */
-- 
2.6.2
