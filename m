Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0WzC-0007b0-Ni
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 13:46:27 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 1/4] mtd: nand: omap: ecc.calculate: rename
 omap3_calculate_ecc_bch to omap_calculate_ecc_bch
Date: Tue, 7 Jan 2014 19:15:43 +0530
Message-ID: <1389102346-1455-2-git-send-email-pekon@ti.com>
In-Reply-To: <1389102346-1455-1-git-send-email-pekon@ti.com>
References: <1389102346-1455-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch renames omap3_calculate_ecc_bch -> omap_calculate_ecc_bch to
keep nomenclature independent of any device family.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c690721..bf9bf7e 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1211,15 +1211,15 @@ static int omap3_calculate_ecc_bch8(struct mtd_info *mtd, const u_char *dat,
 
 #ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
- * omap3_calculate_ecc_bch - Generate bytes of ECC bytes
+ * omap_calculate_ecc_bch - Generate bytes of ECC bytes
  * @mtd:	MTD device structure
  * @dat:	The pointer to data on which ecc is computed
  * @ecc_code:	The ecc_code buffer
  *
  * Support calculating of BCH4/8 ecc vectors for the page
  */
-static int omap3_calculate_ecc_bch(struct mtd_info *mtd, const u_char *dat,
-				    u_char *ecc_code)
+static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
+					const u_char *dat, u_char *ecc_code)
 {
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 						   mtd);
@@ -1858,7 +1858,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.strength		= 4;
 		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
 		nand_chip->ecc.correct		= omap_elm_correct_data;
-		nand_chip->ecc.calculate	= omap3_calculate_ecc_bch;
+		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		nand_chip->ecc.read_page	= omap_read_page_bch;
 		nand_chip->ecc.write_page	= omap_write_page_bch;
 		/* define ECC layout */
@@ -1929,7 +1929,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.strength		= 8;
 		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
 		nand_chip->ecc.correct		= omap_elm_correct_data;
-		nand_chip->ecc.calculate	= omap3_calculate_ecc_bch;
+		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		nand_chip->ecc.read_page	= omap_read_page_bch;
 		nand_chip->ecc.write_page	= omap_write_page_bch;
 		/* This ECC scheme requires ELM H/W block */
-- 
1.8.1
