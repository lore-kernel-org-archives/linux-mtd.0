Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds07J-0006Xr-NG
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 05:21:51 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 9/9] mtd: nand: denali: remove unneeded init of ECC_ENABLE
 register
Date: Wed, 13 Sep 2017 14:20:46 +0900
Message-Id: <1505280046-16608-10-git-send-email-yamada.masahiro@socionext.com>
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

The ECC correction is properly enabled/disabled before the page
read/write.  There is no need to set up this at the beginning of
the probe.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 02ce310..7a2ad47 100644
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
