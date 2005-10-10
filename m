Received: from host-84-9-200-7.bulldogdsl.com ([84.9.200.7]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOmQQ-0007mc-Go
	for linux-mtd@lists.infradead.org; Sun, 09 Oct 2005 21:26:20 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1EOmQQ-0000id-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2005 02:25:58 +0100
Date: Mon, 10 Oct 2005 02:25:58 +0100
From: Ben Dooks <ben@fluff.org.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20051010012558.GA1269@home.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
Subject: updates i'd like to send for 2.6.14
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If there isn't going to be a merge before 2.6.14,
I would like to get the following changes into 
the kernel, so would like to send the attached
patch:

Changes are:

1) added .owner initialisation
2) change to using dev_err instead of printk


diff -urN -X ../dontdiff linux-2.6.13-simtec3a/drivers/mtd/maps/bast-flash.c linux-2.6.13-simtec3b/drivers/mtd/maps/bast-flash.c
--- linux-2.6.13-simtec3a/drivers/mtd/maps/bast-flash.c	2005-10-02 18:48:13.000000000 +0100
+++ linux-2.6.13-simtec3b/drivers/mtd/maps/bast-flash.c	2005-10-10 01:54:55.000000000 +0100
@@ -9,7 +9,7 @@
  *	20-Sep-2004  BJD  Initial version
  *	17-Jan-2005  BJD  Add whole device if no partitions found
  *
