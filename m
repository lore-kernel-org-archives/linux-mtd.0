Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJt0-00041T-6z
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:16 +0000
Received: by wwf22 with SMTP id 22so452817wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:11 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/18] mtd: prepare to convert of_mtd_parse_partitions to
	partition parser
Date: Wed, 22 Jun 2011 13:37:36 +0400
Message-Id: <1308735472-32640-3-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
References: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
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
3) Add device_node to mtd_part_parser_data struct
4) Move of_mtd_parse_partitions from __devinit to common text section
5) add ofpart to the default list of partition parsers

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdpart.c          |    8 ++++++--
 drivers/mtd/ofpart.c           |   27 +++++++++++++++++++++++++--
 include/linux/mtd/partitions.h |    6 +++++-
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 34d582c..9e8ee05 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -729,7 +729,11 @@ EXPORT_SYMBOL_GPL(deregister_mtd_parser);
  * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
  * are changing this array!
  */
-static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
+static const char *default_mtd_part_types[] = {
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
index a996718..7c2c926 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -20,7 +20,17 @@
 #include <linux/slab.h>
 #include <linux/mtd/partitions.h>
 
-int __devinit of_mtd_parse_partitions(struct device *dev,
+static int parse_ofpart_partitions(struct mtd_info *master,
+				   struct mtd_partition **pparts,
+				   struct mtd_part_parser_data *data)
+{
+	if (!data || !data->of_node)
+		return 0;
+
+	return of_mtd_parse_partitions(NULL, data->of_node, pparts);
+}
+
+int of_mtd_parse_partitions(struct device *dev,
                                       struct device_node *node,
                                       struct mtd_partition **pparts)
 {
@@ -69,7 +79,7 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 
 	if (!i) {
 		of_node_put(pp);
-		dev_err(dev, "No valid partition found on %s\n", node->full_name);
+		pr_err("No valid partition found on %s\n", node->full_name);
 		kfree(*pparts);
 		*pparts = NULL;
 		return -EINVAL;
@@ -79,4 +89,17 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
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
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index df125fa..6e724af 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -51,14 +51,18 @@ struct mtd_partition {
 
 
 struct mtd_info;
+struct device_node;
 
 /**
  * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
  * @origin: for RedBoot, start address of MTD device,
  *					%0 unless you are sure you need this.
+ * @of_node: for OpenFirmware based parsers, pass device node containing
+ *					partitioning information
  */
 struct mtd_part_parser_data {
 	unsigned long origin;
+	struct device_node *of_node;
 };
 
 
@@ -86,7 +90,7 @@ struct device;
 struct device_node;
 
 #ifdef CONFIG_MTD_OF_PARTS
-int __devinit of_mtd_parse_partitions(struct device *dev,
+int of_mtd_parse_partitions(struct device *dev,
                                       struct device_node *node,
                                       struct mtd_partition **pparts);
 #else
-- 
1.7.5.3
