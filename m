Received: from smtp120.sbc.mail.sp1.yahoo.com ([69.147.64.93])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQxWv-0008AO-4M
	for linux-mtd@lists.infradead.org; Thu, 07 Aug 2008 04:55:17 +0000
From: David Brownell <david-b@pacbell.net>
To: dwmw2@infradead.org
Subject: [patch 2.6.27-rc2] MTD:  make dataflash write-verify be optional
Date: Wed, 6 Aug 2008 21:55:14 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808062155.14366.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, Andrew Victor <linux@maxim.org.za>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

This adds a WRITE_VERIFY Kconfig option to the DataFlash driver,
closely mirroring the similar NAND and ONENAND options, giving
an option to disable some code that's currently always enabled.

Removing this step probably saves a millisecond or so per page
when writing data, which will add up quickly since these pages
are small (the largest is 1 KByte).  It doesn't seem to add a
lot in terms of reliability, and wouldn't detect errors which 
crop up when transferring data to the on-chip SRAM buffer.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/devices/Kconfig         |   10 ++++++++++
 drivers/mtd/devices/mtd_dataflash.c |    8 +++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

--- a/drivers/mtd/devices/Kconfig	2008-07-27 11:56:15.000000000 -0700
+++ b/drivers/mtd/devices/Kconfig	2008-07-27 12:13:52.000000000 -0700
@@ -59,6 +59,16 @@ config MTD_DATAFLASH
 	  Sometimes DataFlash chips are packaged inside MMC-format
 	  cards; at this writing, the MMC stack won't handle those.
 
+config MTD_DATAFLASH_WRITE_VERIFY
+	bool "Verify DataFlash page writes"
+	depends on MTD_DATAFLASH
+	help
+	  This adds an extra check when data is written to the flash.
+	  It may help if you are verifying chip setup (timings etc) on
+	  your board.  There is a rare possibility that even though the
+	  device thinks the write was successful, a bit could have been
+	  flipped accidentally due to device wear or something else.
+
 config MTD_DATAFLASH_OTP
 	bool "DataFlash OTP support (Security Register)"
 	depends on MTD_DATAFLASH
--- a/drivers/mtd/devices/mtd_dataflash.c	2008-07-27 11:56:15.000000000 -0700
+++ b/drivers/mtd/devices/mtd_dataflash.c	2008-07-27 12:10:38.000000000 -0700
@@ -30,12 +30,10 @@
  * doesn't (yet) use these for any kind of i/o overlap or prefetching.
  *
  * Sometimes DataFlash is packaged in MMC-format cards, although the
- * MMC stack can't use SPI (yet), or distinguish between MMC and DataFlash
+ * MMC stack can't (yet?) distinguish between MMC and DataFlash
  * protocols during enumeration.
  */
 
-#define CONFIG_DATAFLASH_WRITE_VERIFY
-
 /* reads can bypass the buffers */
 #define OP_READ_CONTINUOUS	0xE8
 #define OP_READ_PAGE		0xD2
@@ -403,7 +401,7 @@ static int dataflash_write(struct mtd_in
 		(void) dataflash_waitready(priv->spi);
 
 
-#ifdef	CONFIG_DATAFLASH_WRITE_VERIFY
+#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
 
 		/* (3) Compare to Buffer1 */
 		addr = pageaddr << priv->page_offset;
@@ -432,7 +430,7 @@ static int dataflash_write(struct mtd_in
 		} else
 			status = 0;
 
-#endif	/* CONFIG_DATAFLASH_WRITE_VERIFY */
+#endif	/* CONFIG_MTD_DATAFLASH_VERIFY_WRITE */
 
 		remaining = remaining - writelen;
 		pageaddr++;
