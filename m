Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMB6y-0000kF-Id
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 11:10:07 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] mtd: nand: denali: Avoid using ecc->code_buf as a
 temporary buffer
Date: Tue,  5 Dec 2017 12:09:28 +0100
Message-Id: <20171205110929.6820-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ECC bytes are contiguous in the ->oob_poi buffer, which means we don't
have to copy them into the ->code_buf (here used as a temporary buffer)
before passing them to the nand_check_erased_ecc_chunk() function.

This change will allow us to allocate ecc->{code,calc}_buf only when
ecc->calculate() or ecc->correct() is specified.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/denali.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 00698b33cb22..313c7f50621b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -330,16 +330,12 @@ static int denali_check_erased_page(struct mtd_info *mtd,
 				    unsigned long uncor_ecc_flags,
 				    unsigned int max_bitflips)
 {
-	uint8_t *ecc_code = chip->ecc.code_buf;
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint8_t *ecc_code = chip->oob_poi + denali->oob_skip_bytes;
 	int ecc_steps = chip->ecc.steps;
 	int ecc_size = chip->ecc.size;
 	int ecc_bytes = chip->ecc.bytes;
-	int i, ret, stat;
-
-	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
-					 chip->ecc.total);
-	if (ret)
-		return ret;
+	int i, stat;
 
 	for (i = 0; i < ecc_steps; i++) {
 		if (!(uncor_ecc_flags & BIT(i)))
-- 
2.11.0
