Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TaLiO-0000fI-N6
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2012 07:24:21 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: remove the "chip" parameter in nand_get_device()
Date: Mon, 19 Nov 2012 14:43:30 +0800
Message-ID: <1353307410-17529-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1353307410-17529-1-git-send-email-b32955@freescale.com>
References: <1353307410-17529-1-git-send-email-b32955@freescale.com>
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

There are two reasons to remove the "chip" parameter in nand_get_device():

[1] The nand_release_device() does not have the "chip" parameter.
[2] We can get the nand_chip by the mtd->priv field.

This patch removes the "chip" parameter in nand_get_device().

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   37 ++++++++++++++-----------------------
 1 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 861a87d..55c2883 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -93,8 +93,7 @@ static struct nand_ecclayout nand_oob_128 = {
 		 .length = 78} }
 };
 
-static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
-			   int new_state);
+static int nand_get_device(struct mtd_info *mtd, int new_state);
 
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
@@ -300,7 +299,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 	if (getchip) {
 		chipnr = (int)(ofs >> chip->chip_shift);
 
-		nand_get_device(chip, mtd, FL_READING);
+		nand_get_device(mtd, FL_READING);
 
 		/* Select the NAND device */
 		chip->select_chip(mtd, chipnr);
@@ -382,7 +381,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		struct mtd_oob_ops ops;
 		loff_t wr_ofs = ofs;
 
-		nand_get_device(chip, mtd, FL_WRITING);
+		nand_get_device(mtd, FL_WRITING);
 
 		ops.datbuf = NULL;
 		ops.oobbuf = buf;
@@ -749,15 +748,15 @@ static void panic_nand_get_device(struct nand_chip *chip,
 
 /**
  * nand_get_device - [GENERIC] Get chip for selected access
- * @chip: the nand chip descriptor
  * @mtd: MTD device structure
  * @new_state: the state which is requested
  *
  * Get the device and lock it for exclusive access
  */
 static int
-nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
+nand_get_device(struct mtd_info *mtd, int new_state)
 {
+	struct nand_chip *chip = mtd->priv;
 	spinlock_t *lock = &chip->controller->lock;
 	wait_queue_head_t *wq = &chip->controller->wq;
 	DECLARE_WAITQUEUE(wait, current);
@@ -933,7 +932,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ofs + len == mtd->size)
 		len -= mtd->erasesize;
 
-	nand_get_device(chip, mtd, FL_UNLOCKING);
+	nand_get_device(mtd, FL_UNLOCKING);
 
 	/* Shift to get chip number */
 	chipnr = ofs >> chip->chip_shift;
@@ -983,7 +982,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (check_offs_len(mtd, ofs, len))
 		ret = -EINVAL;
 
-	nand_get_device(chip, mtd, FL_LOCKING);
+	nand_get_device(mtd, FL_LOCKING);
 
 	/* Shift to get chip number */
 	chipnr = ofs >> chip->chip_shift;
@@ -1581,11 +1580,10 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 		     size_t *retlen, uint8_t *buf)
 {
-	struct nand_chip *chip = mtd->priv;
 	struct mtd_oob_ops ops;
 	int ret;
 
-	nand_get_device(chip, mtd, FL_READING);
+	nand_get_device(mtd, FL_READING);
 	ops.len = len;
 	ops.datbuf = buf;
 	ops.oobbuf = NULL;
@@ -1832,7 +1830,6 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops)
 {
-	struct nand_chip *chip = mtd->priv;
 	int ret = -ENOTSUPP;
 
 	ops->retlen = 0;
@@ -1844,7 +1841,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 		return -EINVAL;
 	}
 
-	nand_get_device(chip, mtd, FL_READING);
+	nand_get_device(mtd, FL_READING);
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -2314,11 +2311,10 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 			  size_t *retlen, const uint8_t *buf)
 {
-	struct nand_chip *chip = mtd->priv;
 	struct mtd_oob_ops ops;
 	int ret;
 
-	nand_get_device(chip, mtd, FL_WRITING);
+	nand_get_device(mtd, FL_WRITING);
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
 	ops.oobbuf = NULL;
@@ -2424,7 +2420,6 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 			  struct mtd_oob_ops *ops)
 {
-	struct nand_chip *chip = mtd->priv;
 	int ret = -ENOTSUPP;
 
 	ops->retlen = 0;
@@ -2436,7 +2431,7 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EINVAL;
 	}
 
-	nand_get_device(chip, mtd, FL_WRITING);
+	nand_get_device(mtd, FL_WRITING);
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -2529,7 +2524,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		return -EINVAL;
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip, mtd, FL_ERASING);
+	nand_get_device(mtd, FL_ERASING);
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -2675,12 +2670,10 @@ erase_exit:
  */
 static void nand_sync(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd->priv;
-
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip, mtd, FL_SYNCING);
+	nand_get_device(mtd, FL_SYNCING);
 	/* Release it and go back */
 	nand_release_device(mtd);
 }
@@ -2766,9 +2759,7 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
  */
 static int nand_suspend(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = mtd->priv;
-
-	return nand_get_device(chip, mtd, FL_PM_SUSPENDED);
+	return nand_get_device(mtd, FL_PM_SUSPENDED);
 }
 
 /**
-- 
1.7.0.4
