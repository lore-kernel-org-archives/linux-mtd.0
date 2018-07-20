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
Subject: [PATCH v4 30/35] mtd: rawnand: qcom: convert driver to nand_scan()
Date: Fri, 20 Jul 2018 17:15:22 +0200
Message-Id: <20180720151527.16038-31-miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/raw/qcom_nandc.c | 71 +++++++++++++--------------------------
 1 file changed, 24 insertions(+), 47 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index aa6c3e026ef1..dc895b846b84 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2475,10 +2475,10 @@ qcom_nandc_calc_ecc_bytes(int step_size, int strength)
 NAND_ECC_CAPS_SINGLE(qcom_nandc_ecc_caps, qcom_nandc_calc_ecc_bytes,
 		     NANDC_STEP_SIZE, 4, 8);
 
-static int qcom_nand_host_setup(struct qcom_nand_host *host)
+static int qcom_nand_attach_chip(struct nand_chip *chip)
 {
-	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int cwperpage, bad_block_byte, ret;
@@ -2640,6 +2640,10 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
 	return 0;
 }
 
+static const struct nand_controller_ops qcom_nandc_ops = {
+	.attach_chip = qcom_nand_attach_chip,
+};
+
 static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 {
 	int ret;
@@ -2781,9 +2785,9 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
-static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
-			       struct qcom_nand_host *host,
-			       struct device_node *dn)
+static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
+					    struct qcom_nand_host *host,
+					    struct device_node *dn)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -2824,36 +2828,20 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	chip->block_markbad	= qcom_nandc_block_markbad;
 
 	chip->controller = &nandc->controller;
+	chip->controller->ops = &qcom_nandc_ops;
 	chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER |
 			 NAND_SKIP_BBTSCAN;
 
 	/* set up initial status value */
 	host->status = NAND_STATUS_READY | NAND_STATUS_WP;
 
-	ret = nand_scan_ident(mtd, 1, NULL);
-	if (ret)
-		return ret;
-
-	ret = qcom_nand_host_setup(host);
-
-	return ret;
-}
-
-static int qcom_nand_mtd_register(struct qcom_nand_controller *nandc,
-				  struct qcom_nand_host *host,
-				  struct device_node *dn)
-{
-	struct nand_chip *chip = &host->chip;
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int ret;
-
-	ret = nand_scan_tail(mtd);
+	ret = nand_scan(mtd, 1);
 	if (ret)
 		return ret;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
-		nand_cleanup(mtd_to_nand(mtd));
+		nand_cleanup(chip);
 
 	return ret;
 }
@@ -2862,9 +2850,19 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 {
 	struct device *dev = nandc->dev;
 	struct device_node *dn = dev->of_node, *child;
-	struct qcom_nand_host *host, *tmp;
+	struct qcom_nand_host *host;
 	int ret;
 
+	if (nandc->props->is_bam) {
+		free_bam_transaction(nandc);
+		nandc->bam_txn = alloc_bam_transaction(nandc);
+		if (!nandc->bam_txn) {
+			dev_err(nandc->dev,
+				"failed to allocate bam transaction\n");
+			return -ENOMEM;
+		}
+	}
+
 	for_each_available_child_of_node(dn, child) {
 		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 		if (!host) {
@@ -2872,7 +2870,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 			return -ENOMEM;
 		}
 
-		ret = qcom_nand_host_init(nandc, host, child);
+		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
 			continue;
@@ -2881,27 +2879,6 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		list_add_tail(&host->node, &nandc->host_list);
 	}
 
-	if (list_empty(&nandc->host_list))
-		return -ENODEV;
-
-	if (nandc->props->is_bam) {
-		free_bam_transaction(nandc);
-		nandc->bam_txn = alloc_bam_transaction(nandc);
-		if (!nandc->bam_txn) {
-			dev_err(nandc->dev,
-				"failed to allocate bam transaction\n");
-			return -ENOMEM;
-		}
-	}
-
-	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
-		ret = qcom_nand_mtd_register(nandc, host, child);
-		if (ret) {
-			list_del(&host->node);
-			devm_kfree(dev, host);
-		}
-	}
-
 	if (list_empty(&nandc->host_list))
 		return -ENODEV;
 
-- 
2.14.1
