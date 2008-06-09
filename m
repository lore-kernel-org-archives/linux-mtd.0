Received: from smtp121.sbc.mail.sp1.yahoo.com ([69.147.64.94])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5eNb-0003d9-Q3
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 10:13:36 +0000
From: David Brownell <david-b@pacbell.net>
To: lkml <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Subject: [patch 2.6.26-rc5-git] at91_nand speedup via {read,write}s{b,w}()
Date: Mon, 9 Jun 2008 03:13:28 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806090313.28515.david-b@pacbell.net>
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This uses __raw_{read,write}s{b,w}() primitives to access data on NAND
chips for more efficient I/O.

On an arm926 with memory clocked at 100 MHz, this reduced the elapsed
time for a 64 MByte read by 16%.  ("dd" /dev/mtd0 to /dev/null, with
an 8-bit NAND using hardware ECC and 128KB blocksize.)

Also some minor section tweaks:

  - Use platform_driver_probe() so no pointer to probe() lingers
    after that code has been removed at run-time.

  - Use __exit and __exit_p so the remove() code will normally be
    removed by the linker.

Since these buffer read/write calls are new, this increases the runtime
code footprint (by 88 bytes on my build, after the section tweaks).

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
Yeah, this does may you wonder why the *default* nand r/w code isn't
using these primitives; this speedup shouldn't be platform-specific.

Posting this now since I think this should either be incorporated into
the new atmel_nand.c code or into drivers/mtd/nand/nand_base.c ...
both arm and avr32 support these calls, I'm not sure whether or not
some platforms don't support them.

 drivers/mtd/nand/at91_nand.c |   46 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

--- a/drivers/mtd/nand/at91_nand.c	2008-04-28 11:05:34.000000000 -0700
+++ b/drivers/mtd/nand/at91_nand.c	2008-04-28 21:59:34.000000000 -0700
@@ -146,6 +146,37 @@ static void at91_nand_disable(struct at9
 }
 
 /*
+ * Minimal-overhead PIO for data access.
+ */
+static void at91_read_buf(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_readsb(nand_chip->IO_ADDR_R, buf, len);
+}
+
+static void at91_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_readsw(nand_chip->IO_ADDR_R, buf, len / 2);
+}
+
+static void at91_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_writesb(nand_chip->IO_ADDR_W, buf, len);
+}
+
+static void at91_write_buf16(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_writesw(nand_chip->IO_ADDR_W, buf, len / 2);
+}
+
+/*
  * write oob for small pages
  */
 static int at91_nand_write_oob_512(struct mtd_info *mtd,
@@ -440,8 +471,14 @@ static int __init at91_nand_probe(struct
 
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
-	if (host->board->bus_width_16)		/* 16-bit bus width */
+	if (host->board->bus_width_16) {	/* 16-bit bus width */
 		nand_chip->options |= NAND_BUSWIDTH_16;
+		nand_chip->read_buf = at91_read_buf16;
+		nand_chip->write_buf = at91_write_buf16;
+	} else {
+		nand_chip->read_buf = at91_read_buf;
+		nand_chip->write_buf = at91_write_buf;
+	}
 
 	platform_set_drvdata(pdev, host);
 	at91_nand_enable(host);
@@ -548,7 +585,7 @@ err_ecc_ioremap:
 /*
  * Remove a NAND device.
  */
-static int __devexit at91_nand_remove(struct platform_device *pdev)
+static int __exit at91_nand_remove(struct platform_device *pdev)
 {
 	struct at91_nand_host *host = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = &host->mtd;
@@ -565,8 +602,7 @@ static int __devexit at91_nand_remove(st
 }
 
 static struct platform_driver at91_nand_driver = {
-	.probe		= at91_nand_probe,
-	.remove		= at91_nand_remove,
+	.remove		= __exit_p(at91_nand_remove),
 	.driver		= {
 		.name	= "at91_nand",
 		.owner	= THIS_MODULE,
@@ -575,7 +611,7 @@ static struct platform_driver at91_nand_
 
 static int __init at91_nand_init(void)
 {
-	return platform_driver_register(&at91_nand_driver);
+	return platform_driver_probe(&at91_nand_driver, at91_nand_probe);
 }
 
 
