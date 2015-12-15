Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ifS-0008Jr-1B
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:01:00 +0000
Received: by pfee66 with SMTP id e66so2960225pfe.1
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 22:00:36 -0800 (PST)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fransklaver@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH v2 02/12] mtd: nand_bbt: introduce struct nand_bbt
Date: Tue, 15 Dec 2015 05:59:28 +0000
Message-Id: <1450159178-29895-3-git-send-email-peterpandong@micron.com>
In-Reply-To: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	mtd
	├── Kconfig
	├── Makefile
	├── ...
	├── nand_bbt.c
	├── nand
	│   ├── Kconfig
	│   ├── Makefile
	│   ├── nand_base.c
	│   ├── nand_ids.c
	│   ├── ...
	│   └── xway_nand.c
	├── spi-nand
	│   ├── Kconfig
	│   ├── Makefile
	│   ├── spi-nand-base.c
	│   ├── ...
	│   └── spi-nand-device.c
	└── ...

We put every information nand_bbt.c needed from outside into struct
nand_bbt, include:
	@mtd:	pointer to MTD device structure
	@is_bad_bbm:	check if a block is factory bad block
	@mark_bad_bbm:	imitate a block as factory bad block
	@erase:	erase block bypassing resvered checks
	@bbt_options:	bad block specific options. All options used
			here must come from nand_bbt.h.
	@numchips:	number of physical chips, required for NAND_BBT_PERCHIP
	@bbt_td:	bad block table descriptor for flash lookup.
	@bbt_md:	bad block table mirror descriptor
	@chipsize:	the size of one chip for multichip arrays
	@chip_shift:	number of address bits in one chip
	@bbt_erase_shift:	number of address bits in a bbt entry
	@page_shift:	number of address bits in a page
	@bbt:	bad block table pointer

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
[Peter: correct comment style]
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/nand_bbt.h | 59 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
index 5a65230..e468571 100644
--- a/include/linux/mtd/nand_bbt.h
+++ b/include/linux/mtd/nand_bbt.h
@@ -18,6 +18,8 @@
 #ifndef __LINUX_MTD_NAND_BBT_H
 #define __LINUX_MTD_NAND_BBT_H
 
+struct mtd_info;
+
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
 
@@ -115,4 +117,61 @@ struct nand_bbt_descr {
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
 
+/**
+ * struct nand_bbt - bad block table structure
+ * @mtd:	pointer to MTD device structure
+ * @is_bad_bbm:	check if a block is factory bad block
+ * @mark_bad_bbm:	imitate a block as factory bad block
+ * @erase:	erase block bypassing resvered checks
+ * @bbt_options:	bad block specific options. All options used
+ *			here must come from nand_bbt.h.
+ * @numchips:	number of physical chips, required for NAND_BBT_PERCHIP
+ * @bbt_td:	bad block table descriptor for flash lookup.
+ * @bbt_md:	bad block table mirror descriptor
+ * @chipsize:	the size of one chip for multichip arrays
+ * @chip_shift:	number of address bits in one chip
+ * @bbt_erase_shift:	number of address bits in a bbt entry
+ * @page_shift:	number of address bits in a page
+ * @bbt:	bad block table pointer
+ *
+ */
+struct nand_bbt {
+	struct mtd_info *mtd;
+
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
+	/*
+	 * Only required if the driver wants to attempt to program new
+	 * bad block markers that imitate the factory-marked BBMs
+	 */
+	int (*mark_bad_bbm)(struct mtd_info *mtd, loff_t ofs);
+
+	/* Erase a block, bypassing reserved checks */
+	int (*erase)(struct mtd_info *mtd, loff_t ofs);
+
+	unsigned int bbt_options;
+	int numchips;
+
+	/*
+	 * Discourage new custom usages here; suggest usage of the
+	 * relevant NAND_BBT_* options instead
+	 */
+	struct nand_bbt_descr *bbt_td;
+	struct nand_bbt_descr *bbt_md;
+	u64 chipsize;
+	int chip_shift;
+	int bbt_erase_shift;
+	int page_shift;
+	u8 *bbt;
+};
+
 #endif	/* __LINUX_MTD_NAND_BBT_H */
-- 
1.9.1
