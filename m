Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RLhWs-0004bV-RG
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2011 20:35:23 +0000
Received: by qyk10 with SMTP id 10so624339qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Nov 2011 13:35:21 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/3] mtd: nand: scan 1st and 2nd page for Macronix SLC
Date: Wed,  2 Nov 2011 13:34:44 -0700
Message-Id: <1320266084-18131-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1320266084-18131-1-git-send-email-computersforpeace@gmail.com>
References: <1320266084-18131-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3ed9c5e..35b4565 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3132,8 +3132,8 @@ ident_done:
 	 * Bad block marker is stored in the last page of each block
 	 * on Samsung and Hynix MLC devices; stored in first two pages
 	 * of each block on Micron devices with 2KiB pages and on
-	 * SLC Samsung, Hynix, Toshiba and AMD/Spansion. All others scan
-	 * only the first page.
+	 * SLC Samsung, Hynix, Toshiba, AMD/Spansion, and Macronix.
+	 * All others scan only the first page.
 	 */
 	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			(*maf_id == NAND_MFR_SAMSUNG ||
@@ -3143,7 +3143,8 @@ ident_done:
 				(*maf_id == NAND_MFR_SAMSUNG ||
 				 *maf_id == NAND_MFR_HYNIX ||
 				 *maf_id == NAND_MFR_TOSHIBA ||
-				 *maf_id == NAND_MFR_AMD)) ||
+				 *maf_id == NAND_MFR_AMD ||
+				 *maf_id == NAND_MFR_MACRONIX)) ||
 			(mtd->writesize == 2048 &&
 			 *maf_id == NAND_MFR_MICRON))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
-- 
1.7.5.4
