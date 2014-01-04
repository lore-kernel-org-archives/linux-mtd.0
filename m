Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzFLL-0002qz-ST
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 00:44:00 +0000
Received: by mail-ig0-f175.google.com with SMTP id j1so2431375iga.2
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 16:43:38 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 3/5] mtd: nand: add generic READ RETRY support
Date: Fri,  3 Jan 2014 16:37:06 -0800
Message-Id: <1388795828-24808-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Modern MLC (and even SLC?) NAND can experience a large number of
bitflips (beyond the recommended correctability capacity) due to drifts
in the voltage threshold (Vt). These bitflips can cause ECC errors to
occur well within the expected lifetime of the flash. To account for
this, some manufacturers provide a mechanism for shifting the Vt
threshold after a corrupted read.

The generic pattern seems to be that a particular flash has N read retry
modes (where N = 0, traditionally), and after an ECC failure, the host
should reconfigure the flash to use the next available mode, then retry
the read operation. This process repeats until all bitfips can be
corrected or until the host has tried all available retry modes.

This patch adds the infrastructure support for a
vendor-specific/flash-specific callback, used for setting the read-retry
mode (i.e., voltage threshold).

For now, this patch always returns the flash to mode 0 (the default
mode) after a successful read-retry, according to the flowchart found in
Micron's datasheets. This may need to change in the future if it is
determined that eventually, mode 0 is insufficient for the majority of
the flash cells (and so for performance reasons, we should leave the
flash in mode 1, 2, etc.).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v1 -> v2: fix a logic error when incrementing retry_mode, which caused -EINVAL
          failures on flash that didn't need READ RETRY

v2 -> v3: split out the generic callback support as a separate patch; adjust #
          of retry modes bounds check

 drivers/mtd/nand/nand_base.c | 56 ++++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/nand.h     |  6 +++++
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e85b07f4293d..d47c5bbca2b3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1410,6 +1410,28 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
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
+
+	if (retry_mode >= chip->read_retries)
+		return -EINVAL;
+
+	if (!chip->set_read_retry)
+		return -EOPNOTSUPP;
+
+	return chip->set_read_retry(mtd, retry_mode);
+}
+
+/**
  * nand_do_read_ops - [INTERN] Read data with ECC
  * @mtd: MTD device structure
  * @from: offset to read from
@@ -1431,6 +1453,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	uint8_t *bufpoi, *oob, *buf;
 	unsigned int max_bitflips = 0;
 
+	int retry_mode = 0;
 	bool ecc_fail = false;
 
 	chipnr = (int)(from >> chip->chip_shift);
@@ -1494,8 +1517,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
 
-			buf += bytes;
-
 			if (unlikely(oob)) {
 				int toread = min(oobreadlen, max_oobsize);
 
@@ -1514,8 +1535,27 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 					nand_wait_ready(mtd);
 			}
 
-			if (mtd->ecc_stats.failed - ecc_failures)
-				ecc_fail = true;
+			if (mtd->ecc_stats.failed - ecc_failures) {
+				if (retry_mode + 1 <= chip->read_retries) {
+					retry_mode++;
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
@@ -1525,6 +1565,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
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
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 029fe5948dc4..ef70505dade1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -472,6 +472,8 @@ struct nand_buffers {
  *			commands to the chip.
  * @waitfunc:		[REPLACEABLE] hardwarespecific function for wait on
  *			ready.
+ * @set_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
+ *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buffers:		buffer structure for read/write
  * @hwcontrol:		platform-specific hardware control structure
@@ -518,6 +520,7 @@ struct nand_buffers {
  *			non 0 if ONFI supported.
  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
  *			supported, 0 otherwise.
+ * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
  * @bbt:		[INTERN] bad block table pointer
@@ -565,6 +568,7 @@ struct nand_chip {
 			int feature_addr, uint8_t *subfeature_para);
 	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
 			int feature_addr, uint8_t *subfeature_para);
+	int (*set_read_retry)(struct mtd_info *mtd, int retry_mode);
 
 	int chip_delay;
 	unsigned int options;
@@ -589,6 +593,8 @@ struct nand_chip {
 	int onfi_version;
 	struct nand_onfi_params	onfi_params;
 
+	int read_retries;
+
 	flstate_t state;
 
 	uint8_t *oob_poi;
-- 
1.8.3.2
