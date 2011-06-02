Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FN-00074f-O0
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:42 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so928274wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:41 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 041/104] mtd: prepare to convert of_mtd_parse_partitions to
	partition parser
Date: Thu,  2 Jun 2011 18:51:19 +0400
Message-Id: <1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Prepare to convert of_mtd_parse_partitions() to usual partitions parser:
1) Register ofpart parser
2) Internally don't use passed device for error printing
3) Add device_node to mtd_info struct
4) Move of_mtd_parse_partitions from __devinit to common text section
5) add ofpart to the default list of partition parsers

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdcore.c          |    9 +++++++++
 drivers/mtd/mtdpart.c          |    2 +-
 drivers/mtd/ofpart.c           |   30 ++++++++++++++++++++++++++++--
 include/linux/mtd/mtd.h        |    3 +++
 include/linux/mtd/partitions.h |    2 +-
 5 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c510aff..bfd5a65 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -36,6 +36,7 @@
 #include <linux/idr.h>
 #include <linux/backing-dev.h>
 #include <linux/gfp.h>
+#include <linux/of.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -446,6 +447,10 @@ int mtd_device_register(struct mtd_info *master,
 			const struct mtd_partition *parts,
 			int nr_parts)
 {
+#ifdef CONFIG_OF
+	if (master->node)
+		of_node_get(master->node);
+#endif
 	return parts ? add_mtd_partitions(master, parts, nr_parts) :
 		add_mtd_device(master);
 }
@@ -461,6 +466,10 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
+#ifdef CONFIG_OF
+	if (master->node)
+		of_node_put(master->node);
+#endif
 	err = del_mtd_partitions(master);
 	if (err)
 		return err;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3477e16..0b473ec 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -712,7 +712,7 @@ int deregister_mtd_parser(struct mtd_part_parser *p)
 }
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
-static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
+static const char *default_mtd_part_types[] = {"cmdlinepart", "ofpart", NULL};
 
 int parse_mtd_partitions(struct mtd_info *master, const char **types,
 			 struct mtd_partition **pparts, unsigned long origin)
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index a996718..ff11b85 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -20,7 +20,20 @@
 #include <linux/slab.h>
 #include <linux/mtd/partitions.h>
 
-int __devinit of_mtd_parse_partitions(struct device *dev,
+static int parse_ofpart_partitions(struct mtd_info *master,
+                             struct mtd_partition **pparts,
+                             unsigned long origin)
+{
+	struct device_node *node;
+
+	node = master->node;
+	if (!node)
+		return 0;
+
+	return of_mtd_parse_partitions(NULL, node, pparts);
+}
+
+int of_mtd_parse_partitions(struct device *dev,
                                       struct device_node *node,
                                       struct mtd_partition **pparts)
 {
@@ -69,7 +82,7 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 
 	if (!i) {
 		of_node_put(pp);
-		dev_err(dev, "No valid partition found on %s\n", node->full_name);
+		pr_err("No valid partition found on %s\n", node->full_name);
 		kfree(*pparts);
 		*pparts = NULL;
 		return -EINVAL;
@@ -79,4 +92,17 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 }
 EXPORT_SYMBOL(of_mtd_parse_partitions);
 
+static struct mtd_part_parser ofpart_parser = {
+	.owner = THIS_MODULE,
+	.parse_fn = parse_ofpart_partitions,
+	.name = "ofpart",
+};
+
+static int __init ofpart_parser_init(void)
+{
+	return register_mtd_parser(&ofpart_parser);
+}
+
+module_init(ofpart_parser_init);
+
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 2541fb8..14305d0 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -171,6 +171,9 @@ struct mtd_info {
 	// Kernel-only stuff starts here.
 	const char *name;
 	int index;
+#ifdef CONFIG_OF
+	struct device_node *node;
+#endif
 
 	/* ecc layout structure pointer - read only ! */
 	struct nand_ecclayout *ecclayout;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 08c9c7b..5fde0d8 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -71,7 +71,7 @@ struct device;
 struct device_node;
 
 #ifdef CONFIG_MTD_OF_PARTS
-int __devinit of_mtd_parse_partitions(struct device *dev,
+int of_mtd_parse_partitions(struct device *dev,
                                       struct device_node *node,
                                       struct mtd_partition **pparts);
 #else
-- 
1.7.4.4
