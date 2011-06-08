Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNTy-0002Ga-IQ
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:28:00 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 3/4] mtd: nand: replace DEBUG() with dev_dbg()
Date: Wed, 8 Jun 2011 11:27:30 -0700
Message-ID: <1307557650-31323-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1307544295.31223.116.camel@localhost>
References: <1307544295.31223.116.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Start moving away from the MTD_DEBUG_LEVEL messages. The dynamic
debugging feature is a generic kernel feature that provides more
flexibility.

(See Documentation/dynamic-debug-howto.txt)

Also fix some punctuation, indentation, and capitalization that went
along with the affected lines.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   74 ++++++++++++++++++++---------------------
 drivers/mtd/nand/nand_bbt.c  |    9 ++---
 2 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7550cea..e124498 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -113,21 +113,19 @@ static int check_offs_len(struct mtd_info *mtd,
 
 	/* Start address must align on block boundary */
 	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+		dev_dbg(&mtd->dev, "%s: unaligned address\n", __func__);
 		ret = -EINVAL;
 	}
 
 	/* Length must align on block boundary */
 	if (len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
+		dev_dbg(&mtd->dev, "%s: length not block aligned\n", __func__);
 		ret = -EINVAL;
 	}
 
 	/* Do not allow past end of device */
 	if (ofs + len > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
-					__func__);
+		dev_dbg(&mtd->dev, "%s: past end of device\n", __func__);
 		ret = -EINVAL;
 	}
 
@@ -912,7 +910,7 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
 	udelay(1000);
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
+		dev_dbg(&mtd->dev, "%s: error status = 0x%08x\n",
 					__func__, status);
 		ret = -EIO;
 	}
@@ -934,7 +932,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	int chipnr;
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+	dev_dbg(&mtd->dev, "%s: start = 0x%012llx, len = %llu\n",
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
@@ -953,7 +951,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
+		dev_dbg(&mtd->dev, "%s: device is write protected!\n",
 					__func__);
 		ret = -EIO;
 		goto out;
@@ -987,7 +985,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	int chipnr, status, page;
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+	dev_dbg(&mtd->dev, "%s: start = 0x%012llx, len = %llu\n",
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
@@ -1002,7 +1000,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
+		dev_dbg(&mtd->dev, "%s: device is write protected!\n",
 					__func__);
 		status = MTD_ERASE_FAILED;
 		ret = -EIO;
@@ -1018,7 +1016,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	udelay(1000);
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
+		dev_dbg(&mtd->dev, "%s: error status = 0x%08x\n",
 					__func__, status);
 		ret = -EIO;
 		goto out;
@@ -1757,7 +1755,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	int len;
 	uint8_t *buf = ops->oobbuf;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08Lx, len = %i\n",
+	dev_dbg(&mtd->dev, "%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
 	if (ops->mode == MTD_OOB_AUTO)
@@ -1766,8 +1764,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 		len = mtd->oobsize;
 
 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start read "
-					"outside oob\n", __func__);
+		dev_dbg(&mtd->dev, "%s: attempt to start read outside oob\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -1775,8 +1773,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	if (unlikely(from >= mtd->size ||
 		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
 					(from >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read beyond end "
-					"of device\n", __func__);
+		dev_dbg(&mtd->dev, "%s: attempt to read beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -1851,8 +1849,8 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 
 	/* Do not allow reads past end of device */
 	if (ops->datbuf && (from + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read "
-				"beyond end of device\n", __func__);
+		dev_dbg(&mtd->dev, "%s: attempt to read beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2341,7 +2339,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	int chipnr, page, status, len;
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+	dev_dbg(&mtd->dev, "%s: to = 0x%08x, len = %i\n",
 			 __func__, (unsigned int)to, (int)ops->ooblen);
 
 	if (ops->mode == MTD_OOB_AUTO)
@@ -2351,14 +2349,14 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 
 	/* Do not allow write past end of page */
 	if ((ops->ooboffs + ops->ooblen) > len) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to write "
-				"past end of page\n", __func__);
+		dev_dbg(&mtd->dev, "%s: attempt to write past end of page\n",
+				__func__);
 		return -EINVAL;
 	}
 
 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start "
-				"write outside oob\n", __func__);
+		dev_dbg(&mtd->dev, "%s: attempt to start write outside oob\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2367,8 +2365,8 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		     ops->ooboffs + ops->ooblen >
 			((mtd->size >> chip->page_shift) -
 			 (to >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
-				"end of device\n", __func__);
+		dev_dbg(&mtd->dev, "%s: attempt to write beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2423,8 +2421,8 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	/* Do not allow writes past end of device */
 	if (ops->datbuf && (to + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
-				"end of device\n", __func__);
+		dev_dbg(&mtd->dev, "%s: attempt to write beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2513,9 +2511,9 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	unsigned int bbt_masked_page = 0xffffffff;
 	loff_t len;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
-				__func__, (unsigned long long)instr->addr,
-				(unsigned long long)instr->len);
+	dev_dbg(&mtd->dev, "%s: start = 0x%012llx, len = %llu\n",
+			__func__, (unsigned long long)instr->addr,
+			(unsigned long long)instr->len);
 
 	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
@@ -2537,8 +2535,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
-					__func__);
+		dev_dbg(&mtd->dev, "%s: device is write protected!\n",
+				__func__);
 		instr->state = MTD_ERASE_FAILED;
 		goto erase_exit;
 	}
@@ -2589,8 +2587,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 
 		/* See if block erase succeeded */
 		if (status & NAND_STATUS_FAIL) {
-			DEBUG(MTD_DEBUG_LEVEL0, "%s: Failed erase, "
-					"page 0x%08x\n", __func__, page);
+			dev_dbg(&mtd->dev, "%s: failed erase, page 0x%08x\n",
+					__func__, page);
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr =
 				((loff_t)page << chip->page_shift);
@@ -2650,9 +2648,9 @@ erase_exit:
 		if (!rewrite_bbt[chipnr])
 			continue;
 		/* Update the BBT for chip */
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: nand_update_bbt "
-			"(%d:0x%0llx 0x%0x)\n", __func__, chipnr,
-			rewrite_bbt[chipnr], chip->bbt_td->pages[chipnr]);
+		dev_dbg(&mtd->dev, "%s: nand_update_bbt (%d:0x%0llx 0x%0x)\n",
+				__func__, chipnr, rewrite_bbt[chipnr],
+				chip->bbt_td->pages[chipnr]);
 		nand_update_bbt(mtd, rewrite_bbt[chipnr]);
 	}
 
@@ -2670,7 +2668,7 @@ static void nand_sync(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: called\n", __func__);
+	dev_dbg(&mtd->dev, "%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_SYNCING);
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index d7221df..5835404 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -225,10 +225,6 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
-				/*
-				 * Leave it for now, if it's matured we can
-				 * move this message to MTD_DEBUG_LEVEL0.
-				 */
 				pr_debug("nand_read_bbt: Bad block at 0x%012llx\n",
 				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
@@ -1378,8 +1374,9 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	block = (int)(offs >> (this->bbt_erase_shift - 1));
 	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
-	      (unsigned int)offs, block >> 1, res);
+	dev_dbg(&mtd->dev, "nand_isbad_bbt(): bbt info for offs 0x%08x: "
+			   "(block %d) 0x%02x\n",
+			   (unsigned int)offs, block >> 1, res);
 
 	switch ((int)res) {
 	case 0x00:
-- 
1.7.0.4
