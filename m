Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2nRx-00038e-0z
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 19:45:31 +0000
Received: by mail-ie0-f170.google.com with SMTP id tq11so7876140ieb.1
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 11:45:07 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 4/5] mtd: nand: support Micron READ RETRY
Date: Mon, 13 Jan 2014 11:44:39 -0800
Message-Id: <1389642280-11714-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
References: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
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

Micron provides READ RETRY support via the ONFI vendor-specific
parameter block (to indicate how many read-retry modes are available)
and the ONFI {GET,SET}_FEATURES commands with a vendor-specific feature
address (to support reading/switching the current read-retry mode).

The recommended sequence is as follows:

  1. Perform PAGE_READ operation
  2. If no ECC error, we are done
  3. Run SET_FEATURES with feature address 89h, mode 1
  4. Retry PAGE_READ operation
  5. If ECC error and there are remaining supported modes, increment the
     mode and return to step 3. Otherwise, this is a true ECC error.
  6. Run SET_FEATURES with feature address 89h, mode 0, to return to the
     default state.

This patch implements the chip->set_read_retry() callback for
Micron and fills in the chip->read_retries.

Tested on Micron MT29F32G08CBADA, which supports 8 read-retry modes.

The Micron vendor-specific table was checked against the datasheets for
the following Micron NAND:

Needs retry   Cell-type    Part number          Vendor revision    Byte 180
-----------   ---------    ----------------     ---------------    ------------
No            SLC          MT29F16G08ABABA      1                  Reserved (0)
No            MLC          MT29F32G08CBABA      1                  Reserved (0)
No            SLC          MT29F1G08AACWP       1                  0
Yes           MLC          MT29F32G08CBADA      1                  08h
Yes           MLC          MT29F64G08CBABA      2                  08h

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2 -> v3: - split out from the previous patch
          - support Micron via replaceable vendor-specific/flash-specific
            callback
          - add vendor-revision check (I've only seen Micron with vendor
            revision >= 1)

v3 -> v4: accommodate name change

 drivers/mtd/nand/nand_base.c | 27 +++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4c2f39f351da..b8c74cda7625 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2979,6 +2979,30 @@ ext_out:
 	return ret;
 }
 
+static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
+{
+	struct nand_chip *chip = mtd->priv;
+	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
+
+	return chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
+			feature);
+}
+
+/*
+ * Configure chip properties from Micron vendor-specific ONFI table
+ */
+static void nand_onfi_detect_micron(struct nand_chip *chip,
+		struct nand_onfi_params *p)
+{
+	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
+
+	if (le16_to_cpu(p->vendor_revision) < 1)
+		return;
+
+	chip->read_retries = micron->read_retry_options;
+	chip->setup_read_retry = nand_setup_read_retry_micron;
+}
+
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
@@ -3085,6 +3109,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
+	if (p->jedec_id == NAND_MFR_MICRON)
+		nand_onfi_detect_micron(chip, p);
+
 	return 1;
 }
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 267d61dd89dd..3080a8c8b62e 100644
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
 
-- 
1.8.3.2
