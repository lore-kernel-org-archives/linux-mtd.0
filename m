Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh3yL-0001mP-PV
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 17:11:14 +0000
Received: by mail-pz0-f49.google.com with SMTP id 3so2957296pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 10:11:13 -0700 (PDT)
Date: Fri, 6 Aug 2010 01:11:23 +0800
From: Chuanxiao <chuanxiao.dong@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com, dwmw2@infradead.org
Subject: [PATCH v2 2/2]nand/denali Update get_nand_para functions
Message-ID: <20100805171123.GB6130@infernal>
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

>From 28c19efd460a024138a27b88d0422cdf35767a02 Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Fri, 6 Aug 2010 00:48:49 +0800
Subject: [PATCH 2/2] mtd: denali: update get nand para functions

In denali driver, wTotalBlocks variable is useless, so just
remove them in get_toshiba_nand_para and get_hynix_nand_para
first. Other wTotalBlocks in denali.c and other variables in
dev_info struct are also useless, will remove them later.

Also add a parameter in get_hynix_nand_para to prepare to
remove dev_info struct. This parameter comes by reading NAND
ID directly. Reading register will report wrong value for
some NAND chips, e.g. some Micron MT29F32G08QAA chips.
So update NAND_CMD_READID method as well.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  107 +++++++++++++++------------------------------
 1 files changed, 35 insertions(+), 72 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 0c76a16..0f9fc5e 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -549,7 +549,6 @@ static void get_samsung_nand_para(struct denali_nand_info *denali)
 
 static void get_toshiba_nand_para(struct denali_nand_info *denali)
 {
-	void __iomem *scratch_reg;
 	uint32_t tmp;
 
 	/* Workaround to fix a controller bug which reports a wrong */
@@ -567,33 +566,14 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
 		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 #endif
 	}
-
-	/* As Toshiba NAND can not provide it's block number, */
-	/* so here we need user to provide the correct block */
-	/* number in a scratch register before the Linux NAND */
-	/* driver is loaded. If no valid value found in the scratch */
-	/* register, then we use default block number value */
-	scratch_reg = ioremap_nocache(SCRATCH_REG_ADDR, SCRATCH_REG_SIZE);
-	if (!scratch_reg) {
-		printk(KERN_ERR "Spectra: ioremap failed in %s, Line %d",
-			__FILE__, __LINE__);
-		denali->dev_info.wTotalBlocks = GLOB_HWCTL_DEFAULT_BLKS;
-	} else {
-		nand_dbg_print(NAND_DBG_WARN,
-			"Spectra: ioremap reg address: 0x%p\n", scratch_reg);
-		denali->dev_info.wTotalBlocks = 1 << ioread8(scratch_reg);
-		if (denali->dev_info.wTotalBlocks < 512)
-			denali->dev_info.wTotalBlocks = GLOB_HWCTL_DEFAULT_BLKS;
-		iounmap(scratch_reg);
-	}
 }
 
