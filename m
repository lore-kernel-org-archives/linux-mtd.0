Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAoCD-0008Qh-Et
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2012 20:01:20 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V2 3/4] drivers/mtd: docg3 refactor cascade floors structure
Date: Thu, 22 Mar 2012 21:00:52 +0100
Message-Id: <1332446453-3527-4-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1332446453-3527-1-git-send-email-robert.jarzmik@free.fr>
References: <1332446453-3527-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Group floors into a common cascade structure. This will provide a common
structure to store common data to all cascaded docg3 chips, like IO
addressing, locking protection.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   88 ++++++++++++++++++++++---------------------
 drivers/mtd/devices/docg3.h |   18 ++++++++-
 2 files changed, 61 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index f33c130..03c9c99 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -80,14 +80,9 @@ static struct nand_ecclayout docg3_oobinfo = {
 	.oobavail = 8,
 };
 
-/**
- * struct docg3_bch - BCH engine
- */
-static struct bch_control *docg3_bch;
-
 static inline u8 doc_readb(struct docg3 *docg3, u16 reg)
 {
-	u8 val = readb(docg3->base + reg);
+	u8 val = readb(docg3->cascade->base + reg);
 
 	trace_docg3_io(0, 8, reg, (int)val);
 	return val;
@@ -95,7 +90,7 @@ static inline u8 doc_readb(struct docg3 *docg3, u16 reg)
 
 static inline u16 doc_readw(struct docg3 *docg3, u16 reg)
 {
-	u16 val = readw(docg3->base + reg);
+	u16 val = readw(docg3->cascade->base + reg);
 
 	trace_docg3_io(0, 16, reg, (int)val);
 	return val;
@@ -103,13 +98,13 @@ static inline u16 doc_readw(struct docg3 *docg3, u16 reg)
 
 static inline void doc_writeb(struct docg3 *docg3, u8 val, u16 reg)
 {
-	writeb(val, docg3->base + reg);
+	writeb(val, docg3->cascade->base + reg);
 	trace_docg3_io(1, 8, reg, val);
 }
 
 static inline void doc_writew(struct docg3 *docg3, u16 val, u16 reg)
 {
-	writew(val, docg3->base + reg);
+	writew(val, docg3->cascade->base + reg);
 	trace_docg3_io(1, 16, reg, val);
 }
 
@@ -643,7 +638,8 @@ static int doc_ecc_bch_fix_data(struct docg3 *docg3, void *buf, u8 *hwecc)
 
 	for (i = 0; i < DOC_ECC_BCH_SIZE; i++)
 		ecc[i] = bitrev8(hwecc[i]);
-	numerrs = decode_bch(docg3_bch, NULL, DOC_ECC_BCH_COVERED_BYTES,
+	numerrs = decode_bch(docg3->cascade->bch, NULL,
+			     DOC_ECC_BCH_COVERED_BYTES,
 			     NULL, ecc, NULL, errorpos);
 	BUG_ON(numerrs == -EINVAL);
 	if (numerrs < 0)
@@ -1598,13 +1594,13 @@ static struct device_attribute doc_sys_attrs[DOC_MAX_NBFLOORS][4] = {
 };
 
 static int doc_register_sysfs(struct platform_device *pdev,
-			      struct mtd_info **floors)
+			      struct docg3_cascade *cascade)
 {
 	int ret = 0, floor, i = 0;
 	struct device *dev = &pdev->dev;
 
-	for (floor = 0; !ret && floor < DOC_MAX_NBFLOORS && floors[floor];
-	     floor++)
+	for (floor = 0; !ret && floor < DOC_MAX_NBFLOORS &&
+		     cascade->floors[floor]; floor++)
 		for (i = 0; !ret && i < 4; i++)
 			ret = device_create_file(dev, &doc_sys_attrs[floor][i]);
 	if (!ret)
@@ -1618,12 +1614,12 @@ static int doc_register_sysfs(struct platform_device *pdev,
 }
 
 static void doc_unregister_sysfs(struct platform_device *pdev,
-				 struct mtd_info **floors)
+				 struct docg3_cascade *cascade)
 {
 	struct device *dev = &pdev->dev;
 	int floor, i;
 
-	for (floor = 0; floor < DOC_MAX_NBFLOORS && floors[floor];
+	for (floor = 0; floor < DOC_MAX_NBFLOORS && cascade->floors[floor];
 	     floor++)
 		for (i = 0; i < 4; i++)
 			device_remove_file(dev, &doc_sys_attrs[floor][i]);
@@ -1832,6 +1828,7 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
  * @base: the io space where the device is probed
  * @floor: the floor of the probed device
  * @dev: the device
+ * @cascade: the cascade of chips this devices will belong to
  *
  * Checks whether a device at the specified IO range, and floor is available.
  *
@@ -1840,7 +1837,7 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
  * launched.
  */
 static struct mtd_info * __init
-doc_probe_device(void __iomem *base, int floor, struct device *dev)
+doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 {
 	int ret, bbt_nbpages;
 	u16 chip_id, chip_id_inv;
@@ -1863,7 +1860,7 @@ doc_probe_device(void __iomem *base, int floor, struct device *dev)
 
 	docg3->dev = dev;
 	docg3->device_id = floor;
-	docg3->base = base;
+	docg3->cascade = cascade;
 	doc_set_device_id(docg3, docg3->device_id);
 	if (!floor)
 		doc_set_asic_mode(docg3, DOC_ASICMODE_RESET);
@@ -1880,7 +1877,7 @@ doc_probe_device(void __iomem *base, int floor, struct device *dev)
 	switch (chip_id) {
 	case DOC_CHIPID_G3:
 		doc_info("Found a G3 DiskOnChip at addr %p, floor %d\n",
-			 base, floor);
+			 docg3->cascade->base, floor);
 		break;
 	default:
 		doc_err("Chip id %04x is not a DiskOnChip G3 chip\n", chip_id);
@@ -1925,10 +1922,12 @@ static void doc_release_device(struct mtd_info *mtd)
 static int docg3_resume(struct platform_device *pdev)
 {
 	int i;
+	struct docg3_cascade *cascade;
 	struct mtd_info **docg3_floors, *mtd;
 	struct docg3 *docg3;
 
-	docg3_floors = platform_get_drvdata(pdev);
+	cascade = platform_get_drvdata(pdev);
+	docg3_floors = cascade->floors;
 	mtd = docg3_floors[0];
 	docg3 = mtd->priv;
 
@@ -1950,11 +1949,13 @@ static int docg3_resume(struct platform_device *pdev)
 static int docg3_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	int floor, i;
+	struct docg3_cascade *cascade;
 	struct mtd_info **docg3_floors, *mtd;
 	struct docg3 *docg3;
 	u8 ctrl, pwr_down;
 
-	docg3_floors = platform_get_drvdata(pdev);
+	cascade = platform_get_drvdata(pdev);
+	docg3_floors = cascade->floors;
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
 		mtd = docg3_floors[floor];
 		if (!mtd)
@@ -2004,7 +2005,7 @@ static int __init docg3_probe(struct platform_device *pdev)
 	struct resource *ress;
 	void __iomem *base;
 	int ret, floor, found = 0;
-	struct mtd_info **docg3_floors;
+	struct docg3_cascade *cascade;
 
 	ret = -ENXIO;
 	ress = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2015,17 +2016,18 @@ static int __init docg3_probe(struct platform_device *pdev)
 	base = ioremap(ress->start, DOC_IOSPACE_SIZE);
 
 	ret = -ENOMEM;
-	docg3_floors = kzalloc(sizeof(*docg3_floors) * DOC_MAX_NBFLOORS,
-			       GFP_KERNEL);
-	if (!docg3_floors)
+	cascade = kzalloc(sizeof(*cascade) * DOC_MAX_NBFLOORS,
+			  GFP_KERNEL);
+	if (!cascade)
 		goto nomem1;
-	docg3_bch = init_bch(DOC_ECC_BCH_M, DOC_ECC_BCH_T,
+	cascade->base = base;
+	cascade->bch = init_bch(DOC_ECC_BCH_M, DOC_ECC_BCH_T,
 			     DOC_ECC_BCH_PRIMPOLY);
-	if (!docg3_bch)
+	if (!cascade->bch)
 		goto nomem2;
 
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
-		mtd = doc_probe_device(base, floor, dev);
+		mtd = doc_probe_device(cascade, floor, dev);
 		if (IS_ERR(mtd)) {
 			ret = PTR_ERR(mtd);
 			goto err_probe;
@@ -2036,7 +2038,7 @@ static int __init docg3_probe(struct platform_device *pdev)
 			else
 				continue;
 		}
-		docg3_floors[floor] = mtd;
+		cascade->floors[floor] = mtd;
 		ret = mtd_device_parse_register(mtd, part_probes, NULL, NULL,
 						0);
 		if (ret)
@@ -2044,26 +2046,26 @@ static int __init docg3_probe(struct platform_device *pdev)
 		found++;
 	}
 
-	ret = doc_register_sysfs(pdev, docg3_floors);
+	ret = doc_register_sysfs(pdev, cascade);
 	if (ret)
 		goto err_probe;
 	if (!found)
 		goto notfound;
 
-	platform_set_drvdata(pdev, docg3_floors);
-	doc_dbg_register(docg3_floors[0]->priv);
+	platform_set_drvdata(pdev, cascade);
+	doc_dbg_register(cascade->floors[0]->priv);
 	return 0;
 
 notfound:
 	ret = -ENODEV;
 	dev_info(dev, "No supported DiskOnChip found\n");
 err_probe:
-	free_bch(docg3_bch);
+	kfree(cascade->bch);
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
-		if (docg3_floors[floor])
-			doc_release_device(docg3_floors[floor]);
+		if (cascade->floors[floor])
+			doc_release_device(cascade->floors[floor]);
 nomem2:
-	kfree(docg3_floors);
+	kfree(cascade);
 nomem1:
 	iounmap(base);
 noress:
@@ -2078,19 +2080,19 @@ noress:
  */
 static int __exit docg3_release(struct platform_device *pdev)
 {
-	struct mtd_info **docg3_floors = platform_get_drvdata(pdev);
-	struct docg3 *docg3 = docg3_floors[0]->priv;
-	void __iomem *base = docg3->base;
+	struct docg3_cascade *cascade = platform_get_drvdata(pdev);
+	struct docg3 *docg3 = cascade->floors[0]->priv;
+	void __iomem *base = cascade->base;
 	int floor;
 
-	doc_unregister_sysfs(pdev, docg3_floors);
+	doc_unregister_sysfs(pdev, cascade);
 	doc_dbg_unregister(docg3);
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
-		if (docg3_floors[floor])
-			doc_release_device(docg3_floors[floor]);
+		if (cascade->floors[floor])
+			doc_release_device(cascade->floors[floor]);
 
-	kfree(docg3_floors);
-	free_bch(docg3_bch);
+	free_bch(docg3->cascade->bch);
+	kfree(cascade);
 	iounmap(base);
 	return 0;
 }
diff --git a/drivers/mtd/devices/docg3.h b/drivers/mtd/devices/docg3.h
index db0da43..642e606 100644
--- a/drivers/mtd/devices/docg3.h
+++ b/drivers/mtd/devices/docg3.h
@@ -22,6 +22,8 @@
 #ifndef _MTD_DOCG3_H
 #define _MTD_DOCG3_H
 
+#include <linux/mtd/mtd.h>
+
 /*
  * Flash memory areas :
  *   - 0x0000 .. 0x07ff : IPL
@@ -267,9 +269,21 @@
 #define DOC_LAYOUT_DPS_KEY_LENGTH	8
 
 /**
+ * struct docg3_cascade - Cascade of 1 to 4 docg3 chips
+ * @floors: floors (ie. one physical docg3 chip is one floor)
+ * @base: IO space to access all chips in the cascade
+ * @bch: the BCH correcting control structure
+ */
+struct docg3_cascade {
+	struct mtd_info *floors[DOC_MAX_NBFLOORS];
+	void __iomem *base;
+	struct bch_control *bch;
+};
+
+/**
  * struct docg3 - DiskOnChip driver private data
  * @dev: the device currently under control
- * @base: mapped IO space
+ * @cascade: the cascade this device belongs to
  * @device_id: number of the cascaded DoCG3 device (0, 1, 2 or 3)
  * @if_cfg: if true, reads are on 16bits, else reads are on 8bits
 
@@ -287,7 +301,7 @@
  */
 struct docg3 {
 	struct device *dev;
-	void __iomem *base;
+	struct docg3_cascade *cascade;
 	unsigned int device_id:4;
 	unsigned int if_cfg:1;
 	unsigned int reliable:2;
-- 
1.7.5.4
