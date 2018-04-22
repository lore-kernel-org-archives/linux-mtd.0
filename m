Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAHRt-0001Ir-2o
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 16:02:47 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: rawnand: add a way to pass an ID table with
 nand_scan()
Date: Sun, 22 Apr 2018 18:02:30 +0200
Message-Id: <20180422160230.4969-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As part of the work of migrating all the drivers to nand_scan(), and
because nand_scan() does not provide a way to pass an ID table, rename
the function nand_scan_with_ids() and add a third parameter to give a
flash ID table (like what was done with nand_scan_ident()).

Create a nand_scan() helper that is just a wrapper of
nand_scan_with_ids(), passing NULL as the ID table. This way a
controller drivers can continue using nand_scan() transparently.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v1:
=================
 * Removed the ID table from nand_chip structure and created a
   nand_scan_with_ids() function called by nand_scan().
 * No need to apply any change to the sm_common.c driver, switching
   from nand_scan() to nand_scan_with_ids() will be done in a future
   series.


 drivers/mtd/nand/raw/nand_base.c | 8 +++++---
 include/linux/mtd/rawnand.h      | 9 ++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 72f3a89da513..15d6c6e2b77a 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6630,19 +6630,21 @@ EXPORT_SYMBOL(nand_scan_tail);
 #endif
 
 /**
- * nand_scan - [NAND Interface] Scan for the NAND device
+ * nand_scan_with_ids - [NAND Interface] Scan for the NAND device
  * @mtd: MTD device structure
  * @maxchips: number of chips to scan for
+ * @ids: optional flash IDs table
  *
  * This fills out all the uninitialized function pointers with the defaults.
  * The flash ID is read and the mtd/chip structures are filled with the
  * appropriate values.
  */
-int nand_scan(struct mtd_info *mtd, int maxchips)
+int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
+		       struct nand_flash_dev *ids)
 {
 	int ret;
 
-	ret = nand_scan_ident(mtd, maxchips, NULL);
+	ret = nand_scan_ident(mtd, maxchips, ids);
 	if (!ret)
 		ret = nand_scan_tail(mtd);
 	return ret;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5dad59b31244..ba8d908f5cc7 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -28,7 +28,14 @@ struct nand_flash_dev;
 struct device_node;
 
 /* Scan and identify a NAND device */
-int nand_scan(struct mtd_info *mtd, int max_chips);
+int nand_scan_with_ids(struct mtd_info *mtd, int max_chips,
+		       struct nand_flash_dev *ids);
+
+static inline int nand_scan(struct mtd_info *mtd, int max_chips)
+{
+	return nand_scan_with_ids(mtd, max_chips, NULL);
+}
+
 /*
  * Separate phases of nand_scan(), allowing board driver to intervene
  * and override command or ECC setup according to flash type.
-- 
2.14.1
