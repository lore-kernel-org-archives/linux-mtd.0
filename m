Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zjt-0003iQ-N6
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:26:11 +0000
Received: by pabfh17 with SMTP id fh17so96225308pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:25:48 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH v2 3/6] mtd: partitions: rename MTD parser get/put
Date: Fri,  4 Dec 2015 15:25:15 -0800
Message-Id: <1449271518-118900-4-git-send-email-computersforpeace@gmail.com>
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

We're going to reuse put_partition_parser(), so let's fix up the prefix
naming a bit, to hopefully be more consistent. Also make convert to a
true C function instead of a macro.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: keep mtd_part_parser_put() in the *.c file instead of the header, since
    we'll only use it in a wrapper now instead of exporting it directly

 drivers/mtd/mtdpart.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1fa3ca95d9c1..c6fd4b24c822 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -684,7 +684,7 @@ int add_mtd_partitions(struct mtd_info *master,
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
 
-static struct mtd_part_parser *get_partition_parser(const char *name)
+static struct mtd_part_parser *mtd_part_parser_get(const char *name)
 {
 	struct mtd_part_parser *p, *ret = NULL;
 
@@ -701,7 +701,10 @@ static struct mtd_part_parser *get_partition_parser(const char *name)
 	return ret;
 }
 
-#define put_partition_parser(p) do { module_put((p)->owner); } while (0)
+static inline void mtd_part_parser_put(const struct mtd_part_parser *p)
+{
+	module_put(p->owner);
+}
 
 int __register_mtd_parser(struct mtd_part_parser *p, struct module *owner)
 {
@@ -765,9 +768,9 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 
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
@@ -775,7 +778,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
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
