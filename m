Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmXOL-0005yE-EL
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 19:36:45 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: Support new Toshiba SLC
Date: Fri, 20 Aug 2010 12:36:12 -0700
Message-ID: <1282332973-12077-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Toshiba does not use ONFI for their NAND flash. So we have to continue
to add new IDs used by Toshiba devices as well as heuristic detection
for scanning the 2nd page for a BBM. This is a relatively harmless
start at supporting many of them.

These chips mostly follow the same ID fields of previous generations,
but there is a need for a few tweaks:

* These chips introduce a strange 576 byte OOB (that's 36 bytes per
  512 bytes of page). In the preliminary data, Toshiba has not
  defined exactly how their ID strings should decode. In the future,
  a new tweak must be added.
* NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE should be increased soon.

Data is taken from, among others, Toshiba TC58TxG4S2FBAxx

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |    5 +++--
 drivers/mtd/nand/nand_ids.c  |   31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..ee5abab 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2962,8 +2962,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	 * Bad block marker is stored in the last page of each block
 	 * on Samsung and Hynix MLC devices; stored in first two pages
 	 * of each block on Micron devices with 2KiB pages and on
-	 * SLC Samsung, Hynix, and AMD/Spansion. All others scan only
-	 * the first page.
+	 * SLC Samsung, Hynix, Toshiba and AMD/Spansion. All others scan
+	 * only the first page.
 	 */
 	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			(*maf_id == NAND_MFR_SAMSUNG ||
@@ -2972,6 +2972,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 				(*maf_id == NAND_MFR_SAMSUNG ||
 				 *maf_id == NAND_MFR_HYNIX ||
+				 *maf_id == NAND_MFR_TOSHIBA ||
 				 *maf_id == NAND_MFR_AMD)) ||
 			(mtd->writesize == 2048 &&
 			 *maf_id == NAND_MFR_MICRON))
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index c65f190..00cf1b0 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -75,9 +75,13 @@ struct nand_flash_dev nand_flash_ids[] = {
 
 	/*512 Megabit */
 	{"NAND 64MiB 1,8V 8-bit",	0xA2, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 1,8V 8-bit",	0xA0, 0,  64, 0, LP_OPTIONS},
 	{"NAND 64MiB 3,3V 8-bit",	0xF2, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 3,3V 8-bit",	0xD0, 0,  64, 0, LP_OPTIONS},
 	{"NAND 64MiB 1,8V 16-bit",	0xB2, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 1,8V 16-bit",	0xB0, 0,  64, 0, LP_OPTIONS16},
 	{"NAND 64MiB 3,3V 16-bit",	0xC2, 0,  64, 0, LP_OPTIONS16},
+	{"NAND 64MiB 3,3V 16-bit",	0xC0, 0,  64, 0, LP_OPTIONS16},
 
 	/* 1 Gigabit */
 	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS},
@@ -112,7 +116,34 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
 
 	/* 32 Gigabit */
+	{"NAND 4GiB 1,8V 8-bit",	0xA7, 0, 4096, 0, LP_OPTIONS},
 	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS},
+	{"NAND 4GiB 1,8V 16-bit",	0xB7, 0, 4096, 0, LP_OPTIONS16},
+	{"NAND 4GiB 3,3V 16-bit",	0xC7, 0, 4096, 0, LP_OPTIONS16},
+
+	/* 64 Gigabit */
+	{"NAND 8GiB 1,8V 8-bit",	0xAE, 0, 8192, 0, LP_OPTIONS},
+	{"NAND 8GiB 3,3V 8-bit",	0xDE, 0, 8192, 0, LP_OPTIONS},
+	{"NAND 8GiB 1,8V 16-bit",	0xBE, 0, 8192, 0, LP_OPTIONS16},
+	{"NAND 8GiB 3,3V 16-bit",	0xCE, 0, 8192, 0, LP_OPTIONS16},
+
+	/* 128 Gigabit */
+	{"NAND 16GiB 1,8V 8-bit",	0x1A, 0, 16384, 0, LP_OPTIONS},
+	{"NAND 16GiB 3,3V 8-bit",	0x3A, 0, 16384, 0, LP_OPTIONS},
+	{"NAND 16GiB 1,8V 16-bit",	0x2A, 0, 16384, 0, LP_OPTIONS16},
+	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
+
+	/* 256 Gigabit */
+	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
+	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
+	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},
+	{"NAND 32GiB 3,3V 16-bit",	0x4C, 0, 32768, 0, LP_OPTIONS16},
+
+	/* 512 Gigabit */
+	{"NAND 64GiB 1,8V 8-bit",	0x1E, 0, 65536, 0, LP_OPTIONS},
+	{"NAND 64GiB 3,3V 8-bit",	0x3E, 0, 65536, 0, LP_OPTIONS},
+	{"NAND 64GiB 1,8V 16-bit",	0x2E, 0, 65536, 0, LP_OPTIONS16},
+	{"NAND 64GiB 3,3V 16-bit",	0x4E, 0, 65536, 0, LP_OPTIONS16},
 
 	/*
 	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
-- 
1.7.0.4
