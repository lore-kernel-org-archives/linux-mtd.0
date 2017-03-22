Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZx-0008Lh-S5
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:10:06 +0000
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
Subject: [RESEND PATCH v2 21/53] mtd: nand: denali: move multi device fixup
 code to a helper function
Date: Thu, 23 Mar 2017 05:07:20 +0900
Message-Id: <1490213273-8571-22-git-send-email-yamada.masahiro@socionext.com>
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

Collect multi NAND fixups into a helper function instead of
scattering them in denali_init().

I am rewording the comment block to clearly explain what is called
"multi device".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Reword the comment block for clarification

 drivers/mtd/nand/denali.c | 54 +++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 1706975..4e63d57 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1458,6 +1458,36 @@ static void denali_drv_init(struct denali_nand_info *denali)
 	denali->irq_status = 0;
 }
 
+static void denali_multidev_fixup(struct denali_nand_info *denali)
+{
+	struct nand_chip *chip = &denali->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/*
+	 * Support for multi device:
+	 * When the IP configuration is x16 capable and two x8 chips are
+	 * connected in parallel, DEVICES_CONNECTED should be set to 2.
+	 * In this case, the core framework knows nothing about this fact,
+	 * so we should tell it the _logical_ pagesize and anything necessary.
+	 */
+	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
+
+	mtd->size <<= denali->devnum - 1;
+	mtd->erasesize <<= denali->devnum - 1;
+	mtd->writesize <<= denali->devnum - 1;
+	mtd->oobsize <<= denali->devnum - 1;
+	chip->chipsize <<= denali->devnum - 1;
+	chip->page_shift += denali->devnum - 1;
+	chip->phys_erase_shift += denali->devnum - 1;
+	chip->bbt_erase_shift += denali->devnum - 1;
+	chip->chip_shift += denali->devnum - 1;
+	chip->pagemask <<= denali->devnum - 1;
+	chip->ecc.size *= denali->devnum;
+	chip->ecc.bytes *= denali->devnum;
+	chip->ecc.strength *= denali->devnum;
+	denali->bbtskipbytes *= denali->devnum;
+}
+
 int denali_init(struct denali_nand_info *denali)
 {
 	struct nand_chip *chip = &denali->nand;
@@ -1540,24 +1570,6 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	/*
-	 * support for multi nand
-	 * MTD known nothing about multi nand, so we should tell it
-	 * the real pagesize and anything necessery
-	 */
-	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
-	chip->chipsize <<= denali->devnum - 1;
-	chip->page_shift += denali->devnum - 1;
-	chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
-	chip->bbt_erase_shift += denali->devnum - 1;
-	chip->phys_erase_shift = chip->bbt_erase_shift;
-	chip->chip_shift += denali->devnum - 1;
-	mtd->writesize <<= denali->devnum - 1;
-	mtd->oobsize <<= denali->devnum - 1;
-	mtd->erasesize <<= denali->devnum - 1;
-	mtd->size = chip->numchips * chip->chipsize;
-	denali->bbtskipbytes *= denali->devnum;
-
-	/*
 	 * second stage of the NAND scan
 	 * this stage requires information regarding ECC and
 	 * bad block management.
@@ -1600,11 +1612,9 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
-	chip->ecc.bytes *= denali->devnum;
-	chip->ecc.strength *= denali->devnum;
 
 	/* override the default read operations */
-	chip->ecc.size = ECC_SECTOR_SIZE * denali->devnum;
+	chip->ecc.size = ECC_SECTOR_SIZE;
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
 	chip->ecc.write_page = denali_write_page;
@@ -1613,6 +1623,8 @@ int denali_init(struct denali_nand_info *denali)
 	chip->ecc.write_oob = denali_write_oob;
 	chip->erase = denali_erase;
 
+	denali_multidev_fixup(denali);
+
 	ret = nand_scan_tail(mtd);
 	if (ret)
 		goto failed_req_irq;
-- 
2.7.4