-static void get_hynix_nand_para(struct denali_nand_info *denali)
+static void get_hynix_nand_para(struct denali_nand_info *denali,
+							uint8_t device_id)
 {
-	void __iomem *scratch_reg;
 	uint32_t main_size, spare_size;
 
-	switch (denali->dev_info.wDeviceID) {
+	switch (device_id) {
 	case 0xD5: /* Hynix H27UAG8T2A, H27UBG8U5A or H27UCG8VFA */
 	case 0xD7: /* Hynix H27UDG8VEM, H27UCG8UDM or H27UCG8V5A */
 		denali_write32(128, denali->flash_reg + PAGES_PER_BLOCK);
@@ -621,20 +601,6 @@ static void get_hynix_nand_para(struct denali_nand_info *denali)
 			"Will use default parameter values instead.\n",
 			denali->dev_info.wDeviceID);
 	}
-
-	scratch_reg = ioremap_nocache(SCRATCH_REG_ADDR, SCRATCH_REG_SIZE);
-	if (!scratch_reg) {
-		printk(KERN_ERR "Spectra: ioremap failed in %s, Line %d",
-			__FILE__, __LINE__);
-		denali->dev_info.wTotalBlocks = GLOB_HWCTL_DEFAULT_BLKS;
-	} else {
-		nand_dbg_print(NAND_DBG_WARN,
-			"Spectra: ioremap reg address: 0x%p\n", scratch_reg);
-		denali->dev_info.wTotalBlocks = 1 << ioread8(scratch_reg);
-		if (denali->dev_info.wTotalBlocks < 512)
-			denali->dev_info.wTotalBlocks = GLOB_HWCTL_DEFAULT_BLKS;
-		iounmap(scratch_reg);
-	}
 }
 
 /* determines how many NAND chips are connected to the controller. Note for
@@ -807,34 +773,35 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 {
 	uint16_t status = PASS;
 	uint8_t no_of_planes;
+	uint32_t id_bytes[5], addr;
+	uint8_t i, maf_id, device_id;
 
 	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
 
-	denali->dev_info.wDeviceMaker =
-		ioread32(denali->flash_reg + MANUFACTURER_ID);
-	denali->dev_info.wDeviceID =
-		ioread32(denali->flash_reg + DEVICE_ID);
-	denali->dev_info.bDeviceParam0 =
-		ioread32(denali->flash_reg + DEVICE_PARAM_0);
-	denali->dev_info.bDeviceParam1 =
-		ioread32(denali->flash_reg + DEVICE_PARAM_1);
-	denali->dev_info.bDeviceParam2 =
-		ioread32(denali->flash_reg + DEVICE_PARAM_2);
-
-	denali->dev_info.MLCDevice =
-		ioread32(denali->flash_reg + DEVICE_PARAM_0) & 0x0c;
+	/* Use read id method to get device ID and other
+	 * params. For some NAND chips, controller can't
+	 * report the correct device ID by reading from
+	 * DEVICE_ID register
+	 * */
+	addr = (uint32_t)MODE_11 | BANK(denali->flash_bank);
+	index_addr(denali, (uint32_t)addr | 0, 0x90);
+	index_addr(denali, (uint32_t)addr | 1, 0);
+	for (i = 0; i < 5; i++)
+		index_addr_read_data(denali, addr | 2, &id_bytes[i]);
+	maf_id = id_bytes[0];
+	device_id = id_bytes[1];
 
 	if (ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) &
 		ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE) { /* ONFI 1.0 NAND */
 		if (FAIL == get_onfi_nand_para(denali))
 			return FAIL;
-	} else if (denali->dev_info.wDeviceMaker == 0xEC) { /* Samsung NAND */
+	} else if (maf_id == 0xEC) { /* Samsung NAND */
 		get_samsung_nand_para(denali);
-	} else if (denali->dev_info.wDeviceMaker == 0x98) { /* Toshiba NAND */
+	} else if (maf_id == 0x98) { /* Toshiba NAND */
 		get_toshiba_nand_para(denali);
-	} else if (denali->dev_info.wDeviceMaker == 0xAD) { /* Hynix NAND */
-		get_hynix_nand_para(denali);
+	} else if (maf_id == 0xAD) { /* Hynix NAND */
+		get_hynix_nand_para(denali, device_id);
 	} else {
 		denali->dev_info.wTotalBlocks = GLOB_HWCTL_DEFAULT_BLKS;
 	}
@@ -1720,6 +1687,8 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			   int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint32_t addr, id;
+	int i;
 
 #if DEBUG_DENALI
 	printk(KERN_INFO "cmdfunc: 0x%x %d %d\n", cmd, col, page);
@@ -1732,24 +1701,18 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 		break;
 	case NAND_CMD_READID:
 		reset_buf(denali);
-		if (denali->flash_bank < denali->total_used_banks) {
-			/* write manufacturer information into nand
-			   buffer for NAND subsystem to fetch.
-			   */
-			write_byte_to_buf(denali,
-					denali->dev_info.wDeviceMaker);
-			write_byte_to_buf(denali,
-					denali->dev_info.wDeviceID);
-			write_byte_to_buf(denali,
-					denali->dev_info.bDeviceParam0);
-			write_byte_to_buf(denali,
-					denali->dev_info.bDeviceParam1);
-			write_byte_to_buf(denali,
-					denali->dev_info.bDeviceParam2);
-		} else {
-			int i;
-			for (i = 0; i < 5; i++)
-				write_byte_to_buf(denali, 0xff);
+		/*sometimes ManufactureId read from register is not right
+		 * e.g. some of Micron MT29F32G08QAA MLC NAND chips
+		 * So here we send READID cmd to NAND insteand
+		 * */
+		addr = (uint32_t)MODE_11 | BANK(denali->flash_bank);
+		index_addr(denali, (uint32_t)addr | 0, 0x90);
+		index_addr(denali, (uint32_t)addr | 1, 0);
+		for (i = 0; i < 5; i++) {
+			index_addr_read_data(denali,
+						(uint32_t)addr | 2,
+						&id);
+			write_byte_to_buf(denali, id);
 		}
 		break;
 	case NAND_CMD_READ0:
-- 
1.6.6.1
