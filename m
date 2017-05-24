Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQHe-00009c-FT
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:00:47 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 05/15] mtd: nand: raw: create struct rawnand_device
Date: Wed, 24 May 2017 15:07:01 +0800
Message-ID: <1495609631-18880-6-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

Create the rawnand_device struct inheriting from nand_device and make
nand_chip inherit from this struct.

The rawnand_device object should be used for the new
rawnand-device/rawnand-controller model, and fields inside nand_chip
should progressively move to the future rawnand_controller or the existing
rawnand_device struct.

In the meantime, we make sure nand_device fields are properly initialized
by converting information stored in mtd_info and nand_chip into the
nand_memory_organization format.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/raw/nand_base.c | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      | 26 ++++++++++++++++++++------
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a113cfb..8f8df15 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3957,6 +3957,43 @@ static bool find_full_id_nand(struct nand_chip *chip,
 	return false;
 }
 
+static int rawnand_erase(struct nand_device *nand, struct erase_info *einfo)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+
+	return nand_erase_nand(mtd, einfo, 1);
+}
+
+static int rawnand_markbad(struct nand_device *nand, int block)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_chip *chip = mtd_to_nandchip(mtd);
+	loff_t offs = nand_eraseblock_to_offs(nand, block);
+
+	return chip->block_markbad(mtd, offs);
+}
+
+static const struct nand_ops rawnand_ops = {
+	.erase = rawnand_erase,
+	.markbad = rawnand_markbad,
+};
+
+static void nandc_fill_nandd(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nandchip_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct nand_memory_organization *memorg = &nand->memorg;
+
+	memorg->pagesize = mtd->writesize;
+	memorg->oobsize = mtd->oobsize;
+	memorg->eraseblocksize = mtd->erasesize;
+	memorg->ndies = chip->numchips;
+	memorg->diesize = chip->chipsize;
+	/* TODO: fill ->planesize and ->nplanes */
+
+	nand->ops = &rawnand_ops;
+}
+
 /*
  * Manufacturer detection. Only used when the NAND is not ONFI or JEDEC
  * compliant and does not have a full-id or legacy-id entry in the nand_ids
@@ -4409,6 +4446,9 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	chip->numchips = i;
 	mtd->size = i * chip->chipsize;
 
+	/* Fill nand_device info */
+	nandc_fill_nandd(chip);
+
 	return 0;
 }
 EXPORT_SYMBOL(nand_scan_ident);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index aa43ec4..750fac2 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/flashchip.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/bbm.h>
 
 struct mtd_info;
@@ -727,8 +728,21 @@ struct nand_manufacturer_ops {
 };
 
 /**
+ * struct rawnand_device - raw NAND device structure
+ * @base: NAND device instance (inheritance)
+ *
+ * This structure describes a raw NAND device and should progressively
+ * replace the nand_chip struct.
+ *
+ * Note: do not blindly move nand_chip fields into rawnand_device.
+ */
+struct rawnand_device {
+	struct nand_device base;
+};
+
+/**
  * struct nand_chip - NAND Private Flash Chip Data
- * @mtd:		MTD device registered to the MTD framework
+ * @base:		raw NAND device instance (inheritance)
  * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
  *			flash device
  * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
@@ -834,7 +848,7 @@ struct nand_manufacturer_ops {
  */
 
 struct nand_chip {
-	struct mtd_info mtd;
+	struct rawnand_device base;
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
 
@@ -930,22 +944,22 @@ struct nand_chip {
 static inline void nand_set_flash_node(struct nand_chip *chip,
 				       struct device_node *np)
 {
-	mtd_set_of_node(&chip->mtd, np);
+	nand_set_of_node(&chip->base.base, np);
 }
 
 static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
 {
-	return mtd_get_of_node(&chip->mtd);
+	return nand_get_of_node(&chip->base.base);
 }
 
 static inline struct nand_chip *mtd_to_nandchip(struct mtd_info *mtd)
 {
-	return container_of(mtd, struct nand_chip, mtd);
+	return container_of(mtd_to_nand(mtd), struct nand_chip, base.base);
 }
 
 static inline struct mtd_info *nandchip_to_mtd(struct nand_chip *chip)
 {
-	return &chip->mtd;
+	return nand_to_mtd(&chip->base.base);
 }
 
 static inline void *nand_get_controller_data(struct nand_chip *chip)
-- 
1.9.1
