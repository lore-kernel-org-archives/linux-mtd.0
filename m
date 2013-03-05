Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCriv-0006vV-7M
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:16:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/11] mtd: nand_ids: minor clean-ups
Date: Tue,  5 Mar 2013 15:17:14 +0200
Message-Id: <1362489444-27762-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Clean-up the code a little bit:
  * clean-up commentaries.
  * move macro definitions to the top of the file.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/nand_ids.c |   30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index e3aa274..f1a799c 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -10,17 +10,17 @@
  */
 #include <linux/module.h>
 #include <linux/mtd/nand.h>
+
+#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
+#define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
+
 /*
-*	Chip ID list
-*
-*	Name. ID code, pagesize, chipsize in MegaByte, eraseblock size,
-*	options
-*
-*	Pagesize; 0, 256, 512
-*	0	get this information from the extended chip ID
-+	256	256 Byte page size
-*	512	512 Byte page size
-*/
+ * The chip ID list:
+ *    name, device ID, page size, chip size in MiB, eraseblock size, options
+ *
+ * If page size and eraseblock size are 0, the sizes are taken from the
+ * extended chip ID.
+ */
 struct nand_flash_dev nand_flash_ids[] = {
 
 #ifdef CONFIG_MTD_NAND_MUSEUM_IDS
@@ -67,11 +67,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 256MiB 3,3V 8-bit",	0x71, 512, 256, 0x4000, 0},
 
 	/*
-	 * These are the new chips with large page size. The pagesize and the
-	 * erasesize is determined from the extended id bytes
+	 * These are the new chips with large page size. Their page size and
+	 * eraseblock size are determined from the extended ID bytes.
 	 */
-#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
-#define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
 	/* 512 Megabit */
 	{"NAND 64MiB 1,8V 8-bit",	0xA2, 0,  64, 0, LP_OPTIONS},
@@ -162,9 +160,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{NULL,}
 };
 
-/*
-*	Manufacturer ID list
-*/
+/* Manufacturer IDs */
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba"},
 	{NAND_MFR_SAMSUNG, "Samsung"},
-- 
1.7.10.4
