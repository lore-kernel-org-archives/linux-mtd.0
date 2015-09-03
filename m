Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXWuy-0002g8-Ld
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 15:59:19 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 1/5] mtd: nand: return consistent error codes in
 ecc.correct() implementations
Date: Thu,  3 Sep 2015 17:58:44 +0200
Message-Id: <1441295932-14868-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1441295932-14868-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1441295932-14868-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The error code returned by the ecc.correct() are not consistent over the
all implementations.

Document the expected behavior in include/linux/mtd/nand.h and fix
offending implementations.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/atmel_nand.c   |  2 +-
 drivers/mtd/nand/bf5xx_nand.c   | 20 ++++++++++++++------
 drivers/mtd/nand/davinci_nand.c |  6 +++---
 drivers/mtd/nand/jz4740_nand.c  |  4 ++--
 drivers/mtd/nand/mxc_nand.c     |  4 ++--
 drivers/mtd/nand/nand_bch.c     |  2 +-
 drivers/mtd/nand/nand_ecc.c     |  2 +-
 drivers/mtd/nand/omap2.c        |  6 +++---
 drivers/mtd/nand/r852.c         |  4 ++--
 include/linux/mtd/nand.h        |  8 +++++++-
 include/linux/mtd/nand_bch.h    |  2 +-
 11 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 46010bd..dc7b399 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1443,7 +1443,7 @@ static int atmel_nand_correct(struct mtd_info *mtd, u_char *dat,
 		 * We can't correct so many errors */
 		dev_dbg(host->dev, "atmel_nand : multiple errors detected."
 				" Unable to correct.\n");
-		return -EIO;
+		return -EBADMSG;
 	}
 
 	/* if there's a single bit error : we can correct it */
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 4d8d4ba..9c39056 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -252,7 +252,7 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
 	 */
 	if (hweight32(syndrome[0]) == 1) {
 		dev_err(info->device, "ECC data was incorrect!\n");
-		return 1;
+		return -EBADMSG;
 	}
 
 	syndrome[1] = (calced & 0x7FF) ^ (stored & 0x7FF);
@@ -285,7 +285,7 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
 		data = data ^ (0x1 << failing_bit);
 		*(dat + failing_byte) = data;
 
-		return 0;
+		return 1;
 	}
 
 	/*
@@ -298,26 +298,34 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
 	dev_err(info->device,
 		"Please discard data, mark bad block\n");
 
-	return 1;
+	return -EBADMSG;
 }
 
 static int bf5xx_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 					u_char *read_ecc, u_char *calc_ecc)
 {
 	struct nand_chip *chip = mtd->priv;
-	int ret;
+	int ret, bitflips = 0;
 
 	ret = bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
+	if (ret < 0)
+		return ret;
+
+	bitflips = ret;
 
 	/* If ecc size is 512, correct second 256 bytes */
 	if (chip->ecc.size == 512) {
 		dat += 256;
 		read_ecc += 3;
 		calc_ecc += 3;
-		ret |= bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
+		ret = bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
+		if (ret < 0)
+			return ret;
+
+		bitflips += ret;
 	}
 
-	return ret;
+	return bitflips;
 }
 
 static void bf5xx_nand_enable_hwecc(struct mtd_info *mtd, int mode)
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index b9080130..816ef53 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -206,7 +206,7 @@ static int nand_davinci_correct_1bit(struct mtd_info *mtd, u_char *dat,
 				dat[diff >> (12 + 3)] ^= BIT((diff >> 12) & 7);
 				return 1;
 			} else {
-				return -1;
+				return -EBADMSG;
 			}
 		} else if (!(diff & (diff - 1))) {
 			/* Single bit ECC error in the ECC itself,
@@ -214,7 +214,7 @@ static int nand_davinci_correct_1bit(struct mtd_info *mtd, u_char *dat,
 			return 1;
 		} else {
 			/* Uncorrectable error */
-			return -1;
+			return -EBADMSG;
 		}
 
 	}
@@ -390,7 +390,7 @@ compare:
 			return 0;
 		case 1:		/* five or more errors detected */
 			davinci_nand_readl(info, NAND_ERR_ERRVAL1_OFFSET);
-			return -EIO;
+			return -EBADMSG;
 		case 2:		/* error addresses computed */
 		case 3:
 			num_errors = 1 + ((fsr >> 16) & 0x03);
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index ebf2cce..ba44af3 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -254,7 +254,7 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
 	} while (!(status & JZ_NAND_STATUS_DEC_FINISH) && --timeout);
 
 	if (timeout == 0)
