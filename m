Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0OoZ-0008WH-3R
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2018 09:53:20 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] mtd: rawnand: marvell: Rename ->ecc_clk into ->core_clk
Date: Mon, 26 Mar 2018 11:53:01 +0200
Message-Id: <20180326095301.13283-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The core clock field was badly named ->ecc_clk which might lead to some
confusion. Rename it ->core_clk.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 3d84f4252af4..10e953218948 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -307,7 +307,7 @@ struct marvell_nfc_caps {
  * @controller:		Base controller structure
  * @dev:		Parent device (used to print error messages)
  * @regs:		NAND controller registers
- * @ecc_clk:		ECC block clock, two times the NAND controller clock
+ * @core_clk:		Core clock
  * @reg_clk:		Regiters clock
  * @complete:		Completion object to wait for NAND controller events
  * @assigned_cs:	Bitmask describing already assigned CS lines
@@ -321,7 +321,7 @@ struct marvell_nfc {
 	struct nand_hw_control controller;
 	struct device *dev;
 	void __iomem *regs;
-	struct clk *ecc_clk;
+	struct clk *core_clk;
 	struct clk *reg_clk;
 	struct completion complete;
 	unsigned long assigned_cs;
@@ -2193,7 +2193,7 @@ static int marvell_nfc_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
-	unsigned int period_ns = 1000000000 / clk_get_rate(nfc->ecc_clk) * 2;
+	unsigned int period_ns = 1000000000 / clk_get_rate(nfc->core_clk) * 2;
 	const struct nand_sdr_timings *sdr;
 	struct marvell_nfc_timings nfc_tmg;
 	int read_delay;
@@ -2759,16 +2759,16 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 		return irq;
 	}
 
-	nfc->ecc_clk = devm_clk_get(&pdev->dev, "core");
+	nfc->core_clk = devm_clk_get(&pdev->dev, "core");
 
 	/* Managed the legacy case (when the first clock was not named) */
-	if (nfc->ecc_clk == ERR_PTR(-ENOENT))
-		nfc->ecc_clk = devm_clk_get(&pdev->dev, NULL);
+	if (nfc->core_clk == ERR_PTR(-ENOENT))
+		nfc->core_clk = devm_clk_get(&pdev->dev, NULL);
 
-	if (IS_ERR(nfc->ecc_clk))
-		return PTR_ERR(nfc->ecc_clk);
+	if (IS_ERR(nfc->core_clk))
+		return PTR_ERR(nfc->core_clk);
 
-	ret = clk_prepare_enable(nfc->ecc_clk);
+	ret = clk_prepare_enable(nfc->core_clk);
 	if (ret)
 		return ret;
 
@@ -2777,10 +2777,10 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 		if (!IS_ERR(nfc->reg_clk)) {
 			ret = clk_prepare_enable(nfc->reg_clk);
 			if (ret)
-				goto unprepare_ecc_clk;
+				goto unprepare_core_clk;
 		} else {
 			ret = PTR_ERR(nfc->reg_clk);
-			goto unprepare_ecc_clk;
+			goto unprepare_core_clk;
 		}
 	}
 
@@ -2818,8 +2818,8 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 
 unprepare_reg_clk:
 	clk_disable_unprepare(nfc->reg_clk);
-unprepare_ecc_clk:
-	clk_disable_unprepare(nfc->ecc_clk);
+unprepare_core_clk:
+	clk_disable_unprepare(nfc->core_clk);
 
 	return ret;
 }
@@ -2836,7 +2836,7 @@ static int marvell_nfc_remove(struct platform_device *pdev)
 	}
 
 	clk_disable_unprepare(nfc->reg_clk);
-	clk_disable_unprepare(nfc->ecc_clk);
+	clk_disable_unprepare(nfc->core_clk);
 
 	return 0;
 }
-- 
2.14.1
