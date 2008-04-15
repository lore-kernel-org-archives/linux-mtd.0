Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JliXF-0006Ul-Oz
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 10:37:11 +0000
Message-Id: <20080415103708.375123822@fluff.org.uk>
References: <20080415103617.924928338@fluff.org.uk>
Date: Tue, 15 Apr 2008 11:36:22 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: S3C2410 Allow ECC disable to be specified by the board
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-nand-s3c2410-disable-ecc.patch
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support to disable ECC checking for a given chip
when passed by the board via the platform data.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.25-rc9-quilt2.orig/drivers/mtd/nand/s3c2410.c	2008-04-15 11:07:26.000000000 +0100
+++ linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c	2008-04-15 11:07:28.000000000 +0100
@@ -675,6 +675,9 @@ static void s3c2410_nand_init_chip(struc
 
 	if (set->ecc_layout != NULL)
 		chip->ecc.layout = set->ecc_layout;
+
+	if (set->disable_ecc)
+		chip->ecc.mode	= NAND_ECC_NONE;
 }
 
 /* s3c2410_nand_update_chip
Index: linux-2.6.25-rc9-quilt2/include/asm-arm/plat-s3c/nand.h
===================================================================
--- linux-2.6.25-rc9-quilt2.orig/include/asm-arm/plat-s3c/nand.h	2008-04-15 11:07:26.000000000 +0100
+++ linux-2.6.25-rc9-quilt2/include/asm-arm/plat-s3c/nand.h	2008-04-15 11:07:28.000000000 +0100
@@ -22,6 +22,8 @@
 */
 
 struct s3c2410_nand_set {
+	unsigned int		disable_ecc : 1;
+
 	int			nr_chips;
 	int			nr_partitions;
 	char			*name;

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