-	    return -1;
+		return -ETIMEDOUT;
 
 	reg = readl(nand->base + JZ_REG_NAND_ECC_CTRL);
 	reg &= ~JZ_NAND_ECC_CTRL_ENABLE;
@@ -262,7 +262,7 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
 
 	if (status & JZ_NAND_STATUS_ERROR) {
 		if (status & JZ_NAND_STATUS_UNCOR_ERROR)
-			return -1;
+			return -EBADMSG;
 
 		error_count = (status & JZ_NAND_STATUS_ERR_COUNT) >> 29;
 
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 2426db8..7710fff 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -675,7 +675,7 @@ static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
 
 	if (((ecc_status & 0x3) == 2) || ((ecc_status >> 2) == 2)) {
 		pr_debug("MXC_NAND: HWECC uncorrectable 2-bit ECC error\n");
-		return -1;
+		return -EBADMSG;
 	}
 
 	return 0;
@@ -702,7 +702,7 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
 		err = ecc_stat & ecc_bit_mask;
 		if (err > err_limit) {
 			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
-			return -1;
+			return -EBADMSG;
 		} else {
 			ret += err;
 		}
diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 3803e0b..6cbf305 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -98,7 +98,7 @@ int nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		}
 	} else if (count < 0) {
 		printk(KERN_ERR "ecc unrecoverable error\n");
-		count = -1;
+		count = -EBADMSG;
 	}
 	return count;
 }
diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index 97c4c02..244a634 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -507,7 +507,7 @@ int __nand_correct_data(unsigned char *buf,
 		return 1;	/* error in ECC data; no action needed */
 
 	pr_err("%s: uncorrectable ECC error\n", __func__);
-	return -1;
+	return -EBADMSG;
 }
 EXPORT_SYMBOL(__nand_correct_data);
 
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 60fa899..03e2faa 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -830,12 +830,12 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
 	case 1:
 		/* Uncorrectable error */
 		pr_debug("ECC UNCORRECTED_ERROR 1\n");
-		return -1;
+		return -EBADMSG;
 
 	case 11:
 		/* UN-Correctable error */
 		pr_debug("ECC UNCORRECTED_ERROR B\n");
-		return -1;
+		return -EBADMSG;
 
 	case 12:
 		/* Correctable error */
@@ -865,7 +865,7 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
 				return 0;
 		}
 		pr_debug("UNCORRECTED_ERROR default\n");
-		return -1;
+		return -EBADMSG;
 	}
 }
 
diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index cc6bac5..c9ad7a0 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -477,7 +477,7 @@ static int r852_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
 
 	if (dev->dma_error) {
 		dev->dma_error = 0;
-		return -1;
+		return -EIO;
 	}
 
 	r852_write_reg(dev, R852_CTL, dev->ctlreg | R852_CTL_ECC_ACCESS);
@@ -491,7 +491,7 @@ static int r852_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
 		/* ecc uncorrectable error */
 		if (ecc_status & R852_ECC_FAIL) {
 			dbg("ecc: unrecoverable error, in half %d", i);
-			error = -1;
+			error = -EBADMSG;
 			goto exit;
 		}
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 77affe9..19d43b1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -456,7 +456,13 @@ struct nand_hw_control {
  * @hwctl:	function to control hardware ECC generator. Must only
  *		be provided if an hardware ECC is available
  * @calculate:	function for ECC calculation or readback from ECC hardware
- * @correct:	function for ECC correction, matching to ECC generator (sw/hw)
+ * @correct:	function for ECC correction, matching to ECC generator (sw/hw).
+ *		Should return a positive number representing the number of
+ *		corrected bitflips, -EBADMSG if the number of bitflips exceed
+ *		ECC strength, or any other error code if the error is not
+ *		directly related to correction.
+ *		If -EBADMSG is returned the input buffers should be left
+ *		untouched.
  * @read_page_raw:	function to read a raw page without ECC. This function
  *			should hide the specific layout used by the ECC
  *			controller and always return contiguous in-band and
diff --git a/include/linux/mtd/nand_bch.h b/include/linux/mtd/nand_bch.h
index 74acf53..fb0bc34 100644
--- a/include/linux/mtd/nand_bch.h
+++ b/include/linux/mtd/nand_bch.h
@@ -55,7 +55,7 @@ static inline int
 nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
 		      unsigned char *read_ecc, unsigned char *calc_ecc)
 {
-	return -1;
+	return -ENOTSUPP;
 }
 
 static inline struct nand_bch_control *
-- 
1.9.1
