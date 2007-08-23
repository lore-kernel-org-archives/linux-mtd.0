Received: from za-gw.sanpeople.com ([196.211.225.226])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IOEDQ-0005vW-Eu
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 11:03:22 -0400
Subject: [PATCH] [MTD] mtd_dataflash: Incorrect compare-after-write check
From: Andrew Victor <andrew@sanpeople.com>
To: dwmw2@infradead.org
Content-Type: text/plain
Message-Id: <1187880348.28773.107.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 23 Aug 2007 16:45:48 +0200
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After writing to a Dataflash page, the built-in compare operation is
used to check that the page was successfully written.  A logic bug in
checking the results of the comparison currently causes the compare to
never fail.

This bug was originally in the legacy at91_dataflash.c driver.

Signed-off-by: Andrew Victor <andrew@sanpeople.com>
Acked-by: David Brownell <david-b@pacbell.net>


diff -urN -x CVS linux-2.6.23-rc3/drivers/mtd/devices/mtd_dataflash.c linux-2.6-stable/drivers/mtd/devices/mtd_dataflash.c
--- linux-2.6.23-rc3/drivers/mtd/devices/mtd_dataflash.c	Thu Apr 26 05:08:32 2007
+++ linux-2.6-stable/drivers/mtd/devices/mtd_dataflash.c	Wed Aug 22 14:43:06 2007
@@ -419,7 +419,7 @@
 		status = dataflash_waitready(priv->spi);
 
 		/* Check result of the compare operation */
-		if ((status & (1 << 6)) == 1) {
+		if (status & (1 << 6)) {
 			printk(KERN_ERR "%s: compare page %u, err %d\n",
 				spi->dev.bus_id, pageaddr, status);
 			remaining = 0;
