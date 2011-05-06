Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM22-0008Ni-Ec
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:28 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3113364wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:26 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 3/9] nand/denali: detect the number of banks
Date: Fri,  6 May 2011 15:28:57 +0100
Message-Id: <1304692143-22432-4-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not all configurations of the Denali controller support 4 banks.  The
controller can support between 1 and 16 banks.  Detect this from the
design features register.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c |   28 ++++++++++++++++++++--------
 drivers/mtd/nand/denali.h |    2 +-
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 70a439c..3af0a95 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -178,11 +178,11 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 	dev_dbg(denali->dev, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
 
-	for (i = 0 ; i < LLD_MAX_FLASH_BANKS; i++)
+	for (i = 0 ; i < denali->max_banks; i++)
 		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
 		denali->flash_reg + INTR_STATUS(i));
 
-	for (i = 0 ; i < LLD_MAX_FLASH_BANKS; i++) {
+	for (i = 0 ; i < denali->max_banks; i++) {
 		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
 		while (!(ioread32(denali->flash_reg +
 				INTR_STATUS(i)) &
@@ -194,7 +194,7 @@ static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 			"NAND Reset operation timed out on bank %d\n", i);
 	}
 
-	for (i = 0; i < LLD_MAX_FLASH_BANKS; i++)
+	for (i = 0; i < denali->max_banks; i++)
 		iowrite32(INTR_STATUS__RST_COMP | INTR_STATUS__TIME_OUT,
 			denali->flash_reg + INTR_STATUS(i));
 
@@ -405,11 +405,11 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
  */
 static void find_valid_banks(struct denali_nand_info *denali)
 {
-	uint32_t id[LLD_MAX_FLASH_BANKS];
+	uint32_t id[denali->max_banks];
 	int i;
 
 	denali->total_used_banks = 1;
-	for (i = 0; i < LLD_MAX_FLASH_BANKS; i++) {
+	for (i = 0; i < denali->max_banks; i++) {
 		index_addr(denali, (uint32_t)(MODE_11 | (i << 24) | 0), 0x90);
 		index_addr(denali, (uint32_t)(MODE_11 | (i << 24) | 1), 0);
 		index_addr_read_data(denali,
@@ -445,6 +445,17 @@ static void find_valid_banks(struct denali_nand_info *denali)
 		"denali->total_used_banks: %d\n", denali->total_used_banks);
 }
 
+/*
+ * Use the configuration feature register to determine the maximum number of
+ * banks that the hardware supports.
+ */
+static void detect_max_banks(struct denali_nand_info *denali)
+{
+	uint32_t features = ioread32(denali->flash_reg + FEATURES);
+
+	denali->max_banks = 2 << (features & FEATURES__N_BANKS);
+}
+
 static void detect_partition_feature(struct denali_nand_info *denali)
 {
 	/* For MRST platform, denali->fwblks represent the
@@ -562,7 +573,7 @@ static void denali_irq_init(struct denali_nand_info *denali)
 	int_mask = DENALI_IRQ_ALL;
 
 	/* Clear all status bits */
-	for (i = 0; i < LLD_MAX_FLASH_BANKS; ++i)
+	for (i = 0; i < denali->max_banks; ++i)
 		iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS(i));
 
 	denali_irq_enable(denali, int_mask);
@@ -579,7 +590,7 @@ static void denali_irq_enable(struct denali_nand_info *denali,
 {
 	int i;
 
-	for (i = 0; i < LLD_MAX_FLASH_BANKS; ++i)
+	for (i = 0; i < denali->max_banks; ++i)
 		iowrite32(int_mask, denali->flash_reg + INTR_EN(i));
 }
 
@@ -1345,6 +1356,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	/* Should set value for these registers when init */
 	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(1, denali->flash_reg + ECC_ENABLE);
+	detect_max_banks(denali);
 	denali_nand_timing_set(denali);
 	denali_irq_init(denali);
 }
@@ -1522,7 +1534,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* scan for NAND devices attached to the controller
 	 * this is the first stage in a two step process to register
 	 * with the nand subsystem */
-	if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL)) {
+	if (nand_scan_ident(&denali->mtd, denali->max_banks, NULL)) {
 		ret = -ENXIO;
 		goto failed_req_irq;
 	}
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 638668c..fabb9d5 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -454,7 +454,6 @@
 #define READ_WRITE_ENABLE_HIGH_COUNT    22
 
 #define ECC_SECTOR_SIZE     512
-#define LLD_MAX_FLASH_BANKS     4
 
 #define DENALI_BUF_SIZE		(NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE)
 
@@ -494,6 +493,7 @@ struct denali_nand_info {
 	uint32_t totalblks;
 	uint32_t blksperchip;
 	uint32_t bbtskipbytes;
+	uint32_t max_banks;
 };
 
 #endif /*_LLD_NAND_*/
-- 
1.7.4.4
