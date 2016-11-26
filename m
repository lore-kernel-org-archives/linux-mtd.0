Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNu-00056D-Ud
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:37 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 28/39] mtd: nand: denali: move multi NAND fixup code to a
 helper function
Date: Sun, 27 Nov 2016 03:06:14 +0900
Message-Id: <1480183585-592-29-git-send-email-yamada.masahiro@socionext.com>
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

Collect multi NAND fixups into a helper function instead of
scattering them in denali_init().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 51 ++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 60b0858..54dcd83 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1472,6 +1472,34 @@ static void denali_drv_init(struct denali_nand_info *denali)
 	denali->irq_status = 0;
 }
 
+static void denali_multidev_fixup(struct denali_nand_info *denali)
+{
+	struct nand_chip *chip = &denali->nand;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/*
+	 * Support for multi NAND:
+	 * MTD knows nothing about multi NAND, so we should tell it
+	 * the real pagesize and anything necessary
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
@@ -1553,23 +1581,6 @@ int denali_init(struct denali_nand_info *denali)
 		goto failed_req_irq;
 	}
 
-	/*
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
 
 	/*
 	 * second stage of the NAND scan
@@ -1614,11 +1625,9 @@ int denali_init(struct denali_nand_info *denali)
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
@@ -1627,6 +1636,8 @@ int denali_init(struct denali_nand_info *denali)
 	chip->ecc.write_oob = denali_write_oob;
 	chip->erase = denali_erase;
 
+	denali_multidev_fixup(denali);
+
 	ret = nand_scan_tail(mtd);
 	if (ret)
 		goto failed_req_irq;
-- 
2.7.4
