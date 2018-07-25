Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJtr-0000Is-Dj
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:22 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 01/17] mtd: rawnand: brcmnand: convert driver to nand_scan()
Date: Wed, 25 Jul 2018 15:31:36 +0200
Message-Id: <20180725133152.30898-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180725133152.30898-1-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two helpers have been added to the core to do all kind of controller
side configuration/initialization between the detection phase and the
final NAND scan. Implement these hooks so that we can convert the driver
to just use nand_scan() instead of the nand_scan_ident() +
nand_scan_tail() pair.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 63 ++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 2e5efa0f9ea2..4b90d5b380c2 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2208,6 +2208,40 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 	return 0;
 }
 
+static int brcmnand_attach_chip(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	int ret;
+
+	chip->options |= NAND_NO_SUBPAGE_WRITE;
+	/*
+	 * Avoid (for instance) kmap()'d buffers from JFFS2, which we can't DMA
+	 * to/from, and have nand_base pass us a bounce buffer instead, as
+	 * needed.
+	 */
+	chip->options |= NAND_USE_BOUNCE_BUFFER;
+
+	if (chip->bbt_options & NAND_BBT_USE_FLASH)
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+
+	if (brcmnand_setup_dev(host))
+		return -ENXIO;
+
+	chip->ecc.size = host->hwcfg.sector_size_1k ? 1024 : 512;
+
+	/* only use our internal HW threshold */
+	mtd->bitflip_threshold = 1;
+
+	ret = brcmstb_choose_ecc_layout(host);
+
+	return ret;
+}
+
+static const struct nand_controller_ops brcmnand_controller_ops = {
+	.attach_chip = brcmnand_attach_chip,
+};
+
 static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -2267,33 +2301,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	nand_writereg(ctrl, cfg_offs,
 		      nand_readreg(ctrl, cfg_offs) & ~CFG_BUS_WIDTH);
 
-	ret = nand_scan_ident(mtd, 1, NULL);
-	if (ret)
-		return ret;
-
-	chip->options |= NAND_NO_SUBPAGE_WRITE;
-	/*
-	 * Avoid (for instance) kmap()'d buffers from JFFS2, which we can't DMA
-	 * to/from, and have nand_base pass us a bounce buffer instead, as
-	 * needed.
-	 */
-	chip->options |= NAND_USE_BOUNCE_BUFFER;
-
-	if (chip->bbt_options & NAND_BBT_USE_FLASH)
-		chip->bbt_options |= NAND_BBT_NO_OOB;
-
-	if (brcmnand_setup_dev(host))
-		return -ENXIO;
-
-	chip->ecc.size = host->hwcfg.sector_size_1k ? 1024 : 512;
-	/* only use our internal HW threshold */
-	mtd->bitflip_threshold = 1;
-
-	ret = brcmstb_choose_ecc_layout(host);
-	if (ret)
-		return ret;
-
-	ret = nand_scan_tail(mtd);
+	ret = nand_scan(mtd, 1);
 	if (ret)
 		return ret;
 
@@ -2434,6 +2442,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	nand_controller_init(&ctrl->controller);
+	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
 	/* NAND register range */
-- 
2.14.1
