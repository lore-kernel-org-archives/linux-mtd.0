Received: from za-gw.sanpeople.com ([196.211.225.226])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iu6te-0004f0-6s
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 08:42:49 -0500
Subject: [PATCH] [MTD] mtd_dataflash: Incorrect compare-after-write check
From: Andrew Victor <andrew@sanpeople.com>
To: dwmw2@infradead.org
Content-Type: text/plain
Message-Id: <1195479443.32266.28.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 19 Nov 2007 15:37:23 +0200
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
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


diff -urN -x CVS linux-2.6.24-rc3/drivers/mtd/devices/mtd_dataflash.c linux-2.6-stable/drivers/mtd/devices/mtd_dataflash.c
--- linux-2.6.24-rc3/drivers/mtd/devices/mtd_dataflash.c	Mon Nov 19 11:31:10 2007
+++ linux-2.6-stable/drivers/mtd/devices/mtd_dataflash.c	Tue Nov 13 15:52:02 2007
@@ -420,7 +420,7 @@
 		status = dataflash_waitready(priv->spi);
 
 		/* Check result of the compare operation */
-		if ((status & (1 << 6)) == 1) {
+		if (status & (1 << 6)) {
 			printk(KERN_ERR "%s: compare page %u, err %d\n",
 				spi->dev.bus_id, pageaddr, status);
 			remaining = 0;
