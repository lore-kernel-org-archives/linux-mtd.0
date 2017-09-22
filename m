Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvEwJ-0004Ff-3I
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 03:47:45 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 10/12] mtd: nand: denali: remove unneeded init of
 ECC_ENABLE register
Date: Fri, 22 Sep 2017 12:46:47 +0900
Message-Id: <1506052009-8285-11-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ECC correction is properly enabled/disabled before the page
read/write.  There is no need to set up this at the beginning of
the probe.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

This patch may cause a conflict
unless  http://patchwork.ozlabs.org/patch/813125/ is applied first.


Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e567ad9..ee688e0 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1101,8 +1101,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	iowrite32(CHIP_EN_DONT_CARE__FLAG, denali->reg + CHIP_ENABLE_DONT_CARE);
 
 	iowrite32(0xffff, denali->reg + SPARE_AREA_MARKER);
-
-	iowrite32(1, denali->reg + ECC_ENABLE);
 }
 
 int denali_calc_ecc_bytes(int step_size, int strength)
-- 
2.7.4
