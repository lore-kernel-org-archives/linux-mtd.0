Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzcLu-0000Zk-Dk
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 03:27:12 +0000
Received: by pabfh17 with SMTP id fh17so105137120pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 19:26:49 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] mtd: support a cleanup callback for partition parsers
Date: Thu, 19 Nov 2015 19:26:37 -0800
Message-Id: <1447989997-108476-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
References: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If partition parsers need to clean up their resources, we shouldn't
assume that all memory will fit in a single kmalloc() that the caller
can kfree(). We should allow the parser to provide a proper cleanup
routine.

Note that this means we need to keep a hold on the parser's module for a
bit longer, and release it later with mtd_part_parser_put().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.c          | 12 ++++++++++--
 drivers/mtd/mtdcore.h          | 18 +++++++++++++++++-
 drivers/mtd/mtdpart.c          | 11 ++++++++---
 include/linux/mtd/partitions.h |  1 +
 4 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c8d54948bbc1..c366de5e0124 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -590,8 +590,10 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 {
 	int ret;
 	struct mtd_partition *real_parts = NULL;
+	struct mtd_part_parser *parser = NULL;
 
-	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
+	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data,
+				   &parser);
 	if (ret > 0) {
 		nr_parts = ret;
 	} else if (ret <= 0 && nr_parts && parts) {
@@ -630,7 +632,13 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 
 out:
-	kfree(real_parts);
+	if (parser) {
+		mtd_part_parser_cleanup(parser, real_parts, nr_parts);
+		mtd_part_parser_put(parser);
+	} else {
+		kfree(real_parts);
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 102cdefa07b5..2cacad7cfbdc 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -14,13 +14,29 @@ int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
 			 struct mtd_partition **pparts,
-			 struct mtd_part_parser_data *data);
+			 struct mtd_part_parser_data *data,
+			 struct mtd_part_parser **ret_parser);
 
 static inline void mtd_part_parser_put(struct mtd_part_parser *p)
 {
 	module_put(p->owner);
 }
 
+static inline void mtd_part_parser_cleanup(struct mtd_part_parser *parser,
+					   struct mtd_partition *pparts,
+					   int nrparts)
+{
+	/* Some parsers provide their own cleanup function */
+	if (parser->cleanup)
+		parser->cleanup(pparts, nrparts);
+	/*
+	 * Others have historically relied on the core to kfree() their data.
+	 * Retain this behavior for legacy.
+	 */
+	else
+		kfree(pparts);
+}
+
 int __init init_mtdchar(void);
 void __exit cleanup_mtdchar(void);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 47afef3f4e25..5146c4e71a47 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -737,6 +737,7 @@ static const char * const default_mtd_part_types[] = {
  * @types: names of partition parsers to try or %NULL
  * @pparts: array of partitions found is returned here
  * @data: MTD partition parser-specific data
+ * @ret_parser: MTD parser used; assigned only on successful parsing
  *
  * This function tries to find partition on MTD device @master. It uses MTD
  * partition parsers, specified in @types. However, if @types is %NULL, then
@@ -749,11 +750,14 @@ static const char * const default_mtd_part_types[] = {
  * o a negative error code in case of failure
  * o zero if no partitions were found
  * o a positive number of found partitions, in which case on exit @pparts will
- *   point to an array containing this number of &struct mtd_info objects.
+ *   point to an array containing this number of &struct mtd_info objects, and
+ *   @ret_parser will point to the parser used. Note that the caller must call
+ *   'mtd_part_parser_put()' on this struct when finished with it.
  */
 int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			 struct mtd_partition **pparts,
-			 struct mtd_part_parser_data *data)
+			 struct mtd_part_parser_data *data,
+			 struct mtd_part_parser **ret_parser)
 {
 	struct mtd_part_parser *parser;
 	int ret, err = 0;
@@ -773,12 +777,13 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		ret = (*parser->parse_fn)(master, pparts, data);
 		pr_debug("%s: parser %s: %i\n",
 			 master->name, parser->name, ret);
-		mtd_part_parser_put(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
+			*ret_parser = parser;
 			return ret;
 		}
+		mtd_part_parser_put(parser);
 		/*
 		 * Stash the first error we see; only report it if no parser
 		 * succeeds
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index d002d9b5d797..d1fd7edbfcfe 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -71,6 +71,7 @@ struct mtd_part_parser {
 	const char *name;
 	int (*parse_fn)(struct mtd_info *, struct mtd_partition **,
 			struct mtd_part_parser_data *);
+	void (*cleanup)(struct mtd_partition *pparts, int nr_parts);
 };
 
 extern int __register_mtd_parser(struct mtd_part_parser *parser,
-- 
2.6.0.rc2.230.g3dd15c0
