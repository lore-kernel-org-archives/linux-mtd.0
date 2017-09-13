Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds07J-0006Xq-NK
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 05:21:53 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 6/9] mtd: nand: denali: clean up macros with <linux/bitfield.h>
Date: Wed, 13 Sep 2017 14:20:43 +0900
Message-Id: <1505280046-16608-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1505280046-16608-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505280046-16608-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All the register offsets and bitfield masks are defined in denali.h,
but the driver code ended up with additional crappy macros such as
MAKE_ECC_CORRECTION(), ECC_SECTOR(), etc.

The reason is apparent - accessing a register field requires mask and
shift pair.  The denali.h only provides mask.  However, defining both
is tedious.

<linux/bitfield.h> provides a convenient way to get register fields
only with a single shifted mask.  Now use it.

While I am here, I shortened some macros.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 25 +++++++++++--------------
 drivers/mtd/nand/denali.h | 13 +++++--------
 2 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3cc56de..1525c4e 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -17,6 +17,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
@@ -386,13 +387,6 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-#define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
-#define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
-#define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
-#define ECC_ERROR_UNCORRECTABLE(x) ((x) & ERR_CORRECTION_INFO__ERROR_TYPE)
-#define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
-#define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
-
 static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			       struct denali_nand_info *denali,
 			       unsigned long *uncor_ecc_flags, uint8_t *buf)
@@ -410,18 +404,20 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 
 	do {
 		err_addr = ioread32(denali->reg + ECC_ERROR_ADDRESS);
-		err_sector = ECC_SECTOR(err_addr);
-		err_byte = ECC_BYTE(err_addr);
+		err_sector = FIELD_GET(ECC_ERROR_ADDRESS__SECTOR, err_addr);
+		err_byte = FIELD_GET(ECC_ERROR_ADDRESS__OFFSET, err_addr);
 
 		err_cor_info = ioread32(denali->reg + ERR_CORRECTION_INFO);
-		err_cor_value = ECC_CORRECTION_VALUE(err_cor_info);
-		err_device = ECC_ERR_DEVICE(err_cor_info);
+		err_cor_value = FIELD_GET(ERR_CORRECTION_INFO__BYTE,
+					  err_cor_info);
+		err_device = FIELD_GET(ERR_CORRECTION_INFO__DEVICE,
+				       err_cor_info);
 
 		/* reset the bitflip counter when crossing ECC sector */
 		if (err_sector != prev_sector)
 			bitflips = 0;
 
-		if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
+		if (err_cor_info & ERR_CORRECTION_INFO__UNCOR) {
 			/*
 			 * Check later if this is a real ECC error, or
 			 * an erased sector.
@@ -451,7 +447,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 		}
 
 		prev_sector = err_sector;
-	} while (!ECC_LAST_ERR(err_cor_info));
+	} while (!(err_cor_info & ERR_CORRECTION_INFO__LAST_ERR));
 
 	/*
 	 * Once handle all ecc errors, controller will trigger a
@@ -1351,7 +1347,8 @@ int denali_init(struct denali_nand_info *denali)
 		"chosen ECC settings: step=%d, strength=%d, bytes=%d\n",
 		chip->ecc.size, chip->ecc.strength, chip->ecc.bytes);
 
-	iowrite32(MAKE_ECC_CORRECTION(chip->ecc.strength, 1),
+	iowrite32(FIELD_PREP(ECC_CORRECTION__ERASE_THRESHOLD, 1) |
+		  FIELD_PREP(ECC_CORRECTION__VALUE, chip->ecc.strength),
 		  denali->reg + ECC_CORRECTION);
 	iowrite32(mtd->erasesize / mtd->writesize,
 		  denali->reg + PAGES_PER_BLOCK);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index dc3f970..73aad3a 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -114,9 +114,6 @@
 #define ECC_CORRECTION				0x1b0
 #define     ECC_CORRECTION__VALUE			GENMASK(4, 0)
 #define     ECC_CORRECTION__ERASE_THRESHOLD		GENMASK(31, 16)
-#define     MAKE_ECC_CORRECTION(val, thresh)		\
-			(((val) & (ECC_CORRECTION__VALUE)) | \
-			(((thresh) << 16) & (ECC_CORRECTION__ERASE_THRESHOLD)))
 
 #define READ_MODE				0x1c0
 #define     READ_MODE__VALUE				GENMASK(3, 0)
@@ -258,13 +255,13 @@
 
 #define ECC_ERROR_ADDRESS			0x630
 #define     ECC_ERROR_ADDRESS__OFFSET			GENMASK(11, 0)
-#define     ECC_ERROR_ADDRESS__SECTOR_NR		GENMASK(15, 12)
+#define     ECC_ERROR_ADDRESS__SECTOR			GENMASK(15, 12)
 
 #define ERR_CORRECTION_INFO			0x640
-#define     ERR_CORRECTION_INFO__BYTEMASK		GENMASK(7, 0)
-#define     ERR_CORRECTION_INFO__DEVICE_NR		GENMASK(11, 8)
-#define     ERR_CORRECTION_INFO__ERROR_TYPE		BIT(14)
-#define     ERR_CORRECTION_INFO__LAST_ERR_INFO		BIT(15)
+#define     ERR_CORRECTION_INFO__BYTE			GENMASK(7, 0)
+#define     ERR_CORRECTION_INFO__DEVICE			GENMASK(11, 8)
+#define     ERR_CORRECTION_INFO__UNCOR			BIT(14)
+#define     ERR_CORRECTION_INFO__LAST_ERR		BIT(15)
 
 #define ECC_COR_INFO(bank)			(0x650 + (bank) / 2 * 0x10)
 #define     ECC_COR_INFO__SHIFT(bank)			((bank) % 2 * 8)
-- 
2.7.4
