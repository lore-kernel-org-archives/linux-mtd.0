Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2a9d-000125-2q
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 08:47:18 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: change return type of nand_get_flash_type() to int
Date: Fri,  4 Nov 2016 17:49:08 +0900
Message-Id: <1478249348-19596-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit d1e1f4e42b5d ("mtd: nand: add support for reading ONFI
parameters from NAND device"), the returned "type" is never used in
nand_scan_ident().

Make nand_get_flash_type() simply return an integer value in order
to avoid unnecessary ERR_PTR/PTR_ERR dance.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/nand_base.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e5718e5..d337217 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3975,10 +3975,9 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
-static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
-						  struct nand_chip *chip,
-						  int *maf_id, int *dev_id,
-						  struct nand_flash_dev *type)
+static int nand_get_flash_type(struct mtd_info *mtd, struct nand_chip *chip,
+			       int *maf_id, int *dev_id,
+			       struct nand_flash_dev *type)
 {
 	int busw;
 	int i, maf_idx;
@@ -4016,7 +4015,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
 		pr_info("second ID read did not match %02x,%02x against %02x,%02x\n",
 			*maf_id, *dev_id, id_data[0], id_data[1]);
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	if (!type)
@@ -4043,7 +4042,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	}
 
 	if (!type->name)
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
 	if (!mtd->name)
 		mtd->name = type->name;
@@ -4088,7 +4087,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		pr_warn("bus width %d instead %d bit\n",
 			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
 			   busw ? 16 : 8);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	nand_decode_bbm_options(mtd, chip, id_data);
@@ -4130,7 +4129,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
-	return type;
+	return 0;
 }
 
 static const char * const nand_ecc_modes[] = {
@@ -4296,7 +4295,6 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 {
 	int i, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nand_flash_dev *type;
 	int ret;
 
 	ret = nand_dt_init(chip);
@@ -4319,14 +4317,12 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(mtd, chip, &nand_maf_id,
-				   &nand_dev_id, table);
-
-	if (IS_ERR(type)) {
+	ret = nand_get_flash_type(mtd, chip, &nand_maf_id, &nand_dev_id, table);
+	if (ret) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
 		chip->select_chip(mtd, -1);
-		return PTR_ERR(type);
+		return ret;
 	}
 
 	ret = nand_init_data_interface(chip);
-- 
1.9.1
