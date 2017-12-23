Received: from mail.ispras.ru ([83.149.199.45])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eSpK7-0002DE-GF
 for linux-mtd@lists.infradead.org; Sat, 23 Dec 2017 19:19:09 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Stefan Agner <stefan@agner.ch>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH v2] mtd: nand: vf610: fix error handling in vf610_nfc_probe()
Date: Sat, 23 Dec 2017 22:18:26 +0300
Message-Id: <1514056706-25136-1-git-send-email-khoroshilov@ispras.ru>
In-Reply-To: <20171222225724.1e26bc38@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

vf610_nfc_probe() misses error handling of mtd_device_register().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
v2: Add nand_cleanup() to undone nand_scan_tail() as Boris Brezillon noted.

 drivers/mtd/nand/vf610_nfc.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 8037d4b48a05..2dac25a8ccbf 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -682,7 +682,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
 				err = -EINVAL;
-				goto error;
+				goto err_node;
 			}
 
 			nand_set_flash_node(chip, child);
@@ -712,7 +712,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, mtd);
 	if (err) {
 		dev_err(nfc->dev, "Error requesting IRQ!\n");
-		goto error;
+		goto err_node;
 	}
 
 	vf610_nfc_preinit_controller(nfc);
@@ -720,7 +720,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	/* first scan to find the device and get the page size */
 	err = nand_scan_ident(mtd, 1, NULL);
 	if (err)
-		goto error;
+		goto err_node;
 
 	vf610_nfc_init_controller(nfc);
 
@@ -732,20 +732,20 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (mtd->writesize + mtd->oobsize > PAGE_2K + OOB_MAX - 8) {
 		dev_err(nfc->dev, "Unsupported flash page size\n");
 		err = -ENXIO;
-		goto error;
+		goto err_node;
 	}
 
 	if (chip->ecc.mode == NAND_ECC_HW) {
 		if (mtd->writesize != PAGE_2K && mtd->oobsize < 64) {
 			dev_err(nfc->dev, "Unsupported flash with hwecc\n");
 			err = -ENXIO;
-			goto error;
+			goto err_node;
 		}
 
 		if (chip->ecc.size != mtd->writesize) {
 			dev_err(nfc->dev, "Step size needs to be page size\n");
 			err = -ENXIO;
-			goto error;
+			goto err_node;
 		}
 
 		/* Only 64 byte ECC layouts known */
@@ -765,7 +765,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		} else {
 			dev_err(nfc->dev, "Unsupported ECC strength\n");
 			err = -ENXIO;
-			goto error;
+			goto err_node;
 		}
 
 		chip->ecc.read_page = vf610_nfc_read_page;
@@ -777,14 +777,19 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	/* second phase scan */
 	err = nand_scan_tail(mtd);
 	if (err)
-		goto error;
+		goto err_node;
 
 	platform_set_drvdata(pdev, mtd);
 
 	/* Register device in MTD */
-	return mtd_device_register(mtd, NULL, 0);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err)
+		goto err_nand;
+	return 0;
 
-error:
+err_nand:
+	nand_cleanup(chip);
+err_node:
 	of_node_put(nand_get_flash_node(chip));
 err_clk:
 	clk_disable_unprepare(nfc->clk);
-- 
2.7.4
