Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYS2-0004Cw-RZ
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:34 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 10/12] mtd: nand_ids: introduce helper macros
Date: Mon,  4 Mar 2013 18:42:27 +0200
Message-Id: <1362415349-7107-11-git-send-email-dedekind1@gmail.com>
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

Introduce helper macros for defining NAND chips. These macros do not really add
much value in the current code-base. However, we are going to add full ID
support which adds some more complexity to the table, and helper macros become
useful for readability.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/nand_ids.c  |  159 +++++++++++++++++++++---------------------
 drivers/mtd/nand/sm_common.c |   64 ++++++++---------
 include/linux/mtd/nand.h     |   17 +++++
 3 files changed, 127 insertions(+), 113 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 7c5dec18..f04942c 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -15,37 +15,34 @@
 #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
 /*
- * The chip ID list:
- *    name, device ID, page size, chip size in MiB, eraseblock size, options
- *
- * If page size and eraseblock size is 0, the sizes are taken from the extended
- * chip ID.
+ * The list of supported chips.  If page size and eraseblock size is 0, the
+ * sizes are taken from the extended chip ID.
  */
 struct nand_flash_dev nand_flash_ids[] = {
-	{"NAND 16MiB 1,8V 8-bit",	0x33, 512, 16, 0x4000, 0},
-	{"NAND 16MiB 3,3V 8-bit",	0x73, 512, 16, 0x4000, 0},
-	{"NAND 16MiB 1,8V 16-bit",	0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 16MiB 3,3V 16-bit",	0x53, 512, 16, 0x4000, NAND_BUSWIDTH_16},
-
-	{"NAND 32MiB 1,8V 8-bit",	0x35, 512, 32, 0x4000, 0},
-	{"NAND 32MiB 3,3V 8-bit",	0x75, 512, 32, 0x4000, 0},
-	{"NAND 32MiB 1,8V 16-bit",	0x45, 512, 32, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 32MiB 3,3V 16-bit",	0x55, 512, 32, 0x4000, NAND_BUSWIDTH_16},
-
-	{"NAND 64MiB 1,8V 8-bit",	0x36, 512, 64, 0x4000, 0},
-	{"NAND 64MiB 3,3V 8-bit",	0x76, 512, 64, 0x4000, 0},
-	{"NAND 64MiB 1,8V 16-bit",	0x46, 512, 64, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 64MiB 3,3V 16-bit",	0x56, 512, 64, 0x4000, NAND_BUSWIDTH_16},
-
-	{"NAND 128MiB 1,8V 8-bit",	0x78, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 1,8V 8-bit",	0x39, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 3,3V 8-bit",	0x79, 512, 128, 0x4000, 0},
-	{"NAND 128MiB 1,8V 16-bit",	0x72, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 1,8V 16-bit",	0x49, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 3,3V 16-bit",	0x74, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-	{"NAND 128MiB 3,3V 16-bit",	0x59, 512, 128, 0x4000, NAND_BUSWIDTH_16},
-
-	{"NAND 256MiB 3,3V 8-bit",	0x71, 512, 256, 0x4000, 0},
+	TABLE_NAND("NAND 16MiB 1,8V 8-bit",  0x33, 512, 16, 0x4000, 0),
+	TABLE_NAND("NAND 16MiB 3,3V 8-bit",  0x73, 512, 16, 0x4000, 0),
+	TABLE_NAND("NAND 16MiB 1,8V 16-bit", 0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16),
+	TABLE_NAND("NAND 16MiB 3,3V 16-bit", 0x53, 512, 16, 0x4000, NAND_BUSWIDTH_16),
+
+	TABLE_NAND("NAND 32MiB 1,8V 8-bit",  0x35, 512, 32, 0x4000, 0),
+	TABLE_NAND("NAND 32MiB 3,3V 8-bit",  0x75, 512, 32, 0x4000, 0),
+	TABLE_NAND("NAND 32MiB 1,8V 16-bit", 0x45, 512, 32, 0x4000, NAND_BUSWIDTH_16),
+	TABLE_NAND("NAND 32MiB 3,3V 16-bit", 0x55, 512, 32, 0x4000, NAND_BUSWIDTH_16),
+
+	TABLE_NAND("NAND 64MiB 1,8V 8-bit",  0x36, 512, 64, 0x4000, 0),
+	TABLE_NAND("NAND 64MiB 3,3V 8-bit",  0x76, 512, 64, 0x4000, 0),
+	TABLE_NAND("NAND 64MiB 1,8V 16-bit", 0x46, 512, 64, 0x4000, NAND_BUSWIDTH_16),
+	TABLE_NAND("NAND 64MiB 3,3V 16-bit", 0x56, 512, 64, 0x4000, NAND_BUSWIDTH_16),
+
+	TABLE_NAND("NAND 128MiB 1,8V 8-bit",  0x78, 512, 128, 0x4000, 0),
+	TABLE_NAND("NAND 128MiB 1,8V 8-bit",  0x39, 512, 128, 0x4000, 0),
+	TABLE_NAND("NAND 128MiB 3,3V 8-bit",  0x79, 512, 128, 0x4000, 0),
+	TABLE_NAND("NAND 128MiB 1,8V 16-bit", 0x72, 512, 128, 0x4000, NAND_BUSWIDTH_16),
+	TABLE_NAND("NAND 128MiB 1,8V 16-bit", 0x49, 512, 128, 0x4000, NAND_BUSWIDTH_16),
+	TABLE_NAND("NAND 128MiB 3,3V 16-bit", 0x74, 512, 128, 0x4000, NAND_BUSWIDTH_16),
+	TABLE_NAND("NAND 128MiB 3,3V 16-bit", 0x59, 512, 128, 0x4000, NAND_BUSWIDTH_16),
+
+	TABLE_NAND("NAND 256MiB 3,3V 8-bit",  0x71, 512, 256, 0x4000, 0),
 
 	/*
 	 * These are the new chips with large page size, page size and
@@ -53,79 +50,79 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 */
 
 	/* 512 Megabit */
-	{"NAND 64MiB 1,8V 8-bit",	0xA2, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 1,8V 8-bit",	0xA0, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 3,3V 8-bit",	0xF2, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 3,3V 8-bit",	0xD0, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 3,3V 8-bit",	0xF0, 0,  64, 0, LP_OPTIONS},
-	{"NAND 64MiB 1,8V 16-bit",	0xB2, 0,  64, 0, LP_OPTIONS16},
-	{"NAND 64MiB 1,8V 16-bit",	0xB0, 0,  64, 0, LP_OPTIONS16},
-	{"NAND 64MiB 3,3V 16-bit",	0xC2, 0,  64, 0, LP_OPTIONS16},
-	{"NAND 64MiB 3,3V 16-bit",	0xC0, 0,  64, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 64MiB 1,8V 8-bit",  0xA2,  64, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 64MiB 1,8V 8-bit",  0xA0,  64, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 64MiB 3,3V 8-bit",  0xF2,  64, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 64MiB 3,3V 8-bit",  0xD0,  64, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 64MiB 3,3V 8-bit",  0xF0,  64, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 64MiB 1,8V 16-bit", 0xB2,  64, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 64MiB 1,8V 16-bit", 0xB0,  64, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 64MiB 3,3V 16-bit", 0xC2,  64, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 64MiB 3,3V 16-bit", 0xC0,  64, LP_OPTIONS16),
 
 	/* 1 Gigabit */
-	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 3,3V 8-bit",	0xF1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 3,3V 8-bit",	0xD1, 0, 128, 0, LP_OPTIONS},
-	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
-	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
-	{"NAND 128MiB 1,8V 16-bit",     0xAD, 0, 128, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 128MiB 1,8V 8-bit",  0xA1, 128, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 128MiB 3,3V 8-bit",  0xF1, 128, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 128MiB 3,3V 8-bit",  0xD1, 128, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 128MiB 1,8V 16-bit", 0xB1, 128, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 128MiB 3,3V 16-bit", 0xC1, 128, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 128MiB 1,8V 16-bit", 0xAD, 128, LP_OPTIONS16),
 
 	/* 2 Gigabit */
-	{"NAND 256MiB 1,8V 8-bit",	0xAA, 0, 256, 0, LP_OPTIONS},
-	{"NAND 256MiB 3,3V 8-bit",	0xDA, 0, 256, 0, LP_OPTIONS},
-	{"NAND 256MiB 1,8V 16-bit",	0xBA, 0, 256, 0, LP_OPTIONS16},
-	{"NAND 256MiB 3,3V 16-bit",	0xCA, 0, 256, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 256MiB 1,8V 8-bit",  0xAA, 256, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 256MiB 3,3V 8-bit",  0xDA, 256, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 256MiB 1,8V 16-bit", 0xBA, 256, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 256MiB 3,3V 16-bit", 0xCA, 256, LP_OPTIONS16),
 
 	/* 4 Gigabit */
-	{"NAND 512MiB 1,8V 8-bit",	0xAC, 0, 512, 0, LP_OPTIONS},
-	{"NAND 512MiB 3,3V 8-bit",	0xDC, 0, 512, 0, LP_OPTIONS},
-	{"NAND 512MiB 1,8V 16-bit",	0xBC, 0, 512, 0, LP_OPTIONS16},
-	{"NAND 512MiB 3,3V 16-bit",	0xCC, 0, 512, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 512MiB 1,8V 8-bit",  0xAC, 512, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 512MiB 3,3V 8-bit",  0xDC, 512, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 512MiB 1,8V 16-bit", 0xBC, 512, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 512MiB 3,3V 16-bit", 0xCC, 512, LP_OPTIONS16),
 
 	/* 8 Gigabit */
-	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
-	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
-	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
-	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 1GiB 1,8V 8-bit",  0xA3, 1024, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 1GiB 3,3V 8-bit",  0xD3, 1024, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 1GiB 1,8V 16-bit", 0xB3, 1024, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 1GiB 3,3V 16-bit", 0xC3, 1024, LP_OPTIONS16),
 
 	/* 16 Gigabit */
-	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
-	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
-	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
-	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 2GiB 1,8V 8-bit",  0xA5, 2048, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 2GiB 3,3V 8-bit",  0xD5, 2048, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 2GiB 1,8V 16-bit", 0xB5, 2048, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 2GiB 3,3V 16-bit", 0xC5, 2048, LP_OPTIONS16),
 
 	/* 32 Gigabit */
-	{"NAND 4GiB 1,8V 8-bit",	0xA7, 0, 4096, 0, LP_OPTIONS},
-	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS},
-	{"NAND 4GiB 1,8V 16-bit",	0xB7, 0, 4096, 0, LP_OPTIONS16},
-	{"NAND 4GiB 3,3V 16-bit",	0xC7, 0, 4096, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 4GiB 1,8V 8-bit",  0xA7, 4096, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 4GiB 3,3V 8-bit",  0xD7, 4096, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 4GiB 1,8V 16-bit", 0xB7, 4096, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 4GiB 3,3V 16-bit", 0xC7, 4096, LP_OPTIONS16),
 
 	/* 64 Gigabit */
-	{"NAND 8GiB 1,8V 8-bit",	0xAE, 0, 8192, 0, LP_OPTIONS},
-	{"NAND 8GiB 3,3V 8-bit",	0xDE, 0, 8192, 0, LP_OPTIONS},
-	{"NAND 8GiB 1,8V 16-bit",	0xBE, 0, 8192, 0, LP_OPTIONS16},
-	{"NAND 8GiB 3,3V 16-bit",	0xCE, 0, 8192, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 8GiB 1,8V 8-bit",  0xAE, 8192, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 8GiB 3,3V 8-bit",  0xDE, 8192, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 8GiB 1,8V 16-bit", 0xBE, 8192, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 8GiB 3,3V 16-bit", 0xCE, 8192, LP_OPTIONS16),
 
 	/* 128 Gigabit */
-	{"NAND 16GiB 1,8V 8-bit",	0x1A, 0, 16384, 0, LP_OPTIONS},
-	{"NAND 16GiB 3,3V 8-bit",	0x3A, 0, 16384, 0, LP_OPTIONS},
-	{"NAND 16GiB 1,8V 16-bit",	0x2A, 0, 16384, 0, LP_OPTIONS16},
-	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 16GiB 1,8V 8-bit",  0x1A, 16384, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 16GiB 3,3V 8-bit",  0x3A, 16384, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 16GiB 1,8V 16-bit", 0x2A, 16384, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 16GiB 3,3V 16-bit", 0x4A, 16384, LP_OPTIONS16),
 
 	/* 256 Gigabit */
-	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
-	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
-	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},
-	{"NAND 32GiB 3,3V 16-bit",	0x4C, 0, 32768, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 32GiB 1,8V 8-bit",  0x1C, 32768, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 32GiB 3,3V 8-bit",  0x3C, 32768, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 32GiB 1,8V 16-bit", 0x2C, 32768, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 32GiB 3,3V 16-bit", 0x4C, 32768, LP_OPTIONS16),
 
 	/* 512 Gigabit */
