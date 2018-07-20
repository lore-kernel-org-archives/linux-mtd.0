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
Subject: [PATCH v4 12/35] mtd: rawnand: lpc32xx_slc: convert driver to
 nand_scan()
Date: Fri, 20 Jul 2018 17:15:04 +0200
Message-Id: <20180720151527.16038-13-miquel.raynal@bootlin.com>
In-Reply-To: <20180720151527.16038-1-miquel.raynal@bootlin.com>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/raw/lpc32xx_slc.c | 77 +++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 42820aa1abab..a4e8b7e75135 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -779,6 +779,46 @@ static struct lpc32xx_nand_cfg_slc *lpc32xx_parse_dt(struct device *dev)
 	return ncfg;
 }
 
+static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
+
+	/* OOB and ECC CPU and DMA work areas */
+	host->ecc_buf = (uint32_t *)(host->data_buf + LPC32XX_DMA_DATA_SIZE);
+
+	/*
+	 * Small page FLASH has a unique OOB layout, but large and huge
+	 * page FLASH use the standard layout. Small page FLASH uses a
+	 * custom BBT marker layout.
+	 */
+	if (mtd->writesize <= 512)
+		mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
+
+	/* These sizes remain the same regardless of page size */
+	chip->ecc.size = 256;
+	chip->ecc.bytes = LPC32XX_SLC_DEV_ECC_BYTES;
+	chip->ecc.prepad = 0;
+	chip->ecc.postpad = 0;
+
+	/*
+	 * Use a custom BBT marker setup for small page FLASH that
+	 * won't interfere with the ECC layout. Large and huge page
+	 * FLASH use the standard layout.
+	 */
+	if ((chip->bbt_options & NAND_BBT_USE_FLASH) &&
+	    mtd->writesize <= 512) {
+		chip->bbt_td = &bbt_smallpage_main_descr;
+		chip->bbt_md = &bbt_smallpage_mirror_descr;
+	}
+
+	return 0;
+}
+
+static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
+	.attach_chip = lpc32xx_nand_attach_chip,
+};
+
 /*
  * Probe for NAND controller
  */
@@ -884,41 +924,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Find NAND device */
-	res = nand_scan_ident(mtd, 1, NULL);
-	if (res)
-		goto release_dma;
-
-	/* OOB and ECC CPU and DMA work areas */
-	host->ecc_buf = (uint32_t *)(host->data_buf + LPC32XX_DMA_DATA_SIZE);
-
-	/*
-	 * Small page FLASH has a unique OOB layout, but large and huge
-	 * page FLASH use the standard layout. Small page FLASH uses a
-	 * custom BBT marker layout.
-	 */
-	if (mtd->writesize <= 512)
-		mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
-
-	/* These sizes remain the same regardless of page size */
-	chip->ecc.size = 256;
-	chip->ecc.bytes = LPC32XX_SLC_DEV_ECC_BYTES;
-	chip->ecc.prepad = chip->ecc.postpad = 0;
-
-	/*
-	 * Use a custom BBT marker setup for small page FLASH that
-	 * won't interfere with the ECC layout. Large and huge page
-	 * FLASH use the standard layout.
-	 */
-	if ((chip->bbt_options & NAND_BBT_USE_FLASH) &&
-	    mtd->writesize <= 512) {
-		chip->bbt_td = &bbt_smallpage_main_descr;
-		chip->bbt_md = &bbt_smallpage_mirror_descr;
-	}
-
-	/*
-	 * Fills out all the uninitialized function pointers with the defaults
-	 */
-	res = nand_scan_tail(mtd);
+	chip->dummy_controller.ops = &lpc32xx_nand_controller_ops;
+	res = nand_scan(mtd, 1);
 	if (res)
 		goto release_dma;
 
-- 
2.14.1
