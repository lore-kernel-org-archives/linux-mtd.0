Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zjt-0003iX-N4
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:26:12 +0000
Received: by pabfh17 with SMTP id fh17so96225557pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:25:50 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH v2 5/6] mtd: partitions: pass around 'mtd_partitions' wrapper
 struct
Date: Fri,  4 Dec 2015 15:25:17 -0800
Message-Id: <1449271518-118900-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For some of the core partitioning code, it helps to keep info about the
parsed partition (and who parsed them) together in one place.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
New in v2

 drivers/mtd/mtdcore.c          | 33 +++++++++++++++++++--------------
 drivers/mtd/mtdcore.h          |  5 ++++-
 drivers/mtd/mtdpart.c          | 15 ++++++++-------
 include/linux/mtd/partitions.h |  7 +++++++
 4 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 868ee52d5063..20b2b38247b6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -532,9 +532,10 @@ out_error:
 }
 
 static int mtd_add_device_partitions(struct mtd_info *mtd,
-				     const struct mtd_partition *real_parts,
-				     int nbparts)
+				     struct mtd_partitions *parts)
 {
+	const struct mtd_partition *real_parts = parts->parts;
+	int nbparts = parts->nr_parts;
 	int ret;
 
 	if (nbparts == 0 || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
@@ -588,23 +589,27 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
+	struct mtd_partitions parsed;
 	int ret;
-	const struct mtd_partition *real_parts = NULL;
 
-	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
-	if (ret <= 0 && nr_parts && parts) {
-		real_parts = parts;
-		ret = nr_parts;
-	}
-	/* Didn't come up with either parsed OR fallback partitions */
-	if (ret < 0) {
+	memset(&parsed, 0, sizeof(parsed));
+
+	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
+	if ((ret < 0 || parsed.nr_parts == 0) && parts && nr_parts) {
+		/* Fall back to driver-provided partitions */
+		parsed = (struct mtd_partitions){
+			.parts		= parts,
+			.nr_parts	= nr_parts,
+		};
+	} else if (ret < 0) {
+		/* Didn't come up with parsed OR fallback partitions */
 		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
 			ret);
 		/* Don't abort on errors; we can still use unpartitioned MTD */
-		ret = 0;
+		memset(&parsed, 0, sizeof(parsed));
 	}
 
-	ret = mtd_add_device_partitions(mtd, real_parts, ret);
+	ret = mtd_add_device_partitions(mtd, &parsed);
 	if (ret)
 		goto out;
 
@@ -625,8 +630,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 out:
 	/* Cleanup any parsed partitions */
-	if (real_parts != parts)
-		kfree(real_parts);
+	if (parsed.parser)
+		kfree(parsed.parts);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 537ec66f9cfd..ce81cc2002f4 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -10,8 +10,11 @@ int add_mtd_device(struct mtd_info *mtd);
 int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
+
+struct mtd_partitions;
+
 int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
-			 const struct mtd_partition **pparts,
+			 struct mtd_partitions *pparts,
 			 struct mtd_part_parser_data *data);
 
 int __init init_mtdchar(void);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 86691a5c68b9..c5108e0efe88 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -740,7 +740,7 @@ static const char * const default_mtd_part_types[] = {
  * parse_mtd_partitions - parse MTD partitions
  * @master: the master partition (describes whole MTD device)
  * @types: names of partition parsers to try or %NULL
- * @pparts: array of partitions found is returned here
+ * @pparts: info about partitions found is returned here
  * @data: MTD partition parser-specific data
  *
  * This function tries to find partition on MTD device @master. It uses MTD
@@ -752,12 +752,11 @@ static const char * const default_mtd_part_types[] = {
  *
  * This function may return:
  * o a negative error code in case of failure
- * o zero if no partitions were found
- * o a positive number of found partitions, in which case on exit @pparts will
- *   point to an array containing this number of &struct mtd_info objects.
+ * o zero otherwise, and @pparts will describe the partitions, number of
+ *   partitions, and the parser which parsed them
  */
 int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
-			 const struct mtd_partition **pparts,
+			 struct mtd_partitions *pparts,
 			 struct mtd_part_parser_data *data)
 {
 	struct mtd_part_parser *parser;
@@ -775,14 +774,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			 parser ? parser->name : NULL);
 		if (!parser)
 			continue;
-		ret = (*parser->parse_fn)(master, pparts, data);
+		ret = (*parser->parse_fn)(master, &pparts->parts, data);
 		pr_debug("%s: parser %s: %i\n",
 			 master->name, parser->name, ret);
 		mtd_part_parser_put(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
-			return ret;
+			pparts->nr_parts = ret;
+			pparts->parser = parser;
+			return 0;
 		}
 		/*
 		 * Stash the first error we see; only report it if no parser
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 6185536daacc..cceaf7bd1537 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -73,6 +73,13 @@ struct mtd_part_parser {
 			struct mtd_part_parser_data *);
 };
 
+/* Container for passing around a set of parsed partitions */
+struct mtd_partitions {
+	const struct mtd_partition *parts;
+	int nr_parts;
+	const struct mtd_part_parser *parser;
+};
+
 extern int __register_mtd_parser(struct mtd_part_parser *parser,
 				 struct module *owner);
 #define register_mtd_parser(parser) __register_mtd_parser(parser, THIS_MODULE)
-- 
2.6.0.rc2.230.g3dd15c0
