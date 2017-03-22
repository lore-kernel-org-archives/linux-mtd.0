Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgxI-00063D-NC
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:53 +0000
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
Subject: [PATCH v2 18/53] mtd: nand: denali: use nand_chip to hold frequently
 accessed data
Date: Wed, 22 Mar 2017 23:07:25 +0900
Message-Id: <1490191680-14481-19-git-send-email-yamada.masahiro@socionext.com>
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

The denali_init() needs to setup a bunch of parameters of nand_chip.
Replace denali->nand.(member) with chip->(member) for shorter code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 68 +++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ff6af1d..24c35a6 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1460,7 +1460,8 @@ static void denali_drv_init(struct denali_nand_info *denali)
 
 int denali_init(struct denali_nand_info *denali)
 {
-	struct mtd_info *mtd = nand_to_mtd(&denali->nand);
+	struct nand_chip *chip = &denali->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
 	if (denali->platform == INTEL_CE4100) {
@@ -1497,10 +1498,10 @@ int denali_init(struct denali_nand_info *denali)
 	mtd->name = "denali-nand";
 
 	/* register the driver with the NAND core subsystem */
-	denali->nand.select_chip = denali_select_chip;
-	denali->nand.cmdfunc = denali_cmdfunc;
-	denali->nand.read_byte = denali_read_byte;
-	denali->nand.waitfunc = denali_waitfunc;
+	chip->select_chip = denali_select_chip;
+	chip->cmdfunc = denali_cmdfunc;
+	chip->read_byte = denali_read_byte;
+	chip->waitfunc = denali_waitfunc;
 
 	/*
 	 * scan for NAND devices attached to the controller
@@ -1544,17 +1545,16 @@ int denali_init(struct denali_nand_info *denali)
 	 * the real pagesize and anything necessery
 	 */
 	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
-	denali->nand.chipsize <<= denali->devnum - 1;
-	denali->nand.page_shift += denali->devnum - 1;
-	denali->nand.pagemask = (denali->nand.chipsize >>
-						denali->nand.page_shift) - 1;
-	denali->nand.bbt_erase_shift += denali->devnum - 1;
-	denali->nand.phys_erase_shift = denali->nand.bbt_erase_shift;
-	denali->nand.chip_shift += denali->devnum - 1;
+	chip->chipsize <<= denali->devnum - 1;
+	chip->page_shift += denali->devnum - 1;
+	chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
+	chip->bbt_erase_shift += denali->devnum - 1;
+	chip->phys_erase_shift = chip->bbt_erase_shift;
+	chip->chip_shift += denali->devnum - 1;
 	mtd->writesize <<= denali->devnum - 1;
 	mtd->oobsize <<= denali->devnum - 1;
 	mtd->erasesize <<= denali->devnum - 1;
-	mtd->size = denali->nand.numchips * denali->nand.chipsize;
+	mtd->size = chip->numchips * chip->chipsize;
 	denali->bbtskipbytes *= denali->devnum;
 
 	/*
@@ -1564,29 +1564,29 @@ int denali_init(struct denali_nand_info *denali)
 	 */
 
 	/* Bad block management */
-	denali->nand.bbt_td = &bbt_main_descr;
-	denali->nand.bbt_md = &bbt_mirror_descr;
+	chip->bbt_td = &bbt_main_descr;
+	chip->bbt_md = &bbt_mirror_descr;
 
 	/* skip the scan for now until we have OOB read and write support */
-	denali->nand.bbt_options |= NAND_BBT_USE_FLASH;
-	denali->nand.options |= NAND_SKIP_BBTSCAN;
-	denali->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
+	chip->bbt_options |= NAND_BBT_USE_FLASH;
+	chip->options |= NAND_SKIP_BBTSCAN;
+	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
 
 	/* no subpage writes on denali */
-	denali->nand.options |= NAND_NO_SUBPAGE_WRITE;
+	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
 	/*
 	 * Denali Controller only support 15bit and 8bit ECC in MRST,
 	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
 	 * SLC if possible.
 	 * */
-	if (!nand_is_slc(&denali->nand) &&
+	if (!nand_is_slc(chip) &&
 			(mtd->oobsize > (denali->bbtskipbytes +
 			ECC_15BITS * (mtd->writesize /
 			ECC_SECTOR_SIZE)))) {
 		/* if MLC OOB size is large enough, use 15bit ECC*/
-		denali->nand.ecc.strength = 15;
-		denali->nand.ecc.bytes = ECC_15BITS;
+		chip->ecc.strength = 15;
+		chip->ecc.bytes = ECC_15BITS;
 		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
 	} else if (mtd->oobsize < (denali->bbtskipbytes +
 			ECC_8BITS * (mtd->writesize /
@@ -1594,24 +1594,24 @@ int denali_init(struct denali_nand_info *denali)
 		pr_err("Your NAND chip OOB is not large enough to contain 8bit ECC correction codes");
 		goto failed_req_irq;
 	} else {
-		denali->nand.ecc.strength = 8;
-		denali->nand.ecc.bytes = ECC_8BITS;
+		chip->ecc.strength = 8;
+		chip->ecc.bytes = ECC_8BITS;
 		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
 	}
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
-	denali->nand.ecc.bytes *= denali->devnum;
-	denali->nand.ecc.strength *= denali->devnum;
+	chip->ecc.bytes *= denali->devnum;
+	chip->ecc.strength *= denali->devnum;
 
 	/* override the default read operations */
-	denali->nand.ecc.size = ECC_SECTOR_SIZE * denali->devnum;
-	denali->nand.ecc.read_page = denali_read_page;
-	denali->nand.ecc.read_page_raw = denali_read_page_raw;
-	denali->nand.ecc.write_page = denali_write_page;
-	denali->nand.ecc.write_page_raw = denali_write_page_raw;
-	denali->nand.ecc.read_oob = denali_read_oob;
-	denali->nand.ecc.write_oob = denali_write_oob;
-	denali->nand.erase = denali_erase;
+	chip->ecc.size = ECC_SECTOR_SIZE * denali->devnum;
+	chip->ecc.read_page = denali_read_page;
+	chip->ecc.read_page_raw = denali_read_page_raw;
+	chip->ecc.write_page = denali_write_page;
+	chip->ecc.write_page_raw = denali_write_page_raw;
+	chip->ecc.read_oob = denali_read_oob;
+	chip->ecc.write_oob = denali_write_oob;
+	chip->erase = denali_erase;
 
 	ret = nand_scan_tail(mtd);
 	if (ret)
-- 
2.7.4
