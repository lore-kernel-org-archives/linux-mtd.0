Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zpa8y-0004Oz-Lt
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 11:04:22 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/2] mtd: nand: sunxi: switch from manual to automated timing
 config
Date: Fri, 23 Oct 2015 13:03:56 +0200
Message-Id: <1445598236-14036-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1445598236-14036-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1445598236-14036-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND framework is now able to select the best NAND timings for us.
All we have to do is implement a ->setup_data_interface() function to
apply those timings and remove the timing selection code from the sunxi
driver.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 72 ++++++++++---------------------------------
 1 file changed, 16 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index b657235..b6f21f4 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1131,7 +1131,8 @@ static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 			_sunxi_nand_lookup_timing(l, ARRAY_SIZE(l), p, c)
 
 static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
-				       const struct nand_sdr_timings *timings)
+				       const struct nand_sdr_timings *timings,
+				       bool check_only)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(chip->nand.controller);
 	u32 min_clk_period = 0;
@@ -1224,6 +1225,9 @@ static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
 		return tRHW;
 	}
 
+	if (check_only)
+		return 0;
+
 	/*
 	 * TODO: according to ONFI specs this value only applies for DDR NAND,
 	 * but Allwinner seems to set this to 0x7. Mimic them for now.
@@ -1254,42 +1258,19 @@ static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
 	return 0;
 }
 
-static int sunxi_nand_chip_init_timings(struct sunxi_nand_chip *chip,
-					struct device_node *np)
+static int sunxi_nand_setup_data_interface(struct mtd_info *mtd,
+					const struct nand_data_interface *conf,
+					bool check_only)
 {
-	const struct nand_sdr_timings *timings;
-	int ret;
-	int mode;
-
-	mode = onfi_get_async_timing_mode(&chip->nand);
-	if (mode == ONFI_TIMING_MODE_UNKNOWN) {
-		mode = chip->nand.onfi_timing_mode_default;
-	} else {
-		uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {};
-		int i;
-
-		mode = fls(mode) - 1;
-		if (mode < 0)
-			mode = 0;
-
-		feature[0] = mode;
-		for (i = 0; i < chip->nsels; i++) {
-			chip->nand.select_chip(&chip->mtd, i);
-			ret = chip->nand.onfi_set_features(&chip->mtd,
-						&chip->nand,
-						ONFI_FEATURE_ADDR_TIMING_MODE,
-						feature);
-			chip->nand.select_chip(&chip->mtd, -1);
-			if (ret)
-				return ret;
-		}
-	}
+	struct nand_chip *nand = mtd->priv;
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 
-	timings = onfi_async_timing_mode_to_sdr_timings(mode);
-	if (IS_ERR(timings))
-		return PTR_ERR(timings);
+	/* TODO: add support for DDR NANDs */
+	if (conf->type != NAND_SDR_IFACE)
+		return -ENOTSUPP;
 
-	return sunxi_nand_chip_set_timings(chip, timings);
+	return sunxi_nand_chip_set_timings(sunxi_nand, &conf->timings.sdr,
+					   check_only);
 }
 
 static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
@@ -1502,7 +1483,6 @@ static int sunxi_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ctrl *ecc,
 static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 				struct device_node *np)
 {
-	const struct nand_sdr_timings *timings;
 	struct sunxi_nand_chip *chip;
 	struct mtd_part_parser_data ppdata;
 	struct mtd_info *mtd;
@@ -1578,21 +1558,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		}
 	}
 
-	timings = onfi_async_timing_mode_to_sdr_timings(0);
-	if (IS_ERR(timings)) {
-		ret = PTR_ERR(timings);
-		dev_err(dev,
-			"could not retrieve timings for ONFI mode 0: %d\n",
-			ret);
-		return ret;
-	}
-
-	ret = sunxi_nand_chip_set_timings(chip, timings);
-	if (ret) {
-		dev_err(dev, "could not configure chip timings: %d\n", ret);
-		return ret;
-	}
-
 	nand = &chip->nand;
 	/* Default tR value specified in the ONFI spec (chapter 4.15.1) */
 	nand->chip_delay = 200;
@@ -1608,6 +1573,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	nand->read_buf = sunxi_nfc_read_buf;
 	nand->write_buf = sunxi_nfc_write_buf;
 	nand->read_byte = sunxi_nfc_read_byte;
+	nand->setup_data_interface = sunxi_nand_setup_data_interface;
 
 	mtd = &chip->mtd;
 	mtd->dev.parent = dev;
@@ -1625,12 +1591,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		nand->bbt_options |= NAND_BBT_SCANRAWMODE;
 	}
 
-	ret = sunxi_nand_chip_init_timings(chip, np);
-	if (ret) {
-		dev_err(dev, "could not configure chip timings: %d\n", ret);
-		return ret;
-	}
-
 	ret = sunxi_nand_ecc_init(mtd, &nand->ecc, np);
 	if (ret) {
 		dev_err(dev, "ECC init failed: %d\n", ret);
-- 
2.1.4
