Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYRr-0004CX-NM
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:17 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 05/12] mtd: nand: remove AG-AND support
Date: Mon,  4 Mar 2013 18:42:22 +0200
Message-Id: <1362415349-7107-6-git-send-email-dedekind1@gmail.com>
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

We have only one AG-AND driver and it was not touched since 2005. It looks
like AG-AND was not really make it to mass-production and can be considered
a dead technology.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/nand_base.c |   78 ++----------------------------------------
 drivers/mtd/nand/nand_bbt.c  |   25 --------------
 drivers/mtd/nand/nand_ids.c  |   13 -------
 include/linux/mtd/nand.h     |   16 ---------
 4 files changed, 2 insertions(+), 130 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4321415..0e28f55 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4,7 +4,6 @@
  *  Overview:
  *   This is the generic MTD driver for NAND flash devices. It should be
  *   capable of working with almost all NAND chips currently available.
- *   Basic support for AG-AND chips is provided.
  *
  *	Additional technical information is available on
  *	http://www.linux-mtd.infradead.org/doc/nand.html
@@ -22,7 +21,6 @@
  *	Enable cached programming for 2k page size chips
  *	Check, if mtd->ecctype should be set to MTD_ECC_HW
  *	if we have HW ECC support.
- *	The AG-AND chips have nice features for speed improvement,
  *	which are not supported yet. Read / program 4 pages in one go.
  *	BBT table is not serialized, has to be fixed
  *
@@ -836,9 +834,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	 */
 	ndelay(100);
 
-	if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
-		chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
-	else
+	if (state == FL_ERASING)
 		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
 
 	if (in_interrupt() || oops_in_progress)
@@ -2465,24 +2461,6 @@ static void single_erase_cmd(struct mtd_info *mtd, int page)
 }
 
 /**
- * multi_erase_cmd - [GENERIC] AND specific block erase command function
- * @mtd: MTD device structure
- * @page: the page address of the block which will be erased
- *
- * AND multi block erase command function. Erase 4 consecutive blocks.
- */
-static void multi_erase_cmd(struct mtd_info *mtd, int page)
-{
-	struct nand_chip *chip = mtd->priv;
-	/* Send commands to erase a block */
-	chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page++);
-	chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page++);
-	chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page++);
-	chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
-	chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
-}
-
-/**
  * nand_erase - [MTD Interface] erase block(s)
  * @mtd: MTD device structure
  * @instr: erase instruction
@@ -2494,7 +2472,6 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return nand_erase_nand(mtd, instr, 0);
 }
 
-#define BBT_PAGE_MASK	0xffffff3f
 /**
  * nand_erase_nand - [INTERN] erase block(s)
  * @mtd: MTD device structure
@@ -2508,8 +2485,6 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 {
 	int page, status, pages_per_block, ret, chipnr;
 	struct nand_chip *chip = mtd->priv;
-	loff_t rewrite_bbt[NAND_MAX_CHIPS] = {0};
-	unsigned int bbt_masked_page = 0xffffffff;
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -2540,15 +2515,6 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		goto erase_exit;
 	}
 
-	/*
-	 * If BBT requires refresh, set the BBT page mask to see if the BBT
-	 * should be rewritten. Otherwise the mask is set to 0xffffffff which
-	 * can not be matched. This is also done when the bbt is actually
-	 * erased to avoid recursive updates.
-	 */
-	if (chip->options & BBT_AUTO_REFRESH && !allowbbt)
-		bbt_masked_page = chip->bbt_td->pages[chipnr] & BBT_PAGE_MASK;
-
 	/* Loop through the pages */
 	len = instr->len;
 
@@ -2594,15 +2560,6 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			goto erase_exit;
 		}
 
-		/*
-		 * If BBT requires refresh, set the BBT rewrite flag to the
-		 * page being erased.
-		 */
-		if (bbt_masked_page != 0xffffffff &&
-		    (page & BBT_PAGE_MASK) == bbt_masked_page)
-			    rewrite_bbt[chipnr] =
-					((loff_t)page << chip->page_shift);
-
 		/* Increment page address and decrement length */
 		len -= (1 << chip->phys_erase_shift);
 		page += pages_per_block;
@@ -2612,15 +2569,6 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			chipnr++;
 			chip->select_chip(mtd, -1);
 			chip->select_chip(mtd, chipnr);
-
-			/*
-			 * If BBT requires refresh and BBT-PERCHIP, set the BBT
-			 * page mask to see if this BBT should be rewritten.
-			 */
-			if (bbt_masked_page != 0xffffffff &&
-			    (chip->bbt_td->options & NAND_BBT_PERCHIP))
-				bbt_masked_page = chip->bbt_td->pages[chipnr] &
-					BBT_PAGE_MASK;
 		}
 	}
 	instr->state = MTD_ERASE_DONE;
