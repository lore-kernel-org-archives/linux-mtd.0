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
Subject: [PATCH v4 09/35] mtd: rawnand: hisi504: convert driver to nand_scan()
Date: Fri, 20 Jul 2018 17:15:01 +0200
Message-Id: <20180720151527.16038-10-miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/raw/hisi504_nand.c | 78 +++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index a1e009c8e556..950dc7789296 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -709,9 +709,50 @@ static int hisi_nfc_ecc_probe(struct hinfc_host *host)
 	return 0;
 }
 
+static int hisi_nfc_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct hinfc_host *host = nand_get_controller_data(chip);
+	int flag;
+
+	host->buffer = dmam_alloc_coherent(host->dev,
+					   mtd->writesize + mtd->oobsize,
+					   &host->dma_buffer, GFP_KERNEL);
+	if (!host->buffer)
+		return -ENOMEM;
+
+	host->dma_oob = host->dma_buffer + mtd->writesize;
+	memset(host->buffer, 0xff, mtd->writesize + mtd->oobsize);
+
+	flag = hinfc_read(host, HINFC504_CON);
+	flag &= ~(HINFC504_CON_PAGESIZE_MASK << HINFC504_CON_PAGEISZE_SHIFT);
+	switch (mtd->writesize) {
+	case 2048:
+		flag |= (0x001 << HINFC504_CON_PAGEISZE_SHIFT);
+		break;
+	/*
+	 * TODO: add more pagesize support,
+	 * default pagesize has been set in hisi_nfc_host_init
+	 */
+	default:
+		dev_err(host->dev, "NON-2KB page size nand flash\n");
+		return -EINVAL;
+	}
+	hinfc_write(host, flag, HINFC504_CON);
+
+	if (chip->ecc.mode == NAND_ECC_HW)
+		hisi_nfc_ecc_probe(host);
+
+	return 0;
+}
+
+static const struct nand_controller_ops hisi_nfc_controller_ops = {
+	.attach_chip = hisi_nfc_attach_chip,
+};
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
-	int ret = 0, irq, flag, max_chips = HINFC504_MAX_CHIP;
+	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
 	struct device *dev = &pdev->dev;
 	struct hinfc_host *host;
 	struct nand_chip  *chip;
@@ -769,42 +810,11 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = nand_scan_ident(mtd, max_chips, NULL);
+	chip->dummy_controller.ops = &hisi_nfc_controller_ops;
+	ret = nand_scan(mtd, max_chips);
 	if (ret)
 		return ret;
 
-	host->buffer = dmam_alloc_coherent(dev, mtd->writesize + mtd->oobsize,
-		&host->dma_buffer, GFP_KERNEL);
-	if (!host->buffer)
-		return -ENOMEM;
-
-	host->dma_oob = host->dma_buffer + mtd->writesize;
-	memset(host->buffer, 0xff, mtd->writesize + mtd->oobsize);
-
-	flag = hinfc_read(host, HINFC504_CON);
-	flag &= ~(HINFC504_CON_PAGESIZE_MASK << HINFC504_CON_PAGEISZE_SHIFT);
-	switch (mtd->writesize) {
-	case 2048:
-		flag |= (0x001 << HINFC504_CON_PAGEISZE_SHIFT); break;
-	/*
-	 * TODO: add more pagesize support,
-	 * default pagesize has been set in hisi_nfc_host_init
-	 */
-	default:
-		dev_err(dev, "NON-2KB page size nand flash\n");
-		return -EINVAL;
-	}
-	hinfc_write(host, flag, HINFC504_CON);
-
-	if (chip->ecc.mode == NAND_ECC_HW)
-		hisi_nfc_ecc_probe(host);
-
-	ret = nand_scan_tail(mtd);
-	if (ret) {
-		dev_err(dev, "nand_scan_tail failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-- 
2.14.1
