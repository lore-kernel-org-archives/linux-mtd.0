Received: from alephnull.demon.nl ([212.238.201.82] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlXWc-0007y3-Rg
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2005 15:38:14 -0400
Date: Thu, 23 Jun 2005 21:33:01 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: dsaxena@plexity.net, linux-mtd@lists.infradead.org
Message-ID: <20050623193301.GA5889@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: 
Subject: [PATCH] fix compile warnings in ixp2000 map driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(please CC on replies, not on the list)

Fix two compile warnings that occur because of treating two
'unsigned long's as 'void *'s.

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
