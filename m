Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE8zS-0002IW-SU
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 07:49:24 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, stable@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bean Huo <beanhuo@micron.com>, Peter Pan <peterpandong@micron.com>
Subject: [PATCH] mtd: rawnand: micron: Fix support for on-die ECC
Date: Thu,  3 May 2018 09:49:08 +0200
Message-Id: <20180503074908.20485-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It looks like the NAND_STATUS_FAIL bit is sticky after an ECC failure,
which leads all READ operations following the failing one to report
an ECC failure. Reset the chip to clear the NAND_STATUS_FAIL bit.

Note that this behavior is not document in the datasheet, but resetting
the chip is the only solution we found to fix the problem.

Fixes: 9748e1d87573 ("mtd: nand: add support for Micron on-die ECC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Peter Pan <peterpandong@micron.com>
---
Peter, Bean,

Can you confirm this behavior, or ask someone in Micron who can confirm
it? Also, if a RESET is actually needed, it would be good to update the
datasheet accordingly. And if that's not the case, can you explain why
the NAND_STATUS_FAIL bit is stuck and how to clear it (I tried a 0x00
command, A.K.A. READ STATUS EXIT, but it does not clear this bit, ERASE
and PROGRAM seem to clear the bit, but that's clearly not the kind of
operation I can do when the user asks for a READ)?

Thanks,

Boris
---
 drivers/mtd/nand/raw/nand_micron.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 0af45b134c0c..a915f568f6a3 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -153,6 +153,23 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 		ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize,
 					false);
 
+	/*
+	 * Looks like the NAND_STATUS_FAIL bit is sticky after an ECC failure,
+	 * which leads all READ operations following the failing one to report
+	 * an ECC failure.
+	 * Reset the chip to clear it.
+	 *
+	 * Note that this behavior is not document in the datasheet, but
+	 * resetting the chip is the only solution we found to clear this bit.
+	 */
+	if (status & NAND_STATUS_FAIL) {
+		int cs = page >> (chip->chip_shift - chip->page_shift);
+
+		chip->select_chip(mtd, -1);
+		nand_reset(chip, cs);
+		chip->select_chip(mtd, cs);
+	}
+
 out:
 	micron_nand_on_die_ecc_setup(chip, false);
 
-- 
2.14.1
