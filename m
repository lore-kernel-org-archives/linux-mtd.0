Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNIjm-00050K-9K
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 09:12:39 +0000
Received: by mail-ie0-f171.google.com with SMTP id ar20so8654576iec.2
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 02:12:16 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Date: Tue, 11 Mar 2014 02:11:51 -0700
Message-Id: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>, Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Upper layers (e.g., UBI/UBIFS) expect that pages that have been erased
will return all 1's (0xff). However, modern NAND (MLC, and even some
SLC) experience bitflips in unprogrammed pages, and so they may not read
back all 1's. This is problematic for drivers whose ECC cannot correct
bitflips in an all-0xff page, as they will report an ECC error
(-EBADMSG) when they come across such a page. This appears to UBIFS as
"corrupt empty space".

Several others [1][2] are attempting to solve this problem, but none is
generically useful, and most (all?) have subtle bugs in their reasoning. Let's
implement a simple, generic, and correct solution instead.

To handle such situations, we should implement the following software
workaround for drivers that need it: when the hardware driver reports an
ECC error, nand_base should "verify" this error by

 * Re-reading the page without ECC
 * counting the number of 0 bits in each ECC sector (N[i], for i = 0, 1,
   ..., chip->ecc.steps)
 * If any N[i] exceeds the ECC strength (and thus, the maximum allowable
   bitflips) then we consider this to be an uncorrectable sector.
 * If all N[i] are less than the ECC strength, then we "correct" the
   output to all-0xff and report max-bitflips appropriately

Obviously, this sequence can be compute intensive if applied heavily.
Ideally, MTD users should not need to read un-programmed pages very
often and would require this software check, for instance, only during
attach/mount checks or certain recovery situations.

Drivers can request support for this new feature by OR'ing
NAND_ECC_NEED_CHECK_FF into their chip->options.

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051585.html

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 68 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  5 ++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5826da39216e..f3723770e43a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1483,6 +1483,62 @@ static int nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 }
 
 /**
+ * nand_verify_erased_page - [INTERN] Check a page for 0xff + bitflips
+ * @mtd: MTD device structure
+ * @buf: read buffer; will contain output data (either raw or "corrected")
+ * @page: page to check
+ *
+ * Check a page to see if it is erased (w/ bitflips) after an uncorrectable ECC
+ * error
+ *
+ * On a real error, return a negative error code (-EBADMSG for ECC error), and
+ * buf will contain raw data.
+ * Otherwise, fill buf with 0xff and return the maximum number of
+ * bitflips per ECC sector to the caller.
+ */
+static int nand_verify_erased_page(struct mtd_info *mtd, uint8_t *buf, int page)
+{
+	struct nand_chip *chip = mtd->priv;
+	int i, oobbits, databits;
+	uint8_t *data = buf, *oob = chip->oob_poi;
+	unsigned int max_bitflips = 0;
+	int oob_step = mtd->oobsize / chip->ecc.steps;
+	int ret;
+
+	oobbits = oob_step * 8;
+	databits = chip->ecc.size * 8;
+
+	/* read without ECC for verification */
+	ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
+	if (ret)
+		return ret;
+
+	/* Check each ECC step individually */
+	for (i = 0; i < chip->ecc.steps; i++) {
+		unsigned int flips = databits + oobbits;
+
+		flips -= bitmap_weight((unsigned long *)oob, oobbits);
+		flips -= bitmap_weight((unsigned long *)data, databits);
+
+		/* Too many bitflips */
+		if (flips > chip->ecc.strength)
+			return -EBADMSG;
+
+		max_bitflips = max(max_bitflips, flips);
+
+		data += chip->ecc.size;
+		oob += oob_step;
+	}
+
+	pr_debug("correcting bitflips in erased page (max %u)\n",
+			max_bitflips);
+
+	memset(buf, 0xff, mtd->writesize);
+	memset(oob, 0xff, mtd->oobsize);
+
+	return max_bitflips;
+}
+/**
  * nand_do_read_ops - [INTERN] Read data with ECC
  * @mtd: MTD device structure
  * @from: offset to read from
@@ -1554,6 +1610,18 @@ read_retry:
 				break;
 			}
 
+			/* Check an ECC error for 0xff + bitflips? */
+			if ((chip->options & NAND_ECC_NEED_CHECK_FF) &&
+					mtd->ecc_stats.failed - ecc_failures) {
+				ret = nand_verify_erased_page(mtd, bufpoi,
+						page);
+				if (ret >= 0)
+					/* "corrected", so reset failures */
+					mtd->ecc_stats.failed = ecc_failures;
+				else if (ret == -EBADMSG)
+					ret = 0;
+			}
+
 			max_bitflips = max_t(unsigned int, max_bitflips, ret);
 
 			/* Transfer not aligned data */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0747fef2bfc6..515f61f028ba 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -182,6 +182,11 @@ typedef enum {
  * before calling nand_scan_tail.
  */
 #define NAND_BUSWIDTH_AUTO      0x00080000
+/*
+ * Driver's ECC does not correct erased pages that have bitflips (i.e.,
+ * "mostly" 0xff data), so ECC errors should be checked for mostly-0xff
+ */
+#define NAND_ECC_NEED_CHECK_FF	0x00100000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.8.3.2