@@ -2637,23 +2585,6 @@ erase_exit:
 	if (!ret)
 		mtd_erase_callback(instr);
 
-	/*
-	 * If BBT requires refresh and erase was successful, rewrite any
-	 * selected bad block tables.
-	 */
-	if (bbt_masked_page == 0xffffffff || ret)
-		return ret;
-
-	for (chipnr = 0; chipnr < chip->numchips; chipnr++) {
-		if (!rewrite_bbt[chipnr])
-			continue;
-		/* Update the BBT for chip */
-		pr_debug("%s: nand_update_bbt (%d:0x%0llx 0x%0x)\n",
-				__func__, chipnr, rewrite_bbt[chipnr],
-				chip->bbt_td->pages[chipnr]);
-		nand_update_bbt(mtd, rewrite_bbt[chipnr]);
-	}
-
 	/* Return more or less happy */
 	return ret;
 }
@@ -3286,12 +3217,7 @@ ident_done:
 	}
 
 	chip->badblockbits = 8;
-
-	/* Check for AND chips with 4 page planes */
-	if (chip->options & NAND_4PAGE_ARRAY)
-		chip->erase_cmd = multi_erase_cmd;
-	else
-		chip->erase_cmd = single_erase_cmd;
+	chip->erase_cmd = single_erase_cmd;
 
 	/* Do not replace user supplied command function! */
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 916d6e9..2672643 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1240,15 +1240,6 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
  */
 static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
 
-static uint8_t scan_agand_pattern[] = { 0x1C, 0x71, 0xC7, 0x1C, 0x71, 0xC7 };
-
-static struct nand_bbt_descr agand_flashbased = {
-	.options = NAND_BBT_SCANEMPTY | NAND_BBT_SCANALLPAGES,
-	.offs = 0x20,
-	.len = 6,
-	.pattern = scan_agand_pattern
-};
-
 /* Generic flash bbt descriptors */
 static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
 static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
@@ -1333,22 +1324,6 @@ int nand_default_bbt(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
 
-	/*
-	 * Default for AG-AND. We must use a flash based bad block table as the
-	 * devices have factory marked _good_ blocks. Erasing those blocks
-	 * leads to loss of the good / bad information, so we _must_ store this
-	 * information in a good / bad table during startup.
-	 */
-	if (this->options & NAND_IS_AND) {
-		/* Use the default pattern descriptors */
-		if (!this->bbt_td) {
-			this->bbt_td = &bbt_main_descr;
-			this->bbt_md = &bbt_mirror_descr;
-		}
-		this->bbt_options |= NAND_BBT_USE_FLASH;
-		return nand_scan_bbt(mtd, &agand_flashbased);
-	}
-
 	/* Is a flash based bad block table requested? */
 	if (this->bbt_options & NAND_BBT_USE_FLASH) {
 		/* Use the default pattern descriptors */
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 35070a2..7c5dec18 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -125,19 +125,6 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 64GiB 1,8V 16-bit",	0x2E, 0, 65536, 0, LP_OPTIONS16},
 	{"NAND 64GiB 3,3V 16-bit",	0x4E, 0, 65536, 0, LP_OPTIONS16},
 
-	/*
-	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
-	 * have a strange page/block layout !  The chosen minimum erasesize is
-	 * 4 * 2 * 2048 = 16384 Byte, as those chips have an array of 4 page
-	 * planes 1 block = 2 pages, but due to plane arrangement the blocks
-	 * 0-3 consists of page 0 + 4,1 + 5, 2 + 6, 3 + 7 Anyway JFFS2 would
-	 * increase the eraseblock size so we chose a combined one which can be
-	 * erased in one go There are more speed improvements for reads and
-	 * writes possible, but not implemented now
-	 */
-	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000,
-	 NAND_IS_AND | NAND_4PAGE_ARRAY | BBT_AUTO_REFRESH},
-
 	{NULL,}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7ccb3c5..2aba049 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -171,22 +171,6 @@ typedef enum {
 #define NAND_CACHEPRG		0x00000008
 /* Chip has copy back function */
 #define NAND_COPYBACK		0x00000010
-/*
- * AND Chip which has 4 banks and a confusing page / block
- * assignment. See Renesas datasheet for further information.
- */
-#define NAND_IS_AND		0x00000020
-/*
- * Chip has a array of 4 pages which can be read without
- * additional ready /busy waits.
- */
-#define NAND_4PAGE_ARRAY	0x00000040
-/*
- * Chip requires that BBT is periodically rewritten to prevent
- * bits from adjacent blocks from 'leaking' in altering data.
- * This happens with the Renesas AG-AND chips, possibly others.
- */
-#define BBT_AUTO_REFRESH	0x00000080
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
 
-- 
1.7.10.4
