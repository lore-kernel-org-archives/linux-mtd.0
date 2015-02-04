From: Nicholas Mc Guire <hofrat@osadl.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: omap: conditions with no effect
Date: Wed,  4 Feb 2015 04:27:39 -0500
Message-Id: <1423042059-22416-1-git-send-email-hofrat@osadl.org>
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, Rostislav Lisovy <lisovy@gmail.com>,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>, pekon gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The if and the else branch code are identical - so the condition has no
effect on the effective code - this patch removes the condition and the
duplicated code.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

The conditions in the OMAP_ECC_BCH8_CODE_HW_DETECTION_SW and
OMAP_ECC_BCH4_CODE_HW_DETECTION_SW case have no effect and can
be removed. As there are no comments it is not possible to say
if this is the correct solution or if this is actually a bug and
the two branches should be different.

This patch needs a review by someone who knows the details of the driver

Patch was only compile tested with arm-linux-gnueabi-4.7-, current
crosstool-ng did no not seem to compile omap2 properly.
Config is omap2plus_defconfig which implies CONFIG_MTD_NAND_OMAP2=y.

Patch is against 3.19.0-rc6 (localversion-next is -next-20150203)

 drivers/mtd/nand/omap2.c |   24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 63f858e..5bcdd66 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1071,15 +1071,9 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
 		bch_type = 0;
 		nsectors = 1;
-		if (mode == NAND_ECC_READ) {
-			wr_mode	  = BCH_WRAPMODE_6;
-			ecc_size0 = BCH_ECC_SIZE0;
-			ecc_size1 = BCH_ECC_SIZE1;
-		} else {
-			wr_mode   = BCH_WRAPMODE_6;
-			ecc_size0 = BCH_ECC_SIZE0;
-			ecc_size1 = BCH_ECC_SIZE1;
-		}
+		wr_mode	  = BCH_WRAPMODE_6;
+		ecc_size0 = BCH_ECC_SIZE0;
+		ecc_size1 = BCH_ECC_SIZE1;
 		break;
 	case OMAP_ECC_BCH4_CODE_HW:
 		bch_type = 0;
@@ -1097,15 +1091,9 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
 		bch_type = 1;
 		nsectors = 1;
-		if (mode == NAND_ECC_READ) {
-			wr_mode	  = BCH_WRAPMODE_6;
-			ecc_size0 = BCH_ECC_SIZE0;
-			ecc_size1 = BCH_ECC_SIZE1;
-		} else {
-			wr_mode   = BCH_WRAPMODE_6;
-			ecc_size0 = BCH_ECC_SIZE0;
-			ecc_size1 = BCH_ECC_SIZE1;
-		}
+		wr_mode	  = BCH_WRAPMODE_6;
+		ecc_size0 = BCH_ECC_SIZE0;
+		ecc_size1 = BCH_ECC_SIZE1;
 		break;
 	case OMAP_ECC_BCH8_CODE_HW:
 		bch_type = 1;
-- 
1.7.10.4
