Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcqFV-0006Pz-VG
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 15:20:53 -0500
Date: Thu, 17 Nov 2005 20:40:57 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051117194056.GA24824@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tglx@linutronix.de
Subject: [PATCH] fix ixp2000 map driver compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

The recent platform driver conversion broke the ixp2000 map driver.
The attached patch attempts to repair it, and now it appears to work
once again.

Looks okay?  If yes, would you please consider applying before 2.6.15?


cheers,
Lennert


===
"[DRIVER MODEL] Convert platform drivers to use struct platform_driver"
broke the ixp2000 map driver.  This patch patches up the missed _dev
-> dev conversions.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

diff -urN linux-2.6.15-rc1.orig/drivers/mtd/maps/ixp2000.c linux-2.6.15-rc1/drivers/mtd/maps/ixp2000.c
--- linux-2.6.15-rc1.orig/drivers/mtd/maps/ixp2000.c	2005-11-12 12:27:16.000000000 +0100
+++ linux-2.6.15-rc1/drivers/mtd/maps/ixp2000.c	2005-11-17 20:06:14.000000000 +0100
@@ -159,11 +159,11 @@
 		return -ENODEV;
 
 	window_size = dev->resource->end - dev->resource->start + 1;
-	dev_info(_dev, "Probe of IXP2000 flash(%d banks x %dMiB)\n",
+	dev_info(&dev->dev, "Probe of IXP2000 flash(%d banks x %dMiB)\n",
 			ixp_data->nr_banks, ((u32)window_size >> 20));
 
 	if (plat->width != 1) {
-		dev_err(_dev, "IXP2000 MTD map only supports 8-bit mode, asking for %d\n",
+		dev_err(&dev->dev, "IXP2000 MTD map only supports 8-bit mode, asking for %d\n",
 				plat->width * 8);
 		return -EIO;
 	}
@@ -202,7 +202,7 @@
 			dev->resource->end - dev->resource->start + 1,
 			dev->dev.bus_id);
 	if (!info->res) {
-		dev_err(_dev, "Could not reserve memory region\n");
+		dev_err(&dev->dev, "Could not reserve memory region\n");
 		err = -ENOMEM;
 		goto Error;
 	}
@@ -210,7 +210,7 @@
 	info->map.map_priv_1 = (unsigned long) ioremap(dev->resource->start,
 			    	dev->resource->end - dev->resource->start + 1);
 	if (!info->map.map_priv_1) {
-		dev_err(_dev, "Failed to ioremap flash region\n");
+		dev_err(&dev->dev, "Failed to ioremap flash region\n");
 		err = -EIO;
 		goto Error;
 	}
@@ -221,13 +221,13 @@
 	 */
 
 	erratum44_workaround = ixp2000_has_broken_slowport();
-	dev_info(_dev, "Erratum 44 workaround %s\n",
+	dev_info(&dev->dev, "Erratum 44 workaround %s\n",
 	       erratum44_workaround ? "enabled" : "disabled");
 #endif
 
 	info->mtd = do_map_probe(plat->map_name, &info->map);
 	if (!info->mtd) {
-		dev_err(_dev, "map_probe failed\n");
+		dev_err(&dev->dev, "map_probe failed\n");
 		err = -ENXIO;
 		goto Error;
 	}
@@ -237,7 +237,7 @@
 	if (err > 0) {
 		err = add_mtd_partitions(info->mtd, info->partitions, err);
 		if(err)
-			dev_err(_dev, "Could not parse partitions\n");
+			dev_err(&dev->dev, "Could not parse partitions\n");
 	}
 
 	if (err)
@@ -252,7 +252,7 @@
 
 static struct platform_driver ixp2000_flash_driver = {
 	.probe		= &ixp2000_flash_probe,
-	.remove		= &ixp2000_flash_remove
+	.remove		= &ixp2000_flash_remove,
 	.driver		= {
 		.name	= "IXP2000-Flash",
 	},
