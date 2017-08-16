Received: from szxga05-in.huawei.com ([45.249.212.191])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhskl-0007yy-Gq
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 07:28:38 +0000
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <guohanjun@huawei.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH] mtd: nand: convert to unified device property interface
Date: Wed, 16 Aug 2017 15:29:05 +0800
Message-ID: <1502868545-124616-1-git-send-email-wangkefeng.wang@huawei.com>
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

Changing from of_* to device_* interface, then we can also extract
the properties from ACPI tables as well as from DT.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---

- APCI will be supported in hisi504_nand.c, and it will use nand_scan_ident().

 drivers/mtd/nand/nand_base.c | 54 ++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c6c18b8..27a0947 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -46,7 +46,7 @@
 #include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
-#include <linux/of.h>
+#include <linux/property.h>
 
 static int nand_get_device(struct mtd_info *mtd, int new_state);
 
@@ -4209,12 +4209,12 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	[NAND_ECC_ON_DIE]	= "on-die",
 };
 
-static int of_get_nand_ecc_mode(struct device_node *np)
+static int device_get_nand_ecc_mode(struct device *dev)
 {
 	const char *pm;
 	int err, i;
 
-	err = of_property_read_string(np, "nand-ecc-mode", &pm);
+	err = device_property_read_string(dev, "nand-ecc-mode", &pm);
 	if (err < 0)
 		return err;
 
@@ -4238,12 +4238,12 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 	[NAND_ECC_BCH]		= "bch",
 };
 
-static int of_get_nand_ecc_algo(struct device_node *np)
+static int device_get_nand_ecc_algo(struct device *dev)
 {
 	const char *pm;
 	int err, i;
 
-	err = of_property_read_string(np, "nand-ecc-algo", &pm);
+	err = device_property_read_string(dev, "nand-ecc-algo", &pm);
 	if (!err) {
 		for (i = NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
 			if (!strcasecmp(pm, nand_ecc_algos[i]))
@@ -4255,7 +4255,7 @@ static int of_get_nand_ecc_algo(struct device_node *np)
 	 * For backward compatibility we also read "nand-ecc-mode" checking
 	 * for some obsoleted values that were specifying ECC algorithm.
 	 */
-	err = of_property_read_string(np, "nand-ecc-mode", &pm);
+	err = device_property_read_string(dev, "nand-ecc-mode", &pm);
 	if (err < 0)
 		return err;
 
@@ -4267,29 +4267,29 @@ static int of_get_nand_ecc_algo(struct device_node *np)
 	return -ENODEV;
 }
 
-static int of_get_nand_ecc_step_size(struct device_node *np)
+static int device_get_nand_ecc_step_size(struct device *dev)
 {
 	int ret;
 	u32 val;
 
-	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
+	ret = device_property_read_u32(dev, "nand-ecc-step-size", &val);
 	return ret ? ret : val;
 }
 
-static int of_get_nand_ecc_strength(struct device_node *np)
+static int device_get_nand_ecc_strength(struct device *dev)
 {
 	int ret;
 	u32 val;
 
-	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
+	ret = device_property_read_u32(dev, "nand-ecc-strength", &val);
 	return ret ? ret : val;
 }
 
-static int of_get_nand_bus_width(struct device_node *np)
+static int device_get_nand_bus_width(struct device *dev)
 {
 	u32 val;
 
-	if (of_property_read_u32(np, "nand-bus-width", &val))
+	if (device_property_read_u32(dev, "nand-bus-width", &val))
 		return 8;
 
 	switch (val) {
@@ -4301,29 +4301,28 @@ static int of_get_nand_bus_width(struct device_node *np)
 	}
 }
 
-static bool of_get_nand_on_flash_bbt(struct device_node *np)
+static bool device_get_nand_on_flash_bbt(struct device *dev)
 {
-	return of_property_read_bool(np, "nand-on-flash-bbt");
+	return device_property_read_bool(dev, "nand-on-flash-bbt");
 }
 
-static int nand_dt_init(struct nand_chip *chip)
+static int nand_chip_init(struct nand_chip *chip, struct device *dev)
 {
-	struct device_node *dn = nand_get_flash_node(chip);
 	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
 
-	if (!dn)
+	if (!dev)
 		return 0;
 
-	if (of_get_nand_bus_width(dn) == 16)
+	if (device_get_nand_bus_width(dev) == 16)
 		chip->options |= NAND_BUSWIDTH_16;
 
-	if (of_get_nand_on_flash_bbt(dn))
+	if (device_get_nand_on_flash_bbt(dev))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	ecc_mode = of_get_nand_ecc_mode(dn);
-	ecc_algo = of_get_nand_ecc_algo(dn);
-	ecc_strength = of_get_nand_ecc_strength(dn);
-	ecc_step = of_get_nand_ecc_step_size(dn);
+	ecc_mode = device_get_nand_ecc_mode(dev);
+	ecc_algo = device_get_nand_ecc_algo(dev);
+	ecc_strength = device_get_nand_ecc_strength(dev);
+	ecc_step = device_get_nand_ecc_step_size(dev);
 
 	if (ecc_mode >= 0)
 		chip->ecc.mode = ecc_mode;
@@ -4337,7 +4336,7 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (ecc_step > 0)
 		chip->ecc.size = ecc_step;
 
-	if (of_property_read_bool(dn, "nand-ecc-maximize"))
+	if (device_property_read_bool(dev, "nand-ecc-maximize"))
 		chip->ecc.options |= NAND_ECC_MAXIMIZE;
 
 	return 0;
@@ -4358,14 +4357,15 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 {
 	int i, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct device *dev = mtd->dev.parent;
 	int ret;
 
-	ret = nand_dt_init(chip);
+	ret = nand_chip_init(chip, dev);
 	if (ret)
 		return ret;
 
-	if (!mtd->name && mtd->dev.parent)
-		mtd->name = dev_name(mtd->dev.parent);
+	if (!mtd->name && dev)
+		mtd->name = dev_name(dev);
 
 	if ((!chip->cmdfunc || !chip->select_chip) && !chip->cmd_ctrl) {
 		/*
-- 
1.8.3.1