- * $Id: bast-flash.c,v 1.2 2005/01/18 11:13:47 bjd Exp $
+ * $Id: bast-flash.c,v 1.3 2005/10/10 00:13:38 bjd Exp $
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -205,6 +205,7 @@
 
 static struct device_driver bast_flash_driver = {
 	.name		= "bast-nor",
+	.owner		= THIS_MODULE,
 	.bus		= &platform_bus_type,
 	.probe		= bast_flash_probe,
 	.remove		= bast_flash_remove,
diff -urN -X ../dontdiff linux-2.6.13-simtec3a/drivers/mtd/nand/s3c2410.c linux-2.6.13-simtec3b/drivers/mtd/nand/s3c2410.c
--- linux-2.6.13-simtec3a/drivers/mtd/nand/s3c2410.c	2005-10-02 18:48:13.000000000 +0100
+++ linux-2.6.13-simtec3b/drivers/mtd/nand/s3c2410.c	2005-10-10 01:54:45.000000000 +0100
@@ -18,7 +18,7 @@
  *	20-Jun-2005  BJD  Updated s3c2440 support, fixed timing bug
  *	08-Jul-2005  BJD  Fix OOPS when no platform data supplied
  *
- * $Id: s3c2410.c,v 1.14 2005/07/06 20:05:06 bjd Exp $
+ * $Id: s3c2410.c,v 1.16 2005/10/10 00:09:16 bjd Exp $
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -575,7 +575,7 @@
 
 	info = kmalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
-		printk(KERN_ERR PFX "no memory for flash info\n");
+		dev_err("no memory for flash info\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
@@ -590,7 +590,7 @@
 
 	info->clk = clk_get(dev, "nand");
 	if (IS_ERR(info->clk)) {
-		printk(KERN_ERR PFX "failed to get clock");
+		dev_err(dev, "failed to get clock");
 		err = -ENOENT;
 		goto exit_error;
 	}
@@ -607,7 +607,7 @@
 	info->area = request_mem_region(res->start, size, pdev->name);
 
 	if (info->area == NULL) {
-		printk(KERN_ERR PFX "cannot reserve register region\n");
+		dev_err(dev, "cannot reserve register region\n");
 		err = -ENOENT;
 		goto exit_error;
 	}
@@ -618,12 +618,12 @@
 	info->is_s3c2440 = is_s3c2440;
 
 	if (info->regs == NULL) {
-		printk(KERN_ERR PFX "cannot reserve register region\n");
+		dev_err(dev, "cannot reserve register region\n");
 		err = -EIO;
 		goto exit_error;
 	}		
 
-	printk(KERN_INFO PFX "mapped registers at %p\n", info->regs);
+	dev_dbg(dev, "mapped registers at %p\n", info->regs);
 
 	/* initialise the hardware */
 
@@ -641,7 +641,7 @@
 	size = nr_sets * sizeof(*info->mtds);
 	info->mtds = kmalloc(size, GFP_KERNEL);
 	if (info->mtds == NULL) {
-		printk(KERN_ERR PFX "failed to allocate mtd storage\n");
+		dev_err(dev, "failed to allocate mtd storage\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
@@ -694,6 +694,7 @@
 
 static struct device_driver s3c2410_nand_driver = {
 	.name		= "s3c2410-nand",
+	.owner		= THIS_MODULE,
 	.bus		= &platform_bus_type,
 	.probe		= s3c2410_nand_probe,
 	.remove		= s3c2410_nand_remove,
@@ -701,6 +702,7 @@
 
 static struct device_driver s3c2440_nand_driver = {
 	.name		= "s3c2440-nand",
+	.owner		= THIS_MODULE,
 	.bus		= &platform_bus_type,
 	.probe		= s3c2440_nand_probe,
 	.remove		= s3c2410_nand_remove,

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="s3c2410-mtd-update.patch"

diff -urN -X ../dontdiff linux-2.6.13-simtec3a/drivers/mtd/maps/bast-flash.c linux-2.6.13-simtec3b/drivers/mtd/maps/bast-flash.c
--- linux-2.6.13-simtec3a/drivers/mtd/maps/bast-flash.c	2005-10-02 18:48:13.000000000 +0100
+++ linux-2.6.13-simtec3b/drivers/mtd/maps/bast-flash.c	2005-10-10 01:54:55.000000000 +0100
@@ -9,7 +9,7 @@
  *	20-Sep-2004  BJD  Initial version
  *	17-Jan-2005  BJD  Add whole device if no partitions found
  *
- * $Id: bast-flash.c,v 1.2 2005/01/18 11:13:47 bjd Exp $
+ * $Id: bast-flash.c,v 1.3 2005/10/10 00:13:38 bjd Exp $
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -205,6 +205,7 @@
 
 static struct device_driver bast_flash_driver = {
 	.name		= "bast-nor",
+	.owner		= THIS_MODULE,
 	.bus		= &platform_bus_type,
 	.probe		= bast_flash_probe,
 	.remove		= bast_flash_remove,
diff -urN -X ../dontdiff linux-2.6.13-simtec3a/drivers/mtd/nand/s3c2410.c linux-2.6.13-simtec3b/drivers/mtd/nand/s3c2410.c
--- linux-2.6.13-simtec3a/drivers/mtd/nand/s3c2410.c	2005-10-02 18:48:13.000000000 +0100
+++ linux-2.6.13-simtec3b/drivers/mtd/nand/s3c2410.c	2005-10-10 01:54:45.000000000 +0100
@@ -18,7 +18,7 @@
  *	20-Jun-2005  BJD  Updated s3c2440 support, fixed timing bug
  *	08-Jul-2005  BJD  Fix OOPS when no platform data supplied
  *
- * $Id: s3c2410.c,v 1.14 2005/07/06 20:05:06 bjd Exp $
+ * $Id: s3c2410.c,v 1.16 2005/10/10 00:09:16 bjd Exp $
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -575,7 +575,7 @@
 
 	info = kmalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
-		printk(KERN_ERR PFX "no memory for flash info\n");
+		dev_err("no memory for flash info\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
@@ -590,7 +590,7 @@
 
 	info->clk = clk_get(dev, "nand");
 	if (IS_ERR(info->clk)) {
-		printk(KERN_ERR PFX "failed to get clock");
+		dev_err(dev, "failed to get clock");
 		err = -ENOENT;
 		goto exit_error;
 	}
@@ -607,7 +607,7 @@
 	info->area = request_mem_region(res->start, size, pdev->name);
 
 	if (info->area == NULL) {
-		printk(KERN_ERR PFX "cannot reserve register region\n");
+		dev_err(dev, "cannot reserve register region\n");
 		err = -ENOENT;
 		goto exit_error;
 	}
@@ -618,12 +618,12 @@
 	info->is_s3c2440 = is_s3c2440;
 
 	if (info->regs == NULL) {
-		printk(KERN_ERR PFX "cannot reserve register region\n");
+		dev_err(dev, "cannot reserve register region\n");
 		err = -EIO;
 		goto exit_error;
 	}		
 
-	printk(KERN_INFO PFX "mapped registers at %p\n", info->regs);
+	dev_dbg(dev, "mapped registers at %p\n", info->regs);
 
 	/* initialise the hardware */
 
@@ -641,7 +641,7 @@
 	size = nr_sets * sizeof(*info->mtds);
 	info->mtds = kmalloc(size, GFP_KERNEL);
 	if (info->mtds == NULL) {
-		printk(KERN_ERR PFX "failed to allocate mtd storage\n");
+		dev_err(dev, "failed to allocate mtd storage\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
@@ -694,6 +694,7 @@
 
 static struct device_driver s3c2410_nand_driver = {
 	.name		= "s3c2410-nand",
+	.owner		= THIS_MODULE,
 	.bus		= &platform_bus_type,
 	.probe		= s3c2410_nand_probe,
 	.remove		= s3c2410_nand_remove,
@@ -701,6 +702,7 @@
 
 static struct device_driver s3c2440_nand_driver = {
 	.name		= "s3c2440-nand",
+	.owner		= THIS_MODULE,
 	.bus		= &platform_bus_type,
 	.probe		= s3c2440_nand_probe,
 	.remove		= s3c2410_nand_remove,

--vtzGhvizbBRQ85DL--
