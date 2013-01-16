Received: from norkia.v3.sk ([91.210.183.14])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvHYu-0003Mv-9x
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2013 01:13:05 +0000
From: Lubomir Rintel <lkundrak@v3.sk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: Allow removal of partitioning modules
Date: Wed, 16 Jan 2013 02:12:50 +0100
Message-Id: <1358298770-20286-2-git-send-email-lkundrak@v3.sk>
In-Reply-To: <1358298770-20286-1-git-send-email-lkundrak@v3.sk>
References: <1358298770-20286-1-git-send-email-lkundrak@v3.sk>
Cc: Lubomir Rintel <lkundrak@v3.sk>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/mtd/ar7part.c     |    6 ++++++
 drivers/mtd/cmdlinepart.c |    6 ++++++
 drivers/mtd/ofpart.c      |    7 +++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index 9453931..a98899f 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -145,7 +145,13 @@ static int __init ar7_parser_init(void)
 	return register_mtd_parser(&ar7_parser);
 }
 
+static void __exit ar7_parser_exit(void)
+{
+	deregister_mtd_parser(&ar7_parser);
+}
+
 module_init(ar7_parser_init);
+module_exit(ar7_parser_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR(	"Felix Fietkau <nbd@openwrt.org>, "
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index a2bb2ea..8689a77 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -382,7 +382,13 @@ static int __init cmdline_parser_init(void)
 	return register_mtd_parser(&cmdline_parser);
 }
 
+static void __exit cmdline_parser_exit(void)
+{
+	deregister_mtd_parser(&cmdline_parser);
+}
+
 module_init(cmdline_parser_init);
+module_exit(cmdline_parser_exit);
 
 MODULE_PARM_DESC(mtdparts, "Partitioning specification");
 module_param(mtdparts, charp, 0);
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index d9127e2..d407e0b 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -171,7 +171,14 @@ out:
 	return rc;
 }
 
+static void __exit ofpart_parser_exit(void)
+{
+	deregister_mtd_parser(&ofpart_parser);
+	deregister_mtd_parser(&ofoldpart_parser);
+}
+
 module_init(ofpart_parser_init);
+module_exit(ofpart_parser_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Parser for MTD partitioning information in device tree");
-- 
1.7.1
