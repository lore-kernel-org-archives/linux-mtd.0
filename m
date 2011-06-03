Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRRh-00029W-QP
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:17:39 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1802737wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:17:37 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] nand/denali: support hardware with internal ECC fixup
Date: Fri,  3 Jun 2011 11:17:16 +0100
Message-Id: <1307096238-25751-5-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1307096238-25751-1-git-send-email-jamie@jamieiles.com>
References: <1307096238-25751-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some versions of the IP have the ECC fixup handled in hardware.  For
these devices we have a new interrupt status/enable mapping that tells
us when we have an uncorrectable error.  Unfortunately this replaces
existing interrupt bits and there is no way to probe for this capability
so we have to do it through platform data.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c            |   18 +++++++++++++++---
 drivers/mtd/nand/denali.h            |    9 +++++++++
 include/linux/platform_data/denali.h |    1 +
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f6bbafb..fb8e49e 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -55,7 +55,8 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
 			INTR_STATUS__TIME_OUT | \
 			INTR_STATUS__ERASE_FAIL | \
 			INTR_STATUS__RST_COMP | \
-			INTR_STATUS__ERASE_COMP)
+			INTR_STATUS__ERASE_COMP | \
+			INTR_STATUS__ECC_UNCOR_ERR)
 
 /* indicates whether or not the internal value for the flash bank is
  * valid or not */
@@ -913,6 +914,14 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 {
 	bool check_erased_page = false;
 
+	if (denali->have_hw_ecc_fixup &&
+	    (irq_status & INTR_STATUS__ECC_UNCOR_ERR)) {
+		clear_interrupts(denali);
+		denali_set_intr_modes(denali, true);
+
+		return true;
+	}
+
 	if (irq_status & INTR_STATUS__ECC_ERR) {
 		/* read the ECC errors. we'll ignore them for now */
 		uint32_t err_address = 0, err_correction_info = 0;
@@ -1111,8 +1120,9 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = denali->mtd.writesize + denali->mtd.oobsize;
 
 	uint32_t irq_status = 0;
-	uint32_t irq_mask = INTR_STATUS__ECC_TRANSACTION_DONE |
-			    INTR_STATUS__ECC_ERR;
+	uint32_t irq_mask = denali->have_hw_ecc_fixup ?
+		(INTR_STATUS__ECC_TRANSACTION_DONE | INTR_STATUS__ECC_ERR) :
+		(INTR_STATUS__DMA_CMD_COMP | INTR_STATUS__ECC_UNCOR_ERR);
 	bool check_erased_page = false;
 
 	if (page != denali->page) {
@@ -1428,6 +1438,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_alloc_memery;
 	}
 
+	denali->have_hw_ecc_fixup = pdata ? pdata->have_hw_ecc_fixup : false;
+
 	if (id->driver_data == INTEL_CE4100) {
 		/* Due to a silicon limitation, we can only support
 		 * ONFI timing mode 1 and below.
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index b428ce3..f0b5e91 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -231,6 +231,14 @@
 #define     INTR_STATUS__PIPE_CMD_ERR			0x4000
 #define     INTR_STATUS__PAGE_XFER_INC			0x8000
 
+/*
+ * Some versions of the IP have the ECC fixup handled in hardware.  In this
+ * configuration we only get interrupted when the error is uncorrectable.
+ * Unfortunately this bit replaces INTR_STATUS__ECC_TRANSACTION_DONE from the
+ * old IP.
+ */
+#define     INTR_STATUS__ECC_UNCOR_ERR			0x0001
+
 #define     INTR_EN__ECC_TRANSACTION_DONE		0x0001
 #define     INTR_EN__ECC_ERR				0x0002
 #define     INTR_EN__DMA_CMD_COMP			0x0004
@@ -495,6 +503,7 @@ struct denali_nand_info {
 	uint32_t bbtskipbytes;
 	uint32_t max_banks;
 	int nr_ecc_bits;
+	bool have_hw_ecc_fixup;
 };
 
 #endif /*_LLD_NAND_*/
diff --git a/include/linux/platform_data/denali.h b/include/linux/platform_data/denali.h
index cfdb775..3767333 100644
--- a/include/linux/platform_data/denali.h
+++ b/include/linux/platform_data/denali.h
@@ -16,6 +16,7 @@
 
 struct denali_nand_pdata {
 	int	nr_ecc_bits;
+	bool	have_hw_ecc_fixup;
 };
 
 #endif /* __DENALI_PDATA_H__ */
-- 
1.7.4.1
