Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bn10O-00024a-Bd
 for linux-mtd@lists.infradead.org; Thu, 22 Sep 2016 10:13:25 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [RFC PATCH 5/7] mtd: nand: rawnand: create struct rawnand_device
Date: Thu, 22 Sep 2016 12:12:58 +0200
Message-Id: <1474539180-5863-6-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
---
 drivers/mtd/nand/rawnand/nand_base.c | 40 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          | 26 +++++++++++++++++------
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/rawnand/nand_base.c b/drivers/mtd/nand/rawnand/nand_base.c
index c4a4054255cf..2eb04d1b9f98 100644
--- a/drivers/mtd/nand/rawnand/nand_base.c
+++ b/drivers/mtd/nand/rawnand/nand_base.c
@@ -3972,6 +3972,43 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
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
+	struct nand_chip *chip = mtd_to_nandc(mtd);
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
+	struct mtd_info *mtd = nandc_to_mtd(chip);
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
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
@@ -4357,6 +4394,9 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	chip->numchips = i;
 	mtd->size = i * chip->chipsize;
 
+	/* Fill nand_device info */
+	nandc_fill_nandd(chip);
+
 	return 0;
 }
 EXPORT_SYMBOL(nand_scan_ident);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 941218dec463..8efff12604ad 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/flashchip.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/bbm.h>
 
 struct mtd_info;
@@ -689,8 +690,21 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
 }
 
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
@@ -790,7 +804,7 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  */
 
 struct nand_chip {
-	struct mtd_info mtd;
+	struct rawnand_device base;
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
 
@@ -880,22 +894,22 @@ extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
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
 
 static inline struct nand_chip *mtd_to_nandc(struct mtd_info *mtd)
 {
-	return container_of(mtd, struct nand_chip, mtd);
+	return container_of(mtd_to_nand(mtd), struct nand_chip, base.base);
 }
 
 static inline struct mtd_info *nandc_to_mtd(struct nand_chip *chip)
 {
-	return &chip->mtd;
+	return nand_to_mtd(&chip->base.base);
 }
 
 static inline void *nand_get_controller_data(struct nand_chip *chip)
-- 
2.7.4
