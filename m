Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OhKVU-0001iX-N2
	for linux-mtd@lists.infradead.org; Fri, 06 Aug 2010 10:50:34 +0000
Date: Fri, 6 Aug 2010 18:48:21 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com, dwmw2@infradead.org
Subject: [PATCH v1 1/4]mtd: denali: Remove device_info_tag structure
Message-ID: <20100806104821.GA7326@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,
   I sent 4 patches using my intel email account. If there is any
   problem about the format of these patches, I will resend them after
   I arrived at home by using my gmail account, and I will keep on
   using gmail account to send patches.
   Thanks.

=46rom 242e3bf5e17f54b1df8cf285154a7c7a61ff62e9 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Fri, 6 Aug 2010 15:29:41 +0800
Subject: [PATCH 1/4] mtd: denali: Remove device_info_tag structure.

Most of the variables in this structure are useless, so just
remove this structure and relevant codes.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  299 +++++------------------------------------=
----
 drivers/mtd/nand/denali.h |   43 +------
 2 files changed, 37 insertions(+), 305 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 0f9fc5e..22d7ba3 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -363,43 +363,12 @@ static void set_ecc_config(struct denali_nand_info *d=
enali)
 		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 #endif
=20
-	if ((ioread32(denali->flash_reg + ECC_CORRECTION) &
-				ECC_CORRECTION__VALUE) =3D=3D 1) {
-		denali->dev_info.wECCBytesPerSector =3D 4;
-		denali->dev_info.wECCBytesPerSector *=3D
-			denali->dev_info.wDevicesConnected;
-		denali->dev_info.wNumPageSpareFlag =3D
-			denali->dev_info.wPageSpareSize -
-			denali->dev_info.wPageDataSize /
-			(ECC_SECTOR_SIZE * denali->dev_info.wDevicesConnected) *
-			denali->dev_info.wECCBytesPerSector
-			- denali->dev_info.wSpareSkipBytes;
-	} else {
-		denali->dev_info.wECCBytesPerSector =3D
-			(ioread32(denali->flash_reg + ECC_CORRECTION) &
-			ECC_CORRECTION__VALUE) * 13 / 8;
-		if ((denali->dev_info.wECCBytesPerSector) % 2 =3D=3D 0)
-			denali->dev_info.wECCBytesPerSector +=3D 2;
-		else
-			denali->dev_info.wECCBytesPerSector +=3D 1;
-
-		denali->dev_info.wECCBytesPerSector *=3D
-			denali->dev_info.wDevicesConnected;
-		denali->dev_info.wNumPageSpareFlag =3D
-			denali->dev_info.wPageSpareSize -
-			denali->dev_info.wPageDataSize /
-			(ECC_SECTOR_SIZE * denali->dev_info.wDevicesConnected) *
-			denali->dev_info.wECCBytesPerSector
-			- denali->dev_info.wSpareSkipBytes;
-	}
 }
=20
 /* queries the NAND device to see what ONFI modes it supports. */
 static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 {
 	int i;
-	uint16_t blks_lun_l, blks_lun_h, n_of_luns;
-	uint32_t blockperlun, id;
=20
 	denali_write32(DEVICE_RESET__BANK0, denali->flash_reg + DEVICE_RESET);
=20
@@ -457,26 +426,6 @@ static uint16_t get_onfi_nand_para(struct denali_nand_=
info *denali)
 	denali_write32(INTR_STATUS3__TIME_OUT,
 			denali->flash_reg + INTR_STATUS3);
=20
-	denali->dev_info.wONFIDevFeatures =3D
-		ioread32(denali->flash_reg + ONFI_DEVICE_FEATURES);
-	denali->dev_info.wONFIOptCommands =3D
-		ioread32(denali->flash_reg + ONFI_OPTIONAL_COMMANDS);
-	denali->dev_info.wONFITimingMode =3D
-		ioread32(denali->flash_reg + ONFI_TIMING_MODE);
-	denali->dev_info.wONFIPgmCacheTimingMode =3D
-		ioread32(denali->flash_reg + ONFI_PGM_CACHE_TIMING_MODE);
-
-	n_of_luns =3D ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) &
-		ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS;
-	blks_lun_l =3D ioread32(denali->flash_reg +
-				ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L);
-	blks_lun_h =3D ioread32(denali->flash_reg +
-				ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U);
-
-	blockperlun =3D (blks_lun_h << 16) | blks_lun_l;
-
-	denali->dev_info.wTotalBlocks =3D n_of_luns * blockperlun;
-
 	if (!(ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
 		ONFI_TIMING_MODE__VALUE))
 		return FAIL;
