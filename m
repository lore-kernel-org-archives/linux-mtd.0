Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIb4-0004o2-A4
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:07 +0000
Received: by mail-pa0-x243.google.com with SMTP id hj7so13598598pac.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:46 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 03/11] mtd: nand_bbt: add new API definitions
Date: Mon, 14 Mar 2016 02:47:56 +0000
Message-Id: <1457923684-13505-4-git-send-email-peterpandong@micron.com>
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

Add new API definitions for nand_bbt to replace old ones without
any users. These API includes:
	struct nand_bbt_create(struct mtd_info *mtd);
	struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
				const struct nand_bbt_ops *ops,
				struct nand_chip_layout_info *info,
				unsigned int options,
				struct nand_bbt_descr *bbt_td,
				struct nand_bbt_descr *bbt_md);
	void nand_bbt_destroy(struct nand_bbt *bbt);
	int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
	int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
	int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/nand_bbt.c  | 113 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand_bbt.h |  11 +++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2fbb523..aab734e 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1373,3 +1373,116 @@ int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 
 	return ret;
 }
+
+/**
+ * nand_bbt_init - Initialize and locate/create a bad block table
+ * @bbt: NAND BBT structure
+ *
+ * This function selects the default bad block table support for the device and
+ * scans for an existing table, or else creates one.
+ */
+static int nand_bbt_init(struct nand_bbt *bbt)
+{
+	/*
+	 * FIXME: For now, we call nand_default_bbt() directly. It will change
+	 * when we use struct nand_bbt instead of struct nand_chip.
+	 */
+	return nand_default_bbt(bbt->mtd);
+}
+
+static void nand_bbt_release(struct nand_bbt *bbt)
+{
+	kfree(bbt->bbt);
+}
+
+/**
+ * nand_bbt_create - [NAND BBT Interface] create BBT structures for certain
+ * MTD device
+ * @mtd: MTD structure
+ */
+struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
+			const struct nand_bbt_ops *ops,
+			struct nand_chip_layout_info *info,
+			unsigned int options,
+			struct nand_bbt_descr *bbt_td,
+			struct nand_bbt_descr *bbt_md)
+{
+	struct nand_bbt *bbt = kzalloc(sizeof(struct nand_bbt),
+					GFP_KERNEL);
+	int ret;
+
+	if (!bbt)
+		return ERR_PTR(-ENOMEM);
+
+	bbt->mtd = mtd;
+	bbt->bbt_options = options;
+	bbt->bbt_ops = ops;
+	bbt->info = info;
+	bbt->bbt_td = bbt_td;
+	bbt->bbt_md = bbt_md;
+
+	ret = nand_bbt_init(bbt);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bbt;
+}
+EXPORT_SYMBOL(nand_bbt_create);
+
+/**
+ * nand_bbt_destroy - [NAND BBT Interface] Destroy BBT structures
+ * @bbt: NAND BBT structure
+ */
+void nand_bbt_destroy(struct nand_bbt *bbt)
+{
+	nand_bbt_release(bbt);
+	kfree(bbt);
+}
+EXPORT_SYMBOL(nand_bbt_destroy);
+
+/**
+ * nand_bbt_isreserved - [NAND BBT Interface] Check if a block is reserved
+ * @bbt: NAND BBT structure
+ * @offs: offset in the device
+ */
+int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs)
+{
+	/*
+	 * FIXME: For now, we call nand_isreserved_bbt() directly. It will
+	 * change when we use struct nand_bbt instead of struct nand_chip.
+	 */
+	return nand_isreserved_bbt(bbt->mtd, offs);
+}
+EXPORT_SYMBOL(nand_bbt_isreserved);
+
+/**
+ * nand_bbt_isbad - [NAND BBT Interface] Check if a block is bad
+ * @bbt: NAND BBT structure
+ * @offs: offset in the device
+ */
+int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs)
+{
+	/*
+	 * FIXME: For now, we call nand_isbad_bbt() directly. It will change
+	 * when we use struct nand_bbt instead of struct nand_chip.
+	 * Since we already have nand_bbt_isreserved(), we don't need to
+	 * check pass down allow_bbt.
+	 */
+	return nand_isbad_bbt(bbt->mtd, offs, 1);
+}
+EXPORT_SYMBOL(nand_bbt_isbad);
+
+/**
+ * nand_bbt_markbad - [NAND BBT Interface] Mark a block bad in the BBT
+ * @bbt: NAND BBT structure
+ * @offs: offset of the bad block
+ */
+int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs)
+{
+	/*
+	 * FIXME: For now, we call nand_markbad_bbt() directly. It will change
+	 * when we use struct nand_bbt instead of struct nand_chip.
+	 */
+	return nand_markbad_bbt(bbt->mtd, offs);
+}
+EXPORT_SYMBOL(nand_bbt_markbad);
diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
index cfb22c8..c651d95 100644
--- a/include/linux/mtd/nand_bbt.h
+++ b/include/linux/mtd/nand_bbt.h
@@ -182,4 +182,15 @@ struct nand_bbt {
 	u8 *bbt;
 };
 
+struct nand_bbt *nand_bbt_create(struct mtd_info *mtd,
+		const struct nand_bbt_ops *ops,
+		struct nand_chip_layout_info *info,
+		unsigned int options,
+		struct nand_bbt_descr *bbt_td,
+		struct nand_bbt_descr *bbt_md);
+void nand_bbt_destroy(struct nand_bbt *bbt);
+int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
+int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
+int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);
+
 #endif	/* __LINUX_MTD_NAND_BBT_H */
-- 
1.9.1
