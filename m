Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwiL0-0001g0-4q
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 03:14:15 +0000
Received: by pasz6 with SMTP id z6so51947953pas.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 19:13:52 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd: kill off MTD partition parser boilerplate
Date: Wed, 11 Nov 2015 19:13:30 -0800
Message-Id: <1447298010-7756-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1447298010-7756-1-git-send-email-computersforpeace@gmail.com>
References: <1447298010-7756-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Most parsers can be handled with our new boilerplate-reducing macro.
There are a few that can't be (cmdlineparts and ofpart).

Also kill off the owner assignments, since register_mtd_parser() now
takes care of that.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/afs.c         | 17 +----------------
 drivers/mtd/ar7part.c     | 16 +---------------
 drivers/mtd/bcm47xxpart.c | 16 +---------------
 drivers/mtd/bcm63xxpart.c | 16 +---------------
 drivers/mtd/cmdlinepart.c |  1 -
 drivers/mtd/ofpart.c      |  2 --
 drivers/mtd/redboot.c     | 17 +----------------
 7 files changed, 5 insertions(+), 80 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index a1eea50ce180..e02dae3b739b 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -256,25 +256,10 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 }
 
 static struct mtd_part_parser afs_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = parse_afs_partitions,
 	.name = "afs",
 };
-
-static int __init afs_parser_init(void)
-{
-	register_mtd_parser(&afs_parser);
-	return 0;
-}
-
-static void __exit afs_parser_exit(void)
-{
-	deregister_mtd_parser(&afs_parser);
-}
-
-module_init(afs_parser_init);
-module_exit(afs_parser_exit);
-
+module_mtd_part_parser(afs_parser);
 
 MODULE_AUTHOR("ARM Ltd");
 MODULE_DESCRIPTION("ARM Firmware Suite partition parser");
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index 7c9172ad2621..9203b96fd789 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -132,24 +132,10 @@ static int create_mtd_partitions(struct mtd_info *master,
 }
 
 static struct mtd_part_parser ar7_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = create_mtd_partitions,
 	.name = "ar7part",
 };
-
-static int __init ar7_parser_init(void)
-{
-	register_mtd_parser(&ar7_parser);
-	return 0;
-}
-
-static void __exit ar7_parser_exit(void)
-{
-	deregister_mtd_parser(&ar7_parser);
-}
-
-module_init(ar7_parser_init);
-module_exit(ar7_parser_exit);
+module_mtd_part_parser(ar7_parser);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR(	"Felix Fietkau <nbd@openwrt.org>, "
diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index c0720c1ee4c9..92a6dd18198b 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -313,24 +313,10 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 };
 
 static struct mtd_part_parser bcm47xxpart_mtd_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = bcm47xxpart_parse,
 	.name = "bcm47xxpart",
 };
-
-static int __init bcm47xxpart_init(void)
-{
-	register_mtd_parser(&bcm47xxpart_mtd_parser);
-	return 0;
-}
-
-static void __exit bcm47xxpart_exit(void)
-{
-	deregister_mtd_parser(&bcm47xxpart_mtd_parser);
-}
-
-module_init(bcm47xxpart_init);
-module_exit(bcm47xxpart_exit);
+module_mtd_part_parser(bcm47xxpart_mtd_parser);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MTD partitioning for BCM47XX flash memories");
diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index b2443f7031c9..cf02135320bc 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -214,24 +214,10 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 };
 
 static struct mtd_part_parser bcm63xx_cfe_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = bcm63xx_parse_cfe_partitions,
 	.name = "bcm63xxpart",
 };
-
-static int __init bcm63xx_cfe_parser_init(void)
-{
-	register_mtd_parser(&bcm63xx_cfe_parser);
-	return 0;
-}
-
-static void __exit bcm63xx_cfe_parser_exit(void)
-{
-	deregister_mtd_parser(&bcm63xx_cfe_parser);
-}
-
-module_init(bcm63xx_cfe_parser_init);
-module_exit(bcm63xx_cfe_parser_exit);
+module_mtd_part_parser(bcm63xx_cfe_parser);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Daniel Dickinson <openwrt@cshore.neomailbox.net>");
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 08f62987cc37..420489864bc2 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -382,7 +382,6 @@ static int __init mtdpart_setup(char *s)
 __setup("mtdparts=", mtdpart_setup);
 
 static struct mtd_part_parser cmdline_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = parse_cmdline_partitions,
 	.name = "cmdlinepart",
 };
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index dacf4c405dec..a4eca73b5f46 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -131,7 +131,6 @@ ofpart_none:
 }
 
 static struct mtd_part_parser ofpart_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = parse_ofpart_partitions,
 	.name = "ofpart",
 };
@@ -191,7 +190,6 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
 }
 
 static struct mtd_part_parser ofoldpart_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = parse_ofoldpart_partitions,
 	.name = "ofoldpart",
 };
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 5da911ebdf49..11c3447eb8ff 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -290,28 +290,13 @@ static int parse_redboot_partitions(struct mtd_info *master,
 }
 
 static struct mtd_part_parser redboot_parser = {
-	.owner = THIS_MODULE,
 	.parse_fn = parse_redboot_partitions,
 	.name = "RedBoot",
 };
+module_mtd_part_parser(redboot_parser);
 
 /* mtd parsers will request the module by parser name */
 MODULE_ALIAS("RedBoot");
-
-static int __init redboot_parser_init(void)
-{
-	register_mtd_parser(&redboot_parser);
-	return 0;
-}
-
-static void __exit redboot_parser_exit(void)
-{
-	deregister_mtd_parser(&redboot_parser);
-}
-
-module_init(redboot_parser_init);
-module_exit(redboot_parser_exit);
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("Parsing code for RedBoot Flash Image System (FIS) tables");
-- 
2.6.0.rc2.230.g3dd15c0
