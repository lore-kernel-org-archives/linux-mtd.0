Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4KaF-00023P-GW
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
Subject: [PATCH 10/11] mtd: nand: denali: remove unneeded parentheses
Date: Wed,  9 Nov 2016 13:35:29 +0900
Message-Id: <1478666130-13413-11-git-send-email-yamada.masahiro@socionext.com>
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

Remove parentheses surrounding the whole right side of an assignment.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d482d8d..14e66ab 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1510,16 +1510,16 @@ int denali_init(struct denali_nand_info *denali)
 	 * the real pagesize and anything necessery
 	 */
 	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
-	denali->nand.chipsize <<= (denali->devnum - 1);
-	denali->nand.page_shift += (denali->devnum - 1);
+	denali->nand.chipsize <<= denali->devnum - 1;
+	denali->nand.page_shift += denali->devnum - 1;
 	denali->nand.pagemask = (denali->nand.chipsize >>
 						denali->nand.page_shift) - 1;
-	denali->nand.bbt_erase_shift += (denali->devnum - 1);
+	denali->nand.bbt_erase_shift += denali->devnum - 1;
 	denali->nand.phys_erase_shift = denali->nand.bbt_erase_shift;
-	denali->nand.chip_shift += (denali->devnum - 1);
-	mtd->writesize <<= (denali->devnum - 1);
-	mtd->oobsize <<= (denali->devnum - 1);
-	mtd->erasesize <<= (denali->devnum - 1);
+	denali->nand.chip_shift += denali->devnum - 1;
+	mtd->writesize <<= denali->devnum - 1;
+	mtd->oobsize <<= denali->devnum - 1;
+	mtd->erasesize <<= denali->devnum - 1;
 	mtd->size = denali->nand.numchips * denali->nand.chipsize;
 	denali->bbtskipbytes *= denali->devnum;
 
-- 
1.9.1
