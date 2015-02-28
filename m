Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReEy-00009J-N9
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:03:21 +0000
Received: by pdev10 with SMTP id v10so26947680pde.10
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:02:58 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/7] mtd: nand: denali: drop dead code
Date: Sat, 28 Feb 2015 02:02:28 -0800
Message-Id: <1425117750-22298-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>,
 Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

TclsRising is always 1.

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 drivers/mtd/nand/denali.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f44c6061536a..09f51395f2c0 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -225,7 +225,6 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	uint16_t Twhr[6] = {120, 80, 80, 60, 60, 60};
 	uint16_t Tcs[6] = {70, 35, 25, 25, 20, 15};
 
-	uint16_t TclsRising = 1;
 	uint16_t data_invalid_rhoh, data_invalid_rloh, data_invalid;
 	uint16_t dv_window = 0;
 	uint16_t en_lo, en_hi;
@@ -276,8 +275,6 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	re_2_re = CEIL_DIV(Trhz[mode], CLK_X);
 	we_2_re = CEIL_DIV(Twhr[mode], CLK_X);
 	cs_cnt = CEIL_DIV((Tcs[mode] - Trp[mode]), CLK_X);
-	if (!TclsRising)
-		cs_cnt = CEIL_DIV(Tcs[mode], CLK_X);
 	if (cs_cnt == 0)
 		cs_cnt = 1;
 
-- 
2.1.0
