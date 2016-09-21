Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme5T-0004b1-FU
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:45:09 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, Richard Weinberger <richard@nod.at>,
 Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH v2 02/46] mtd: nand: Provide nand_cleanup() function to free
 NAND related resources
Date: Wed, 21 Sep 2016 11:44:41 +0200
Message-Id: <8b9dd116b40fb7965a29fe0d051bd8b85e3f036b.1474450295.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Provide a nand_cleanup() function to free all nand related resources
without unregistering the mtd device.
This should allow drivers to call mtd_device_unregister() and handle
its return value and still being able to cleanup all nand related
resources.

Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 drivers/mtd/nand/nand_base.c | 18 +++++++++++++-----
 include/linux/mtd/nand.h     |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77533f7..e743052 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4601,10 +4601,10 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 EXPORT_SYMBOL(nand_scan);
 
 /**
- * nand_release - [NAND Interface] Free resources held by the NAND device
- * @mtd: MTD device structure
+ * nand_cleanup - [NAND Interface] Free resources held by the NAND device
+ * @mts: MTD device structure
  */
-void nand_release(struct mtd_info *mtd)
+void nand_cleanup(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
@@ -4612,8 +4612,6 @@ void nand_release(struct mtd_info *mtd)
 	    chip->ecc.algo == NAND_ECC_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
-	mtd_device_unregister(mtd);
-
 	/* Free bad block table memory */
 	kfree(chip->bbt);
 	if (!(chip->options & NAND_OWN_BUFFERS))
@@ -4624,6 +4622,16 @@ void nand_release(struct mtd_info *mtd)
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
 }
+
+/**
+ * nand_release - [NAND Interface] Free resources held by the NAND device
+ * @mtd: MTD device structure
+ */
+void nand_release(struct mtd_info *mtd)
+{
+	mtd_device_unregister(mtd);
+	nand_cleanup(mtd);
+}
 EXPORT_SYMBOL_GPL(nand_release);
 
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8dd6e01..c692c06 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -39,6 +39,7 @@ extern int nand_scan_ident(struct mtd_info *mtd, int max_chips,
 extern int nand_scan_tail(struct mtd_info *mtd);
 
 /* Free resources held by the NAND device */
+extern void nand_cleanup(struct mtd_info *mtd);
 extern void nand_release(struct mtd_info *mtd);
 
 /* Internal helper for board drivers which need to override command function */
-- 
2.8.3
