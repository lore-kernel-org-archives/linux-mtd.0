Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8e-0007V5-1Z
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:13 +0000
Received: by wwb39 with SMTP id 39so1305416wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:09 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/17] mtd: prepare to convert of_mtd_parse_partitions to
	partition parser
Date: Thu,  9 Jun 2011 18:22:50 +0400
Message-Id: <1307629388-24769-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
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
 drivers/mtd/mtdcore.c          |   19 +++++++++++++++++++
 drivers/mtd/mtdpart.c          |    8 ++++++--
 drivers/mtd/ofpart.c           |   30 ++++++++++++++++++++++++++++--
 include/linux/mtd/mtd.h        |    5 +++++
 include/linux/mtd/partitions.h |    2 +-
 5 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1326747..2d5b865 100644
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
@@ -487,6 +492,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
 	int err;
 	struct mtd_partition *real_parts;
 
+#ifdef CONFIG_OF
+	if (mtd->node)
+		of_node_get(mtd->node);
+#endif
+
 	err = parse_mtd_partitions(mtd, types, &real_parts, origin);
 	if (err <= 0 && nr_parts) {
 		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
@@ -505,6 +515,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
 			err = -ENODEV;
 	}
 
+#ifdef CONFIG_OF
+	if (err < 0 && mtd->node)
+		of_node_put(mtd->node);
+#endif
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
@@ -519,6 +534,10 @@ int mtd_device_unregister(struct mtd_info *master)
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
index 2b71ccb..584fa56 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -729,7 +729,11 @@ EXPORT_SYMBOL_GPL(deregister_mtd_parser);
  * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
  * are changing this array!
  */
-static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
+static const char * const default_mtd_part_types[] = {
+	"cmdlinepart",
+	"ofpart",
+	NULL
+};
 
 /**
  * parse_mtd_partitions - parse MTD partitions
@@ -741,7 +745,7 @@ static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
  * This function tries to find partition on MTD device @master. It uses MTD
  * partition parsers, specified in @types. However, if @types is %NULL, then
  * the default list of parsers is used. The default list contains only the
- * "cmdlinepart" parser ATM.
+ * "cmdlinepart" and "ofpart" parsers ATM.
  *
  * This function may return:
  * o a negative error code in case of failure
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index a996718..4ac040e 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -20,7 +20,20 @@
 #include <linux/slab.h>
 #include <linux/mtd/partitions.h>
 
-int __devinit of_mtd_parse_partitions(struct device *dev,
+static int parse_ofpart_partitions(struct mtd_info *master,
+				   struct mtd_partition **pparts,
+				   unsigned long origin)
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
index d28a241..55fbb60 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -171,6 +171,11 @@ struct mtd_info {
 	// Kernel-only stuff starts here.
 	const char *name;
 	int index;
+#ifdef CONFIG_OF
+	/* Set by driver, reference counting handled by MTD registration/
+	 * unregistration functions. */
+	struct device_node *node;
+#endif
 
 	/* ecc layout structure pointer - read only ! */
 	struct nand_ecclayout *ecclayout;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 1431cf2..a8bd193 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -74,7 +74,7 @@ struct device;
 struct device_node;
 
 #ifdef CONFIG_MTD_OF_PARTS
-int __devinit of_mtd_parse_partitions(struct device *dev,
+int of_mtd_parse_partitions(struct device *dev,
                                       struct device_node *node,
                                       struct mtd_partition **pparts);
 #else
-- 
1.7.5.3
