Received: from conuserg-11.nifty.com ([210.131.2.78])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOB-0006Oa-St
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 32/39] mtd: nand: denali: remove unnecessary writes to
 ECC_CORRECTION
Date: Sun, 27 Nov 2016 03:06:18 +0900
Message-Id: <1480183585-592-33-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Because SUPPORT_15BITECC is defined, the following is dead code:

  #elif SUPPORT_8BITECC
          iowrite32(8, denali->flash_reg + ECC_CORRECTION);
  #endif

Such ifdefs are useless and unacceptable coding style.

These writes are not needed in the first place since ECC_CORRECTION
is set up by the nand_init() function.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 15 +--------------
 drivers/mtd/nand/denali.h |  3 ---
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 9193331..63f7500 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -62,8 +62,6 @@ MODULE_PARM_DESC(onfi_timing_mode,
  */
 #define CHIP_SELECT_INVALID	-1
 
-#define SUPPORT_8BITECC		1
-
 /*
  * This macro divides two integers and rounds fractional values up
  * to the nearest integer value.
@@ -347,14 +345,8 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
 	 * spare area size for some kind of Toshiba NAND device
 	 */
 	if ((ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE) == 4096) &&
-		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) == 64)) {
+		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) == 64))
 		iowrite32(216, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-#if SUPPORT_15BITECC
-		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-#elif SUPPORT_8BITECC
-		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
-#endif
-	}
 }
 
 static void get_hynix_nand_para(struct denali_nand_info *denali, u8 device_id)
@@ -366,11 +358,6 @@ static void get_hynix_nand_para(struct denali_nand_info *denali, u8 device_id)
 		iowrite32(4096, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
 		iowrite32(224, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
 		iowrite32(0, denali->flash_reg + DEVICE_WIDTH);
-#if SUPPORT_15BITECC
-		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-#elif SUPPORT_8BITECC
-		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
-#endif
 		break;
 	default:
 		dev_warn(denali->dev,
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index e3fe3bc..d621b74 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -387,9 +387,6 @@
 #define CLK_X  5
 #define CLK_MULTI 4
 
-#define SUPPORT_15BITECC        1
-#define SUPPORT_8BITECC         1
-
 #define ONFI_BLOOM_TIME         1
 #define MODE5_WORKAROUND        0
 
-- 
2.7.4
