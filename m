Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIb5-0004o3-NY
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:08 +0000
Received: by mail-pa0-x241.google.com with SMTP id q6so13621627pav.0
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:47 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 04/11] mtd: nand_bbt: add nand_bbt_markbad_factory() interface
Date: Mon, 14 Mar 2016 02:47:57 +0000
Message-Id: <1457923684-13505-5-git-send-email-peterpandong@micron.com>
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

Some nand controller drivers(like docg4.c) mark factory bad block
mark by accessing bbt buffer directly, so create this API to avoid
breaking layer.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/nand_bbt.c  | 33 ++++++++++++++++++++++++++++++---
 include/linux/mtd/nand_bbt.h |  1 +
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index aab734e..2ac90a1 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1353,11 +1353,12 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 }
 
 /**
- * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
+ * nand_bbt_update_mark - update mark in the BBT
  * @mtd: MTD device structure
  * @offs: offset of the bad block
+ * @mark: block type mark
  */
-int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
+static int nand_bbt_update_mark(struct mtd_info *mtd, loff_t offs, uint8_t mark)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	int block, ret = 0;
@@ -1365,7 +1366,7 @@ int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 	block = (int)(offs >> this->bbt_erase_shift);
 
 	/* Mark bad block in memory */
-	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
+	bbt_mark_entry(this, block, mark);
 
 	/* Update flash-based bad block table */
 	if (this->bbt_options & NAND_BBT_USE_FLASH)
@@ -1375,6 +1376,16 @@ int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 }
 
 /**
+ * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
+ * @mtd: MTD device structure
+ * @offs: offset of the bad block
+ */
+int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
+{
+	return nand_bbt_update_mark(mtd, offs, BBT_BLOCK_WORN);
+}
+
+/**
  * nand_bbt_init - Initialize and locate/create a bad block table
  * @bbt: NAND BBT structure
  *
@@ -1486,3 +1497,19 @@ int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs)
 	return nand_markbad_bbt(bbt->mtd, offs);
 }
 EXPORT_SYMBOL(nand_bbt_markbad);
+
+/**
+ * nand_bbt_markbad_factory - [NAND BBT Interface] Mark a block as factory bad
+ * in the BBT
+ * @bbt: NAND BBT structure
+ * @offs: offset of the bad block
+ */
+int nand_bbt_markbad_factory(struct nand_bbt *bbt, loff_t offs)
+{
+	/*
+	 * FIXME: For now, we call nand_markbad_bbt() directly. It will change
+	 * when we use struct nand_bbt instead of struct nand_chip.
+	 */
+	return nand_bbt_update_mark(bbt->mtd, offs, BBT_BLOCK_FACTORY_BAD);
+}
+EXPORT_SYMBOL(nand_bbt_markbad_factory);
diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
index c651d95..a0683b0 100644
--- a/include/linux/mtd/nand_bbt.h
+++ b/include/linux/mtd/nand_bbt.h
@@ -192,5 +192,6 @@ void nand_bbt_destroy(struct nand_bbt *bbt);
 int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
 int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
 int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);
+int nand_bbt_markbad_factory(struct nand_bbt *bbt, loff_t offs);
 
 #endif	/* __LINUX_MTD_NAND_BBT_H */
-- 
1.9.1
