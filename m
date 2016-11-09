Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021k-5Z
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:33:48 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 04/11] mtd: nand: denali: remove detect_partition_feature()
Date: Wed,  9 Nov 2016 13:35:23 +0900
Message-Id: <1478666130-13413-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The denali->fwblks is set by detect_partition_feature(), but it is
not referenced from anywhere.  That means the struct member fwblks
and the whole of detect_partition_feature() are unneeded.

The comment block implies this function is only for Intel platforms.
I found drivers/staging/spectra used to exist, but it was deleted by
commit be7f39c5ecf5 ("Staging: delete spectra driver") 5 years ago.

So, I guess nobody would need this function any more.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 29 -----------------------------
 drivers/mtd/nand/denali.h |  9 ---------
 2 files changed, 38 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d6f1b29..80d3e26 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -473,33 +473,6 @@ static void detect_max_banks(struct denali_nand_info *denali)
 		denali->max_banks = 1 << (features & FEATURES__N_BANKS);
 }
 
-static void detect_partition_feature(struct denali_nand_info *denali)
-{
-	/*
-	 * For MRST platform, denali->fwblks represent the
-	 * number of blocks firmware is taken,
-	 * FW is in protect partition and MTD driver has no
-	 * permission to access it. So let driver know how many
-	 * blocks it can't touch.
-	 */
-	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__PARTITION) {
-		if ((ioread32(denali->flash_reg + PERM_SRC_ID(1)) &
-			PERM_SRC_ID__SRCID) == SPECTRA_PARTITION_ID) {
-			denali->fwblks =
-			    ((ioread32(denali->flash_reg + MIN_MAX_BANK(1)) &
-			      MIN_MAX_BANK__MIN_VALUE) *
-			     denali->blksperchip)
-			    +
-			    (ioread32(denali->flash_reg + MIN_BLK_ADDR(1)) &
-			    MIN_BLK_ADDR__VALUE);
-		} else {
-			denali->fwblks = SPECTRA_START_BLOCK;
-		}
-	} else {
-		denali->fwblks = SPECTRA_START_BLOCK;
-	}
-}
-
 static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 {
 	uint16_t status = PASS;
@@ -551,8 +524,6 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 
 	find_valid_banks(denali);
 
-	detect_partition_feature(denali);
-
 	/*
 	 * If the user specified to override the default timings
 	 * with a specific ONFI mode, we apply those changes here.
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 0ce7344..7c0800d 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -383,14 +383,6 @@
 #define CLK_X  5
 #define CLK_MULTI 4
 
-/* spectraswconfig.h */
-#define CMD_DMA 0
-
-#define SPECTRA_PARTITION_ID    0
-/**** Block Table and Reserved Block Parameters *****/
-#define SPECTRA_START_BLOCK     3
-#define NUM_FREE_BLOCKS_GATE    30
-
 /* KBV - Updated to LNW scratch register address */
 #define SCRATCH_REG_ADDR    CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR
 #define SCRATCH_REG_SIZE    64
@@ -470,7 +462,6 @@ struct denali_nand_info {
 	int irq;
 
 	uint32_t devnum;	/* represent how many nands connected */
-	uint32_t fwblks; /* represent how many blocks FW used */
 	uint32_t totalblks;
 	uint32_t blksperchip;
 	uint32_t bbtskipbytes;
-- 
1.9.1
