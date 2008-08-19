Received: from elasmtp-masked.atl.sa.earthlink.net ([209.86.89.68])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVYjN-0005Cr-9s
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 21:27:09 +0000
Received: from [24.41.66.60] (helo=[10.0.1.3])
	by elasmtp-masked.atl.sa.earthlink.net with esmtpa (Exim 4.67)
	(envelope-from <brucle@earthlink.net>) id 1KVYjM-0003n6-Hk
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 17:27:08 -0400
Message-ID: <48AB3AAC.7030900@earthlink.net>
Date: Tue, 19 Aug 2008 14:27:08 -0700
From: Bruce Leonard <brucle@earthlink.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] Clean up of code found when adding support for > 2GiB
	MTD devices
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These are just some code cleanups that I found while working on the MTD sub-system.

 From ab740d4e4b786a04a51b1de44e91f51919709e0a Mon Sep 17 00:00:00 2001
From: brucle <brucle@selinc.com>
Date: Wed, 13 Aug 2008 17:16:48 -0700
Subject: [PATCH] Code clean up preping for support of > 2GiB MTD devices

Signed-off-by: Bruce D. Leonard <brucle@selinc.com>

---
  drivers/mtd/nand/nand_base.c |    2 +-
  drivers/mtd/nand/nand_bbt.c  |    5 ++---
  2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d1129ba..d5ac675 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2042,7 +2042,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
  		return -EINVAL;
  	}

-	instr->fail_addr = 0xffffffff;
+	instr->fail_addr = (typeof(instr->fail_addr))(-1);

  	/* Grab the lock and see if the device is available */
  	nand_get_device(chip, mtd, FL_ERASING);
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 0b1c485..2f9f0f5 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -411,7 +411,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
  		numblocks = this->chipsize >> (this->bbt_erase_shift - 1);
  		startblock = chip * numblocks;
  		numblocks += startblock;
-		from = startblock << (this->bbt_erase_shift - 1);
+		from = (loff_t)startblock << (this->bbt_erase_shift - 1);
  	}

  	for (i = startblock; i < numblocks;) {
@@ -495,7 +495,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
  		for (block = 0; block < td->maxblocks; block++) {

  			int actblock = startblock + dir * block;
-			loff_t offs = actblock << this->bbt_erase_shift;
+			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;

  			/* Read first page */
  			scan_read_raw(mtd, buf, offs, mtd->writesize);
@@ -1027,7 +1027,6 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
  	if (!this->bbt || !td)
  		return -EINVAL;

-	len = mtd->size >> (this->bbt_erase_shift + 2);
  	/* Allocate a temporary buffer for one eraseblock incl. oob */
  	len = (1 << this->bbt_erase_shift);
  	len += (len >> this->page_shift) * mtd->oobsize;
-- 
1.5.3.4