@@ -489,16 +438,6 @@ static uint16_t get_onfi_nand_para(struct denali_nand_=
info *denali)
=20
 	nand_onfi_timing_set(denali, i);
=20
-	index_addr(denali, MODE_11 | 0, 0x90);
-	index_addr(denali, MODE_11 | 1, 0);
-
-	for (i =3D 0; i < 3; i++)
-		index_addr_read_data(denali, MODE_11 | 2, &id);
-
-	nand_dbg_print(NAND_DBG_DEBUG, "3rd ID: 0x%x\n", id);
-
-	denali->dev_info.MLCDevice =3D id & 0x0C;
-
 	/* By now, all the ONFI devices we know support the page cache */
 	/* rw feature. So here we enable the pipeline_rw_ahead feature */
 	/* iowrite32(1, denali->flash_reg + CACHE_WRITE_ENABLE); */
@@ -509,9 +448,6 @@ static uint16_t get_onfi_nand_para(struct denali_nand_i=
nfo *denali)
=20
 static void get_samsung_nand_para(struct denali_nand_info *denali)
 {
-	uint8_t no_of_planes;
-	uint32_t blk_size;
-	uint64_t plane_size, capacity;
 	uint32_t id_bytes[5];
 	int i;
=20
@@ -536,15 +472,6 @@ static void get_samsung_nand_para(struct denali_nand_i=
nfo *denali)
 		denali_write32(2, denali->flash_reg + RDWR_EN_HI_CNT);
 		denali_write32(2, denali->flash_reg + CS_SETUP_CNT);
 	}
-
-	no_of_planes =3D 1 << ((id_bytes[4] & 0x0c) >> 2);
-	plane_size  =3D (uint64_t)64 << ((id_bytes[4] & 0x70) >> 4);
-	blk_size =3D 64 << ((ioread32(denali->flash_reg + DEVICE_PARAM_1) &
-					0x30) >> 4);
-	capacity =3D (uint64_t)128 * plane_size * no_of_planes;
-
-	do_div(capacity, blk_size);
-	denali->dev_info.wTotalBlocks =3D capacity;
 }
=20
 static void get_toshiba_nand_para(struct denali_nand_info *denali)
@@ -593,13 +520,12 @@ static void get_hynix_nand_para(struct denali_nand_in=
fo *denali,
 #elif SUPPORT_8BITECC
 		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 #endif
-		denali->dev_info.MLCDevice  =3D 1;
 		break;
 	default:
 		nand_dbg_print(NAND_DBG_WARN,
 			"Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
 			"Will use default parameter values instead.\n",
-			denali->dev_info.wDeviceID);
+			device_id);
 	}
 }
=20
@@ -649,130 +575,31 @@ static void find_valid_banks(struct denali_nand_info=
 *denali)
