Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzcLt-0000Zc-Df
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 03:27:10 +0000
Received: by padhx2 with SMTP id hx2so101890675pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 19:26:48 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] mtd: rename MTD parser get/put
Date: Thu, 19 Nov 2015 19:26:35 -0800
Message-Id: <1447989997-108476-2-git-send-email-computersforpeace@gmail.com>
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

We're going to use put_partition_parser() outside of this file, so let's
fix up the prefix naming a bit, to hopefully be more consistent.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.h |  7 +++++++
 drivers/mtd/mtdpart.c | 10 ++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 7b0353399a10..102cdefa07b5 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -1,3 +1,5 @@
+#include <linux/mtd/partitions.h>
+
 /*
  * These are exported solely for the purpose of mtd_blkdevs.c and mtdchar.c.
  * You should not use them for _anything_ else.
@@ -14,6 +16,11 @@ int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
 			 struct mtd_partition **pparts,
 			 struct mtd_part_parser_data *data);
 
+static inline void mtd_part_parser_put(struct mtd_part_parser *p)
+{
+	module_put(p->owner);
+}
+
 int __init init_mtdchar(void);
 void __exit cleanup_mtdchar(void);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1fa3ca95d9c1..47afef3f4e25 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -684,7 +684,7 @@ int add_mtd_partitions(struct mtd_info *master,
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
 
-static struct mtd_part_parser *get_partition_parser(const char *name)
+static struct mtd_part_parser *mtd_part_parser_get(const char *name)
 {
 	struct mtd_part_parser *p, *ret = NULL;
 
@@ -701,8 +701,6 @@ static struct mtd_part_parser *get_partition_parser(const char *name)
 	return ret;
 }
 
-#define put_partition_parser(p) do { module_put((p)->owner); } while (0)
-
 int __register_mtd_parser(struct mtd_part_parser *p, struct module *owner)
 {
 	p->owner = owner;
@@ -765,9 +763,9 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 
 	for ( ; *types; types++) {
 		pr_debug("%s: parsing partitions %s\n", master->name, *types);
-		parser = get_partition_parser(*types);
+		parser = mtd_part_parser_get(*types);
 		if (!parser && !request_module("%s", *types))
-			parser = get_partition_parser(*types);
+			parser = mtd_part_parser_get(*types);
 		pr_debug("%s: got parser %s\n", master->name,
 			 parser ? parser->name : NULL);
 		if (!parser)
@@ -775,7 +773,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		ret = (*parser->parse_fn)(master, pparts, data);
 		pr_debug("%s: parser %s: %i\n",
 			 master->name, parser->name, ret);
-		put_partition_parser(parser);
+		mtd_part_parser_put(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
-- 
2.6.0.rc2.230.g3dd15c0
