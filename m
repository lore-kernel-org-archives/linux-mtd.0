Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds07J-0006Xm-ND
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 05:21:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/9] mtd: nand: denali: prefix detect_max_banks() with denali_
Date: Wed, 13 Sep 2017 14:20:39 +0900
Message-Id: <1505280046-16608-3-git-send-email-yamada.masahiro@socionext.com>
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

All functions in this driver are prefixed with denali_
except detect_max_banks().  Rename it for consistency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d847ae4..48193f9 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -81,7 +81,7 @@ static void denali_host_write(struct denali_nand_info *denali,
  * Use the configuration feature register to determine the maximum number of
  * banks that the hardware supports.
  */
-static void detect_max_banks(struct denali_nand_info *denali)
+static void denali_detect_max_banks(struct denali_nand_info *denali)
 {
 	uint32_t features = ioread32(denali->reg + FEATURES);
 
@@ -1115,7 +1115,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	 * if this value is 0, just let it be.
 	 */
 	denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
-	detect_max_banks(denali);
+	denali_detect_max_banks(denali);
 	iowrite32(0x0F, denali->reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG, denali->reg + CHIP_ENABLE_DONT_CARE);
 
-- 
2.7.4
