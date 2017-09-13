Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds07J-0006Xn-NM
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 05:21:51 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 7/9] mtd: nand: denali: use more FIELD_PREP / FIELD_GET where
 appropriate
Date: Wed, 13 Sep 2017 14:20:44 +0900
Message-Id: <1505280046-16608-8-git-send-email-yamada.masahiro@socionext.com>
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

In several places in this driver, the register fields are retrieved
as follows:

  val = reg & FOO_MASK;

Then, modified as follows:

  reg &= ~FOO_MASK;
  reg |= val;

This code relies on its shift is 0, which we will never know until
we check the definition of FOO_MASK.  Use FIELD_PREP / FIELD_GET
where appropriate.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 1525c4e..ca98015 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -88,7 +88,7 @@ static void denali_detect_max_banks(struct denali_nand_info *denali)
 {
 	uint32_t features = ioread32(denali->reg + FEATURES);
 
-	denali->max_banks = 1 << (features & FEATURES__N_BANKS);
+	denali->max_banks = 1 << FIELD_GET(FEATURES__N_BANKS, features);
 
 	/* the encoding changed from rev 5.0 to 5.1 */
 	if (denali->revision < 0x0501)
@@ -374,7 +374,7 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 		return 0;
 	}
 
-	max_bitflips = ecc_cor & ECC_COR_INFO__MAX_ERRORS;
+	max_bitflips = FIELD_GET(ECC_COR_INFO__MAX_ERRORS, ecc_cor);
 
 	/*
 	 * The register holds the maximum of per-sector corrected bitflips.
@@ -985,7 +985,7 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 
 	tmp = ioread32(denali->reg + ACC_CLKS);
 	tmp &= ~ACC_CLKS__VALUE;
-	tmp |= acc_clks;
+	tmp |= FIELD_PREP(ACC_CLKS__VALUE, acc_clks);
 	iowrite32(tmp, denali->reg + ACC_CLKS);
 
 	/* tRWH -> RE_2_WE */
@@ -994,7 +994,7 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 
 	tmp = ioread32(denali->reg + RE_2_WE);
 	tmp &= ~RE_2_WE__VALUE;
-	tmp |= re_2_we;
+	tmp |= FIELD_PREP(RE_2_WE__VALUE, re_2_we);
 	iowrite32(tmp, denali->reg + RE_2_WE);
 
 	/* tRHZ -> RE_2_RE */
@@ -1003,7 +1003,7 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 
 	tmp = ioread32(denali->reg + RE_2_RE);
 	tmp &= ~RE_2_RE__VALUE;
-	tmp |= re_2_re;
+	tmp |= FIELD_PREP(RE_2_RE__VALUE, re_2_re);
 	iowrite32(tmp, denali->reg + RE_2_RE);
 
 	/* tWHR -> WE_2_RE */
@@ -1012,7 +1012,7 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 
 	tmp = ioread32(denali->reg + TWHR2_AND_WE_2_RE);
 	tmp &= ~TWHR2_AND_WE_2_RE__WE_2_RE;
-	tmp |= we_2_re;
+	tmp |= FIELD_PREP(TWHR2_AND_WE_2_RE__WE_2_RE, we_2_re);
 	iowrite32(tmp, denali->reg + TWHR2_AND_WE_2_RE);
 
 	/* tADL -> ADDR_2_DATA */
@@ -1026,8 +1026,8 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	addr_2_data = min_t(int, addr_2_data, addr_2_data_mask);
 
 	tmp = ioread32(denali->reg + TCWAW_AND_ADDR_2_DATA);
-	tmp &= ~addr_2_data_mask;
-	tmp |= addr_2_data;
+	tmp &= ~TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA;
+	tmp |= FIELD_PREP(TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA, addr_2_data);
 	iowrite32(tmp, denali->reg + TCWAW_AND_ADDR_2_DATA);
 
 	/* tREH, tWH -> RDWR_EN_HI_CNT */
@@ -1037,7 +1037,7 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 
 	tmp = ioread32(denali->reg + RDWR_EN_HI_CNT);
 	tmp &= ~RDWR_EN_HI_CNT__VALUE;
-	tmp |= rdwr_en_hi;
+	tmp |= FIELD_PREP(RDWR_EN_HI_CNT__VALUE, rdwr_en_hi);
 	iowrite32(tmp, denali->reg + RDWR_EN_HI_CNT);
 
 	/* tRP, tWP -> RDWR_EN_LO_CNT */
@@ -1051,7 +1051,7 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 
 	tmp = ioread32(denali->reg + RDWR_EN_LO_CNT);
 	tmp &= ~RDWR_EN_LO_CNT__VALUE;
-	tmp |= rdwr_en_lo;
+	tmp |= FIELD_PREP(RDWR_EN_LO_CNT__VALUE, rdwr_en_lo);
 	iowrite32(tmp, denali->reg + RDWR_EN_LO_CNT);
 
 	/* tCS, tCEA -> CS_SETUP_CNT */
@@ -1062,7 +1062,7 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 
 	tmp = ioread32(denali->reg + CS_SETUP_CNT);
 	tmp &= ~CS_SETUP_CNT__VALUE;
-	tmp |= cs_setup;
+	tmp |= FIELD_PREP(CS_SETUP_CNT__VALUE, cs_setup);
 	iowrite32(tmp, denali->reg + CS_SETUP_CNT);
 
 	return 0;
-- 
2.7.4
