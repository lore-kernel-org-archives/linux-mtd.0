Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEg8c-0000Ff-6Y
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 17:03:59 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v4 8/8] mtd: nand: xway: add nandaddr to own struct
Date: Sun, 19 Jun 2016 19:03:05 +0200
Message-Id: <1466355785-13689-9-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466355785-13689-1-git-send-email-hauke@hauke-m.de>
References: <1466355785-13689-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of using IO_ADDR_W and IO_ADDR_R use an own pointer to the NAND
controller memory area.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 108758c..dc8e1ff 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -66,22 +66,23 @@
 struct xway_nand_data {
 	struct nand_chip	chip;
 	unsigned long		csflags;
+	void __iomem		*nandaddr;
 };
 
 static u8 xway_readb(struct mtd_info *mtd, int op)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	void __iomem *nandaddr = chip->IO_ADDR_R;
+	struct xway_nand_data *data = nand_get_controller_data(chip);
 
-	return readb(nandaddr + op);
+	return readb(data->nandaddr + op);
 }
 
 static void xway_writeb(struct mtd_info *mtd, int op, u8 value)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	void __iomem *nandaddr = chip->IO_ADDR_W;
+	struct xway_nand_data *data = nand_get_controller_data(chip);
 
-	writeb(value, nandaddr + op);
+	writeb(value, data->nandaddr + op);
 }
 
 static void xway_select_chip(struct mtd_info *mtd, int select)
@@ -154,7 +155,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct resource *res;
 	int err;
-	void __iomem *nandaddr;
 	u32 cs;
 	u32 cs_flag = 0;
 
@@ -165,16 +165,14 @@ static int xway_nand_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nandaddr = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(nandaddr))
-		return PTR_ERR(nandaddr);
+	data->nandaddr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(data->nandaddr))
+		return PTR_ERR(data->nandaddr);
 
 	nand_set_flash_node(&data->chip, pdev->dev.of_node);
 	mtd = nand_to_mtd(&data->chip);
 	mtd->dev.parent = &pdev->dev;
 
-	data->chip.IO_ADDR_R = nandaddr;
-	data->chip.IO_ADDR_W = nandaddr;
 	data->chip.cmd_ctrl = xway_cmd_ctrl;
 	data->chip.dev_ready = xway_dev_ready;
 	data->chip.select_chip = xway_select_chip;
@@ -195,16 +193,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 		cs_flag = NAND_CON_IN_CS1 | NAND_CON_OUT_CS1;
 
 	/* setup the EBU to run in NAND mode on our base addr */
-	ltq_ebu_w32(CPHYSADDR(nandaddr)
-		| ADDSEL1_MASK(3) | ADDSEL1_REGEN, EBU_ADDSEL1);
+	ltq_ebu_w32(CPHYSADDR(data->nandaddr)
+		    | ADDSEL1_MASK(3) | ADDSEL1_REGEN, EBU_ADDSEL1);
 
 	ltq_ebu_w32(BUSCON1_SETUP | BUSCON1_BCGEN_RES | BUSCON1_WAITWRC2
-		| BUSCON1_WAITRDC2 | BUSCON1_HOLDC1 | BUSCON1_RECOVC1
-		| BUSCON1_CMULT4, LTQ_EBU_BUSCON1);
+		    | BUSCON1_WAITRDC2 | BUSCON1_HOLDC1 | BUSCON1_RECOVC1
+		    | BUSCON1_CMULT4, LTQ_EBU_BUSCON1);
 
 	ltq_ebu_w32(NAND_CON_NANDM | NAND_CON_CSMUX | NAND_CON_CS_P
-		| NAND_CON_SE_P | NAND_CON_WP_P | NAND_CON_PRE_P
-		| cs_flag, EBU_NAND_CON);
+		    | NAND_CON_SE_P | NAND_CON_WP_P | NAND_CON_PRE_P
+		    | cs_flag, EBU_NAND_CON);
 
 	/* Scan to find existence of the device */
 	err = nand_scan(mtd, 1);
-- 
2.8.1
