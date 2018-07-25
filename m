Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJuR-0001wF-Vh
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:58 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 16/17] mtd: rawnand: allocate model parameter dynamically
Date: Wed, 25 Jul 2018 15:31:51 +0200
Message-Id: <20180725133152.30898-17-miquel.raynal@bootlin.com>
In-Reply-To: <20180725133152.30898-1-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks to the migration of all drivers to use nand_scan() and the
related nand_controller_ops, we can now allocate data during the
detection phase. Let's do it first for the NAND model parameter which
is allocated in nand_detect().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 52 +++++++++++++++++++++++++++++++---------
 include/linux/mtd/rawnand.h      |  2 +-
 2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 34ea44f90fd8..00e80781124a 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5225,8 +5225,11 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
-	strncpy(chip->parameters.model, p->model,
-		sizeof(chip->parameters.model) - 1);
+	chip->parameters.model = kstrdup(p->model, GFP_KERNEL);
+	if (!chip->parameters.model) {
+		ret = -ENOMEM;
+		goto free_onfi_param_page;
+	}
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5356,8 +5359,11 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
-	strncpy(chip->parameters.model, p->model,
-		sizeof(chip->parameters.model) - 1);
+	chip->parameters.model = kstrdup(p->model, GFP_KERNEL);
+	if (!chip->parameters.model) {
+		ret = -ENOMEM;
+		goto free_jedec_param_page;
+	}
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5546,8 +5552,9 @@ static bool find_full_id_nand(struct nand_chip *chip,
 		chip->onfi_timing_mode_default =
 					type->onfi_timing_mode_default;
 
-		strncpy(chip->parameters.model, type->name,
-			sizeof(chip->parameters.model) - 1);
+		chip->parameters.model = kstrdup(type->name, GFP_KERNEL);
+		if (!chip->parameters.model)
+			return false;
 
 		return true;
 	}
@@ -5706,8 +5713,9 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	if (!type->name)
 		return -ENODEV;
 
-	strncpy(chip->parameters.model, type->name,
-		sizeof(chip->parameters.model) - 1);
+	chip->parameters.model = kstrdup(type->name, GFP_KERNEL);
+	if (!chip->parameters.model)
+		return -ENOMEM;
 
 	chip->chipsize = (uint64_t)type->chipsize << 20;
 
@@ -5737,7 +5745,9 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 			mtd->name);
 		pr_warn("bus width %d instead of %d bits\n", busw ? 16 : 8,
 			(chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
-		return -EINVAL;
+		ret = -EINVAL;
+
+		goto free_detect_allocation;
 	}
 
 	nand_decode_bbm_options(chip);
@@ -5774,6 +5784,11 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
 	return 0;
+
+free_detect_allocation:
+	kfree(chip->parameters.model);
+
+	return ret;
 }
 
 static const char * const nand_ecc_modes[] = {
@@ -6013,6 +6028,11 @@ static int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	return 0;
 }
 
+static void nand_scan_ident_cleanup(struct nand_chip *chip)
+{
+	kfree(chip->parameters.model);
+}
+
 static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -6760,11 +6780,18 @@ int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
 
 	ret = nand_attach(chip);
 	if (ret)
-		return ret;
+		goto cleanup_ident;
 
 	ret = nand_scan_tail(mtd);
 	if (ret)
-		nand_detach(chip);
+		goto detach_chip;
+
+	return 0;
+
+detach_chip:
+	nand_detach(chip);
+cleanup_ident:
+	nand_scan_ident_cleanup(chip);
 
 	return ret;
 }
@@ -6796,6 +6823,9 @@ void nand_cleanup(struct nand_chip *chip)
 
 	/* Free controller specific allocations after chip identification */
 	nand_detach(chip);
+
+	/* Free identification phase allocations */
+	nand_scan_ident_cleanup(chip);
 }
 
 EXPORT_SYMBOL_GPL(nand_cleanup);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index eaf000b09222..4848c00f3eda 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -476,7 +476,7 @@ struct onfi_params {
  */
 struct nand_parameters {
 	/* Generic parameters */
-	char model[100];
+	const char *model;
 	bool supports_set_get_features;
 	DECLARE_BITMAP(set_feature_list, ONFI_FEATURE_NUMBER);
 	DECLARE_BITMAP(get_feature_list, ONFI_FEATURE_NUMBER);
-- 
2.14.1
