Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPNC4-0000oh-0K
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 00:13:20 +0000
Received: by pbbrq13 with SMTP id rq13so206997pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 17:13:19 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] mtd: nand: remove autoincrement 'sndcmd' code
Date: Tue,  1 May 2012 17:12:54 -0700
Message-Id: <1335917575-14953-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335917575-14953-1-git-send-email-computersforpeace@gmail.com>
References: <1335917575-14953-1-git-send-email-computersforpeace@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND_NO_AUTOINCR option is always set, so we will kill the option and make
"no autoincrement" the default behavior for nand_base.c. Thus, we should remove
the code which decides whether or not to send the NAND_CMD_READ0 command.
Instead, we unconditionally send the command.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   43 +++++------------------------------------
 1 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 640f1f8..6246b0f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1477,8 +1477,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	int chipnr, page, realpage, col, bytes, aligned;
 	struct nand_chip *chip = mtd->priv;
 	struct mtd_ecc_stats stats;
-	int blkcheck = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
-	int sndcmd = 1;
 	int ret = 0;
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
@@ -1509,10 +1507,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		if (realpage != chip->pagebuf || oob) {
 			bufpoi = aligned ? buf : chip->buffers->databuf;
 
-			if (likely(sndcmd)) {
-				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
-				sndcmd = 0;
-			}
+			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
 
 			/*
 			 * Now read the page into the buffer.  Absent an error,
@@ -1564,13 +1559,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			}
 
 			if (!(chip->options & NAND_NO_READRDY)) {
-				/*
-				 * Apply delay or wait for ready/busy pin. Do
-				 * this before the AUTOINCR check, so no
-				 * problems arise if a chip which does auto
-				 * increment is marked as NOAUTOINCR by the
-				 * board driver.
-				 */
+				/* Apply delay or wait for ready/busy pin */
 				if (!chip->dev_ready)
 					udelay(chip->chip_delay);
 				else
@@ -1600,13 +1589,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			chip->select_chip(mtd, -1);
 			chip->select_chip(mtd, chipnr);
 		}
-
-		/*
-		 * Check, if the chip supports auto page increment or if we
-		 * have hit a block boundary.
-		 */
-		if (!NAND_CANAUTOINCR(chip) || !(page & blkcheck))
-			sndcmd = 1;
 	}
 
 	ops->retlen = ops->len - (size_t) readlen;
@@ -1800,10 +1782,9 @@ static int nand_write_oob_syndrome(struct mtd_info *mtd,
 static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
-	int page, realpage, chipnr, sndcmd = 1;
+	int page, realpage, chipnr;
 	struct nand_chip *chip = mtd->priv;
 	struct mtd_ecc_stats stats;
-	int blkcheck = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
 	int readlen = ops->ooblen;
 	int len;
 	uint8_t *buf = ops->oobbuf;
@@ -1842,20 +1823,15 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 
 	while (1) {
 		if (ops->mode == MTD_OPS_RAW)
-			sndcmd = chip->ecc.read_oob_raw(mtd, chip, page, sndcmd);
+			chip->ecc.read_oob_raw(mtd, chip, page, 1);
 		else
-			sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
+			chip->ecc.read_oob(mtd, chip, page, 1);
 
 		len = min(len, readlen);
 		buf = nand_transfer_oob(chip, buf, ops, len);
 
 		if (!(chip->options & NAND_NO_READRDY)) {
-			/*
-			 * Apply delay or wait for ready/busy pin. Do this
-			 * before the AUTOINCR check, so no problems arise if a
-			 * chip which does auto increment is marked as
-			 * NOAUTOINCR by the board driver.
-			 */
+			/* Apply delay or wait for ready/busy pin */
 			if (!chip->dev_ready)
 				udelay(chip->chip_delay);
 			else
@@ -1876,13 +1852,6 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			chip->select_chip(mtd, -1);
 			chip->select_chip(mtd, chipnr);
 		}
-
-		/*
-		 * Check, if the chip supports auto page increment or if we
-		 * have hit a block boundary.
-		 */
-		if (!NAND_CANAUTOINCR(chip) || !(page & blkcheck))
-			sndcmd = 1;
 	}
 
 	ops->oobretlen = ops->ooblen;
-- 
1.7.5.4.2.g519b1
