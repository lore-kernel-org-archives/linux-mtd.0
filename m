Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEvUq-0003ok-Fp
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 09:28:01 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Aleksei Mamlin <mamlinav@gmail.com>, valdis.kletnieks@vt.edu
Subject: [PATCH v3 05/16] mtd: nand: rename nand_get_flash_type() into
 nand_detect()
Date: Mon, 20 Jun 2016 11:26:51 +0200
Message-Id: <1466414822-18948-6-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The only caller of nand_get_flash_type() (nand_scan_ident()) actually
don't use the returned nand_flash_dev pointer except for converting it to
to an error code.
Rename this function nand_detect() and make it return an integer.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b174d7c6ba1f..14c28abec9aa 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3814,8 +3814,7 @@ static bool find_full_id_nand(struct nand_chip *chip,
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
-static struct nand_flash_dev *nand_get_flash_type(struct nand_chip *chip,
-						  struct nand_flash_dev *type)
+static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
@@ -3855,7 +3854,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct nand_chip *chip,
 	if (id_data[0] != maf_id || id_data[1] != dev_id) {
 		pr_info("second ID read did not match %02x,%02x against %02x,%02x\n",
 			maf_id, dev_id, id_data[0], id_data[1]);
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	chip->id.len = nand_id_len(id_data, 8);
@@ -3899,7 +3898,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct nand_chip *chip,
 	}
 
 	if (!type->name)
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
 	if (!mtd->name)
 		mtd->name = type->name;
@@ -3942,7 +3941,7 @@ ident_done:
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
 		pr_warn("bus width %d instead %d bit\n", busw ? 16 : 8,
 			(chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	nand_decode_bbm_options(chip);
@@ -3984,7 +3983,7 @@ ident_done:
 	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
-	return type;
+	return 0;
 }
 
 static const char * const nand_ecc_modes[] = {
@@ -4147,7 +4146,6 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 {
 	int i, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nand_flash_dev *type;
 	int ret;
 
 	ret = nand_dt_init(chip);
@@ -4161,13 +4159,12 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(chip, table);
-
-	if (IS_ERR(type)) {
+	ret = nand_detect(chip, table);
+	if (ret) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
 		chip->select_chip(mtd, -1);
-		return PTR_ERR(type);
+		return ret;
 	}
 
 	nand_maf_id = chip->id.data[0];
-- 
2.7.4
