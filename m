Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhoXG-0006Dm-RD
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 23:12:32 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb1so178883pad.9
 for <linux-mtd@lists.infradead.org>; Tue, 06 May 2014 16:12:07 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: refactor erase_cmd() to return chip status
Date: Tue,  6 May 2014 16:11:10 -0700
Message-Id: <1399417870-14436-1-git-send-email-computersforpeace@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_chip::erase_cmd callback previously served a dual purpose; for
one, it allowed a per-flash-chip override, so that AG-AND devices could
use a different erase command than other NAND. These AND devices were
dropped in commit xxxxx. On the other hand, some drivers (denali and
doc-g4) need to use this sort of callback to implement
controller-specific erase operations.

To make the latter operation easier for some drivers (e.g., ST's new BCH
NAND driver), it helps if the command dispatch and wait functions can be
lumped together, rather than called separately.

This patch does two things:
 1. Pull the call to chip->waitfunc() into chip->erase_cmd(), and return
    the status from this callback
 2. Rename erase_cmd() to just erase(), since this callback does a
    little more than just send a command

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/denali.c    |  7 +++----
 drivers/mtd/nand/docg4.c     |  6 ++++--
 drivers/mtd/nand/nand_base.c | 14 +++++++-------
 include/linux/mtd/nand.h     |  5 ++---
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c07cd573ad3a..9f2012a3e764 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1233,7 +1233,7 @@ static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 	return status;
 }
 
-static void denali_erase(struct mtd_info *mtd, int page)
+static int denali_erase(struct mtd_info *mtd, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
@@ -1250,8 +1250,7 @@ static void denali_erase(struct mtd_info *mtd, int page)
 	irq_status = wait_for_irq(denali, INTR_STATUS__ERASE_COMP |
 					INTR_STATUS__ERASE_FAIL);
 
-	denali->status = (irq_status & INTR_STATUS__ERASE_FAIL) ?
-						NAND_STATUS_FAIL : PASS;
+	return (irq_status & INTR_STATUS__ERASE_FAIL) ? NAND_STATUS_FAIL : PASS;
 }
 
 static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
@@ -1584,7 +1583,7 @@ int denali_init(struct denali_nand_info *denali)
 	denali->nand.ecc.write_page_raw = denali_write_page_raw;
 	denali->nand.ecc.read_oob = denali_read_oob;
 	denali->nand.ecc.write_oob = denali_write_oob;
-	denali->nand.erase_cmd = denali_erase;
+	denali->nand.erase = denali_erase;
 
 	if (nand_scan_tail(&denali->mtd)) {
 		ret = -ENXIO;
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 1b0265e85a06..ce24637e14f1 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -872,7 +872,7 @@ static int docg4_read_oob(struct mtd_info *mtd, struct nand_chip *nand,
 	return 0;
 }
 
-static void docg4_erase_block(struct mtd_info *mtd, int page)
+static int docg4_erase_block(struct mtd_info *mtd, int page)
 {
 	struct nand_chip *nand = mtd->priv;
 	struct docg4_priv *doc = nand->priv;
@@ -916,6 +916,8 @@ static void docg4_erase_block(struct mtd_info *mtd, int page)
 	write_nop(docptr);
 	poll_status(doc);
 	write_nop(docptr);
+
+	return nand->waitfunc(mtd, nand);
 }
 
 static int write_page(struct mtd_info *mtd, struct nand_chip *nand,
@@ -1236,7 +1238,7 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->block_markbad = docg4_block_markbad;
 	nand->read_buf = docg4_read_buf;
 	nand->write_buf = docg4_write_buf16;
-	nand->erase_cmd = docg4_erase_block;
+	nand->erase = docg4_erase_block;
 	nand->ecc.read_page = docg4_read_page;
 	nand->ecc.write_page = docg4_write_page;
 	nand->ecc.read_page_raw = docg4_read_page_raw;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f6c5685b79a6..7853b9b0a05e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2617,18 +2617,20 @@ out:
 }
 
 /**
- * single_erase_cmd - [GENERIC] NAND standard block erase command function
+ * single_erase - [GENERIC] NAND standard block erase command function
  * @mtd: MTD device structure
  * @page: the page address of the block which will be erased
  *
- * Standard erase command for NAND chips.
+ * Standard erase command for NAND chips. Returns NAND status.
  */
-static void single_erase_cmd(struct mtd_info *mtd, int page)
+static int single_erase(struct mtd_info *mtd, int page)
 {
 	struct nand_chip *chip = mtd->priv;
 	/* Send commands to erase a block */
 	chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
 	chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
+
+	return chip->waitfunc(mtd, chip);
 }
 
 /**
@@ -2709,9 +2711,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    (page + pages_per_block))
 			chip->pagebuf = -1;
 
-		chip->erase_cmd(mtd, page & chip->pagemask);
-
-		status = chip->waitfunc(mtd, chip);
+		status = chip->erase(mtd, page & chip->pagemask);
 
 		/*
 		 * See if operation failed and additional status checks are
@@ -3684,7 +3684,7 @@ ident_done:
 	}
 
 	chip->badblockbits = 8;
-	chip->erase_cmd = single_erase_cmd;
+	chip->erase = single_erase;
 
 	/* Do not replace user supplied command function! */
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 450d61ec7f06..7a922e6c4e4b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -552,8 +552,7 @@ struct nand_buffers {
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buffers:		buffer structure for read/write
  * @hwcontrol:		platform-specific hardware control structure
- * @erase_cmd:		[INTERN] erase command write function, selectable due
- *			to AND support.
+ * @erase:		[REPLACEABLE] erase function
  * @scan_bbt:		[REPLACEABLE] function to scan bad block table
  * @chip_delay:		[BOARDSPECIFIC] chip dependent delay for transferring
  *			data from array to read regs (tR).
@@ -637,7 +636,7 @@ struct nand_chip {
 	void (*cmdfunc)(struct mtd_info *mtd, unsigned command, int column,
 			int page_addr);
 	int(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
-	void (*erase_cmd)(struct mtd_info *mtd, int page);
+	int (*erase)(struct mtd_info *mtd, int page);
 	int (*scan_bbt)(struct mtd_info *mtd);
 	int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state,
 			int status, int page);
-- 
1.8.3.2
