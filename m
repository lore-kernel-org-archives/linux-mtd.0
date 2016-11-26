Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050x-QY
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:35 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 11/39] mtd: nand: denali: increment ecc_stats.failed by one
 per error
Date: Sun, 27 Nov 2016 03:05:57 +0900
Message-Id: <1480183585-592-12-git-send-email-yamada.masahiro@socionext.com>
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

If the addressed page is not erased, the two calls of is_erase()
will both return false, then mtd->ecc_stats.failed will be
incremented by two.  Rather, increment it by one because the whole
page including OOB area is transferred in one transaction.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ab59371..ae9a8d2 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1157,9 +1157,8 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		read_oob_data(mtd, chip->oob_poi, denali->page);
 
 		/* check ECC failures that may have occurred on erased pages */
-		if (!is_erased(buf, mtd->writesize))
-			mtd->ecc_stats.failed++;
-		if (!is_erased(chip->oob_poi, mtd->oobsize))
+		if (!is_erased(buf, mtd->writesize) ||
+		    !is_erased(chip->oob_poi, mtd->oobsize))
 			mtd->ecc_stats.failed++;
 	}
 	return max_bitflips;
-- 
2.7.4
