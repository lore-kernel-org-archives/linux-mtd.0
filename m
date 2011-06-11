Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLp-00012e-2y
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:23 +0000
Received: by mail-ey0-f177.google.com with SMTP id 6so1530647eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:20 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/18] mtd: physmap_of: move parse_obsolete_partitions to
	become separate parser
Date: Sun, 12 Jun 2011 03:11:55 +0400
Message-Id: <1307833922-21602-12-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move parse_obsolete_partitions() to ofpart.c and register it as an
ofoldpart partitions parser.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/physmap_of.c |   53 +----------------------------
 drivers/mtd/ofpart.c          |   75 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 6a75743..55c4e2e 100644
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
@@ -343,12 +298,6 @@ static int __devinit of_flash_probe(struct platform_device *dev)
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
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 24007f3..41c4518 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -93,9 +93,82 @@ static struct mtd_part_parser ofpart_parser = {
 	.name = "ofpart",
 };
 
+static int parse_ofoldpart_partitions(struct mtd_info *master,
+				      struct mtd_partition **pparts,
+				      struct mtd_part_parser_data *data)
+{
+	struct device_node *dp;
+	int i, plen, nr_parts;
+	const struct {
+		__be32 offset, len;
+	} *part;
+	const char *names;
+
+	if (!data)
+		return 0;
+
+	dp = data->of_node;
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
+		/* bit 0 set signifies read only partition */
+		if (be32_to_cpu(part->len) & 1)
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
 static int __init ofpart_parser_init(void)
 {
-	return register_mtd_parser(&ofpart_parser);
+	int rc;
+	rc = register_mtd_parser(&ofpart_parser);
+	if (rc)
+		goto out;
+
+	rc = register_mtd_parser(&ofoldpart_parser);
+	if (!rc)
+		return 0;
+
+	deregister_mtd_parser(&ofoldpart_parser);
+out:
+	return rc;
 }
 
 module_init(ofpart_parser_init);
-- 
1.7.5.3
