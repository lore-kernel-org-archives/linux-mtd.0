Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHLsQ-0001WI-06
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 09:40:21 -0400
Message-ID: <432EBFC8.3090803@ru.mvista.com>
Date: Mon, 19 Sep 2005 17:40:24 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------040006080302060705090504"
Subject: NAND/ HW ECC problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040006080302060705090504
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Greetings,

we're currently working on NAND flash driver implementation for a new 
ARM926-based board. The flash controller is SanDisk's MLC, and the the 
requirement is to use hardware ECC capabilities provided by this controller.

We've come across several hardships with generic MTD NAND stuff carrying 
out this task.

First, it turned to be necessary to add one more ECC type 
(NAND_ECC_HW10_512): this controller stores 10 ECC data bytes after each 
512-byte block. Also the need to change size of eccpos array off of 
nand_oobinfo structure arose: for flashes with 2K-sector, this turned to 
be 40 bytes for each sector.

The serious problem we came across also was that nand_write_page doesn't 
follow the free bytes reference for OOB to write ECC data what was 
obviously wrong. As far as I understand, the DoC flashes have specific 
mechanism for handling that, so he legacy variant was left for the DoC, 
dunno whether it's right.

Attached is the patch suggested to fix the problems described.

Best regards,
   Vitaly



--------------040006080302060705090504
Content-Type: text/plain;
 name="nand-ecc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand-ecc.patch"

Index: linux-2.6.10/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.10.orig/drivers/mtd/nand/nand_base.c
+++ linux-2.6.10/drivers/mtd/nand/nand_base.c
@@ -904,11 +904,17 @@ static int nand_write_page (struct mtd_i
 		}
 		break;
 	}
-										
+
 	/* Write out OOB data */
-	if (this->options & NAND_HWECC_SYNDROME)
-		this->write_buf(mtd, &oob_buf[oobsel->eccbytes], mtd->oobsize - oobsel->eccbytes);
-	else 
+	if (this->options & NAND_HWECC_SYNDROME) 
+		if (mtd->ecctype != MTD_ECC_RS_DiskOnChip ) 
+			for (i = 0; oobsel->oobfree[i][1]; i++ ) 
+		    		this->write_buf (mtd, 
+						 oob_buf+oobsel->oobfree[i][0],
+			    			 oobsel->oobfree[i][1] );
+		else /* DiskOnChip legacy ECC */
+			this->write_buf(mtd, &oob_buf[oobsel->eccbytes], mtd->oobsize - oobsel->eccbytes);
+	else  
 		this->write_buf(mtd, oob_buf, mtd->oobsize);
 
 	/* Send command to actually program the data */
@@ -1247,8 +1253,15 @@ int nand_do_read_ecc (struct mtd_info *m
 			break;						
 		}
 
+		
 		/* read oobdata */
-		this->read_buf(mtd, &oob_data[mtd->oobsize - oobreadlen], oobreadlen);
+		if (mtd->ecctype != MTD_ECC_RS_DiskOnChip )
+			for (i = 0; oobsel->oobfree[i][1]; i++ ) 
+		    		this->read_buf (mtd, 
+						oob_data+oobsel->oobfree[i][0],
+			    			oobsel->oobfree[i][1] );
+		else /* legacy DiskOnChip ECC */
+			 this->read_buf(mtd, &oob_data[mtd->oobsize - oobreadlen], oobreadlen);
 
 		/* Skip ECC check, if not requested (ECC_NONE or HW_ECC with syndromes) */
 		if (!compareecc)
@@ -2542,6 +2555,7 @@ int nand_scan (struct mtd_info *mtd, int
 			this->eccsize = 2048;
 		break;
 
+	case NAND_ECC_HW10_512:
 	case NAND_ECC_HW3_512: 
 	case NAND_ECC_HW6_512: 
 	case NAND_ECC_HW8_512: 
@@ -2578,7 +2592,9 @@ int nand_scan (struct mtd_info *mtd, int
 	switch (this->eccmode) {
 	case NAND_ECC_HW12_2048:
 		this->eccbytes += 4;
-	case NAND_ECC_HW8_512: 
+	case NAND_ECC_HW10_512: 
+		this->eccbytes += 2;		
+    	case NAND_ECC_HW8_512: 
 		this->eccbytes += 2;
 	case NAND_ECC_HW6_512: 
 		this->eccbytes += 3;
@@ -2600,6 +2616,7 @@ int nand_scan (struct mtd_info *mtd, int
 	case NAND_ECC_HW3_512:
 	case NAND_ECC_HW6_512:
 	case NAND_ECC_HW8_512:
+	case NAND_ECC_HW10_512:
 		this->eccsteps = mtd->oobblock / 512;
 		break;
 	case NAND_ECC_HW3_256:
Index: linux-2.6.10/include/mtd/mtd-abi.h
===================================================================
--- linux-2.6.10.orig/include/mtd/mtd-abi.h
+++ linux-2.6.10/include/mtd/mtd-abi.h
@@ -115,7 +115,7 @@ struct nand_oobinfo {
 	uint32_t useecc;
 	uint32_t eccbytes;
 	uint32_t oobfree[8][2];
-	uint32_t eccpos[32];
+	uint32_t eccpos[40];
 };
 
 #endif /* __MTD_ABI_H__ */
Index: linux-2.6.10/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.10.orig/include/linux/mtd/nand.h
+++ linux-2.6.10/include/linux/mtd/nand.h
@@ -161,8 +161,10 @@ extern int nand_read_raw (struct mtd_inf
 #define NAND_ECC_HW6_512	4
 /* Hardware ECC 8 byte ECC per 512 Byte data */
 #define NAND_ECC_HW8_512	6
+/* SanDisk MLC: 10 bytes ECC per 512 Byte data */
+#define NAND_ECC_HW10_512	7
 /* Hardware ECC 12 byte ECC per 2048 Byte data */
-#define NAND_ECC_HW12_2048	7
+#define NAND_ECC_HW12_2048	8
 
 /*
  * Constants for Hardware ECC

--------------040006080302060705090504--
