Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fm3eG-000625-2T
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 20:59:42 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH v2 3/4] mtd: rawnand: Make maxchips an unsigned int
Date: Sat,  4 Aug 2018 22:59:22 +0200
Message-Id: <20180804205923.25298-3-boris.brezillon@bootlin.com>
In-Reply-To: <20180804205923.25298-1-boris.brezillon@bootlin.com>
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's no good reason to make maxchips a signed integer, since only
positive values are valid. Make it an unsigned int.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- new patch
---
 drivers/mtd/nand/raw/nand_base.c | 7 ++++---
 include/linux/mtd/rawnand.h      | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d527e448ce19..b1bc63b76580 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5965,11 +5965,12 @@ static int nand_dt_init(struct nand_chip *chip)
  * prevented dynamic allocations during this phase which was unconvenient and
  * as been banned for the benefit of the ->init_ecc()/cleanup_ecc() hooks.
  */
-static int nand_scan_ident(struct mtd_info *mtd, int maxchips,
+static int nand_scan_ident(struct mtd_info *mtd, unsigned int maxchips,
 			   struct nand_flash_dev *table)
 {
-	int i, nand_maf_id, nand_dev_id;
+	int nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	unsigned int i;
 	int ret;
 
 	/* Enforce the right timings for reset/detection */
@@ -6780,7 +6781,7 @@ static void nand_detach(struct nand_chip *chip)
  * The flash ID is read and the mtd/chip structures are filled with the
  * appropriate values.
  */
-int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
+int nand_scan_with_ids(struct mtd_info *mtd, unsigned int maxchips,
 		       struct nand_flash_dev *ids)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index efb2345359bb..33b42c95c8ba 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -27,10 +27,10 @@
 struct nand_flash_dev;
 
 /* Scan and identify a NAND device */
-int nand_scan_with_ids(struct mtd_info *mtd, int max_chips,
+int nand_scan_with_ids(struct mtd_info *mtd, unsigned int max_chips,
 		       struct nand_flash_dev *ids);
 
-static inline int nand_scan(struct mtd_info *mtd, int max_chips)
+static inline int nand_scan(struct mtd_info *mtd, unsigned int max_chips)
 {
 	return nand_scan_with_ids(mtd, max_chips, NULL);
 }
-- 
2.14.1
