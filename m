Received: from mail1.bemta8.messagelabs.com ([216.82.243.200])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6afT-0005ZO-9R
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 10:08:44 +0000
Subject: [PATCH v3 3/3] mtd: nand: tango: Cleanup raw_write and raw_read
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
References: <5829883A.8080307@sigmadesigns.com>
 <20161114111122.27804c4e@bbrezillon> <5829EF25.70202@sigmadesigns.com>
 <20161114183819.0a954b36@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <582ADE93.4010003@sigmadesigns.com>
Date: Tue, 15 Nov 2016 11:08:19 +0100
MIME-Version: 1.0
In-Reply-To: <20161114183819.0a954b36@bbrezillon>
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

Drop raw_write return value (no longer used).
Drop raw_read  return value (for symmetry).

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 drivers/mtd/nand/tango_nand.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index bacc2a02b7fe..7ed35348993e 100644
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
@@ -395,15 +393,14 @@ static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
 	aux_write(chip, &oob_orig, BBM_SIZE, &pos);
 	aux_write(chip, &buf, pkt_size - rem, &pos);
 	aux_write(chip, &oob, ecc_size, &pos);
-
-	return 0;
 }
 
 static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			       u8 *buf, int oob_required, int page)
 {
 	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
-	return raw_read(chip, buf, chip->oob_poi);
+	raw_read(chip, buf, chip->oob_poi);
+	return 0;
 }
 
 static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
@@ -419,7 +416,8 @@ static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 			  int page)
 {
 	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
-	return raw_read(chip, NULL, chip->oob_poi);
+	raw_read(chip, NULL, chip->oob_poi);
+	return 0;
 }
 
 static int tango_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
-- 
2.9.0
