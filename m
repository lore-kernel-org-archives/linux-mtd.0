Received: from smtp4-g21.free.fr ([212.27.42.4])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMsk-0000cq-T6
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:23:56 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [RFC] MTD: export more NAND-related informations to syfs
Date: Fri, 6 May 2011 17:28:20 +0200
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201105061728.20948.ffainelli@freebox.fr>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Florian Fainelli <ffainelli@freebox.fr>

This patch exports the following NAND specific informations through sysfs:
- NAND type
- NAND manufacturer
- NAND onfi version (if set, otherwise, 0)

Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index da69bc8..b91a6d0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -250,6 +250,33 @@ static ssize_t mtd_name_show(struct device *dev,
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
+static ssize_t mtd_nand_type_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->nand_type);
+}
+static DEVICE_ATTR(nand_type, S_IRUGO, mtd_nand_type_show, NULL);
+
+static ssize_t mtd_nand_manufacturer_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->nand_manufacturer);
+}
+static DEVICE_ATTR(nand_manufacturer, S_IRUGO, mtd_nand_manufacturer_show, NULL);
+
+static ssize_t mtd_nand_onfi_version_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_to_mtd(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->onfi_version);
+}
+static DEVICE_ATTR(onfi_version, S_IRUGO, mtd_nand_onfi_version_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -260,6 +287,9 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
+	&dev_attr_nand_type.attr,
+	&dev_attr_nand_manufacturer.attr,
+	&dev_attr_onfi_version,
 	NULL,
 };
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 0a47601..a240935 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -405,6 +405,9 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.oobsize = master->oobsize;
 	slave->mtd.oobavail = master->oobavail;
 	slave->mtd.subpage_sft = master->subpage_sft;
+	slave->mtd.nand_type = master->nand_type;
+	slave->mtd.nand_manufacturer = master->nand_manufacturer;
+	slave->mtd.onfi_version = master->onfi_version;
 
 	slave->mtd.name = name;
 	slave->mtd.owner = master->owner;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..6f1a2c2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2916,6 +2916,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	int i, maf_idx;
 	u8 id_data[8];
 	int ret;
+	char onfi_version[3];
 
 	/* Select the device */
 	chip->select_chip(mtd, 0);
@@ -3164,7 +3165,36 @@ ident_done:
 		nand_manuf_ids[maf_idx].name,
 		chip->onfi_version ? chip->onfi_params.model : type->name);
 
+	if (chip->onfi_version)
+		snprintf(onfi_version, sizeof(onfi_version), "%d.%d",
+					chip->onfi_version / 10,
+					chip->onfi_version % 10);
+	else
+		snprintf(onfi_version, sizeof(onfi_version), "%s", "0");
+
+	mtd->onfi_version = kstrdup(onfi_version, GFP_KERNEL);
+	if (!mtd->onfi_version)
+		return ERR_PTR(-ENOMEM);
+
+	mtd->nand_type = kstrdup(nand_manuf_ids[maf_idx].name, GFP_KERNEL);
+	if (!mtd->nand_type) {
+		ret = -ENOMEM;
+		goto out_onfi_version;
+	}
+
+	mtd->nand_manufacturer = kstrdup(type->name, GFP_KERNEL);
+	if (!mtd->nand_manufacturer) {
+		ret = -ENOMEM;
+		goto out_nand_type;
+	}
+
 	return type;
+
+out_nand_type:
+	kfree(mtd->nand_type);
+out_onfi_version:
+	kfree(mtd->onfi_version);
+	return ERR_PTR(ret);
 }
 
 /**
@@ -3184,6 +3214,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	int i, busw, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
+	int err;
 
 	/* Get buswidth to select the correct functions */
 	busw = chip->options & NAND_BUSWIDTH_16;
@@ -3198,7 +3229,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			printk(KERN_WARNING "No NAND device found.\n");
 		chip->select_chip(mtd, -1);
-		return PTR_ERR(type);
+		err = PTR_ERR(type);
+		goto out_error;
 	}
 
 	/* Check for a chip array */
@@ -3221,6 +3253,16 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	mtd->size = i * chip->chipsize;
 
 	return 0;
+
+out_error:
+	if (mtd->nand_type)
+		kfree(mtd->nand_type);
+	if (mtd->nand_manufacturer)
+		kfree(mtd->nand_manufacturer);
+	if (mtd->onfi_version)
+		kfree(mtd->onfi_version);
+
+	return err;
 }
 EXPORT_SYMBOL(nand_scan_ident);
 
@@ -3555,6 +3597,11 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->badblock_pattern && chip->badblock_pattern->options
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
+
+	kfree(mtd->nand_type);
+	kfree(mtd->nand_manufacturer);
+	kfree(mtd->onfi_version);
+
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9d5306b..2262d5b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -168,6 +168,11 @@ struct mtd_info {
 	unsigned int erasesize_mask;
 	unsigned int writesize_mask;
 
+	/* NAND related attributes */
+	const char *nand_type;
+	const char *nand_manufacturer;
+	const char *onfi_version;
+
 	// Kernel-only stuff starts here.
 	const char *name;
 	int index;
-- 
1.7.4.1
