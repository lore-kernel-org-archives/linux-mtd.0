Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drx4m-0000PW-Fv
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 02:06:59 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 2/2] mtd: nand: denali: support two row address cycle
 devices
Date: Wed, 13 Sep 2017 11:05:51 +0900
Message-Id: <1505268351-31941-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1505268351-31941-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505268351-31941-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The register TWO_ROW_ADDR_CYCLES specifies the number of row address
cycles of the device, but it is fixed to 0 in the driver init code
(i.e. always 3 row address cycles).

Reflect the result of nand_scan_ident() to the register setting
in order to support 2 row address cycle devices.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3087b0b..aefdc83 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1137,8 +1137,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 
 	iowrite32(0xffff, denali->reg + SPARE_AREA_MARKER);
 
-	/* Should set value for these registers when init */
-	iowrite32(0, denali->reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(1, denali->reg + ECC_ENABLE);
 }
 
@@ -1379,6 +1377,8 @@ int denali_init(struct denali_nand_info *denali)
 		  denali->reg + PAGES_PER_BLOCK);
 	iowrite32(chip->options & NAND_BUSWIDTH_16 ? 1 : 0,
 		  denali->reg + DEVICE_WIDTH);
+	iowrite32(chip->options & NAND_ROW_ADDR_3 ? 0 : TWO_ROW_ADDR_CYCLES__FLAG,
+		  denali->reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(mtd->writesize, denali->reg + DEVICE_MAIN_AREA_SIZE);
 	iowrite32(mtd->oobsize, denali->reg + DEVICE_SPARE_AREA_SIZE);
 
-- 
2.7.4
