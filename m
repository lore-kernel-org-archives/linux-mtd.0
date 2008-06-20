From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/3] atmel_nand speedup via {read,write}s{b,w}()
Date: Fri, 20 Jun 2008 09:48:30 +0200
Message-Id: <1213948112-22348-1-git-send-email-haavard.skinnemoen@atmel.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	linux-kernel@vger.kernel.org, David Brownell <david-b@pacbell.net>,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	linux-mtd@lists.infradead.org, Andrew Victor <andrew@sanpeople.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <david-b@pacbell.net>

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
[haavard.skinnemoen@atmel.com: rebase onto atmel_nand rename]
Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
Another round of patches for the newly renamed Atmel NAND driver
coming up. I'm hoping this can join the existing bunch of patches for
2.6.27.

Out of curiosity, how did you solve the merge conflict with the ARM
tree?

Haavard

 drivers/mtd/nand/atmel_nand.c |   46 ++++++++++++++++++++++++++++++++++++----
 1 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 50700ab..4814fc9 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -142,6 +142,37 @@ static int atmel_nand_device_ready(struct mtd_info *mtd)
 }
 
 /*
+ * Minimal-overhead PIO for data access.
+ */
+static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_readsb(nand_chip->IO_ADDR_R, buf, len);
+}
+
+static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_readsw(nand_chip->IO_ADDR_R, buf, len / 2);
+}
+
+static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_writesb(nand_chip->IO_ADDR_W, buf, len);
+}
+
+static void atmel_write_buf16(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct nand_chip	*nand_chip = mtd->priv;
+
+	__raw_writesw(nand_chip->IO_ADDR_W, buf, len / 2);
+}
+
+/*
  * write oob for small pages
  */
 static int atmel_nand_write_oob_512(struct mtd_info *mtd,
@@ -436,8 +467,14 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
-	if (host->board->bus_width_16)		/* 16-bit bus width */
+	if (host->board->bus_width_16) {	/* 16-bit bus width */
 		nand_chip->options |= NAND_BUSWIDTH_16;
+		nand_chip->read_buf = atmel_read_buf16;
+		nand_chip->write_buf = atmel_write_buf16;
+	} else {
+		nand_chip->read_buf = atmel_read_buf;
+		nand_chip->write_buf = atmel_write_buf;
+	}
 
 	platform_set_drvdata(pdev, host);
 	atmel_nand_enable(host);
@@ -546,7 +583,7 @@ err_nand_ioremap:
 /*
  * Remove a NAND device.
  */
-static int __devexit atmel_nand_remove(struct platform_device *pdev)
+static int __exit atmel_nand_remove(struct platform_device *pdev)
 {
 	struct atmel_nand_host *host = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = &host->mtd;
@@ -564,8 +601,7 @@ static int __devexit atmel_nand_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver atmel_nand_driver = {
-	.probe		= atmel_nand_probe,
-	.remove		= atmel_nand_remove,
+	.remove		= __exit_p(atmel_nand_remove),
 	.driver		= {
 		.name	= "atmel_nand",
 		.owner	= THIS_MODULE,
@@ -574,7 +610,7 @@ static struct platform_driver atmel_nand_driver = {
 
 static int __init atmel_nand_init(void)
 {
-	return platform_driver_register(&atmel_nand_driver);
+	return platform_driver_probe(&atmel_nand_driver, atmel_nand_probe);
 }
 
 
-- 
1.5.5.3
