Received: from mgw-x2.nokia.com ([131.228.20.22])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1COWuA-0000wu-HR
	for linux-mtd@lists.infradead.org; Mon, 01 Nov 2004 02:47:08 -0500
Received: from esdks002.ntc.nokia.com (esdks002.ntc.nokia.com [172.21.138.121])
	by mgw-x2.nokia.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id
	iA17kxe08634 for <linux-mtd@lists.infradead.org>;
	Mon, 1 Nov 2004 09:47:00 +0200 (EET)
Received: (from root@localhost)
	by esdks002.ntc.nokia.com (8.12.9/8.12.9) id iA17kux7027150
	for <linux-mtd@lists.infradead.org>; Mon, 1 Nov 2004 09:46:56 +0200
Received: from two.research.nokia.com (two.research.nokia.com [172.21.50.14])
	by mgw-int2.ntc.nokia.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id
	iA17kmS23731 for <linux-mtd@lists.infradead.org>;
	Mon, 1 Nov 2004 09:46:48 +0200 (EET)
From: Juha =?ISO-8859-1?Q?Yrj=F6l=E4?= <juha.yrjola@nokia.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-lJNhu9VQc0M6xqMsnBq7"
Date: Mon, 01 Nov 2004 09:46:48 +0200
Message-Id: <1099295208.10601.8.camel@two.research.nokia.com>
Mime-Version: 1.0
Subject: [PATCH] Add NAND_ECC_HW12_2048
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lJNhu9VQc0M6xqMsnBq7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

The attached patch adds support for ECC hardware that generates 12 bytes
of ECC per 2048 bytes of data.

Please apply.

Cheers,
Juha


--=-lJNhu9VQc0M6xqMsnBq7
Content-Disposition: attachment; filename=mtd-nand-hw-ecc-2048.diff
Content-Type: text/x-patch; name=mtd-nand-hw-ecc-2048.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

===== include/linux/mtd/nand.h 1.6 vs edited =====
--- 1.6/include/linux/mtd/nand.h	2004-10-26 13:39:12 +03:00
+++ edited/include/linux/mtd/nand.h	2004-10-30 07:57:23 +03:00
@@ -138,6 +138,8 @@
 #define NAND_ECC_HW6_512	4
 /* Hardware ECC 8 byte ECC per 512 Byte data */
 #define NAND_ECC_HW8_512	6
+/* Hardware ECC 12 byte ECC per 2048 Byte data */
+#define NAND_ECC_HW12_2048	7
 
 /*
  * Constants for Hardware ECC
===== drivers/mtd/nand/nand_base.c 1.11 vs edited =====
--- 1.11/drivers/mtd/nand/nand_base.c	2004-10-26 13:39:12 +03:00
+++ edited/drivers/mtd/nand/nand_base.c	2004-10-31 21:06:36 +02:00
@@ -840,7 +840,10 @@
 		}
 		this->write_buf(mtd, this->data_poi, mtd->oobblock);
 		break;
-		
+
+	/* Hardware ECC 12 byte / 2048 byte data */
+	case NAND_ECC_HW12_2048:
+		eccbytes += 4;
 	/* Hardware ecc 8 byte / 512 byte data */	
 	case NAND_ECC_HW8_512:	
 		eccbytes += 2;
@@ -1099,6 +1102,9 @@
 	case NAND_ECC_HW8_512: /* Hardware ECC 8 byte / 512 byte data  */
 		eccbytes = 8;
 		break;
+	case NAND_ECC_HW12_2048: /* Hardware ECC 8 byte / 512 byte data  */
+		eccbytes = 12;
+		break;
 	case NAND_ECC_NONE:
 		compareecc = 0;
 		break;						
@@ -1164,13 +1170,14 @@
 			for (i = 0, datidx = 0; eccsteps; eccsteps--, i+=3, datidx += ecc) 
 				this->calculate_ecc(mtd, &data_poi[datidx], &ecc_calc[i]);
 			break;	
-			
-		case NAND_ECC_HW3_256: /* Hardware ECC 3 byte /256 byte data */
-		case NAND_ECC_HW3_512: /* Hardware ECC 3 byte /512 byte data */	
+
+		case NAND_ECC_HW12_2048: /* Hardware ECC 12 byte / 2048 byte data */
+		case NAND_ECC_HW3_256: /* Hardware ECC 3 byte / 256 byte data */
+		case NAND_ECC_HW3_512: /* Hardware ECC 3 byte / 512 byte data */
 		case NAND_ECC_HW6_512: /* Hardware ECC 6 byte / 512 byte data  */
 		case NAND_ECC_HW8_512: /* Hardware ECC 8 byte / 512 byte data  */
 			for (i = 0, datidx = 0; eccsteps; eccsteps--, i+=eccbytes, datidx += ecc) {
-				this->enable_hwecc(mtd, NAND_ECC_READ);	
+				this->enable_hwecc(mtd, NAND_ECC_READ);
 				this->read_buf(mtd, &data_poi[datidx], ecc);
 
 				/* HW ecc with syndrome calculation must read the
@@ -2435,6 +2442,17 @@
 	this->eccsize = 256;	/* set default eccsize */	
 
 	switch (this->eccmode) {
+	case NAND_ECC_HW12_2048:
+		if (mtd->oobblock < 2048) {
+			printk(KERN_WARNING "2048 byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
+			       mtd->oobblock);
+			this->eccmode = NAND_ECC_SOFT;
+			this->calculate_ecc = nand_calculate_ecc;
+			this->correct_data = nand_correct_data;
+			break;
+		} else
+			this->eccsize = 2048;
+		break;
 
 	case NAND_ECC_HW3_512: 
 	case NAND_ECC_HW6_512: 
@@ -2473,6 +2491,9 @@
 	
 	/* Set the number of read / write steps for one page to ensure ECC generation */
 	switch (this->eccmode) {
+	case NAND_ECC_HW12_2048:
+		this->eccsteps = mtd->oobblock / 2048;
+		break;
 	case NAND_ECC_HW3_512:
 	case NAND_ECC_HW6_512:
 	case NAND_ECC_HW8_512:

--=-lJNhu9VQc0M6xqMsnBq7--
