Received: from za-gw.sanpeople.com ([196.211.225.226])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GseOP-0003fs-Am
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 06:59:56 -0500
Subject: [PATCH] [MTD] NAND: Support for 16-bit bus-width on AT91.
From: Andrew Victor <andrew@sanpeople.com>
To: dwmw2@infradead.org
Content-Type: text/plain
Message-Id: <1165578581.29331.93.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 08 Dec 2006 13:49:42 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for 16-bit NAND bus-width for the AT91 NAND driver.

The 16-bit NAND is found on the Atmel AT91SAM9260-EK and AT91SAM9261-EK
boards.

Orignal Patch from Patrice Vilchez


Signed-off-by: Andrew Victor <andrew@sanpeople.com>


diff -urN -x CVS linux-2.6.19-final/drivers/mtd/nand/at91_nand.c linux-2.6.19/drivers/mtd/nand/at91_nand.c
--- linux-2.6.19-final/drivers/mtd/nand/at91_nand.c	Fri Dec  8 12:56:33 2006
+++ linux-2.6.19/drivers/mtd/nand/at91_nand.c	Wed Nov 15 08:12:22 2006
@@ -128,6 +128,9 @@
 	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 
+	if (host->board->bus_width_16)		/* 16-bit bus width */
+		nand_chip->options |= NAND_BUSWIDTH_16;
+
 	platform_set_drvdata(pdev, host);
 	at91_nand_enable(host);
 