=20
 static void detect_partition_feature(struct denali_nand_info *denali)
 {
+	/* For MRST platform, denali->fwblks represent the
+	 * number of blocks firmware is taken,
+	 * FW is in protect partition and MTD driver has no
+	 * permission to access it. So let driver know how many
+	 * blocks it can't touch.
+	 * */
 	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__PARTITION) {
 		if ((ioread32(denali->flash_reg + PERM_SRC_ID_1) &
 			PERM_SRC_ID_1__SRCID) =3D=3D SPECTRA_PARTITION_ID) {
-			denali->dev_info.wSpectraStartBlock =3D
+			denali->fwblks =3D
 			    ((ioread32(denali->flash_reg + MIN_MAX_BANK_1) &
 			      MIN_MAX_BANK_1__MIN_VALUE) *
-			     denali->dev_info.wTotalBlocks)
+			     denali->blksperchip)
 			    +
 			    (ioread32(denali->flash_reg + MIN_BLK_ADDR_1) &
 			    MIN_BLK_ADDR_1__VALUE);
-
-			denali->dev_info.wSpectraEndBlock =3D
-			    (((ioread32(denali->flash_reg + MIN_MAX_BANK_1) &
-			       MIN_MAX_BANK_1__MAX_VALUE) >> 2) *
-			     denali->dev_info.wTotalBlocks)
-			    +
-			    (ioread32(denali->flash_reg + MAX_BLK_ADDR_1) &
-			    MAX_BLK_ADDR_1__VALUE);
-
-			denali->dev_info.wTotalBlocks *=3D
-				denali->total_used_banks;
-
-			if (denali->dev_info.wSpectraEndBlock >=3D
-			    denali->dev_info.wTotalBlocks) {
-				denali->dev_info.wSpectraEndBlock =3D
-				    denali->dev_info.wTotalBlocks - 1;
-			}
-
-			denali->dev_info.wDataBlockNum =3D
-				denali->dev_info.wSpectraEndBlock -
-				denali->dev_info.wSpectraStartBlock + 1;
-		} else {
-			denali->dev_info.wTotalBlocks *=3D
-				denali->total_used_banks;
-			denali->dev_info.wSpectraStartBlock =3D
-				SPECTRA_START_BLOCK;
-			denali->dev_info.wSpectraEndBlock =3D
-				denali->dev_info.wTotalBlocks - 1;
-			denali->dev_info.wDataBlockNum =3D
-				denali->dev_info.wSpectraEndBlock -
-				denali->dev_info.wSpectraStartBlock + 1;
-		}
-	} else {
-		denali->dev_info.wTotalBlocks *=3D denali->total_used_banks;
-		denali->dev_info.wSpectraStartBlock =3D SPECTRA_START_BLOCK;
-		denali->dev_info.wSpectraEndBlock =3D
-			denali->dev_info.wTotalBlocks - 1;
-		denali->dev_info.wDataBlockNum =3D
-			denali->dev_info.wSpectraEndBlock -
-			denali->dev_info.wSpectraStartBlock + 1;
-	}
-}
-
-static void dump_device_info(struct denali_nand_info *denali)
-{
-	nand_dbg_print(NAND_DBG_DEBUG, "denali->dev_info:\n");
-	nand_dbg_print(NAND_DBG_DEBUG, "DeviceMaker: 0x%x\n",
-		denali->dev_info.wDeviceMaker);
-	nand_dbg_print(NAND_DBG_DEBUG, "DeviceID: 0x%x\n",
-		denali->dev_info.wDeviceID);
-	nand_dbg_print(NAND_DBG_DEBUG, "DeviceType: 0x%x\n",
-		denali->dev_info.wDeviceType);
-	nand_dbg_print(NAND_DBG_DEBUG, "SpectraStartBlock: %d\n",
-		denali->dev_info.wSpectraStartBlock);
-	nand_dbg_print(NAND_DBG_DEBUG, "SpectraEndBlock: %d\n",
-		denali->dev_info.wSpectraEndBlock);
-	nand_dbg_print(NAND_DBG_DEBUG, "TotalBlocks: %d\n",
-		denali->dev_info.wTotalBlocks);
-	nand_dbg_print(NAND_DBG_DEBUG, "PagesPerBlock: %d\n",
-		denali->dev_info.wPagesPerBlock);
-	nand_dbg_print(NAND_DBG_DEBUG, "PageSize: %d\n",
-		denali->dev_info.wPageSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "PageDataSize: %d\n",
-		denali->dev_info.wPageDataSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "PageSpareSize: %d\n",
-		denali->dev_info.wPageSpareSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "NumPageSpareFlag: %d\n",
-		denali->dev_info.wNumPageSpareFlag);
-	nand_dbg_print(NAND_DBG_DEBUG, "ECCBytesPerSector: %d\n",
-		denali->dev_info.wECCBytesPerSector);
-	nand_dbg_print(NAND_DBG_DEBUG, "BlockSize: %d\n",
-		denali->dev_info.wBlockSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "BlockDataSize: %d\n",
-		denali->dev_info.wBlockDataSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "DataBlockNum: %d\n",
-		denali->dev_info.wDataBlockNum);
-	nand_dbg_print(NAND_DBG_DEBUG, "PlaneNum: %d\n",
-		denali->dev_info.bPlaneNum);
-	nand_dbg_print(NAND_DBG_DEBUG, "DeviceMainAreaSize: %d\n",
-		denali->dev_info.wDeviceMainAreaSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "DeviceSpareAreaSize: %d\n",
-		denali->dev_info.wDeviceSpareAreaSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "DevicesConnected: %d\n",
-		denali->dev_info.wDevicesConnected);
-	nand_dbg_print(NAND_DBG_DEBUG, "DeviceWidth: %d\n",
-		denali->dev_info.wDeviceWidth);
-	nand_dbg_print(NAND_DBG_DEBUG, "HWRevision: 0x%x\n",
-		denali->dev_info.wHWRevision);
-	nand_dbg_print(NAND_DBG_DEBUG, "HWFeatures: 0x%x\n",
-		denali->dev_info.wHWFeatures);
-	nand_dbg_print(NAND_DBG_DEBUG, "ONFIDevFeatures: 0x%x\n",
-		denali->dev_info.wONFIDevFeatures);
-	nand_dbg_print(NAND_DBG_DEBUG, "ONFIOptCommands: 0x%x\n",
-		denali->dev_info.wONFIOptCommands);
-	nand_dbg_print(NAND_DBG_DEBUG, "ONFITimingMode: 0x%x\n",
-		denali->dev_info.wONFITimingMode);
-	nand_dbg_print(NAND_DBG_DEBUG, "ONFIPgmCacheTimingMode: 0x%x\n",
-		denali->dev_info.wONFIPgmCacheTimingMode);
-	nand_dbg_print(NAND_DBG_DEBUG, "MLCDevice: %s\n",
-		denali->dev_info.MLCDevice ? "Yes" : "No");
-	nand_dbg_print(NAND_DBG_DEBUG, "SpareSkipBytes: %d\n",
-		denali->dev_info.wSpareSkipBytes);
-	nand_dbg_print(NAND_DBG_DEBUG, "BitsInPageNumber: %d\n",
-		denali->dev_info.nBitsInPageNumber);
-	nand_dbg_print(NAND_DBG_DEBUG, "BitsInPageDataSize: %d\n",
-		denali->dev_info.nBitsInPageDataSize);
-	nand_dbg_print(NAND_DBG_DEBUG, "BitsInBlockDataSize: %d\n",
-		denali->dev_info.nBitsInBlockDataSize);
+		} else
+			denali->fwblks =3D SPECTRA_START_BLOCK;
+	} else
+		denali->fwblks =3D SPECTRA_START_BLOCK;
 }
