Received: from conuserg-09.nifty.com ([210.131.2.76])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqTT-0001GU-AE
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:35 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 53/53] mtd: nand: denali: enable bad block table scan
Date: Thu, 23 Mar 2017 09:18:02 +0900
Message-Id: <1490228282-10805-27-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now this driver is ready to remove NAND_SKIP_BBTSCAN.

The BBT descriptors in denali.c are equivalent to the ones in
nand_bbt.c.  There is no need to duplicate the equivalent structures.
The with-oob decriptors do not work for this driver anyway.

The bbt_pattern (offs = 8) and the version (veroffs = 12) area
overlaps the ECC area.  Set NAND_BBT_NO_OOB flag to use the no_oob
variant of the BBT descriptors.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 28622a9..9cfc374 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1207,29 +1207,6 @@ static const struct mtd_ooblayout_ops denali_ooblayout_ops = {
 	.free = denali_ooblayout_free,
 };
 
-static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
-static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
-
-static struct nand_bbt_descr bbt_main_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = 4,
-	.pattern = bbt_pattern,
-};
-
-static struct nand_bbt_descr bbt_mirror_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = 4,
-	.pattern = mirror_pattern,
-};
-
 /* initialize driver data structures */
 static void denali_drv_init(struct denali_nand_info *denali)
 {
@@ -1366,13 +1343,9 @@ int denali_init(struct denali_nand_info *denali)
 	 * bad block management.
 	 */
 
-	/* Bad block management */
-	chip->bbt_td = &bbt_main_descr;
-	chip->bbt_md = &bbt_mirror_descr;
-
-	/* skip the scan for now until we have OOB read and write support */
 	chip->bbt_options |= NAND_BBT_USE_FLASH;
-	chip->options |= NAND_SKIP_BBTSCAN;
+	chip->bbt_options |= NAND_BBT_NO_OOB;
+
 	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
 
 	/* no subpage writes on denali */
-- 
2.7.4
