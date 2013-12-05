Received: from mail-qa0-x230.google.com ([2607:f8b0:400d:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VofPU-0004WF-QH
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 20:20:34 +0000
Received: by mail-qa0-f48.google.com with SMTP id w5so165864qac.7
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 12:20:11 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] mtd: nand: support Micron READ RETRY
Date: Thu,  5 Dec 2013 12:19:59 -0800
Message-Id: <1386274800-22013-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1386274800-22013-1-git-send-email-computersforpeace@gmail.com>
References: <1386274800-22013-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MLC NAND can experience a large number of bitflips (beyond the
recommended correctability capacity) due to drifts in the voltage
threshold (Vt). These bitflips can cause ECC errors to occur well within
the expected lifetime of the flash. To account for this, some
manufacturers provide a mechanism for shifting the Vt threshold after a
corrupted read. Micron provides the necessary information via the ONFI
vendor-specific parameter block (to indicate how many read-retry modes
are available) and the ONFI {GET,SET}_FEATURES commands with a
vendor-specific feature address (to support reading/switching the
current read-retry mode).

The recommmended sequence is as follows:

  1. Perform PAGE_READ operation
  2. If no ECC error, we are done
  3. Run SET_FEATURES with feature address 89h, mode 1
  4. Retry PAGE_READ operation
  5. If ECC error and there are remaining supported modes, increment the
     mode and return to step 3. Otherwise, this is a true ECC error.
  6. Run SET_FEATURES with feature address 89h, mode 0, to return to the
     default state.

Tested on Micron MT29F32G08CBADA, suppors 8 read-retry modes.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
One thing I'm not sure about: do all relevant (i.e., ONFI-capable) NAND drivers
support SET_FEATURES properly? If not, then it's possible that this could break
nand_do_read_ops for such drivers. Not sure what the best method of handling
that would be.

 drivers/mtd/nand/nand_base.c | 71 +++++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/nand.h     |  6 ++++
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 239f1dacee58..82efd819f31b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1408,6 +1408,30 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 }
 
 /**
+ * nand_set_read_retry - [INTERN] Set the READ RETRY mode
+ * @mtd: MTD device structure
+ * @retry_mode: the retry mode to use
+ *
+ * Some vendors supply a special command to shift the Vt threshold, to be used
+ * when there are too many bitflips in a page (i.e., ECC error). After setting
+ * a new threshold, the host should retry reading the page.
+ */
+static int nand_set_read_retry(struct mtd_info *mtd, int retry_mode)
+{
+	struct nand_chip *chip = mtd->priv;
+	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
+
+	if (retry_mode >= chip->read_retries)
+		return -EINVAL;
+
+	if (chip->onfi_params.jedec_id == NAND_MFR_MICRON)
+		return chip->onfi_set_features(mtd, chip,
+				ONFI_FEATURE_ADDR_READ_RETRY, feature);
+
+	return -EOPNOTSUPP;
+}
+
+/**
  * nand_do_read_ops - [INTERN] Read data with ECC
  * @mtd: MTD device structure
  * @from: offset to read from
@@ -1429,6 +1453,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	uint8_t *bufpoi, *oob, *buf;
 	unsigned int max_bitflips = 0;
 
+	int retry_mode = 0;
 	bool ecc_fail = false;
 
 	chipnr = (int)(from >> chip->chip_shift);
@@ -1492,8 +1517,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
 
-			buf += bytes;
-
 			if (unlikely(oob)) {
 				int toread = min(oobreadlen, max_oobsize);
 
@@ -1512,8 +1535,27 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 					nand_wait_ready(mtd);
 			}
 
-			if (mtd->ecc_stats.failed - ecc_failures)
-				ecc_fail = true;
+			if (mtd->ecc_stats.failed - ecc_failures) {
+				retry_mode++;
+				if (retry_mode < chip->read_retries) {
+					pr_debug("ECC error; performing READ RETRY %d\n",
+							retry_mode);
+
+					ret = nand_set_read_retry(mtd,
+							retry_mode);
+					if (ret < 0)
+						break;
+
+					/* Reset failures */
+					mtd->ecc_stats.failed = ecc_failures;
+					continue;
+				} else {
+					/* No more retry modes; real failure */
+					ecc_fail = true;
+				}
+			}
+
+			buf += bytes;
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
@@ -1523,6 +1565,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 		readlen -= bytes;
 
+		/* Reset to retry mode 0 */
+		if (retry_mode) {
+			ret = nand_set_read_retry(mtd, 0);
+			if (ret < 0)
+				break;
+			retry_mode = 0;
+		}
+
 		if (!readlen)
 			break;
 
@@ -2930,6 +2980,16 @@ ext_out:
 }
 
 /*
+ * Configure chip properties from Micron vendor-specific ONFI table
+ */
+static void nand_onfi_detect_micron(struct nand_chip *chip,
+		struct nand_onfi_params *p)
+{
+	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
+	chip->read_retries = micron->read_retry_options;
+}
+
+/*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
 static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
@@ -3035,6 +3095,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
+	if (p->jedec_id == NAND_MFR_MICRON)
+		nand_onfi_detect_micron(chip, p);
+
 	return 1;
 }
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 029fe5948dc4..6e579e90955e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -219,6 +219,9 @@ struct nand_chip;
 /* ONFI feature address */
 #define ONFI_FEATURE_ADDR_TIMING_MODE	0x1
 
+/* Vendor-specific feature address (Micron) */
+#define ONFI_FEATURE_ADDR_READ_RETRY	0x89
+
 /* ONFI subfeature parameters length */
 #define ONFI_SUBFEATURE_PARAM_LEN	4
 
@@ -518,6 +521,7 @@ struct nand_buffers {
  *			non 0 if ONFI supported.
  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
  *			supported, 0 otherwise.
+ * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
  * @bbt:		[INTERN] bad block table pointer
@@ -589,6 +593,8 @@ struct nand_chip {
 	int onfi_version;
 	struct nand_onfi_params	onfi_params;
 
+	int read_retries;
+
 	flstate_t state;
 
 	uint8_t *oob_poi;
-- 
1.8.5
