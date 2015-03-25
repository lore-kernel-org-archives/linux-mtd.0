Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yalth-00074w-LD
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 14:03:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: nand: Add support for raw access when using on-die
 ECC
Date: Wed, 25 Mar 2015 15:02:30 +0100
Message-Id: <1427292151-3835-3-git-send-email-richard@nod.at>
In-Reply-To: <1427292151-3835-1-git-send-email-richard@nod.at>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implementing raw access for on-die ECC mode is a bit beautiless
because we have to disable on-die ECC before sending the NAND read
command and re-enable it again at all locations where raw access
can happen.
If the kernel was built without on-die ECC support or the current
ECC mode is not on-die these operations are no-ops.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nand_base.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 92e7ed7..b42f556 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1589,16 +1589,21 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 						 __func__, buf);
 
 read_retry:
+			if (unlikely(ops->mode == MTD_OPS_RAW))
+				nand_setup_on_die_ecc_micron(mtd, 0);
+
 			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
 
 			/*
 			 * Now read the page into the buffer.  Absent an error,
 			 * the read methods return max bitflips per ecc step.
 			 */
-			if (unlikely(ops->mode == MTD_OPS_RAW))
+			if (unlikely(ops->mode == MTD_OPS_RAW)) {
 				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
 							      oob_required,
 							      page);
+				nand_setup_on_die_ecc_micron(mtd, 1);
+			}
 			else if (!aligned && NAND_HAS_SUBPAGE_READ(chip) &&
 				 !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
@@ -1926,9 +1931,11 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	page = realpage & chip->pagemask;
 
 	while (1) {
-		if (ops->mode == MTD_OPS_RAW)
+		if (ops->mode == MTD_OPS_RAW) {
+			nand_setup_on_die_ecc_micron(mtd, 0);
 			ret = chip->ecc.read_oob_raw(mtd, chip, page);
-		else
+			nand_setup_on_die_ecc_micron(mtd, 1);
+		} else
 			ret = chip->ecc.read_oob(mtd, chip, page);
 
 		if (ret < 0)
@@ -2271,6 +2278,9 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	else
 		subpage = 0;
 
+	if (unlikely(raw))
+		nand_setup_on_die_ecc_micron(mtd, 0);
+
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
 
 	if (unlikely(raw))
@@ -2283,7 +2293,7 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		status = chip->ecc.write_page(mtd, chip, buf, oob_required);
 
 	if (status < 0)
-		return status;
+		goto out;
 
 	/*
 	 * Cached progamming disabled for now. Not sure if it's worth the
@@ -2303,14 +2313,22 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			status = chip->errstat(mtd, chip, FL_WRITING, status,
 					       page);
 
-		if (status & NAND_STATUS_FAIL)
-			return -EIO;
+		if (status & NAND_STATUS_FAIL) {
+			status = -EIO;
+			goto out;
+		}
 	} else {
 		chip->cmdfunc(mtd, NAND_CMD_CACHEDPROG, -1, -1);
 		status = chip->waitfunc(mtd, chip);
 	}
 
-	return 0;
+	status = 0;
+
+out:
+	if (unlikely(raw))
+		nand_setup_on_die_ecc_micron(mtd, 1);
+
+	return status;
 }
 
 /**
@@ -2632,9 +2650,11 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 
 	nand_fill_oob(mtd, ops->oobbuf, ops->ooblen, ops);
 
-	if (ops->mode == MTD_OPS_RAW)
+	if (ops->mode == MTD_OPS_RAW) {
+		nand_setup_on_die_ecc_micron(mtd, 0);
 		status = chip->ecc.write_oob_raw(mtd, chip, page & chip->pagemask);
-	else
+		nand_setup_on_die_ecc_micron(mtd, 1);
+	} else
 		status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
 
 	chip->select_chip(mtd, -1);
-- 
2.3.4
