Received: from mail1.bemta8.messagelabs.com ([216.82.243.198])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6Kis-0000ts-MZ
 for linux-mtd@lists.infradead.org; Mon, 14 Nov 2016 17:07:11 +0000
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v2 2/2] mtd: nand: tango: Enable custom page accessors
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>,
 Sebastian Frias <sf84@laposte.net>
References: <5829883A.8080307@sigmadesigns.com>
 <20161114111122.27804c4e@bbrezillon>
Message-ID: <5829EF25.70202@sigmadesigns.com>
Date: Mon, 14 Nov 2016 18:06:45 +0100
MIME-Version: 1.0
In-Reply-To: <20161114111122.27804c4e@bbrezillon>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable NAND_ECC_CUSTOM_PAGE_ACCESS in tango NFC driver.
Fixup "raw" page accessors to send proper NAND commands.
Drop raw_write/raw_read return values (no longer used).

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
v2:
split from previous v1 patch
---
 drivers/mtd/nand/tango_nand.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index fd8cf414cb2b..7ed35348993e 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -343,7 +343,7 @@ static void aux_write(struct nand_chip *chip, const u8 **buf, int len, int *pos)
  * buf = |      PKT_0      | ... |      PKT_N      |
  *       +-----------------+-----+-----------------+
  */
-static int raw_read(struct nand_chip *chip, u8 *buf, u8 *oob)
+static void raw_read(struct nand_chip *chip, u8 *buf, u8 *oob)
 {
 	u8 *oob_orig = oob;
 	const int page_size = chip->mtd.writesize;
@@ -367,11 +367,9 @@ static int raw_read(struct nand_chip *chip, u8 *buf, u8 *oob)
 	aux_read(chip, &oob_orig, BBM_SIZE, &pos);
 	aux_read(chip, &buf, pkt_size - rem, &pos);
 	aux_read(chip, &oob, ecc_size, &pos);
-
-	return 0;
 }
 
-static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
+static void raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
 {
 	const u8 *oob_orig = oob;
 	const int page_size = chip->mtd.writesize;
@@ -395,27 +393,31 @@ static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
 	aux_write(chip, &oob_orig, BBM_SIZE, &pos);
 	aux_write(chip, &buf, pkt_size - rem, &pos);
 	aux_write(chip, &oob, ecc_size, &pos);
-
-	return 0;
 }
 
 static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			       u8 *buf, int oob_required, int page)
 {
-	return raw_read(chip, buf, chip->oob_poi);
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+	raw_read(chip, buf, chip->oob_poi);
+	return 0;
 }
 
 static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				const u8 *buf, int oob_required, int page)
 {
-	return raw_write(chip, buf, chip->oob_poi);
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
+	raw_write(chip, buf, chip->oob_poi);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	return 0;
 }
 
 static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 			  int page)
 {
 	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
-	return raw_read(chip, NULL, chip->oob_poi);
+	raw_read(chip, NULL, chip->oob_poi);
+	return 0;
 }
 
 static int tango_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
@@ -553,6 +555,7 @@ static int chip_init(struct device *dev, struct device_node *np)
 	ecc->write_page = tango_write_page;
 	ecc->read_oob = tango_read_oob;
 	ecc->write_oob = tango_write_oob;
+	ecc->options = NAND_ECC_CUSTOM_PAGE_ACCESS;
 
 	err = nand_scan_tail(mtd);
 	if (err)
-- 
2.9.0
