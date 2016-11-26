Received: from conuserg-11.nifty.com ([210.131.2.78])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOB-0006Ob-Sc
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 29/39] mtd: nand: denali: refactor multi NAND fixup code in
 more generic way
Date: Sun, 27 Nov 2016 03:06:15 +0900
Message-Id: <1480183585-592-30-git-send-email-yamada.masahiro@socionext.com>
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

Currently, this code expects denali->devnum == 1 or 2, but it can be
written in a more generic way, although denali->devnum should be a
power of 2.

Also, make the code more readable with devnum_shift.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 54dcd83..71bdf2a 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1476,6 +1476,7 @@ static void denali_multidev_fixup(struct denali_nand_info *denali)
 {
 	struct nand_chip *chip = &denali->nand;
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	int devnum_shift;
 
 	/*
 	 * Support for multi NAND:
@@ -1484,20 +1485,30 @@ static void denali_multidev_fixup(struct denali_nand_info *denali)
 	 */
 	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
 
-	mtd->size <<= denali->devnum - 1;
-	mtd->erasesize <<= denali->devnum - 1;
-	mtd->writesize <<= denali->devnum - 1;
-	mtd->oobsize <<= denali->devnum - 1;
-	chip->chipsize <<= denali->devnum - 1;
-	chip->page_shift += denali->devnum - 1;
-	chip->phys_erase_shift += denali->devnum - 1;
-	chip->bbt_erase_shift += denali->devnum - 1;
-	chip->chip_shift += denali->devnum - 1;
-	chip->pagemask <<= denali->devnum - 1;
-	chip->ecc.size *= denali->devnum;
-	chip->ecc.bytes *= denali->devnum;
-	chip->ecc.strength *= denali->devnum;
-	denali->bbtskipbytes *= denali->devnum;
+	devnum_shift = fls(denali->devnum) - 1;
+
+	if (denali->devnum != BIT(devnum_shift)) {
+		dev_warn(denali->dev,
+			 "DEVICE_CONNECTED=%d is not power of 2. Some devices will not be used.\n",
+			 denali->devnum);
+		denali->devnum = BIT(devnum_shift);
+		iowrite32(denali->devnum, denali->flash_reg + DEVICES_CONNECTED);
+	}
+
+	mtd->size <<= devnum_shift;
+	mtd->erasesize <<= devnum_shift;
+	mtd->writesize <<= devnum_shift;
+	mtd->oobsize <<= devnum_shift;
+	chip->chipsize <<= devnum_shift;
+	chip->page_shift += devnum_shift;
+	chip->phys_erase_shift += devnum_shift;
+	chip->bbt_erase_shift += devnum_shift;
+	chip->chip_shift += devnum_shift;
+	chip->pagemask <<= devnum_shift;
+	chip->ecc.size <<= devnum_shift;
+	chip->ecc.bytes <<= devnum_shift;
+	chip->ecc.strength <<= devnum_shift;
+	denali->bbtskipbytes <<= devnum_shift;
 }
 
 int denali_init(struct denali_nand_info *denali)
-- 
2.7.4