-	{"NAND 64GiB 1,8V 8-bit",	0x1E, 0, 65536, 0, LP_OPTIONS},
-	{"NAND 64GiB 3,3V 8-bit",	0x3E, 0, 65536, 0, LP_OPTIONS},
-	{"NAND 64GiB 1,8V 16-bit",	0x2E, 0, 65536, 0, LP_OPTIONS16},
-	{"NAND 64GiB 3,3V 16-bit",	0x4E, 0, 65536, 0, LP_OPTIONS16},
+	EXTENDED_ID_NAND("NAND 64GiB 1,8V 8-bit",  0x1E, 65536, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 64GiB 3,3V 8-bit",  0x3E, 65536, LP_OPTIONS),
+	EXTENDED_ID_NAND("NAND 64GiB 1,8V 16-bit", 0x2E, 65536, LP_OPTIONS16),
+	EXTENDED_ID_NAND("NAND 64GiB 3,3V 16-bit", 0x4E, 65536, LP_OPTIONS16),
 
-	{NULL,}
+	{NULL}
 };
 
 /*
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index 082bcdc..85fb95a 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -69,42 +69,42 @@ static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 
 static struct nand_flash_dev nand_smartmedia_flash_ids[] = {
-	{"SmartMedia 1MiB 5V",          0x6e, 256, 1, 0x1000, 0},
-	{"SmartMedia 1MiB 3,3V",        0xe8, 256, 1, 0x1000, 0},
-	{"SmartMedia 1MiB 3,3V",        0xec, 256, 1, 0x1000, 0},
-	{"SmartMedia 2MiB 3,3V",        0xea, 256, 2, 0x1000, 0},
-	{"SmartMedia 2MiB 5V",          0x64, 256, 2, 0x1000, 0},
-	{"SmartMedia 2MiB 3,3V ROM",    0x5d, 512, 2, 0x2000, NAND_ROM},
-	{"SmartMedia 4MiB 3,3V",        0xe3, 512, 4, 0x2000, 0},
-	{"SmartMedia 4MiB 3,3/5V",      0xe5, 512, 4, 0x2000, 0},
-	{"SmartMedia 4MiB 5V",          0x6b, 512, 4, 0x2000, 0},
-	{"SmartMedia 4MiB 3,3V ROM",    0xd5, 512, 4, 0x2000, NAND_ROM},
-	{"SmartMedia 8MiB 3,3V",        0xe6, 512, 8, 0x2000, 0},
-	{"SmartMedia 8MiB 3,3V ROM",    0xd6, 512, 8, 0x2000, NAND_ROM},
-	{"SmartMedia 16MiB 3,3V",       0x73, 512, 16, 0x4000, 0},
-	{"SmartMedia 16MiB 3,3V ROM",   0x57, 512, 16, 0x4000, NAND_ROM},
-	{"SmartMedia 32MiB 3,3V",       0x75, 512, 32, 0x4000, 0},
-	{"SmartMedia 32MiB 3,3V ROM",   0x58, 512, 32, 0x4000, NAND_ROM},
-	{"SmartMedia 64MiB 3,3V",       0x76, 512, 64, 0x4000, 0},
-	{"SmartMedia 64MiB 3,3V ROM",   0xd9, 512, 64, 0x4000, NAND_ROM},
-	{"SmartMedia 128MiB 3,3V",      0x79, 512, 128, 0x4000, 0},
-	{"SmartMedia 128MiB 3,3V ROM",  0xda, 512, 128, 0x4000, NAND_ROM},
-	{"SmartMedia 256MiB 3,3V",      0x71, 512, 256, 0x4000 },
-	{"SmartMedia 256MiB 3,3V ROM",  0x5b, 512, 256, 0x4000, NAND_ROM},
-	{NULL,}
+	TABLE_NAND("SmartMedia 1MiB 5V",         0x6e, 256, 1, 0x1000, 0),
+	TABLE_NAND("SmartMedia 1MiB 3,3V",       0xe8, 256, 1, 0x1000, 0),
+	TABLE_NAND("SmartMedia 1MiB 3,3V",       0xec, 256, 1, 0x1000, 0),
+	TABLE_NAND("SmartMedia 2MiB 3,3V",       0xea, 256, 2, 0x1000, 0),
+	TABLE_NAND("SmartMedia 2MiB 5V",         0x64, 256, 2, 0x1000, 0),
+	TABLE_NAND("SmartMedia 2MiB 3,3V ROM",   0x5d, 512, 2, 0x2000, NAND_ROM),
+	TABLE_NAND("SmartMedia 4MiB 3,3V",       0xe3, 512, 4, 0x2000, 0),
+	TABLE_NAND("SmartMedia 4MiB 3,3/5V",     0xe5, 512, 4, 0x2000, 0),
+	TABLE_NAND("SmartMedia 4MiB 5V",         0x6b, 512, 4, 0x2000, 0),
+	TABLE_NAND("SmartMedia 4MiB 3,3V ROM",   0xd5, 512, 4, 0x2000, NAND_ROM),
+	TABLE_NAND("SmartMedia 8MiB 3,3V",       0xe6, 512, 8, 0x2000, 0),
+	TABLE_NAND("SmartMedia 8MiB 3,3V ROM",   0xd6, 512, 8, 0x2000, NAND_ROM),
+	TABLE_NAND("SmartMedia 16MiB 3,3V",      0x73, 512, 16, 0x4000, 0),
+	TABLE_NAND("SmartMedia 16MiB 3,3V ROM",  0x57, 512, 16, 0x4000, NAND_ROM),
+	TABLE_NAND("SmartMedia 32MiB 3,3V",      0x75, 512, 32, 0x4000, 0),
+	TABLE_NAND("SmartMedia 32MiB 3,3V ROM",  0x58, 512, 32, 0x4000, NAND_ROM),
+	TABLE_NAND("SmartMedia 64MiB 3,3V",      0x76, 512, 64, 0x4000, 0),
+	TABLE_NAND("SmartMedia 64MiB 3,3V ROM",  0xd9, 512, 64, 0x4000, NAND_ROM),
+	TABLE_NAND("SmartMedia 128MiB 3,3V",     0x79, 512, 128, 0x4000, 0),
+	TABLE_NAND("SmartMedia 128MiB 3,3V ROM", 0xda, 512, 128, 0x4000, NAND_ROM),
+	TABLE_NAND("SmartMedia 256MiB 3, 3V",    0x71, 512, 256, 0x4000, 0),
+	TABLE_NAND("SmartMedia 256MiB 3,3V ROM", 0x5b, 512, 256, 0x4000, NAND_ROM),
+	{NULL}
 };
 
 static struct nand_flash_dev nand_xd_flash_ids[] = {
 
-	{"xD 16MiB 3,3V",    0x73, 512, 16, 0x4000, 0},
-	{"xD 32MiB 3,3V",    0x75, 512, 32, 0x4000, 0},
-	{"xD 64MiB 3,3V",    0x76, 512, 64, 0x4000, 0},
-	{"xD 128MiB 3,3V",   0x79, 512, 128, 0x4000, 0},
-	{"xD 256MiB 3,3V",   0x71, 512, 256, 0x4000, NAND_BROKEN_XD},
-	{"xD 512MiB 3,3V",   0xdc, 512, 512, 0x4000, NAND_BROKEN_XD},
-	{"xD 1GiB 3,3V",     0xd3, 512, 1024, 0x4000, NAND_BROKEN_XD},
-	{"xD 2GiB 3,3V",     0xd5, 512, 2048, 0x4000, NAND_BROKEN_XD},
-	{NULL,}
+	TABLE_NAND("xD 16MiB 3,3V",  0x73, 512, 16, 0x4000, 0),
+	TABLE_NAND("xD 32MiB 3,3V",  0x75, 512, 32, 0x4000, 0),
+	TABLE_NAND("xD 64MiB 3,3V",  0x76, 512, 64, 0x4000, 0),
+	TABLE_NAND("xD 128MiB 3,3V", 0x79, 512, 128, 0x4000, 0),
+	TABLE_NAND("xD 256MiB 3,3V", 0x71, 512, 256, 0x4000, NAND_BROKEN_XD),
+	TABLE_NAND("xD 512MiB 3,3V", 0xdc, 512, 512, 0x4000, NAND_BROKEN_XD),
+	TABLE_NAND("xD 1GiB 3,3V",   0xd3, 512, 1024, 0x4000, NAND_BROKEN_XD),
+	TABLE_NAND("xD 2GiB 3,3V",   0xd5, 512, 2048, 0x4000, NAND_BROKEN_XD),
+	{NULL}
 };
 
 int sm_register_device(struct mtd_info *mtd, int smartmedia)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 59dee20..f7f198e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -539,6 +539,23 @@ struct nand_chip {
 #define NAND_MFR_MACRONIX	0xc2
 #define NAND_MFR_EON		0x92
 
+/*
+ * A helper for defining older chips which did not have page size and
+ * eraseblock size encoded in the chip ID bytes.
+ */
+#define TABLE_NAND(nm, devid, pagesz, chipsz, erasesz, opts) \
+	{ .name = (nm), .id = (devid), .pagesize = (pagesz), \
+	  .chipsize = (chipsz), .erasesize = (erasesz),      \
+	  .options = (opts) }
+
+/*
+ * A helper for defining newer chips which report their page size and
+ * eraseblock size via the extended ID bytes.
+ */
+#define EXTENDED_ID_NAND(nm, devid, chipsz, opts)            \
+	{ .name = (nm), .id = (devid), .chipsize = (chipsz), \
+	  .options = (opts) }
+
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
  * @name:	Identify the device type
-- 
1.7.10.4
