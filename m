Received: from alephnull.demon.nl ([212.238.201.82] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DExuf-0004zS-Gs
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 18:08:23 -0500
Date: Sat, 26 Mar 2005 00:08:01 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: dsaxena@plexity.net, linux-mtd@lists.infradead.org
Message-ID: <20050325230801.GB31444@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: 
Subject: [PATCH] fix compile warnings and remove slowport mode setting from
	ixp2000 map driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(please CC on replies, not on the list)

Setting the slowport to 8-bit mode is done in the generic IXP2000
code (where it belongs) as of 2.6.11, so there's no need to do it
in the MTD map driver anymore.  Also fix two compile warnings that
occur because of treating two 'unsigned long's as 'void *'s.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

diff -urN linux-2.6.12-rc1.orig/drivers/mtd/maps/ixp2000.c linux-2.6.12-rc1/drivers/mtd/maps/ixp2000.c
--- linux-2.6.12-rc1.orig/drivers/mtd/maps/ixp2000.c	2005-03-20 18:33:46.000000000 +0100
+++ linux-2.6.12-rc1/drivers/mtd/maps/ixp2000.c	2005-03-25 22:42:54.000000000 +0100
@@ -191,7 +191,7 @@
 	/*
  	 * map_priv_2 is used to store a ptr to to the bank_setup routine
  	 */
-	info->map.map_priv_2 = (void __iomem *) ixp_data->bank_setup;
+	info->map.map_priv_2 = (unsigned long) ixp_data->bank_setup;
 
 	info->map.name = dev->dev.bus_id;
 	info->map.read = ixp2000_flash_read8;
@@ -208,7 +208,7 @@
 		goto Error;
 	}
 
-	info->map.map_priv_1 = ioremap(dev->resource->start, 
+	info->map.map_priv_1 = (unsigned long) ioremap(dev->resource->start, 
 			    	dev->resource->end - dev->resource->start + 1);
 	if (!info->map.map_priv_1) {
 		dev_err(_dev, "Failed to ioremap flash region\n");
@@ -216,11 +216,6 @@
 		goto Error;
 	}
 
-	/*
-	 * Setup read mode for FLASH
-	 */
-	*IXP2000_SLOWPORT_FRM = 1;
-
 #if defined(__ARMEB__)
 	/*
 	 * Enable erratum 44 workaround for NPUs with broken slowport
