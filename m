Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnqXG-0007J8-Mb
 for linux-mtd@lists.infradead.org; Tue, 14 Mar 2017 17:47:05 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH] mtd: nand: use .read_oob() instead of .cmdfunc() for bad
 block check
Date: Wed, 15 Mar 2017 02:45:48 +0900
Message-Id: <1489513548-3248-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_default_block_markbad() is the default implementation of
chip->block_markbad().  This is called for marking a block as bad.
It invokes nand_do_write_oob(), then calls a higher level accessor
ecc->write_oob().

On the other hand, when reading BBM from the OOB, chip->block_bad()
is called, and nand_block_bad() is the default implementation.  This
function calls a lower level chip->cmdfunc().  If a driver wants to
re-use nand_block_bad(), it is required to support NAND_CMD_READOOB
in its cmdfunc().  This is strange.  If the controller supports
optimized read operation and the driver has its own ecc->read_oob(),
it should be able to use it.  Besides, NAND_CMD_READOOB (0x50) is
not a real command for large page devices.  So, recent drivers may
not be happy to handle this command.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

At first, I tried to call nand_do_read_oob() from nand_block_bad()
in order to make to make things symmetry, but it did not work.
chip->select_chip() is handled outside of nand_block_bad(), so
nand_do_read_oob() can not be used there.


 drivers/mtd/nand/nand_base.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c0f47..78c5cd6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -354,9 +354,9 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
  */
 static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
-	int page, res = 0, i = 0;
+	int page, res = 0, ret = 0, i = 0;
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	u16 bad;
+	u8 bad;
 
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
@@ -364,30 +364,26 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
 
 	do {
-		if (chip->options & NAND_BUSWIDTH_16) {
-			chip->cmdfunc(mtd, NAND_CMD_READOOB,
-					chip->badblockpos & 0xFE, page);
-			bad = cpu_to_le16(chip->read_word(mtd));
-			if (chip->badblockpos & 0x1)
-				bad >>= 8;
+		res = chip->ecc.read_oob(mtd, chip, page);
+		if (!res) {
+			bad = chip->oob_poi[chip->badblockpos];
+
+			if (likely(chip->badblockbits == 8))
+				res = bad != 0xFF;
 			else
-				bad &= 0xFF;
-		} else {
-			chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
-					page);
-			bad = chip->read_byte(mtd);
+				res = hweight8(bad) < chip->badblockbits;
+			if (res)
+				return res;
 		}
 
-		if (likely(chip->badblockbits == 8))
-			res = bad != 0xFF;
-		else
-			res = hweight8(bad) < chip->badblockbits;
-		ofs += mtd->writesize;
-		page = (int)(ofs >> chip->page_shift) & chip->pagemask;
+		if (!ret)
+			ret = res;
+
+		page++;
 		i++;
-	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
+	} while (chip->bbt_options & NAND_BBT_SCAN2NDPAGE && i < 2);
 
-	return res;
+	return ret;
 }
 
 /**
-- 
2.7.4
