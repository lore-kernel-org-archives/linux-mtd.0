Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZN-0001Re-EZ
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:09:23 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [RESEND PATCH v2 02/53] mtd: nand: use read_oob() instead of
 cmdfunc() for bad block check
Date: Thu, 23 Mar 2017 05:07:01 +0900
Message-Id: <1490213273-8571-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_default_block_markbad() and scan_block_fast() use high
level APIs to get access to the BBM.

On the other hand, nand_block_bad (the default implementation of
->block_bad) calls the lower level ->cmdfunc hook.  This prevents
drivers from using ->ecc.read_oob() even if optimized read operation
is implemented.  Besides, some NAND controllers may protect the BBM
with ECC.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Error out immediately if the first page access fails
  - Use for() {} instead of do {} while()
  - Update git-log

 drivers/mtd/nand/nand_base.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c0f47..807398d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -354,40 +354,32 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
  */
 static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
-	int page, res = 0, i = 0;
+	int page, page_end, res;
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	u16 bad;
+	u8 bad;
 
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
+	page_end = page + (chip->bbt_options & NAND_BBT_SCAN2NDPAGE ? 2 : 1);
 
-	do {
-		if (chip->options & NAND_BUSWIDTH_16) {
-			chip->cmdfunc(mtd, NAND_CMD_READOOB,
-					chip->badblockpos & 0xFE, page);
-			bad = cpu_to_le16(chip->read_word(mtd));
-			if (chip->badblockpos & 0x1)
-				bad >>= 8;
-			else
-				bad &= 0xFF;
-		} else {
-			chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
-					page);
-			bad = chip->read_byte(mtd);
-		}
+	for (; page < page_end; page++) {
+		res = chip->ecc.read_oob(mtd, chip, page);
+		if (res)
+			return res;
+
+		bad = chip->oob_poi[chip->badblockpos];
 
 		if (likely(chip->badblockbits == 8))
 			res = bad != 0xFF;
 		else
 			res = hweight8(bad) < chip->badblockbits;
-		ofs += mtd->writesize;
-		page = (int)(ofs >> chip->page_shift) & chip->pagemask;
-		i++;
-	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
+		if (res)
+			return res;
+	}
 
-	return res;
+	return 0;
 }
 
 /**
-- 
2.7.4
