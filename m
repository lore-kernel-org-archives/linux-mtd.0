Received: from mail-ig0-f173.google.com ([209.85.213.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMcZG-0004ui-ID
 for linux-mtd@lists.infradead.org; Wed, 27 Aug 2014 12:43:15 +0000
Received: by mail-ig0-f173.google.com with SMTP id h18so6136989igc.12
 for <linux-mtd@lists.infradead.org>; Wed, 27 Aug 2014 05:42:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] mtd: nand: stm_nand_bch: adding BBT header
Date: Wed, 27 Aug 2014 13:42:22 +0100
Message-Id: <1409143344-22458-8-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1409143344-22458-1-git-send-email-lee.jones@linaro.org>
References: <1409143344-22458-1-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 kernel@stlinux.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This header will be used firstly by the BCH main driver, then the
Bad Block Table (BBT) code which will be added immediately after.
Doing it this way provides the cleanest method of keeping the
patch-set bisectable.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mtd/stm_nand_bbt.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/linux/mtd/stm_nand_bbt.h

diff --git a/include/linux/mtd/stm_nand_bbt.h b/include/linux/mtd/stm_nand_bbt.h
new file mode 100644
index 0000000..bcb33b2
--- /dev/null
+++ b/include/linux/mtd/stm_nand_bbt.h
@@ -0,0 +1,17 @@
+#include <linux/mtd/stm_nand.h>
+
+/* BCH ECC sizes */
+static int bch_ecc_sizes[] = {
+	[BCH_18BIT_ECC] = 32,
+	[BCH_30BIT_ECC] = 54,
+	[BCH_NO_ECC] = 0,
+};
+
+#if defined(CONFIG_MTD_NAND_STM_BCH_BBT)
+extern void nandi_dump_bad_blocks(struct nandi_controller *nandi);
+extern int bch_scan_bbt(struct mtd_info *mtd);
+extern int bch_block_isbad(struct mtd_info *mtd, loff_t offs, int getchip);
+extern int bch_block_markbad(struct mtd_info *mtd, loff_t offs);
+#else
+inline void nandi_dump_bad_blocks(struct nandi_controller *nandi) {}
+#endif
-- 
1.9.1