=20
 static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 {
 	uint16_t status =3D PASS;
-	uint8_t no_of_planes;
 	uint32_t id_bytes[5], addr;
 	uint8_t i, maf_id, device_id;
=20
@@ -802,8 +629,6 @@ static uint16_t denali_nand_timing_set(struct denali_na=
nd_info *denali)
 		get_toshiba_nand_para(denali);
 	} else if (maf_id =3D=3D 0xAD) { /* Hynix NAND */
 		get_hynix_nand_para(denali, device_id);
-	} else {
-		denali->dev_info.wTotalBlocks =3D GLOB_HWCTL_DEFAULT_BLKS;
 	}
=20
 	nand_dbg_print(NAND_DBG_DEBUG, "Dump timing register values:"
@@ -818,79 +643,12 @@ static uint16_t denali_nand_timing_set(struct denali_=
nand_info *denali)
 			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
 			ioread32(denali->flash_reg + CS_SETUP_CNT));
=20
-	denali->dev_info.wHWRevision =3D ioread32(denali->flash_reg + REVISION);
-	denali->dev_info.wHWFeatures =3D ioread32(denali->flash_reg + FEATURES);
-
-	denali->dev_info.wDeviceMainAreaSize =3D
-		ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
-	denali->dev_info.wDeviceSpareAreaSize =3D
-		ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-
-	denali->dev_info.wPageDataSize =3D
-		ioread32(denali->flash_reg + LOGICAL_PAGE_DATA_SIZE);
-
-	/* Note: When using the Micon 4K NAND device, the controller will report
-	 * Page Spare Size as 216 bytes. But Micron's Spec say it's 218 bytes.
-	 * And if force set it to 218 bytes, the controller can not work
-	 * correctly. So just let it be. But keep in mind that this bug may
-	 * cause
-	 * other problems in future.       - Yunpeng  2008-10-10
-	 */
-	denali->dev_info.wPageSpareSize =3D
-		ioread32(denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
-
-	denali->dev_info.wPagesPerBlock =3D
-		ioread32(denali->flash_reg + PAGES_PER_BLOCK);
-
-	denali->dev_info.wPageSize =3D
-	    denali->dev_info.wPageDataSize + denali->dev_info.wPageSpareSize;
-	denali->dev_info.wBlockSize =3D
-	    denali->dev_info.wPageSize * denali->dev_info.wPagesPerBlock;
-	denali->dev_info.wBlockDataSize =3D
-	    denali->dev_info.wPagesPerBlock * denali->dev_info.wPageDataSize;
-
-	denali->dev_info.wDeviceWidth =3D
-		ioread32(denali->flash_reg + DEVICE_WIDTH);
-	denali->dev_info.wDeviceType =3D
-		((ioread32(denali->flash_reg + DEVICE_WIDTH) > 0) ? 16 : 8);
-
-	denali->dev_info.wDevicesConnected =3D
-		ioread32(denali->flash_reg + DEVICES_CONNECTED);
-
-	denali->dev_info.wSpareSkipBytes =3D
-		ioread32(denali->flash_reg + SPARE_AREA_SKIP_BYTES) *
-		denali->dev_info.wDevicesConnected;
-
-	denali->dev_info.nBitsInPageNumber =3D
-		ilog2(denali->dev_info.wPagesPerBlock);
-	denali->dev_info.nBitsInPageDataSize =3D
-		ilog2(denali->dev_info.wPageDataSize);
-	denali->dev_info.nBitsInBlockDataSize =3D
-		ilog2(denali->dev_info.wBlockDataSize);
-
 	set_ecc_config(denali);
=20
-	no_of_planes =3D ioread32(denali->flash_reg + NUMBER_OF_PLANES) &
-		NUMBER_OF_PLANES__VALUE;
-
-	switch (no_of_planes) {
-	case 0:
-	case 1:
-	case 3:
-	case 7:
-		denali->dev_info.bPlaneNum =3D no_of_planes + 1;
-		break;
-	default:
-		status =3D FAIL;
-		break;
-	}
-
 	find_valid_banks(denali);
=20
 	detect_partition_feature(denali);
=20
-	dump_device_info(denali);
-
 	/* If the user specified to override the default timings
 	 * with a specific ONFI mode, we apply those changes here.
 	 */
@@ -1962,16 +1720,6 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
=20
 	denali_nand_timing_set(denali);
=20
-	/* MTD supported page sizes vary by kernel. We validate our
-	 * kernel supports the device here.
-	 */
-	if (denali->dev_info.wPageSize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE) {
-		ret =3D -ENODEV;
-		printk(KERN_ERR "Spectra: device size not supported by this "
-			"version of MTD.");
-		goto failed_nand;
-	}
-
 	nand_dbg_print(NAND_DBG_DEBUG, "Dump timing register values:"
 			"acc_clks: %d, re_2_we: %d, we_2_re: %d,"
 			"addr_2_data: %d, rdwr_en_lo_cnt: %d, "
@@ -2002,6 +1750,16 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 		goto failed_nand;
 	}
=20
+	/* MTD supported page sizes vary by kernel. We validate our
+	 * kernel supports the device here.
+	 */
+	if (denali->mtd.writesize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE) {
+		ret =3D -ENODEV;
+		printk(KERN_ERR "Spectra: device size not supported by this "
+			"version of MTD.");
+		goto failed_nand;
+	}
+
 	/* second stage of the NAND scan
 	 * this stage requires information regarding ECC and
 	 * bad block management. */
@@ -2014,7 +1772,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	denali->nand.options |=3D NAND_USE_FLASH_BBT | NAND_SKIP_BBTSCAN;
 	denali->nand.ecc.mode =3D NAND_ECC_HW_SYNDROME;
=20
-	if (denali->dev_info.MLCDevice) {
+	if (denali->nand.cellinfo & 0xc) {
 		denali->nand.ecc.layout =3D &nand_oob_mlc_14bit;
 		denali->nand.ecc.bytes =3D ECC_BYTES_MLC;
 	} else {/* SLC */
@@ -2022,6 +1780,15 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 		denali->nand.ecc.bytes =3D ECC_BYTES_SLC;
 	}
=20
+	/* Let driver know the total blocks number and
+	 * how many blocks contained by each nand chip.
+	 * blksperchip will help driver to know how many
+	 * blocks is taken by FW.
+	 * */
+	denali->totalblks =3D denali->mtd.size >>
+				denali->nand.phys_erase_shift;
+	denali->blksperchip =3D denali->totalblks / denali->nand.numchips;
+
 	/* These functions are required by the NAND core framework, otherwise,
 	 * the NAND core will assert. However, we don't need them, so we'll stub
 	 * them out. */
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 626c915..fcac241 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -620,44 +620,6 @@
 #define     MIN_MAX_BANK_7__MIN_VALUE			0x0003
 #define     MIN_MAX_BANK_7__MAX_VALUE			0x000c
=20
-/* flash.h */
-struct device_info_tag {
-	uint16_t wDeviceMaker;
-	uint16_t wDeviceID;
-	uint8_t  bDeviceParam0;
-	uint8_t  bDeviceParam1;
-	uint8_t  bDeviceParam2;
-	uint32_t wDeviceType;
-	uint32_t wSpectraStartBlock;
-	uint32_t wSpectraEndBlock;
-	uint32_t wTotalBlocks;
-	uint16_t wPagesPerBlock;
-	uint16_t wPageSize;
-	uint16_t wPageDataSize;
-	uint16_t wPageSpareSize;
-	uint16_t wNumPageSpareFlag;
-	uint16_t wECCBytesPerSector;
-	uint32_t wBlockSize;
-	uint32_t wBlockDataSize;
-	uint32_t wDataBlockNum;
-	uint8_t bPlaneNum;
-	uint16_t wDeviceMainAreaSize;
-	uint16_t wDeviceSpareAreaSize;
-	uint16_t wDevicesConnected;
-	uint16_t wDeviceWidth;
-	uint16_t wHWRevision;
-	uint16_t wHWFeatures;
-	uint16_t wONFIDevFeatures;
-	uint16_t wONFIOptCommands;
-	uint16_t wONFITimingMode;
-	uint16_t wONFIPgmCacheTimingMode;
-	uint16_t MLCDevice;
-	uint16_t wSpareSkipBytes;
-	uint8_t nBitsInPageNumber;
-	uint8_t nBitsInPageDataSize;
-	uint8_t nBitsInBlockDataSize;
-};
-
 /* ffsdefs.h */
 #define CLEAR 0                 /*use this to clear a field instead of "fa=
il"*/
 #define SET   1                 /*use this to set a field instead of "pass=
"*/
@@ -784,7 +746,6 @@ struct nand_buf {
 struct denali_nand_info {
 	struct mtd_info mtd;
 	struct nand_chip nand;
-	struct device_info_tag dev_info;
 	int flash_bank; /* currently selected chip */
 	int status;
 	int platform;
@@ -802,6 +763,10 @@ struct denali_nand_info {
 	uint32_t irq_status;
 	int irq_debug_array[32];
 	int idx;
+
+	uint32_t fwblks; /* represent how many blocks FW used */
+	uint32_t totalblks;
+	uint32_t blksperchip;
 };
=20
 #endif /*_LLD_NAND_*/
--=20
1.6.6.1
