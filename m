Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050r-Qe
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:32 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 10/39] mtd: nand: denali: remove redundant if conditional of
 erased_check
Date: Sun, 27 Nov 2016 03:05:56 +0900
Message-Id: <1480183585-592-11-git-send-email-yamada.masahiro@socionext.com>
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

This code block is nested by double "if (check_erase_page)".
Remove the redundant inner one.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 753e9a02..ab59371 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1157,12 +1157,10 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		read_oob_data(mtd, chip->oob_poi, denali->page);
 
 		/* check ECC failures that may have occurred on erased pages */
-		if (check_erased_page) {
-			if (!is_erased(buf, mtd->writesize))
-				mtd->ecc_stats.failed++;
-			if (!is_erased(chip->oob_poi, mtd->oobsize))
-				mtd->ecc_stats.failed++;
-		}
+		if (!is_erased(buf, mtd->writesize))
+			mtd->ecc_stats.failed++;
+		if (!is_erased(chip->oob_poi, mtd->oobsize))
+			mtd->ecc_stats.failed++;
 	}
 	return max_bitflips;
 }
-- 
2.7.4
