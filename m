Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIZXD-0004V9-Sw
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 11:54:01 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v5 23/23] mtd: nand: denali: enable bad block table scan
Date: Wed,  7 Jun 2017 20:52:32 +0900
Message-Id: <1496836352-8016-24-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
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

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 904f859e19b6..43006c506a6b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1247,29 +1247,6 @@ static const struct mtd_ooblayout_ops denali_ooblayout_ops = {
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
@@ -1412,13 +1389,9 @@ int denali_init(struct denali_nand_info *denali)
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
