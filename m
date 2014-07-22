Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PUe-0007UL-39
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:07:52 +0000
Received: by mail-pa0-f47.google.com with SMTP id kx10so10763063pab.20
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:07:31 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: use __packed shorthand
Date: Mon, 21 Jul 2014 19:07:22 -0700
Message-Id: <1405994842-19454-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdswap.c        |  2 +-
 drivers/mtd/nand/sm_common.h |  2 +-
 include/linux/mtd/cfi.h      | 22 +++++++++++-----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 8ca8d41bb35e..5c23f81c6912 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -145,7 +145,7 @@ struct mtdswap_dev {
 struct mtdswap_oobdata {
 	__le16 magic;
 	__le32 count;
-} __attribute__((packed));
+} __packed;
 
 #define MTDSWAP_MAGIC_CLEAN	0x2095
 #define MTDSWAP_MAGIC_DIRTY	(MTDSWAP_MAGIC_CLEAN + 1)
diff --git a/drivers/mtd/nand/sm_common.h b/drivers/mtd/nand/sm_common.h
index 00f4a83359b2..d3e028e58b0f 100644
--- a/drivers/mtd/nand/sm_common.h
+++ b/drivers/mtd/nand/sm_common.h
@@ -18,7 +18,7 @@ struct sm_oob {
 	uint8_t ecc2[3];
 	uint8_t lba_copy2[2];
 	uint8_t ecc1[3];
-} __attribute__((packed));
+} __packed;
 
 
 /* one sector is always 512 bytes, but it can consist of two nand pages */
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 37ef6b194089..299d7d31fe53 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -153,7 +153,7 @@ struct cfi_ident {
 	uint16_t MaxBufWriteSize;
 	uint8_t  NumEraseRegions;
 	uint32_t EraseRegionInfo[0]; /* Not host ordered */
-} __attribute__((packed));
+} __packed;
 
 /* Extended Query Structure for both PRI and ALT */
 
@@ -161,7 +161,7 @@ struct cfi_extquery {
 	uint8_t  pri[3];
 	uint8_t  MajorVersion;
 	uint8_t  MinorVersion;
-} __attribute__((packed));
+} __packed;
 
 /* Vendor-Specific PRI for Intel/Sharp Extended Command Set (0x0001) */
 
@@ -180,7 +180,7 @@ struct cfi_pri_intelext {
 	uint8_t  FactProtRegSize;
 	uint8_t  UserProtRegSize;
 	uint8_t  extra[0];
-} __attribute__((packed));
+} __packed;
 
 struct cfi_intelext_otpinfo {
 	uint32_t ProtRegAddr;
@@ -188,7 +188,7 @@ struct cfi_intelext_otpinfo {
 	uint8_t  FactProtRegSize;
 	uint16_t UserGroups;
 	uint8_t  UserProtRegSize;
-} __attribute__((packed));
+} __packed;
 
 struct cfi_intelext_blockinfo {
 	uint16_t NumIdentBlocks;
@@ -196,7 +196,7 @@ struct cfi_intelext_blockinfo {
 	uint16_t MinBlockEraseCycles;
 	uint8_t  BitsPerCell;
 	uint8_t  BlockCap;
-} __attribute__((packed));
+} __packed;
 
 struct cfi_intelext_regioninfo {
 	uint16_t NumIdentPartitions;
@@ -205,7 +205,7 @@ struct cfi_intelext_regioninfo {
 	uint8_t  NumOpAllowedSimEraMode;
 	uint8_t  NumBlockTypes;
 	struct cfi_intelext_blockinfo BlockTypes[1];
-} __attribute__((packed));
+} __packed;
 
 struct cfi_intelext_programming_regioninfo {
 	uint8_t  ProgRegShift;
@@ -214,7 +214,7 @@ struct cfi_intelext_programming_regioninfo {
 	uint8_t  Reserved2;
 	uint8_t  ControlInvalid;
 	uint8_t  Reserved3;
-} __attribute__((packed));
+} __packed;
 
 /* Vendor-Specific PRI for AMD/Fujitsu Extended Command Set (0x0002) */
 
@@ -233,7 +233,7 @@ struct cfi_pri_amdstd {
 	uint8_t  VppMin;
 	uint8_t  VppMax;
 	uint8_t  TopBottom;
-} __attribute__((packed));
+} __packed;
 
 /* Vendor-Specific PRI for Atmel chips (command set 0x0002) */
 
@@ -245,18 +245,18 @@ struct cfi_pri_atmel {
 	uint8_t BottomBoot;
 	uint8_t BurstMode;
 	uint8_t PageMode;
-} __attribute__((packed));
+} __packed;
 
 struct cfi_pri_query {
 	uint8_t  NumFields;
 	uint32_t ProtField[1]; /* Not host ordered */
-} __attribute__((packed));
+} __packed;
 
 struct cfi_bri_query {
 	uint8_t  PageModeReadCap;
 	uint8_t  NumFields;
 	uint32_t ConfField[1]; /* Not host ordered */
-} __attribute__((packed));
+} __packed;
 
 #define P_ID_NONE               0x0000
 #define P_ID_INTEL_EXT          0x0001
-- 
1.9.1
