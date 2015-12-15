Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ifT-0008Jt-6q
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:01:02 +0000
Received: by pacwq6 with SMTP id wq6so12088270pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 22:00:38 -0800 (PST)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fransklaver@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH v2 03/12] mtd: nand_bbt: add new API definitions
Date: Tue, 15 Dec 2015 05:59:29 +0000
Message-Id: <1450159178-29895-4-git-send-email-peterpandong@micron.com>
In-Reply-To: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Brian Norris <computersforpeace@gmail.com>

Add new API definitions for nand_bbt to replace old ones without
any users. These API includes:
	int nand_bbt_init(struct nand_bbt *bbt);
	void nand_bbt_release(struct nand_bbt *bbt);
	int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
	int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
	int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/nand_bbt.c  | 71 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand_bbt.h |  6 ++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 4b6a708..72aed20 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1375,3 +1375,74 @@ int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 }
 
 EXPORT_SYMBOL(nand_scan_bbt);
+
+/**
+ * nand_bbt_init - [NAND BBT Interface] Initialize and locate/create a bad block
+ * table
+ * @bbt: NAND BBT structure
+ *
+ * This function selects the default bad block table support for the device and
+ * scans for an existing table, or else creates one.
+ */
+int nand_bbt_init(struct nand_bbt *bbt)
+{
+	/*
+	 * FIXME: For now, we call nand_default_bbt() directly. It will change
+	 * when we use struct nand_bbt instead of struct nand_chip.
+	 */
+	return nand_default_bbt(bbt->mtd);
+}
+EXPORT_SYMBOL(nand_bbt_init);
+
+void nand_bbt_release(struct nand_bbt *bbt)
+{
+	kfree(bbt->bbt);
+}
+EXPORT_SYMBOL(nand_bbt_release);
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
index e468571..150c49a 100644
--- a/include/linux/mtd/nand_bbt.h
+++ b/include/linux/mtd/nand_bbt.h
@@ -174,4 +174,10 @@ struct nand_bbt {
 	u8 *bbt;
 };
 
+int nand_bbt_init(struct nand_bbt *bbt);
+void nand_bbt_release(struct nand_bbt *bbt);
+int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
+int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
+int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);
+
 #endif	/* __LINUX_MTD_NAND_BBT_H */
-- 
1.9.1
