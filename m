Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYRi-0004Cw-RR
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:11 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 02/12] mtd: remove museum NAND ID's support
Date: Mon,  4 Mar 2013 18:42:19 +0200
Message-Id: <1362415349-7107-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

It is probably OK to remove support for really old NAND chips of 8MiB or
smaller size. We had a separate configuration option for them:
CONFIG_MTD_NAND_MUSEUM_IDS, which we remove along with this patch.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/Kconfig    |    8 --------
 drivers/mtd/nand/nand_ids.c |   19 -------------------
 2 files changed, 27 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 81bf5e5..0f443ef 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -41,14 +41,6 @@ config MTD_SM_COMMON
 	tristate
 	default n
 
-config MTD_NAND_MUSEUM_IDS
-	bool "Enable chip ids for obsolete ancient NAND devices"
-	default n
-	help
-	  Enable this option only when your board has first generation
-	  NAND chips (page size 256 byte, erase size 4-8KiB). The IDs
-	  of these chips were reused by later, larger chips.
-
 config MTD_NAND_DENALI
         tristate "Support Denali NAND controller"
         help
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index b110742..35070a2 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -22,25 +22,6 @@
  * chip ID.
  */
 struct nand_flash_dev nand_flash_ids[] = {
-
-#ifdef CONFIG_MTD_NAND_MUSEUM_IDS
-	{"NAND 1MiB 5V 8-bit",		0x6e, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 5V 8-bit",		0x64, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 5V 8-bit",		0x6b, 512, 4, 0x2000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xe8, 256, 1, 0x1000, 0},
-	{"NAND 1MiB 3,3V 8-bit",	0xec, 256, 1, 0x1000, 0},
-	{"NAND 2MiB 3,3V 8-bit",	0xea, 256, 2, 0x1000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xd5, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe3, 512, 4, 0x2000, 0},
-	{"NAND 4MiB 3,3V 8-bit",	0xe5, 512, 4, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xd6, 512, 8, 0x2000, 0},
-
-	{"NAND 8MiB 1,8V 8-bit",	0x39, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 3,3V 8-bit",	0xe6, 512, 8, 0x2000, 0},
-	{"NAND 8MiB 1,8V 16-bit",	0x49, 512, 8, 0x2000, NAND_BUSWIDTH_16},
-	{"NAND 8MiB 3,3V 16-bit",	0x59, 512, 8, 0x2000, NAND_BUSWIDTH_16},
-#endif
-
 	{"NAND 16MiB 1,8V 8-bit",	0x33, 512, 16, 0x4000, 0},
 	{"NAND 16MiB 3,3V 8-bit",	0x73, 512, 16, 0x4000, 0},
 	{"NAND 16MiB 1,8V 16-bit",	0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16},
-- 
1.7.10.4
