Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwiKz-0001fz-Fd
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 03:14:14 +0000
Received: by pacdm15 with SMTP id dm15so50153996pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 19:13:51 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/2] mtd: partitions: add module_mtd_part_parser() helper
Date: Wed, 11 Nov 2015 19:13:29 -0800
Message-Id: <1447298010-7756-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This can help eliminate some boilerplate by generating the module_init()
and module_exit() functions, and by automatically assigning the module
owner.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdpart.c          |  8 ++++++--
 include/linux/mtd/partitions.h | 14 +++++++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3ace53342fd2..aaa08428cf93 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -704,13 +704,17 @@ static struct mtd_part_parser *get_partition_parser(const char *name)
 
 #define put_partition_parser(p) do { module_put((p)->owner); } while (0)
 
-void register_mtd_parser(struct mtd_part_parser *p)
+int __register_mtd_parser(struct mtd_part_parser *p, struct module *owner)
 {
+	p->owner = owner;
+
 	spin_lock(&part_parser_lock);
 	list_add(&p->list, &part_parsers);
 	spin_unlock(&part_parser_lock);
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(register_mtd_parser);
+EXPORT_SYMBOL_GPL(__register_mtd_parser);
 
 void deregister_mtd_parser(struct mtd_part_parser *p)
 {
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 34388ced421a..75def3067d71 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -74,9 +74,21 @@ struct mtd_part_parser {
 			struct mtd_part_parser_data *);
 };
 
-extern void register_mtd_parser(struct mtd_part_parser *parser);
+extern int __register_mtd_parser(struct mtd_part_parser *parser,
+				 struct module *owner);
+#define register_mtd_parser(parser) __register_mtd_parser(parser, THIS_MODULE)
+
 extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 
+/*
+ * module_mtd_part_parser() - Helper macro for MTD partition parsers that don't
+ * do anything special in module init/exit. Each driver may only use this macro
+ * once, and calling it replaces module_init() and module_exit().
+ */
+#define module_mtd_part_parser(__mtd_part_parser) \
+	module_driver(__mtd_part_parser, register_mtd_parser, \
+		      deregister_mtd_parser)
+
 int mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length);
-- 
2.6.0.rc2.230.g3dd15c0
