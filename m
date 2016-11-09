Received: from mail1.bemta12.messagelabs.com ([216.82.251.4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4X7r-0004cc-Rb
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 17:57:33 +0000
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [RFC] Special handling for NAND_CMD_PAGEPROG and NAND_CMD_READ0
To: linux-mtd <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
Message-ID: <58236370.1050105@sigmadesigns.com>
Date: Wed, 9 Nov 2016 18:57:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sample code to generate some discussion around having the framework
send I/O commands (for read_page and write_page) when it is dealing
with "high-level" NFCs that send the commands themselves.
---
 drivers/mtd/nand/nand_base.c  | 6 ++++--
 drivers/mtd/nand/tango_nand.c | 7 ++++++-
 include/linux/mtd/nand.h      | 6 ++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 50cdf37cb8e4..b4149101342c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1970,7 +1970,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 						 __func__, buf);
 
 read_retry:
-			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+			if (!(chip->options & NAND_FOO))
+				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
 
 			/*
 			 * Now read the page into the buffer.  Absent an error,
@@ -2681,7 +2682,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (!cached || !NAND_HAS_CACHEPROG(chip)) {
 
-		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+		if (!(chip->options & NAND_FOO))
+			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 		status = chip->waitfunc(mtd, chip);
 		/*
 		 * See if operation failed and additional status checks are
diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index 74e39a92771c..d3679fdf2020 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -401,13 +401,17 @@ static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
 static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		uint8_t *buf, int oob_required, int page)
 {
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
 	return raw_read(chip, buf, chip->oob_poi);
 }
 
 static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		const uint8_t *buf, int oob_required, int page)
 {
-	return raw_write(chip, buf, chip->oob_poi);
+	/* what about NAND_CMD_SEQIN ? */
+	raw_write(chip, buf, chip->oob_poi);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	return 0;
 }
 
 static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
@@ -527,6 +531,7 @@ static int chip_init(struct device *dev, struct device_node *np)
 	chip->setup_data_interface = tango_set_timings;
 	chip->options = NAND_USE_BOUNCE_BUFFER
 		| NAND_NO_SUBPAGE_WRITE
+		| NAND_FOO
 		| NAND_WAIT_TCCS;
 	chip->controller = &nfc->hw;
 	tchip->base = nfc->pbus_base + (cs * 256);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 06d0c9d740f7..fd8968f3ccca 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -220,6 +220,12 @@ enum nand_ecc_algo {
  */
 #define NAND_WAIT_TCCS		0x00200000
 
+/*
+ * Controller sends NAND_CMD_PAGEPROG (write_page) and NAND_CMD_READ0 (read_page)
+ * therefore the framework should not send these commands.
+ */
+#define NAND_FOO		0x00400000
+
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
 #define NAND_CONTROLLER_ALLOC	0x80000000
-- 
2.1.4
