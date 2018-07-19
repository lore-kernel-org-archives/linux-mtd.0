From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans Rullgard <mans@mansr.com>,
 Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 18/33] mtd: rawnand: s3c2410: convert driver to nand_scan()
Date: Fri, 20 Jul 2018 01:00:11 +0200
Message-Id: <20180719230026.8741-19-miquel.raynal@bootlin.com>
In-Reply-To: <20180719230026.8741-1-miquel.raynal@bootlin.com>
References: <20180719230026.8741-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two helpers have been added to the core to make ECC-related
configuration between the detection phase and the final NAND scan. Use
these hooks and convert the driver to just use nand_scan() instead of
both nand_scan_ident() and nand_scan_tail().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/s3c2410.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index e8bf64832213..9ce505fa02e0 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -915,20 +915,19 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 }
 
 /**
- * s3c2410_nand_update_chip - post probe update
- * @info: The controller instance.
- * @nmtd: The driver version of the MTD instance.
+ * s3c2410_nand_attach_chip - Init the ECC engine after NAND scan
+ * @chip: The NAND chip
  *
- * This routine is called after the chip probe has successfully completed
- * and the relevant per-chip information updated. This call ensure that
+ * This hook is called by the core after the identification of the NAND chip,
+ * once the relevant per-chip information is up to date.. This call ensure that
  * we update the internal state accordingly.
  *
  * The internal state is currently limited to the ECC state information.
 */
-static int s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
-				    struct s3c2410_nand_mtd *nmtd)
+static int s3c2410_nand_attach_chip(struct nand_chip *chip)
 {
-	struct nand_chip *chip = &nmtd->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
 
 	switch (chip->ecc.mode) {
 
@@ -998,6 +997,10 @@ static int s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 	return 0;
 }
 
+static struct nand_controller_ops s3c24xx_nand_controller_ops = {
+	.attach_chip = s3c2410_nand_attach_chip,
+};
+
 static const struct of_device_id s3c24xx_nand_dt_ids[] = {
 	{
 		.compatible = "samsung,s3c2410-nand",
@@ -1095,6 +1098,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	nand_controller_init(&info->controller);
+	info->controller.ops = &s3c24xx_nand_controller_ops;
 
 	/* get the clock source and enable it */
 
@@ -1166,15 +1170,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 		mtd->dev.parent = &pdev->dev;
 		s3c2410_nand_init_chip(info, nmtd, sets);
 
-		err = nand_scan_ident(mtd, (sets) ? sets->nr_chips : 1, NULL);
-		if (err)
-			goto exit_error;
-
-		err = s3c2410_nand_update_chip(info, nmtd);
-		if (err < 0)
-			goto exit_error;
-
-		err = nand_scan_tail(mtd);
+		err = nand_scan(mtd, sets ? sets->nr_chips : 1);
 		if (err)
 			goto exit_error;
 
-- 
2.14.1
