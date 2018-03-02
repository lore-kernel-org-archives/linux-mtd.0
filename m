From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 46/52] mtd: rawnand: sm_common: convert driver to nand_scan()
Date: Fri,  2 Mar 2018 18:03:54 +0100
Message-Id: <20180302170400.6712-47-miquel.raynal@bootlin.com>
In-Reply-To: <20180302170400.6712-1-miquel.raynal@bootlin.com>
References: <20180302170400.6712-1-miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/raw/sm_common.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index 71b791634ee4..895cc2e455e5 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -161,20 +161,9 @@ static struct nand_flash_dev nand_xd_flash_ids[] = {
 	{NULL}
 };
 
-int sm_register_device(struct mtd_info *mtd, int smartmedia)
+static int sm_attach_chip(struct nand_chip *chip)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	int ret;
-
-	chip->options |= NAND_SKIP_BBTSCAN;
-
-	/* Scan for card properties */
-	chip->flash_ids = smartmedia ? nand_smartmedia_flash_ids :
-				       nand_xd_flash_ids;
-	ret = nand_scan_ident(mtd, 1, NULL);
-
-	if (ret)
-		return ret;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 
 	/* Bad block marker position */
 	chip->badblockpos = 0x05;
@@ -189,12 +178,29 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
 	else
 		return -ENODEV;
 
-	ret = nand_scan_tail(mtd);
+	return 0;
+}
 
+int sm_register_device(struct mtd_info *mtd, int smartmedia)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	int ret;
+
+	chip->options |= NAND_SKIP_BBTSCAN;
+
+	/* Scan for card properties */
+	chip->flash_ids = smartmedia ? nand_smartmedia_flash_ids :
+				       nand_xd_flash_ids;
+	chip->ecc.attach_chip = sm_attach_chip;
+	ret = nand_scan(mtd, 1);
 	if (ret)
 		return ret;
 
-	return mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		nand_release(mtd);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(sm_register_device);
 
-- 
2.14.1
