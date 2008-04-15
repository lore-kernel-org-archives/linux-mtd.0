Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JliXF-0006Ud-Ox
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 10:37:10 +0000
Message-Id: <20080415103708.074883289@fluff.org.uk>
References: <20080415103617.924928338@fluff.org.uk>
Date: Tue, 15 Apr 2008 11:36:20 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: S3C2410 Allow unset ecc to be ignored for ecc correction
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-nand-s3c2410-ignore-unset-ecc.patch
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a block's ecc field is all 0xff, then ignore the ECC
correction. This is for systems where some of the blocks,
such as the initial cramfs are written without ECC and
need to be loaded on start.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.25-rc9-quilt2.orig/drivers/mtd/nand/s3c2410.c	2008-04-15 11:07:09.000000000 +0100
+++ linux-2.6.25-rc9-quilt2/drivers/mtd/nand/s3c2410.c	2008-04-15 11:07:20.000000000 +0100
@@ -357,6 +357,14 @@ static int s3c2410_nand_correct_data(str
 	if (diff0 == 0 && diff1 == 0 && diff2 == 0)
 		return 0;		/* ECC is ok */
 
+	/* sometimes people do not think about using the ECC, so check
+	 * to see if we have an 0xff,0xff,0xff read ECC and then ignore
+	 * the error, on the assumption that this is an un-eccd page.
+	 */
+	if (read_ecc[0] == 0xff && read_ecc[1] == 0xff && read_ecc[2] == 0xff
+	    && info->platform->ignore_unset_ecc)
+		return 0;
+
 	/* Can we correct this ECC (ie, one row and column change).
 	 * Note, this is similar to the 256 error code on smartmedia */
 
Index: linux-2.6.25-rc9-quilt2/include/asm-arm/plat-s3c/nand.h
===================================================================
--- linux-2.6.25-rc9-quilt2.orig/include/asm-arm/plat-s3c/nand.h	2008-04-15 10:55:44.000000000 +0100
+++ linux-2.6.25-rc9-quilt2/include/asm-arm/plat-s3c/nand.h	2008-04-15 11:07:20.000000000 +0100
@@ -36,6 +36,8 @@ struct s3c2410_platform_nand {
 	int	twrph0;	/* active time for nWE/nOE */
 	int	twrph1;	/* time for release CLE/ALE from nWE/nOE inactive */
 
+	unsigned int	ignore_unset_ecc : 1;
+
 	int			nr_sets;
 	struct s3c2410_nand_set *sets;
 

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
