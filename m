Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HD1lE-0004Pb-R7
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 11:59:42 -0500
Date: Fri, 2 Feb 2007 16:59:33 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: S3C2410: Hardware ECC correction code
Message-ID: <20070202165932.GA3699@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for correcting errors detected by the
hardware ECC.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

diff -urpN -X ../dontdiff linux-2.6.20-rc6/drivers/mtd/nand/Kconfig linux-2.6.20-rc6-nand1/drivers/mtd/nand/Kconfig
--- linux-2.6.20-rc6/drivers/mtd/nand/Kconfig	2007-01-27 17:39:19.000000000 +0000
+++ linux-2.6.20-rc6-nand1/drivers/mtd/nand/Kconfig	2007-02-02 16:51:12.000000000 +0000
@@ -126,10 +126,6 @@ config MTD_NAND_S3C2410_HWECC
 	  incorrect ECC generation, and if using these, the default of
 	  software ECC is preferable.
 
-	  If you lay down a device with the hardware ECC, then you will
-	  currently not be able to switch to software, as there is no
-	  implementation for ECC method used by the S3C2410
-
 config MTD_NAND_NDFC
 	tristate "NDFC NanD Flash Controller"
 	depends on MTD_NAND && 44x
diff -urpN -X ../dontdiff linux-2.6.20-rc6/drivers/mtd/nand/s3c2410.c linux-2.6.20-rc6-nand1/drivers/mtd/nand/s3c2410.c
--- linux-2.6.20-rc6/drivers/mtd/nand/s3c2410.c	2007-01-27 17:39:19.000000000 +0000
+++ linux-2.6.20-rc6-nand1/drivers/mtd/nand/s3c2410.c	2007-02-02 16:51:12.000000000 +0000
@@ -337,17 +337,69 @@ static int s3c2412_nand_devready(struct 
 static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 				     u_char *read_ecc, u_char *calc_ecc)
 {
-	pr_debug("s3c2410_nand_correct_data(%p,%p,%p,%p)\n", mtd, dat, read_ecc, calc_ecc);
+	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
+	unsigned int diff0, diff1, diff2;
+	unsigned int bit, byte;
 
-	pr_debug("eccs: read %02x,%02x,%02x vs calc %02x,%02x,%02x\n",
-		 read_ecc[0], read_ecc[1], read_ecc[2], calc_ecc[0], calc_ecc[1], calc_ecc[2]);
+	pr_debug("%s(%p,%p,%p,%p)\n", __func__, mtd, dat, read_ecc, calc_ecc);
 
-	if (read_ecc[0] == calc_ecc[0] && read_ecc[1] == calc_ecc[1] && read_ecc[2] == calc_ecc[2])
-		return 0;
+	diff0 = read_ecc[0] ^ calc_ecc[0];
+	diff1 = read_ecc[1] ^ calc_ecc[1];
+	diff2 = read_ecc[2] ^ calc_ecc[2];
+
+	pr_debug("%s: rd %02x%02x%02x calc %02x%02x%02x diff %02x%02x%02x\n",
+		 __func__,
+		 read_ecc[0], read_ecc[1], read_ecc[2],
+		 calc_ecc[0], calc_ecc[1], calc_ecc[2],
+		 diff0, diff1, diff2);
+
+	if (diff0 == 0 && diff1 == 0 && diff2 == 0)
+		return 0;		/* ECC is ok */
+
+	/* Can we correct this ECC (ie, one row and column change).
+	 * Note, this is similar to the 256 error code on smartmedia */
+
+	if (((diff0 ^ (diff0 >> 1)) & 0x55) == 0x55 &&
+	    ((diff1 ^ (diff1 >> 1)) & 0x55) == 0x55 &&
+	    ((diff2 ^ (diff2 >> 1)) & 0x55) == 0x55) {
+		/* calculate the bit position of the error */
+
+		bit  = (diff2 >> 2) & 1;
+		bit |= (diff2 >> 3) & 2;
+		bit |= (diff2 >> 4) & 4;
+
+		/* calculate the byte position of the error */
+
+		byte  = (diff1 << 1) & 0x80;
+		byte |= (diff1 << 2) & 0x40;
+		byte |= (diff1 << 3) & 0x20;
+		byte |= (diff1 << 4) & 0x10;
 
-	/* we curently have no method for correcting the error */
+		byte |= (diff0 >> 3) & 0x08;
+		byte |= (diff0 >> 2) & 0x04;
+		byte |= (diff0 >> 1) & 0x02;
+		byte |= (diff0 >> 0) & 0x01;
 
-	return -1;
+		byte |= (diff2 << 8) & 0x100;
+
+		dev_dbg(info->device, "correcting error bit %d, byte %d\n",
+			bit, byte);
+
+		dat[byte] ^= (1 << bit);
+		return 1;
+	}
+
+	/* if there is only one bit difference in the ECC, then
+	 * one of only a row or column parity has changed, which
+	 * means the error is most probably in the ECC itself */
+
+	diff0 |= (diff1 << 8);
+	diff0 |= (diff2 << 16);
+
+	if ((diff0 & ~(1<<fls(diff0))) == 0)
+		return 1;
+
+	return 0;
 }
 
 /* ECC functions
@@ -383,7 +435,8 @@ static int s3c2410_nand_calculate_ecc(st
 	ecc_code[1] = readb(info->regs + S3C2410_NFECC + 1);
 	ecc_code[2] = readb(info->regs + S3C2410_NFECC + 2);
 
-	pr_debug("calculate_ecc: returning ecc %02x,%02x,%02x\n", ecc_code[0], ecc_code[1], ecc_code[2]);
+	pr_debug("%s: returning ecc %02x%02x%02x\n", __func__,
+		 ecc_code[0], ecc_code[1], ecc_code[2]);
 
 	return 0;
 }
@@ -397,7 +450,7 @@ static int s3c2440_nand_calculate_ecc(st
 	ecc_code[1] = ecc >> 8;
 	ecc_code[2] = ecc >> 16;
 
-	pr_debug("calculate_ecc: returning ecc %02x,%02x,%02x\n", ecc_code[0], ecc_code[1], ecc_code[2]);
+	pr_debug("%s: returning ecc %06x\n", __func__, ecc);
 
 	return 0;
 }
