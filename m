Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY53m-0001pq-2Q
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:12:34 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 1/5] mtd: rawnand: sunxi: Use a consistent name for
 sunxi_nand_chip objects
Date: Sat, 15 Dec 2018 09:12:10 +0100
Message-Id: <20181215081214.4935-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

sunxi_nand_chip objects are sometimes called chip and other times
called sunxi_nand. Make that consistent and name all occurrences
sunxi_nand.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++---------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a5c83cbe4897..9139fc003b1a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1471,8 +1471,8 @@ static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 					const struct nand_data_interface *conf)
 {
-	struct sunxi_nand_chip *chip = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(chip->nand.controller);
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	const struct nand_sdr_timings *timings;
 	u32 min_clk_period = 0;
 	s32 tWB, tADL, tWHR, tRHW, tCAD;
@@ -1591,7 +1591,7 @@ static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 	tCAD = 0x7;
 
 	/* TODO: A83 has some more bits for CDQSS, CS, CLHZ, CCS, WC */
-	chip->timing_cfg = NFC_TIMING_CFG(tWB, tADL, tWHR, tRHW, tCAD);
+	sunxi_nand->timing_cfg = NFC_TIMING_CFG(tWB, tADL, tWHR, tRHW, tCAD);
 
 	/* Convert min_clk_period from picoseconds to nanoseconds */
 	min_clk_period = DIV_ROUND_UP(min_clk_period, 1000);
@@ -1602,10 +1602,11 @@ static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 	 * This new formula was verified with a scope and validated by
 	 * Allwinner engineers.
 	 */
-	chip->clk_rate = NSEC_PER_SEC / min_clk_period;
-	real_clk_rate = clk_round_rate(nfc->mod_clk, chip->clk_rate);
+	sunxi_nand->clk_rate = NSEC_PER_SEC / min_clk_period;
+	real_clk_rate = clk_round_rate(nfc->mod_clk, sunxi_nand->clk_rate);
 	if (real_clk_rate <= 0) {
-		dev_err(nfc->dev, "Unable to round clk %lu\n", chip->clk_rate);
+		dev_err(nfc->dev, "Unable to round clk %lu\n",
+			sunxi_nand->clk_rate);
 		return -EINVAL;
 	}
 
@@ -1615,8 +1616,8 @@ static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 	 * 30 ns.
 	 */
 	min_clk_period = NSEC_PER_SEC / real_clk_rate;
-	chip->timing_ctl = ((min_clk_period * 2) < 30) ?
-			   NFC_TIMING_CTL_EDO : 0;
+	sunxi_nand->timing_ctl = ((min_clk_period * 2) < 30) ?
+				 NFC_TIMING_CTL_EDO : 0;
 
 	return 0;
 }
@@ -1853,7 +1854,7 @@ static const struct nand_controller_ops sunxi_nand_controller_ops = {
 static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 				struct device_node *np)
 {
-	struct sunxi_nand_chip *chip;
+	struct sunxi_nand_chip *sunxi_nand;
 	struct mtd_info *mtd;
 	struct nand_chip *nand;
 	int nsels;
@@ -1870,17 +1871,17 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev,
-			    sizeof(*chip) +
-			    (nsels * sizeof(struct sunxi_nand_chip_sel)),
-			    GFP_KERNEL);
-	if (!chip) {
+	sunxi_nand = devm_kzalloc(dev,
+				  sizeof(*sunxi_nand) +
+				  (nsels * sizeof(struct sunxi_nand_chip_sel)),
+				  GFP_KERNEL);
+	if (!sunxi_nand) {
 		dev_err(dev, "could not allocate chip\n");
 		return -ENOMEM;
 	}
 
-	chip->nsels = nsels;
-	chip->selected = -1;
+	sunxi_nand->nsels = nsels;
+	sunxi_nand->selected = -1;
 
 	for (i = 0; i < nsels; i++) {
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
@@ -1902,16 +1903,16 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 			return -EINVAL;
 		}
 
-		chip->sels[i].cs = tmp;
+		sunxi_nand->sels[i].cs = tmp;
 
 		if (!of_property_read_u32_index(np, "allwinner,rb", i, &tmp) &&
 		    tmp < 2)
-			chip->sels[i].rb = tmp;
+			sunxi_nand->sels[i].rb = tmp;
 		else
-			chip->sels[i].rb = -1;
+			sunxi_nand->sels[i].rb = -1;
 	}
 
-	nand = &chip->nand;
+	nand = &sunxi_nand->nand;
 	/* Default tR value specified in the ONFI spec (chapter 4.15.1) */
 	nand->legacy.chip_delay = 200;
 	nand->controller = &nfc->controller;
@@ -1943,7 +1944,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return ret;
 	}
 
-	list_add_tail(&chip->node, &nfc->chips);
+	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
 }
@@ -1973,14 +1974,15 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 
 static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 {
-	struct sunxi_nand_chip *chip;
+	struct sunxi_nand_chip *sunxi_nand;
 
 	while (!list_empty(&nfc->chips)) {
-		chip = list_first_entry(&nfc->chips, struct sunxi_nand_chip,
-					node);
-		nand_release(&chip->nand);
-		sunxi_nand_ecc_cleanup(&chip->nand.ecc);
-		list_del(&chip->node);
+		sunxi_nand = list_first_entry(&nfc->chips,
+					      struct sunxi_nand_chip,
+					      node);
+		nand_release(&sunxi_nand->nand);
+		sunxi_nand_ecc_cleanup(&sunxi_nand->nand.ecc);
+		list_del(&sunxi_nand->node);
 	}
 }
 
-- 
2.17.1
