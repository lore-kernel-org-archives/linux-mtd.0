Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TaLiN-0000fH-IV
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2012 07:24:20 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 1/2] mtd: remove the de-select chip code in
 nand_release_device()
Date: Mon, 19 Nov 2012 14:43:29 +0800
Message-ID: <1353307410-17529-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_get_device() does not select the chip, but nand_release_device()
does de-select the chip. It is really strange.

With the current code, nand_sync() will de-select the chip, even if the chip
has never been selected.

To make the balance of select/de-select chip, it's better to remove the
de-select chip code in nand_release_device() which makes the code more
clear.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   35 +++++++++++++++++++++++++----------
 1 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6eef7fb..861a87d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -130,15 +130,12 @@ static int check_offs_len(struct mtd_info *mtd,
  * nand_release_device - [GENERIC] release chip
  * @mtd: MTD device structure
  *
- * Deselect, release chip lock and wake up anyone waiting on the device.
+ * Release chip lock and wake up anyone waiting on the device.
  */
 static void nand_release_device(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
 
-	/* De-select the NAND device */
-	chip->select_chip(mtd, -1);
-
 	/* Release the controller and the chip */
 	spin_lock(&chip->controller->lock);
 	chip->controller->active = NULL;
@@ -333,8 +330,10 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 		i++;
 	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
 
-	if (getchip)
+	if (getchip) {
+		chip->select_chip(mtd, -1);
 		nand_release_device(mtd);
+	}
 
 	return res;
 }
@@ -952,6 +951,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	ret = __nand_unlock(mtd, ofs, len, 0);
 
 out:
+	chip->select_chip(mtd, -1);
 	nand_release_device(mtd);
 
 	return ret;
@@ -1016,6 +1016,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	ret = __nand_unlock(mtd, ofs, len, 0x1);
 
 out:
+	chip->select_chip(mtd, -1);
 	nand_release_device(mtd);
 
 	return ret;
@@ -1552,6 +1553,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			chip->select_chip(mtd, chipnr);
 		}
 	}
+	chip->select_chip(mtd, -1);
 
 	ops->retlen = ops->len - (size_t) readlen;
 	if (oob)
@@ -1806,6 +1808,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			chip->select_chip(mtd, chipnr);
 		}
 	}
+	chip->select_chip(mtd, -1);
 
 	ops->oobretlen = ops->ooblen - readlen;
 
@@ -2188,8 +2191,10 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	chip->select_chip(mtd, chipnr);
 
 	/* Check, if it is write protected */
-	if (nand_check_wp(mtd))
-		return -EIO;
+	if (nand_check_wp(mtd)) {
+		ret = -EIO;
+		goto err_out;
+	}
 
 	realpage = (int)(to >> chip->page_shift);
 	page = realpage & chip->pagemask;
@@ -2201,8 +2206,10 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		chip->pagebuf = -1;
 
 	/* Don't allow multipage oob writes with offset */
-	if (oob && ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
-		return -EINVAL;
+	if (oob && ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
 
 	while (1) {
 		int bytes = mtd->writesize;
@@ -2253,6 +2260,9 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	ops->retlen = ops->len - writelen;
 	if (unlikely(oob))
 		ops->oobretlen = ops->ooblen;
+
+err_out:
+	chip->select_chip(mtd, -1);
 	return ret;
 }
 
@@ -2379,8 +2389,10 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
 
 	/* Check, if it is write protected */
-	if (nand_check_wp(mtd))
+	if (nand_check_wp(mtd)) {
+		chip->select_chip(mtd, -1);
 		return -EROFS;
+	}
 
 	/* Invalidate the page cache, if we write to the cached page */
 	if (page == chip->pagebuf)
@@ -2393,6 +2405,8 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	else
 		status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
 
+	chip->select_chip(mtd, -1);
+
 	if (status)
 		return status;
 
@@ -2625,6 +2639,7 @@ erase_exit:
 	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
 
 	/* Deselect and wake up anyone waiting on the device */
+	chip->select_chip(mtd, -1);
 	nand_release_device(mtd);
 
 	/* Do call back function */
-- 
1.7.0.4
