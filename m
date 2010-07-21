Received: from mga14.intel.com ([143.182.124.37])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Obd9l-00010v-47
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 17:32:34 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Woodhouse, David" <david.woodhouse@intel.com>
Date: Thu, 22 Jul 2010 01:32:26 +0800
Subject: [PATCH 2/2]  [MTD] nand/denali.h: fixed all checkpatch errors in
	denali.h
Message-ID: <5D8008F58939784290FAB48F549751981D10A98E54@shsmsx502.ccr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>, "Gao,
	Yunpeng" <yunpeng.gao@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the 2nd one. This patch fixed checkpatch errors in nand/denali.h

>From 939b3d5109a15282747db8a819a22bd6803d32ea Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 22 Jul 2010 00:55:13 +0800
Subject: [PATCH 2/2] [MTD] nand/denali.h: fixed checkpatch errors in denali=
.h

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.h |   88 +++++++++++++++++++++--------------------=
---
 1 files changed, 42 insertions(+), 46 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 422a29a..a38c8ae 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -17,7 +17,7 @@
  *
  */
=20
-#include <linux/mtd/nand.h>=20
+#include <linux/mtd/nand.h>
=20
 #define DEVICE_RESET				0x0
 #define     DEVICE_RESET__BANK0				0x0001
@@ -83,7 +83,7 @@
 #define RE_2_WE					0x120
 #define     RE_2_WE__VALUE				0x003f
=20
-#define ACC_CLKS    				0x130
+#define ACC_CLKS				0x130
 #define     ACC_CLKS__VALUE				0x000f
=20
 #define NUMBER_OF_PLANES			0x140
@@ -622,43 +622,40 @@
=20
 /* flash.h */
 struct device_info_tag {
-        uint16_t wDeviceMaker;
-        uint16_t wDeviceID;
+	uint16_t wDeviceMaker;
+	uint16_t wDeviceID;
 	uint8_t  bDeviceParam0;
 	uint8_t  bDeviceParam1;
 	uint8_t  bDeviceParam2;
-        uint32_t wDeviceType;
-        uint32_t wSpectraStartBlock;
-        uint32_t wSpectraEndBlock;
-        uint32_t wTotalBlocks;
-        uint16_t wPagesPerBlock;
-        uint16_t wPageSize;
-        uint16_t wPageDataSize;
-        uint16_t wPageSpareSize;
-        uint16_t wNumPageSpareFlag;
-        uint16_t wECCBytesPerSector;
-        uint32_t wBlockSize;
-        uint32_t wBlockDataSize;
-        uint32_t wDataBlockNum;
-        uint8_t bPlaneNum;
-        uint16_t wDeviceMainAreaSize;
-        uint16_t wDeviceSpareAreaSize;
-        uint16_t wDevicesConnected;
-        uint16_t wDeviceWidth;
-        uint16_t wHWRevision;
-        uint16_t wHWFeatures;
-
-        uint16_t wONFIDevFeatures;
-        uint16_t wONFIOptCommands;
-        uint16_t wONFITimingMode;
-        uint16_t wONFIPgmCacheTimingMode;
-
-        uint16_t MLCDevice;
-        uint16_t wSpareSkipBytes;
-
-        uint8_t nBitsInPageNumber;
-        uint8_t nBitsInPageDataSize;
-        uint8_t nBitsInBlockDataSize;
+	uint32_t wDeviceType;
+	uint32_t wSpectraStartBlock;
+	uint32_t wSpectraEndBlock;
+	uint32_t wTotalBlocks;
+	uint16_t wPagesPerBlock;
+	uint16_t wPageSize;
+	uint16_t wPageDataSize;
+	uint16_t wPageSpareSize;
+	uint16_t wNumPageSpareFlag;
+	uint16_t wECCBytesPerSector;
+	uint32_t wBlockSize;
+	uint32_t wBlockDataSize;
+	uint32_t wDataBlockNum;
+	uint8_t bPlaneNum;
+	uint16_t wDeviceMainAreaSize;
+	uint16_t wDeviceSpareAreaSize;
+	uint16_t wDevicesConnected;
+	uint16_t wDeviceWidth;
+	uint16_t wHWRevision;
+	uint16_t wHWFeatures;
+	uint16_t wONFIDevFeatures;
+	uint16_t wONFIOptCommands;
+	uint16_t wONFITimingMode;
+	uint16_t wONFIPgmCacheTimingMode;
+	uint16_t MLCDevice;
+	uint16_t wSpareSkipBytes;
+	uint8_t nBitsInPageNumber;
+	uint8_t nBitsInPageDataSize;
+	uint8_t nBitsInBlockDataSize;
 };
=20
 /* ffsdefs.h */
@@ -684,11 +681,11 @@ struct device_info_tag {
 #define NAND_DBG_TRACE 3
=20
 #ifdef VERBOSE
-#define nand_dbg_print(level, args...)                  \
-        do {                                            \
-                if (level <=3D nand_debug_level)          \
-                        printk(KERN_ALERT args);        \
-        } while (0)
+#define nand_dbg_print(level, args...)		\
+	do {		\
+			if (level <=3D nand_debug_level)	\
+				printk(KERN_ALERT args);	\
+	} while (0)
 #else
 #define nand_dbg_print(level, args...)
 #endif
@@ -772,10 +769,9 @@ struct device_info_tag {
 #define ECC_SECTOR_SIZE     512
 #define LLD_MAX_FLASH_BANKS     4
=20
-#define DENALI_BUF_SIZE		NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE
+#define DENALI_BUF_SIZE		(NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE)
=20
-struct nand_buf
-{
+struct nand_buf {
 	int head;
 	int tail;
 	uint8_t buf[DENALI_BUF_SIZE];
@@ -810,7 +806,7 @@ struct denali_nand_info {
=20
 static uint16_t  NAND_Flash_Reset(struct denali_nand_info *denali);
 static uint16_t  NAND_Read_Device_ID(struct denali_nand_info *denali);
-static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *de=
nali, uint16_t INT_ENABLE);
+static void NAND_LLD_Enable_Disable_Interrupts(struct denali_nand_info *de=
nali,
+							uint16_t INT_ENABLE);
=20
 #endif /*_LLD_NAND_*/
-
--=20
1.6.6.1
