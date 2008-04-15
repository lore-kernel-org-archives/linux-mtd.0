Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JliXF-0006Uc-Op
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 10:37:11 +0000
Message-Id: <20080415103707.918235058@fluff.org.uk>
References: <20080415103617.924928338@fluff.org.uk>
Date: Tue, 15 Apr 2008 11:36:19 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: S3C2410 Large page NAND support
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-nand-s3c24xx-largepage.patch
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds support for using large page NAND devices
with the S3C24XX NAND controller. This also adds the 
file Documentation/arm/Samsung-S3C24XX/NAND.txt to
describe the differences.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.25-rc9-quilt2.orig/drivers/mtd/nand/s3c2410.c	2008-04-15 11:02:11.000000000 +0100
+++ linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c	2008-04-15 11:07:09.000000000 +0100
@@ -472,7 +472,7 @@ static int s3c2440_nand_calculate_ecc(st
 	ecc_code[1] = ecc >> 8;
 	ecc_code[2] = ecc >> 16;
 
-	pr_debug("%s: returning ecc %06lx\n", __func__, ecc);
+	pr_debug("%s: returning ecc %06lx\n", __func__, ecc & 0xffffff);
 
 	return 0;
 }
@@ -643,9 +643,6 @@ static void s3c2410_nand_init_chip(struc
 		chip->ecc.calculate = s3c2410_nand_calculate_ecc;
 		chip->ecc.correct   = s3c2410_nand_correct_data;
 		chip->ecc.mode	    = NAND_ECC_HW;
-		chip->ecc.size	    = 512;
-		chip->ecc.bytes	    = 3;
-		chip->ecc.layout    = &nand_hw_eccoob;
 
 		switch (info->cpu_type) {
 		case TYPE_S3C2410:
@@ -669,6 +666,34 @@ static void s3c2410_nand_init_chip(struc
 	}
 }
 
+/* s3c2410_nand_update_chip
+ *
+ * post-probe chip update, to change any items, such as the
+ * layout for large page nand
+ */
+
+static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
+				     struct s3c2410_nand_mtd *nmtd)
+{
+	struct nand_chip *chip = &nmtd->chip;
+
+	printk("%s: chip %p: %d\n", __func__, chip, chip->page_shift);
+
+	if (hardware_ecc) {
+		/* change the behaviour depending on wether we are using
+		 * the large or small page nand device */
+
+		if (chip->page_shift > 10) {
+			chip->ecc.size	    = 256;
+			chip->ecc.bytes	    = 3;
+		} else {
+			chip->ecc.size	    = 512;
+			chip->ecc.bytes	    = 3;
+			chip->ecc.layout    = &nand_hw_eccoob;
+		}
+	}
+}
+
 /* s3c2410_nand_probe
  *
  * called by device layer when it finds a device matching
@@ -775,9 +800,12 @@ static int s3c24xx_nand_probe(struct pla
 
 		s3c2410_nand_init_chip(info, nmtd, sets);
 
-		nmtd->scan_res = nand_scan(&nmtd->mtd, (sets) ? sets->nr_chips : 1);
+		nmtd->scan_res = nand_scan_ident(&nmtd->mtd,
+						 (sets) ? sets->nr_chips : 1);
 
 		if (nmtd->scan_res == 0) {
+			s3c2410_nand_update_chip(info, nmtd);
+			nand_scan_tail(&nmtd->mtd);
 			s3c2410_nand_add_partition(info, nmtd, sets);
 		}
 
Index: linux-2.6.25-rc9-quilt2/Documentation/arm/Samsung-S3C24XX/NAND.txt
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux-2.6.25-rc9-quilt2/Documentation/arm/Samsung-S3C24XX/NAND.txt	2008-04-15 11:07:09.000000000 +0100
@@ -0,0 +1,30 @@
+			S3C24XX NAND Support
+			====================
+
+Introduction
+------------
+
+Small Page NAND
+---------------
+
+The driver uses a 512 byte (1 page) ECC code for this setup. The
+ECC code is not directly compatible with the default kernel ECC
+code, so the driver enforces its own OOB layout and ECC parameters
+
+Large Page NAND
+---------------
+
+The driver is capable of handling NAND flash with a 2KiB page
+size, with support for hardware ECC generation and correction.
+
+Unlike the 512byte page mode, the driver generates ECC data for
+each 256 byte block in an 2KiB page. This means that more than
+one error in a page can be rectified. It also means that the
+OOB layout remains the default kernel layout for these flashes.
+
+
+Document Author
+---------------
+
+Ben Dooks, Copyright 2007 Simtec Electronics
+
Index: linux-2.6.25-rc9-quilt2/Documentation/arm/Samsung-S3C24XX/Overview.txt
===================================================================
--- linux-2.6.25-rc9-quilt2.orig/Documentation/arm/Samsung-S3C24XX/Overview.txt	2008-04-15 10:55:50.000000000 +0100
+++ linux-2.6.25-rc9-quilt2/Documentation/arm/Samsung-S3C24XX/Overview.txt	2008-04-15 11:07:09.000000000 +0100
@@ -156,6 +156,8 @@ NAND
   controller. If there are any problems the latest linux-mtd
   code can be found from http://www.linux-mtd.infradead.org/
 
+  For more information see Documentation/arm/Samsung-S3C24XX/NAND.txt
+
 
 Serial
 ------

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
