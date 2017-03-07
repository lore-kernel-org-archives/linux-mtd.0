Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clDEl-0000zg-Ut
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 11:25:05 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH] mtd: nand: fix write accessor sanity checks
Date: Tue,  7 Mar 2017 20:23:59 +0900
Message-Id: <1488885839-18470-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the higher level accessor chip->write_page() is implemented,
ecc->write_page() and ecc->write_page_raw() are not required.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/nand_base.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c0f47..c32e700 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4585,11 +4585,12 @@ static bool invalid_ecc_page_accessors(struct nand_chip *chip)
 	 * default helpers are not suitable when the core does not
 	 * send the READ0/PAGEPROG commands.
 	 */
-	return (!ecc->read_page || !ecc->write_page ||
-		!ecc->read_page_raw || !ecc->write_page_raw ||
+	return !ecc->read_page || !ecc->read_page_raw ||
 		(NAND_HAS_SUBPAGE_READ(chip) && !ecc->read_subpage) ||
-		(NAND_HAS_SUBPAGE_WRITE(chip) && !ecc->write_subpage &&
-		 ecc->hwctl && ecc->calculate));
+		(!chip->write_page &&
+		 (!ecc->write_page || !ecc->write_page_raw ||
+		  (NAND_HAS_SUBPAGE_WRITE(chip) && !ecc->write_subpage &&
+		   ecc->hwctl && ecc->calculate)));
 }
 
 /**
@@ -4699,8 +4700,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
 		    (!ecc->read_page ||
 		     ecc->read_page == nand_read_page_hwecc ||
-		     !ecc->write_page ||
-		     ecc->write_page == nand_write_page_hwecc)) {
+		     (!chip->write_page &&
+		      (!ecc->write_page ||
+		       ecc->write_page == nand_write_page_hwecc)))) {
 			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
 			ret = -EINVAL;
 			goto err_free;
-- 
2.7.4
