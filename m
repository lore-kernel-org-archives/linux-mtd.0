Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh3Hh-0006cB-Lw
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 16:27:14 +0000
Received: by pwi9 with SMTP id 9so174436pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 09:27:08 -0700 (PDT)
Date: Fri, 6 Aug 2010 00:26:54 +0800
From: Chuanxiao <chuanxiao.dong@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com, dwmw2@infradead.org
Subject: [PATCH v1 1/2]nand/denali Rename functions which is named by using
	captials
Message-ID: <20100805162654.GB3160@infernal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: chuanxiao.dong@intel.com, yunpeng.gao@intel.com, hang.yuan@intel.com
Reply-To: Chuanxiao <chuanxiao.dong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From bc6e36c08d97940e6c6a968d54363a4a1164dc8b Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 27 Jul 2010 14:17:37 +0800
Subject: [PATCH 1/2] mtd: denali: rename functions which is named by using capitals

rename these functions' name and remove additional declarations
in header file

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   22 +++++++++++-----------
 drivers/mtd/nand/denali.h |    5 -----
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 52278d8..0c76a16 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -221,7 +221,7 @@ static void reset_bank(struct denali_nand_info *denali)
 }
 
 /* Reset the flash controller */
-static uint16_t NAND_Flash_Reset(struct denali_nand_info *denali)
+static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
 	uint32_t i;
 
@@ -256,7 +256,7 @@ static uint16_t NAND_Flash_Reset(struct denali_nand_info *denali)
  * programs the clocking register accordingly. The mode is determined by
  * the get_onfi_nand_para routine.
  */
-static void NAND_ONFi_Timing_Mode(struct denali_nand_info *denali,
+static void nand_onfi_timing_set(struct denali_nand_info *denali,
 								uint16_t mode)
 {
 	uint16_t Trea[6] = {40, 30, 25, 20, 20, 16};
@@ -487,7 +487,7 @@ static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 			break;
 	}
 
-	NAND_ONFi_Timing_Mode(denali, i);
+	nand_onfi_timing_set(denali, i);
 
 	index_addr(denali, MODE_11 | 0, 0x90);
 	index_addr(denali, MODE_11 | 1, 0);
@@ -803,7 +803,7 @@ static void dump_device_info(struct denali_nand_info *denali)
 		denali->dev_info.nBitsInBlockDataSize);
 }
 
-static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
+static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 {
 	uint16_t status = PASS;
 	uint8_t no_of_planes;
@@ -928,12 +928,12 @@ static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali)
 	 * with a specific ONFI mode, we apply those changes here.
 	 */
 	if (onfi_timing_mode != NAND_DEFAULT_TIMINGS)
-		NAND_ONFi_Timing_Mode(denali, onfi_timing_mode);
+		nand_onfi_timing_set(denali, onfi_timing_mode);
 
 	return status;
 }
 
-static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *denali,
+static void denali_set_intr_modes(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
 	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
@@ -958,7 +958,7 @@ static void denali_irq_init(struct denali_nand_info *denali)
 	uint32_t int_mask = 0;
 
 	/* Disable global interrupts */
-	NAND_LLD_Enable_Disable_Interrupts(denali, false);
+	denali_set_intr_modes(denali, false);
 
 	int_mask = DENALI_IRQ_ALL;
 
@@ -973,7 +973,7 @@ static void denali_irq_init(struct denali_nand_info *denali)
 
 static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
 {
-	NAND_LLD_Enable_Disable_Interrupts(denali, false);
+	denali_set_intr_modes(denali, false);
 	free_irq(irqnum, denali);
 }
 
@@ -1797,7 +1797,7 @@ static void denali_ecc_hwctl(struct mtd_info *mtd, int mode)
 static void denali_hw_init(struct denali_nand_info *denali)
 {
 	denali_irq_init(denali);
-	NAND_Flash_Reset(denali);
+	denali_nand_reset(denali);
 	denali_write32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	denali_write32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
@@ -1993,11 +1993,11 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	/* now that our ISR is registered, we can enable interrupts */
-	NAND_LLD_Enable_Disable_Interrupts(denali, true);
+	denali_set_intr_modes(denali, true);
 
 	pci_set_drvdata(dev, denali);
 
-	NAND_Read_Device_ID(denali);
+	denali_nand_timing_set(denali);
 
 	/* MTD supported page sizes vary by kernel. We validate our
 	 * kernel supports the device here.
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index b56fa3c..626c915 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -804,9 +804,4 @@ struct denali_nand_info {
 	int idx;
 };
 
-static uint16_t NAND_Flash_Reset(struct denali_nand_info *denali);
-static uint16_t NAND_Read_Device_ID(struct denali_nand_info *denali);
-static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *denali,
-						uint16_t INT_ENABLE);
-
 #endif /*_LLD_NAND_*/
-- 
1.6.6.1
