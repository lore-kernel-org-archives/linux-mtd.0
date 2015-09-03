Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXXUf-0001kS-Vl
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 16:36:10 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Jonas Gorski <jogo@openwrt.org>, Marek Vasut <marex@denx.de>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd: nand: Rename nand_chip .dn to .flash_node
Date: Thu,  3 Sep 2015 18:35:37 +0200
Message-Id: <1441298137-12199-2-git-send-email-marex@denx.de>
In-Reply-To: <1441298137-12199-1-git-send-email-marex@denx.de>
References: <1441298137-12199-1-git-send-email-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use a more descriptive name for the device_node element in struct nand_chip .
This name matches the element name used for device_node property of a flash
in the spi-nor framework.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 5 +++--
 drivers/mtd/nand/nand_base.c         | 4 ++--
 include/linux/mtd/nand.h             | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index fddb795..048e4e0 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1792,7 +1792,8 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 
 	memset(cfg, 0, sizeof(*cfg));
 
-	ret = of_property_read_u32(chip->dn, "brcm,nand-oob-sector-size",
+	ret = of_property_read_u32(chip->flash_node,
+				   "brcm,nand-oob-sector-size",
 				   &oob_sector);
 	if (ret) {
 		/* Use detected size */
@@ -1899,7 +1900,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 	mtd = &host->mtd;
 	chip = &host->chip;
 
-	chip->dn = dn;
+	chip->flash_node = dn;
 	chip->priv = host;
 	mtd->priv = chip;
 	mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "brcmnand.%d",
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..51f7816 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3846,8 +3846,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	struct nand_flash_dev *type;
 	int ret;
 
-	if (chip->dn) {
-		ret = nand_dt_init(mtd, chip, chip->dn);
+	if (chip->flash_node) {
+		ret = nand_dt_init(mtd, chip, chip->flash_node);
 		if (ret)
 			return ret;
 	}
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 272f429..3140b3d 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -544,7 +544,7 @@ struct nand_buffers {
  *			flash device
  * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
  *			flash device.
- * @dn:			[BOARDSPECIFIC] device node describing this instance
+ * @flash_node:		[BOARDSPECIFIC] device node describing this instance
  * @read_byte:		[REPLACEABLE] read one byte from the chip
  * @read_word:		[REPLACEABLE] read one word from the chip
  * @write_byte:		[REPLACEABLE] write a single byte to the chip on the
@@ -647,7 +647,7 @@ struct nand_chip {
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
 
-	struct device_node *dn;
+	struct device_node *flash_node;
 
 	uint8_t (*read_byte)(struct mtd_info *mtd);
 	u16 (*read_word)(struct mtd_info *mtd);
-- 
2.1.4
