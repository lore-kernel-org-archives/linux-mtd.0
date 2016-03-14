Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIbC-0004oA-KG
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:16 +0000
Received: by mail-pf0-x243.google.com with SMTP id q129so12044521pfb.3
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:55 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 09/11] mtd: nand_bbt: remove old API definitions
Date: Mon, 14 Mar 2016 02:48:02 +0000
Message-Id: <1457923684-13505-10-git-send-email-peterpandong@micron.com>
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

remove old BBT APIs

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/nand_bbt.c | 94 ++++++++-------------------------------------
 include/linux/mtd/nand.h    |  3 --
 2 files changed, 15 insertions(+), 82 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 0dda0c5..ef887c0 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1180,13 +1180,14 @@ static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
 };
 
 /**
- * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
+ * nand_bbt_init - [NAND BBT Interface] Initialize and locate/create a bad block
+ * table
  * @bbt: NAND BBT structure
  *
  * This function selects the default bad block table support for the device and
- * calls the nand_scan_bbt function.
+ * scans for an existing table, or else creates one.
  */
-int nand_default_bbt(struct nand_bbt *bbt)
+static int nand_bbt_init(struct nand_bbt *bbt)
 {
 	/* Is a flash based bad block table requested? */
 	if (bbt->bbt_options & NAND_BBT_USE_FLASH) {
@@ -1209,11 +1210,11 @@ int nand_default_bbt(struct nand_bbt *bbt)
 }
 
 /**
- * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
+ * nand_bbt_isreserved - [NAND BBT Interface] Check if a block is reserved
  * @bbt: NAND BBT structure
  * @offs: offset in the device
  */
-int nand_isreserved_bbt(struct nand_bbt *bbt, loff_t offs)
+int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs)
 {
 	struct nand_chip_layout_info *info = bbt->info;
 	int block;
@@ -1221,14 +1222,14 @@ int nand_isreserved_bbt(struct nand_bbt *bbt, loff_t offs)
 	block = (int)(offs >> info->bbt_erase_shift);
 	return bbt_get_entry(bbt, block) == BBT_BLOCK_RESERVED;
 }
+EXPORT_SYMBOL(nand_bbt_isreserved);
 
 /**
- * nand_isbad_bbt - [NAND Interface] Check if a block is bad
+ * nand_bbt_isbad - [NAND BBT Interface] Check if a block is bad
  * @bbt: NAND BBT structure
  * @offs: offset in the device
- * @allowbbt: allow access to bad block table region
  */
-int nand_isbad_bbt(struct nand_bbt *bbt, loff_t offs, int allowbbt)
+int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs)
 {
 	struct nand_chip_layout_info *info = bbt->info;
 	int block, res;
@@ -1236,19 +1237,20 @@ int nand_isbad_bbt(struct nand_bbt *bbt, loff_t offs, int allowbbt)
 	block = (int)(offs >> info->bbt_erase_shift);
 	res = bbt_get_entry(bbt, block);
 
-	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
+	pr_debug("nand_bbt_isbad(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
 
 	switch (res) {
 	case BBT_BLOCK_GOOD:
+	case BBT_BLOCK_RESERVED:
 		return 0;
 	case BBT_BLOCK_WORN:
+	case BBT_BLOCK_FACTORY_BAD:
+	default:
 		return 1;
-	case BBT_BLOCK_RESERVED:
-		return allowbbt ? 0 : 1;
 	}
-	return 1;
 }
+EXPORT_SYMBOL(nand_bbt_isbad);
 
 /**
  * nand_bbt_update_mark - update mark in the BBT
@@ -1273,32 +1275,6 @@ static int nand_bbt_update_mark(struct nand_bbt *bbt, loff_t offs, uint8_t mark)
 	return ret;
 }
 
-/**
- * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
- * @bbt: NAND BBT structure
- * @offs: offset of the bad block
- */
-int nand_markbad_bbt(struct nand_bbt *bbt, loff_t offs)
-{
-	return nand_bbt_update_mark(bbt, offs, BBT_BLOCK_WORN);
-}
-
-/**
- * nand_bbt_init - Initialize and locate/create a bad block table
- * @bbt: NAND BBT structure
- *
- * This function selects the default bad block table support for the device and
- * scans for an existing table, or else creates one.
- */
-static int nand_bbt_init(struct nand_bbt *bbt)
-{
-	/*
-	 * FIXME: For now, we call nand_default_bbt() directly. It will change
-	 * when we use struct nand_bbt instead of struct nand_chip.
-	 */
-	return nand_default_bbt(bbt);
-}
-
 static void nand_bbt_release(struct nand_bbt *bbt)
 {
 	kfree(bbt->bbt);
@@ -1350,49 +1326,13 @@ void nand_bbt_destroy(struct nand_bbt *bbt)
 EXPORT_SYMBOL(nand_bbt_destroy);
 
 /**
- * nand_bbt_isreserved - [NAND BBT Interface] Check if a block is reserved
- * @bbt: NAND BBT structure
- * @offs: offset in the device
- */
-int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs)
-{
-	/*
-	 * FIXME: For now, we call nand_isreserved_bbt() directly. It will
-	 * change when we use struct nand_bbt instead of struct nand_chip.
-	 */
-	return nand_isreserved_bbt(bbt, offs);
-}
-EXPORT_SYMBOL(nand_bbt_isreserved);
-
-/**
- * nand_bbt_isbad - [NAND BBT Interface] Check if a block is bad
- * @bbt: NAND BBT structure
- * @offs: offset in the device
- */
-int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs)
-{
-	/*
-	 * FIXME: For now, we call nand_isbad_bbt() directly. It will change
-	 * when we use struct nand_bbt instead of struct nand_chip.
-	 * Since we already have nand_bbt_isreserved(), we don't need to
-	 * check pass down allow_bbt.
-	 */
-	return nand_isbad_bbt(bbt, offs, 1);
-}
-EXPORT_SYMBOL(nand_bbt_isbad);
-
-/**
  * nand_bbt_markbad - [NAND BBT Interface] Mark a block bad in the BBT
  * @bbt: NAND BBT structure
  * @offs: offset of the bad block
  */
 int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs)
 {
-	/*
-	 * FIXME: For now, we call nand_markbad_bbt() directly. It will change
-	 * when we use struct nand_bbt instead of struct nand_chip.
-	 */
-	return nand_markbad_bbt(bbt, offs);
+	return nand_bbt_update_mark(bbt, offs, BBT_BLOCK_WORN);
 }
 EXPORT_SYMBOL(nand_bbt_markbad);
 
@@ -1404,10 +1344,6 @@ EXPORT_SYMBOL(nand_bbt_markbad);
  */
 int nand_bbt_markbad_factory(struct nand_bbt *bbt, loff_t offs)
 {
-	/*
-	 * FIXME: For now, we call nand_markbad_bbt() directly. It will change
-	 * when we use struct nand_bbt instead of struct nand_chip.
-	 */
 	return nand_bbt_update_mark(bbt, offs, BBT_BLOCK_FACTORY_BAD);
 }
 EXPORT_SYMBOL(nand_bbt_markbad_factory);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8730afd..d180e86 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -893,9 +893,6 @@ struct nand_manufacturers {
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
-extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
-extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
 extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, uint8_t *buf);
 
-- 
1.9.1
