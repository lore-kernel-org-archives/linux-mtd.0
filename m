Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050u-QX
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
Subject: [PATCH 12/39] mtd: nand: denali: return 0 for uncorrectable ECC error
Date: Sun, 27 Nov 2016 03:05:58 +0900
Message-Id: <1480183585-592-13-git-send-email-yamada.masahiro@socionext.com>
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

When uncorrectable ECC error happens, whether the page is erased or
not, the ecc.read_page() should return zero.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ae9a8d2..a6445d9 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1160,6 +1160,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		if (!is_erased(buf, mtd->writesize) ||
 		    !is_erased(chip->oob_poi, mtd->oobsize))
 			mtd->ecc_stats.failed++;
+		return 0;
 	}
 	return max_bitflips;
 }
-- 
2.7.4
