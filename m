Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6jPf-0002qP-GW
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 18:24:28 +0000
Received: by pfdd184 with SMTP id d184so33784885pfd.3
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 10:24:06 -0800 (PST)
Date: Wed, 9 Dec 2015 10:24:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH v3 6/6] mtd: partitions: support a cleanup callback for parsers
Message-ID: <20151209182403.GW120110@google.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-7-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449271518-118900-7-git-send-email-computersforpeace@gmail.com>
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

Alongside this, define a default callback that we'll automatically use
if the parser doesn't provide one, so we can still retain the old
behavior.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v3:
 * drop redundant 'if (parsed.parser)' condition before cleanup

v2:
 * put more common logic in mtd_part_parser_cleanup()
 * provide default cleanup routine (i.e., kfree()) for parsers

 drivers/mtd/mtdcore.c          |  3 +--
 drivers/mtd/mtdcore.h          |  2 ++
 drivers/mtd/mtdpart.c          | 35 +++++++++++++++++++++++++++++++++--
 include/linux/mtd/partitions.h |  1 +
 4 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 20b2b38247b6..89d811e7b04a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -630,8 +630,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 out:
 	/* Cleanup any parsed partitions */
-	if (parsed.parser)
-		kfree(parsed.parts);
+	mtd_part_parser_cleanup(&parsed);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index ce81cc2002f4..55fdb8e1fd2a 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -17,6 +17,8 @@ int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
 			 struct mtd_partitions *pparts,
 			 struct mtd_part_parser_data *data);
 
+void mtd_part_parser_cleanup(struct mtd_partitions *parts);
+
 int __init init_mtdchar(void);
 void __exit cleanup_mtdchar(void);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 53517d7653cb..10bf304027dd 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -709,10 +709,23 @@ static inline void mtd_part_parser_put(const struct mtd_part_parser *p)
 	module_put(p->owner);
 }
 
+/*
+ * Many partition parsers just expected the core to kfree() all their data in
+ * one chunk. Do that by default.
+ */
+static void mtd_part_parser_cleanup_default(const struct mtd_partition *pparts,
+					    int nr_parts)
+{
+	kfree(pparts);
+}
+
 int __register_mtd_parser(struct mtd_part_parser *p, struct module *owner)
 {
 	p->owner = owner;
 
+	if (!p->cleanup)
+		p->cleanup = &mtd_part_parser_cleanup_default;
+
 	spin_lock(&part_parser_lock);
 	list_add(&p->list, &part_parsers);
 	spin_unlock(&part_parser_lock);
@@ -756,7 +769,9 @@ static const char * const default_mtd_part_types[] = {
  * This function may return:
  * o a negative error code in case of failure
  * o zero otherwise, and @pparts will describe the partitions, number of
- *   partitions, and the parser which parsed them
+ *   partitions, and the parser which parsed them. Caller must release
+ *   resources with mtd_part_parser_cleanup() when finished with the returned
+ *   data.
  */
 int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			 struct mtd_partitions *pparts,
@@ -780,7 +795,6 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		ret = (*parser->parse_fn)(master, &pparts->parts, data);
 		pr_debug("%s: parser %s: %i\n",
 			 master->name, parser->name, ret);
-		mtd_part_parser_put(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
@@ -788,6 +802,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			pparts->parser = parser;
 			return 0;
 		}
+		mtd_part_parser_put(parser);
 		/*
 		 * Stash the first error we see; only report it if no parser
 		 * succeeds
@@ -798,6 +813,22 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 	return err;
 }
 
+void mtd_part_parser_cleanup(struct mtd_partitions *parts)
+{
+	const struct mtd_part_parser *parser;
+
+	if (!parts)
+		return;
+
+	parser = parts->parser;
+	if (parser) {
+		if (parser->cleanup)
+			parser->cleanup(parts->parts, parts->nr_parts);
+
+		mtd_part_parser_put(parser);
+	}
+}
+
 int mtd_is_partition(const struct mtd_info *mtd)
 {
 	struct mtd_part *part;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index cceaf7bd1537..70736e1e6c8f 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -71,6 +71,7 @@ struct mtd_part_parser {
 	const char *name;
 	int (*parse_fn)(struct mtd_info *, const struct mtd_partition **,
 			struct mtd_part_parser_data *);
+	void (*cleanup)(const struct mtd_partition *pparts, int nr_parts);
 };
 
 /* Container for passing around a set of parsed partitions */
-- 
2.6.0.rc2.230.g3dd15c0
