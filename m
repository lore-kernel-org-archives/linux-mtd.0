Received: from mail-pd0-f172.google.com ([209.85.192.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vn4mM-0002dL-9H
 for linux-mtd@lists.infradead.org; Sun, 01 Dec 2013 11:01:35 +0000
Received: by mail-pd0-f172.google.com with SMTP id g10so16242820pdj.17
 for <linux-mtd@lists.infradead.org>; Sun, 01 Dec 2013 03:01:11 -0800 (PST)
Message-ID: <1385895666.3994.6.camel@phoenix>
Subject: [PATCH 2/2] mtd: Make register_mtd_parser return void
From: Axel Lin <axel.lin@ingics.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 01 Dec 2013 19:01:06 +0800
In-Reply-To: <1385895555.3994.4.camel@phoenix>
References: <1385895555.3994.4.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

register_mtd_parser never fails, hence make it return void.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/mtd/afs.c              |  3 ++-
 drivers/mtd/ar7part.c          |  3 ++-
 drivers/mtd/bcm47xxpart.c      |  3 ++-
 drivers/mtd/bcm63xxpart.c      |  3 ++-
 drivers/mtd/cmdlinepart.c      |  3 ++-
 drivers/mtd/mtdpart.c          |  4 +---
 drivers/mtd/ofpart.c           | 15 +++------------
 drivers/mtd/redboot.c          |  3 ++-
 include/linux/mtd/partitions.h |  2 +-
 9 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index 5a3942b..96a33e3 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -264,7 +264,8 @@ static struct mtd_part_parser afs_parser = {
 
 static int __init afs_parser_init(void)
 {
-	return register_mtd_parser(&afs_parser);
+	register_mtd_parser(&afs_parser);
+	return 0;
 }
 
 static void __exit afs_parser_exit(void)
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index ddc0a42..7c9172a 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -139,7 +139,8 @@ static struct mtd_part_parser ar7_parser = {
 
 static int __init ar7_parser_init(void)
 {
-	return register_mtd_parser(&ar7_parser);
+	register_mtd_parser(&ar7_parser);
+	return 0;
 }
 
 static void __exit ar7_parser_exit(void)
diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 7a6384b..931746d 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -243,7 +243,8 @@ static struct mtd_part_parser bcm47xxpart_mtd_parser = {
 
 static int __init bcm47xxpart_init(void)
 {
-	return register_mtd_parser(&bcm47xxpart_mtd_parser);
+	register_mtd_parser(&bcm47xxpart_mtd_parser);
+	return 0;
 }
 
 static void __exit bcm47xxpart_exit(void)
diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 5c81390..b2443f7 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -221,7 +221,8 @@ static struct mtd_part_parser bcm63xx_cfe_parser = {
 
 static int __init bcm63xx_cfe_parser_init(void)
 {
-	return register_mtd_parser(&bcm63xx_cfe_parser);
+	register_mtd_parser(&bcm63xx_cfe_parser);
+	return 0;
 }
 
 static void __exit bcm63xx_cfe_parser_exit(void)
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 721caeb..3e829b3 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -395,7 +395,8 @@ static int __init cmdline_parser_init(void)
 {
 	if (mtdparts)
 		mtdpart_setup(mtdparts);
-	return register_mtd_parser(&cmdline_parser);
+	register_mtd_parser(&cmdline_parser);
+	return 0;
 }
 
 static void __exit cmdline_parser_exit(void)
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 29ee91e..3c7d6d7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -672,13 +672,11 @@ static struct mtd_part_parser *get_partition_parser(const char *name)
 
 #define put_partition_parser(p) do { module_put((p)->owner); } while (0)
 
-int register_mtd_parser(struct mtd_part_parser *p)
+void register_mtd_parser(struct mtd_part_parser *p)
 {
 	spin_lock(&part_parser_lock);
 	list_add(&p->list, &part_parsers);
 	spin_unlock(&part_parser_lock);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(register_mtd_parser);
 
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index f0a708b..aa26c32 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -173,18 +173,9 @@ static struct mtd_part_parser ofoldpart_parser = {
 
 static int __init ofpart_parser_init(void)
 {
-	int rc;
-	rc = register_mtd_parser(&ofpart_parser);
-	if (rc)
-		goto out;
-
-	rc = register_mtd_parser(&ofoldpart_parser);
-	if (!rc)
-		return 0;
-
-	deregister_mtd_parser(&ofoldpart_parser);
-out:
-	return rc;
+	register_mtd_parser(&ofpart_parser);
+	register_mtd_parser(&ofoldpart_parser);
+	return 0;
 }
 
 static void __exit ofpart_parser_exit(void)
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 580035c..5da911e 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -300,7 +300,8 @@ MODULE_ALIAS("RedBoot");
 
 static int __init redboot_parser_init(void)
 {
-	return register_mtd_parser(&redboot_parser);
+	register_mtd_parser(&redboot_parser);
+	return 0;
 }
 
 static void __exit redboot_parser_exit(void)
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index d513ffb..6a35e6d 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -76,7 +76,7 @@ struct mtd_part_parser {
 			struct mtd_part_parser_data *);
 };
 
-extern int register_mtd_parser(struct mtd_part_parser *parser);
+extern void register_mtd_parser(struct mtd_part_parser *parser);
 extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 
 int mtd_is_partition(const struct mtd_info *mtd);
-- 
1.8.1.2
