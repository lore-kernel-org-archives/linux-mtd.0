Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9Fd-00074f-9H
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:52:00 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so928274wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:56 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCH=20050/104=5D=20physmap=5Fof=3A=20separate=20parse=5Fobsolete=5Fpartitions=20to=20separate=20parser?=
Date: Thu,  2 Jun 2011 18:51:28 +0400
Message-Id: <1307026293-8535-16-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Separate parse_obsolete_partitions() to external ofoldpart partitions parser.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/Kconfig           |   10 +++++
 drivers/mtd/Makefile          |    1 +
 drivers/mtd/maps/physmap_of.c |   53 +------------------------
 drivers/mtd/ofoldpart.c       |   89 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 101 insertions(+), 52 deletions(-)
 create mode 100644 drivers/mtd/ofoldpart.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 4be8373..2aa8afb 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -144,6 +144,16 @@ config MTD_OF_PARTS
 	  the partition map from the children of the flash node,
 	  as described in Documentation/powerpc/booting-without-of.txt.
 
+config MTD_OF_OLD_PARTS
+	bool "Obsolete OF tree partition info"
+	depends on OF
+	help
+	  This provides a partition parsing function which derives
+	  the partition map from the the flash node, being an obsolete
+	  way to describe physmap_of partitioning info.
+
+	  If you aren't sure you need this, you can say N.
+
 config MTD_AR7_PARTS
 	tristate "TI AR7 partitioning support"
 	---help---
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 39664c4..1de83b9 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o
 mtd-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
+mtd-$(CONFIG_MTD_OF_OLD_PARTS)	+= ofoldpart.o
 
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 312eb17..c953db3 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -40,51 +40,6 @@ struct of_flash {
 };
 
 #define OF_FLASH_PARTS(info)	((info)->parts)
-static int parse_obsolete_partitions(struct platform_device *dev,
-				     struct of_flash *info,
-				     struct device_node *dp)
-{
-	int i, plen, nr_parts;
-	const struct {
-		__be32 offset, len;
-	} *part;
-	const char *names;
-
-	part = of_get_property(dp, "partitions", &plen);
-	if (!part)
-		return 0; /* No partitions found */
-
-	dev_warn(&dev->dev, "Device tree uses obsolete partition map binding\n");
-
-	nr_parts = plen / sizeof(part[0]);
-
-	info->parts = kzalloc(nr_parts * sizeof(*info->parts), GFP_KERNEL);
-	if (!info->parts)
-		return -ENOMEM;
-
-	names = of_get_property(dp, "partition-names", &plen);
-
-	for (i = 0; i < nr_parts; i++) {
-		info->parts[i].offset = be32_to_cpu(part->offset);
-		info->parts[i].size   = be32_to_cpu(part->len) & ~1;
-		if (be32_to_cpu(part->len) & 1) /* bit 0 set signifies read only partition */
-			info->parts[i].mask_flags = MTD_WRITEABLE;
-
-		if (names && (plen > 0)) {
-			int len = strlen(names) + 1;
-
-			info->parts[i].name = (char *)names;
-			plen -= len;
-			names += len;
-		} else {
-			info->parts[i].name = "unnamed";
-		}
-
-		part++;
-	}
-
-	return nr_parts;
-}
 
 static int of_flash_remove(struct platform_device *dev)
 {
@@ -166,7 +121,7 @@ static struct mtd_info * __devinit obsolete_probe(struct platform_device *dev,
    default is use. These take precedence over other device tree
    information. */
 static const char *part_probe_types_def[] = { "cmdlinepart", "RedBoot",
-					"ofpart", NULL };
+					"ofpart", "ofoldpart", NULL };
 static const char ** __devinit of_get_probes(struct device_node *dp)
 {
 	const char *cp;
@@ -342,12 +297,6 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	}
 	of_free_probes(part_probe_types);
 
-	if (err == 0) {
-		err = parse_obsolete_partitions(dev, info, dp);
-		if (err < 0)
-			goto err_out;
-	}
-
 	mtd_device_register(info->cmtd, info->parts, err);
 
 	kfree(mtd_list);
diff --git a/drivers/mtd/ofoldpart.c b/drivers/mtd/ofoldpart.c
new file mode 100644
index 0000000..a2c143b
--- /dev/null
+++ b/drivers/mtd/ofoldpart.c
@@ -0,0 +1,89 @@
+/*
+ * Flash partitions described by the OF (or flattened) device tree
+ *
+ * Copyright © 2006 MontaVista Software Inc.
+ * Author: Vitaly Wool <vwool@ru.mvista.com>
+ *
+ * Revised to handle newer style flash binding by:
+ *   Copyright © 2007 David Gibson, IBM Corporation.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/mtd/mtd.h>
+#include <linux/slab.h>
+#include <linux/mtd/partitions.h>
+
+static int parse_ofoldpart_partitions(struct mtd_info *master,
+                             struct mtd_partition **pparts,
+                             unsigned long origin)
+{
+	struct device_node *dp;
+	int i, plen, nr_parts;
+	const struct {
+		__be32 offset, len;
+	} *part;
+	const char *names;
+
+	dp = master->node;
+	if (!dp)
+		return 0;
+
+	part = of_get_property(dp, "partitions", &plen);
+	if (!part)
+		return 0; /* No partitions found */
+
+	pr_warning("Device tree uses obsolete partition map binding: %s\n",
+			dp->full_name);
+
+	nr_parts = plen / sizeof(part[0]);
+
+	*pparts = kzalloc(nr_parts * sizeof(*(*pparts)), GFP_KERNEL);
+	if (!pparts)
+		return -ENOMEM;
+
+	names = of_get_property(dp, "partition-names", &plen);
+
+	for (i = 0; i < nr_parts; i++) {
+		(*pparts)[i].offset = be32_to_cpu(part->offset);
+		(*pparts)[i].size   = be32_to_cpu(part->len) & ~1;
+		if (be32_to_cpu(part->len) & 1) /* bit 0 set signifies read only partition */
+			(*pparts)[i].mask_flags = MTD_WRITEABLE;
+
+		if (names && (plen > 0)) {
+			int len = strlen(names) + 1;
+
+			(*pparts)[i].name = (char *)names;
+			plen -= len;
+			names += len;
+		} else {
+			(*pparts)[i].name = "unnamed";
+		}
+
+		part++;
+	}
+
+	return nr_parts;
+}
+
+static struct mtd_part_parser ofoldpart_parser = {
+	.owner = THIS_MODULE,
+	.parse_fn = parse_ofoldpart_partitions,
+	.name = "ofoldpart",
+};
+
+static int __init ofoldpart_parser_init(void)
+{
+	return register_mtd_parser(&ofoldpart_parser);
+}
+
+module_init(ofoldpart_parser_init);
+
+MODULE_LICENSE("GPL");
+
-- 
1.7.4.4
