Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4KaF-00023D-Gp
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:34:01 +0000
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
Subject: [PATCH 11/11] mtd: nand: denali: remove debug lines of __FILE__,
 __LINE__, __func__
Date: Wed,  9 Nov 2016 13:35:30 +0900
Message-Id: <1478666130-13413-12-git-send-email-yamada.masahiro@socionext.com>
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

Such debug lines might be useful when debugging the driver first,
but should be deleted from the upstream code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 14e66ab..e32e13c 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -181,9 +181,6 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
 	int i;
 
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		__FILE__, __LINE__, __func__);
-
 	for (i = 0; i < denali->max_banks; i++)
 		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
 		denali->flash_reg + INTR_STATUS(i));
@@ -233,9 +230,6 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	uint16_t acc_clks;
 	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
 
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		__FILE__, __LINE__, __func__);
-
 	en_lo = CEIL_DIV(Trp[mode], CLK_X);
 	en_hi = CEIL_DIV(Treh[mode], CLK_X);
 #if ONFI_BLOOM_TIME
@@ -480,9 +474,6 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 	uint8_t maf_id, device_id;
 	int i;
 
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-			__FILE__, __LINE__, __func__);
-
 	/*
 	 * Use read id method to get device ID and other params.
 	 * For some NAND chips, controller can't report the correct
@@ -537,9 +528,6 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 static void denali_set_intr_modes(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
-	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
-		__FILE__, __LINE__, __func__);
-
 	if (INT_ENABLE)
 		iowrite32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
 	else
-- 
1.9.1
