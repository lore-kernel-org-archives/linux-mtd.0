Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4NHJ-00023l-CB
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 09:35:44 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: toshiba: Pass a single nand_chip object to the
 status helper
Date: Mon, 24 Sep 2018 11:35:18 +0200
Message-Id: <20180924093518.22021-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that most of the raw NAND API is consistent and has almost all its
helpers and hooks using a single nand_chip object instead of an mtd_info
one (or both), let's do the same cleanup in the raw NAND vendors
drivers.

Apply this change to the Toshiba driver so that the internal helper to
retrieve the ECC status does only take a nand_chip object.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_toshiba.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 941ddc615190..0549c4b59d9c 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -23,9 +23,9 @@
 /* Recommended to rewrite for BENAND */
 #define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
 
-static int toshiba_nand_benand_eccstatus(struct mtd_info *mtd,
-					 struct nand_chip *chip)
+static int toshiba_nand_benand_eccstatus(struct nand_chip *chip)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 	unsigned int max_bitflips = 0;
 	u8 status;
@@ -58,7 +58,7 @@ toshiba_nand_read_page_benand(struct nand_chip *chip, uint8_t *buf,
 	if (ret)
 		return ret;
 
-	return toshiba_nand_benand_eccstatus(mtd, chip);
+	return toshiba_nand_benand_eccstatus(chip);
 }
 
 static int
@@ -73,7 +73,7 @@ toshiba_nand_read_subpage_benand(struct nand_chip *chip, uint32_t data_offs,
 	if (ret)
 		return ret;
 
-	return toshiba_nand_benand_eccstatus(mtd, chip);
+	return toshiba_nand_benand_eccstatus(chip);
 }
 
 static void toshiba_nand_benand_init(struct nand_chip *chip)
-- 
2.17.1
