Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgxM-0007rR-Gm
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:47 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 10/53] mtd: nand: denali: fix erased page checking
Date: Wed, 22 Mar 2017 23:07:17 +0900
Message-Id: <1490191680-14481-11-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This part is wrong in multiple ways:

[1] is_erased() is called against "buf" twice, so the second one is
meaningless.  The second call should check chip->oob_poi.

[2] This code block is nested by double "if (check_erase_page)".
The inner one is redundant.

[3] Erased page checking without threshold is false-positive.
Basically, there are two ways for erased page checking:
- read the whole of page + oob in raw transfer, then check if all
  the data are 0xFF.
- read the ECC-corrected page + oob, then check if *almost* all the
  data are 0xFF (bit-flips less than ecc.strength are allowed)
While here, it checks if all data in ECC-corrected page are 0xFF.
This is too strong because not all of the data are 0xFF after they
are manipulated by the ECC engine.  Proper threshold must be taken
into account to avoid false-positive ecc_stats.failed increments.

[4] positive return value for uncorrectable bitflips

The comment of ecc->read_page() says it should return "0 if bitflips
uncorrectable", but the current code could return a positive value
in the case.

This commit solves the problems above.  The nand framework provides
a helper nand_check_erased_ecc_chunk() for erased page check with
threshold.  The driver's own helper is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Squash some patches into one.
  - Use nand_check_erased_ecc_chunk() with threshold

 drivers/mtd/nand/denali.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 2c59eb3..86381ac 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -883,19 +883,6 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	}
 }
 
-/*
- * this function examines buffers to see if they contain data that
- * indicate that the buffer is part of an erased region of flash.
- */
-static bool is_erased(uint8_t *buf, int len)
-{
-	int i;
-
-	for (i = 0; i < len; i++)
-		if (buf[i] != 0xFF)
-			return false;
-	return true;
-}
 #define ECC_SECTOR_SIZE 512
 
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
@@ -1119,6 +1106,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	uint32_t irq_status;
 	uint32_t irq_mask = INTR__ECC_TRANSACTION_DONE | INTR__ECC_ERR;
 	bool check_erased_page = false;
+	int stat;
 
 	if (page != denali->page) {
 		dev_err(denali->dev,
@@ -1148,12 +1136,15 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (check_erased_page) {
 		read_oob_data(mtd, chip->oob_poi, denali->page);
 
-		/* check ECC failures that may have occurred on erased pages */
-		if (check_erased_page) {
-			if (!is_erased(buf, mtd->writesize))
-				mtd->ecc_stats.failed++;
-			if (!is_erased(buf, mtd->oobsize))
-				mtd->ecc_stats.failed++;
+		stat = nand_check_erased_ecc_chunk(
+					buf, mtd->writesize,
+					chip->oob_poi, mtd->oobsize,
+					NULL, 0,
+					chip->ecc.strength * chip->ecc.steps);
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+			/* return 0 for uncorrectable bitflips */
+			max_bitflips = 0;
 		}
 	}
 	return max_bitflips;
-- 
2.7.4
