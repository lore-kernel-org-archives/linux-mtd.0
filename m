Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIb2-0004o1-RK
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:05 +0000
Received: by mail-pf0-x243.google.com with SMTP id u190so8810332pfb.2
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:44 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 02/11] mtd: nand_bbt: introduce BBT related data structure
Date: Mon, 14 Mar 2016 02:47:55 +0000
Message-Id: <1457923684-13505-3-git-send-email-peterpandong@micron.com>
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

From: Brian Norris <computersforpeace@gmail.com>

Currently nand_bbt.c is tied with struct nand_chip, and it makes other
NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
onenand has own bbt(onenand_bbt.c).

Separate struct nand_chip from BBT code can make current BBT shareable.
We create struct nand_bbt to take place of nand_chip in nand_bbt.c

Below is mtd folder structure we want:
	drivers/mtd/nand/<all-nand-core-code>
	drivers/mtd/nand/raw/<raw-nand-controller-drivers>
	drivers/mtd/nand/spi/<spi-nand-code>
	drivers/mtd/nand/onenand/<onenand-code>
	drivers/mtd/nand/chips/<manufacturer-spcific-code>

Of course, nand_bbt.c should be part of <all-nand-core-code>.

We put every chip layout related information BBT needed into struct
nand_chip_layout_info.
	@numchips:	number of physical chips, required for NAND_BBT_PERCHIP
	@chipsize:	the size of one chip for multichip arrays
	@chip_shift:	number of address bits in one chip
	@bbt_erase_shift:	number of address bits in a bbt entry
	@page_shift:	number of address bits in a page

We defined a struct nand_bbt_ops for BBT ops. Struct
	@is_bad_bbm:	check if a block is factory bad block
	@erase:	erase block bypassing resvered checks

Struct nand_bbt includes all BBT information:
	@mtd:	pointer to MTD device structure
	@bbt_options:	bad block specific options. All options used
			here must come from nand_bbt.h.
	@bbt_ops:	struct nand_bbt_ops pointer.
	@info:		struct nand_chip_layout_info pointer.
	@bbt_td:	bad block table descriptor for flash lookup.
	@bbt_md:	bad block table mirror descriptor
	@bbt:		bad block table pointer

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
[Peter: 1. correct comment style
	2. introduce struct nand_bbt_ops and nand_chip_layout_info]
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/nand_bbt.h | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
index 5a65230..cfb22c8 100644
--- a/include/linux/mtd/nand_bbt.h
+++ b/include/linux/mtd/nand_bbt.h
@@ -18,6 +18,8 @@
 #ifndef __LINUX_MTD_NAND_BBT_H
 #define __LINUX_MTD_NAND_BBT_H
 
+struct mtd_info;
+
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
 
@@ -115,4 +117,69 @@ struct nand_bbt_descr {
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
 
+struct nand_bbt;
+
+/**
+ * struct nand_bbt_ops - bad block table operations
+ * @is_bad_bbm:	check if a block is factory bad block
+ * @erase:	erase block bypassing resvered checks
+ */
+struct nand_bbt_ops {
+	/*
+	 * This is important to abstract out of nand_bbt.c and provide
+	 * separately in nand_base.c and spi-nand-base.c -- it's sort of
+	 * duplicated in nand_block_bad() (nand_base) and
+	 * scan_block_fast() (nand_bbt) right now
+	 *
+	 * Note that this also means nand_chip.badblock_pattern should
+	 * be removed from nand_bbt.c
+	 */
+	int (*is_bad_bbm)(struct mtd_info *mtd, loff_t ofs);
+
+	/* Erase a block, bypassing reserved checks */
+	int (*erase)(struct mtd_info *mtd, loff_t ofs);
+};
+
+/**
+ * struct nand_chip_layout_info - strucure contains all chip layout
+ * information that BBT needed.
+ * @numchips:	number of physical chips, required for NAND_BBT_PERCHIP
+ * @chipsize:	the size of one chip for multichip arrays
+ * @chip_shift:	number of address bits in one chip
+ * @bbt_erase_shift:	number of address bits in a bbt entry
+ * @page_shift:	number of address bits in a page
+ */
+struct nand_chip_layout_info {
+	int numchips;
+	u64 chipsize;
+	int chip_shift;
+	int bbt_erase_shift;
+	int page_shift;
+};
+
+/**
+ * struct nand_bbt - bad block table structure
+ * @mtd:	pointer to MTD device structure
+ * @bbt_options:	bad block specific options. All options used
+ *			here must come from nand_bbt.h.
+ * @bbt_ops:	struct nand_bbt_ops pointer.
+ * @info:	struct nand_chip_layout_info pointer.
+ * @bbt_td:	bad block table descriptor for flash lookup.
+ * @bbt_md:	bad block table mirror descriptor
+ * @bbt:	bad block table pointer
+ */
+struct nand_bbt {
+	struct mtd_info *mtd;
+	unsigned int bbt_options;
+	const struct nand_bbt_ops *bbt_ops;
+	struct nand_chip_layout_info *info;
+	/*
+	 * Discourage new custom usages here; suggest usage of the
+	 * relevant NAND_BBT_* options instead
+	 */
+	struct nand_bbt_descr *bbt_td;
+	struct nand_bbt_descr *bbt_md;
+	u8 *bbt;
+};
+
 #endif	/* __LINUX_MTD_NAND_BBT_H */
-- 
1.9.1
