Received: from mail1.bemta8.messagelabs.com ([216.82.243.197])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6acu-0003iI-0L
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 10:06:05 +0000
Subject: [PATCH v3 2/3] mtd: nand: tango: Enable custom page accessors
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
References: <5829883A.8080307@sigmadesigns.com>
 <20161114111122.27804c4e@bbrezillon> <5829EF25.70202@sigmadesigns.com>
 <20161114183819.0a954b36@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <582ADDF3.9010707@sigmadesigns.com>
Date: Tue, 15 Nov 2016 11:05:39 +0100
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

Enable NAND_ECC_CUSTOM_PAGE_ACCESS in the tango NFC driver.
Fixup the "raw" page accessors to send the proper NAND commands.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 drivers/mtd/nand/tango_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index fd8cf414cb2b..bacc2a02b7fe 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -402,13 +402,17 @@ static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
 static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			       u8 *buf, int oob_required, int page)
 {
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
 	return raw_read(chip, buf, chip->oob_poi);
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
@@ -553,6 +557,7 @@ static int chip_init(struct device *dev, struct device_node *np)
 	ecc->write_page = tango_write_page;
 	ecc->read_oob = tango_read_oob;
 	ecc->write_oob = tango_write_oob;
+	ecc->options = NAND_ECC_CUSTOM_PAGE_ACCESS;
 
 	err = nand_scan_tail(mtd);
 	if (err)
-- 
2.9.0
