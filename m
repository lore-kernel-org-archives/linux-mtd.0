Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCOHi-00014k-Q4
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 02:36:28 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Wed, 12 May 2010 19:22:57 -0700
Subject: [PATCH v5 1/3] mtd-utils: update to latest mtd-abi.h from kernel.org
Message-Id: <cd4bcbb843643dc463d2a2853766bcf57c23f546@localhost.localdomain>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 include/mtd/mtd-abi.h |   89 ++++++++++++++++++++++++++++--------------------
 1 files changed, 52 insertions(+), 37 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 86defe1..c6954ed 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -1,23 +1,35 @@
 /*
- * $Id: mtd-abi.h,v 1.13 2005/11/07 11:14:56 gleixner Exp $
- *
  * Portions of MTD ABI definition which are shared by kernel and user space
  */
 
 #ifndef __MTD_ABI_H__
 #define __MTD_ABI_H__
 
+#include <linux/types.h>
+
 struct erase_info_user {
-	uint32_t start;
-	uint32_t length;
+	__u32 start;
+	__u32 length;
+};
+
+struct erase_info_user64 {
+	__u64 start;
+	__u64 length;
 };
 
 struct mtd_oob_buf {
-	uint32_t start;
-	uint32_t length;
+	__u32 start;
+	__u32 length;
 	unsigned char *ptr;
 };
 
+struct mtd_oob_buf64 {
+	__u64 start;
+	__u32 pad;
+	__u32 length;
+	__u64 usr_ptr;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -29,7 +41,7 @@ struct mtd_oob_buf {
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
-#define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
+#define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
 
 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
@@ -50,30 +62,30 @@ struct mtd_oob_buf {
 #define MTD_OTP_USER		2
 
 struct mtd_info_user {
-	uint8_t type;
-	uint32_t flags;
-	uint32_t size;	 // Total size of the MTD
-	uint32_t erasesize;
-	uint32_t writesize;
-	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
+	__u8 type;
+	__u32 flags;
+	__u32 size;	 // Total size of the MTD
+	__u32 erasesize;
+	__u32 writesize;
+	__u32 oobsize;   // Amount of OOB data per block (e.g. 16)
 	/* The below two fields are obsolete and broken, do not use them
 	 * (TODO: remove at some point) */
-	uint32_t ecctype;
-	uint32_t eccsize;
+	__u32 ecctype;
+	__u32 eccsize;
 };
 
 struct region_info_user {
-	uint32_t offset;		/* At which this region starts,
+	__u32 offset;		/* At which this region starts,
 					 * from the beginning of the MTD */
-	uint32_t erasesize;		/* For this region */
-	uint32_t numblocks;		/* Number of blocks in this region */
-	uint32_t regionindex;
+	__u32 erasesize;		/* For this region */
+	__u32 numblocks;		/* Number of blocks in this region */
+	__u32 regionindex;
 };
 
 struct otp_info {
-	uint32_t start;
-	uint32_t length;
-	uint32_t locked;
+	__u32 start;
+	__u32 length;
+	__u32 locked;
 };
 
 #define MEMGETINFO		_IOR('M', 1, struct mtd_info_user)
@@ -86,8 +98,8 @@ struct otp_info {
 #define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
 #define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)
 #define MEMGETOOBSEL		_IOR('M', 10, struct nand_oobinfo)
-#define MEMGETBADBLOCK		_IOW('M', 11, loff_t)
-#define MEMSETBADBLOCK		_IOW('M', 12, loff_t)
+#define MEMGETBADBLOCK		_IOW('M', 11, __kernel_loff_t)
+#define MEMSETBADBLOCK		_IOW('M', 12, __kernel_loff_t)
 #define OTPSELECT		_IOR('M', 13, int)
 #define OTPGETREGIONCOUNT	_IOW('M', 14, int)
 #define OTPGETREGIONINFO	_IOW('M', 15, struct otp_info)
@@ -95,21 +107,24 @@ struct otp_info {
 #define ECCGETLAYOUT		_IOR('M', 17, struct nand_ecclayout)
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)
+#define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
+#define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
+#define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
  */
 struct nand_oobinfo {
-	uint32_t useecc;
-	uint32_t eccbytes;
-	uint32_t oobfree[8][2];
-	uint32_t eccpos[32];
+	__u32 useecc;
+	__u32 eccbytes;
+	__u32 oobfree[8][2];
+	__u32 eccpos[32];
 };
 
 struct nand_oobfree {
-	uint32_t offset;
-	uint32_t length;
+	__u32 offset;
+	__u32 length;
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES	8
@@ -118,9 +133,9 @@ struct nand_oobfree {
  * diagnosis and to allow creation of raw images
  */
 struct nand_ecclayout {
-	uint32_t eccbytes;
-	uint32_t eccpos[64];
-	uint32_t oobavail;
+	__u32 eccbytes;
+	__u32 eccpos[64];
+	__u32 oobavail;
 	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
 };
 
@@ -133,10 +148,10 @@ struct nand_ecclayout {
  * @bbtblocks:	number of blocks reserved for bad block tables
  */
 struct mtd_ecc_stats {
-	uint32_t corrected;
-	uint32_t failed;
-	uint32_t badblocks;
-	uint32_t bbtblocks;
+	__u32 corrected;
+	__u32 failed;
+	__u32 badblocks;
+	__u32 bbtblocks;
 };
 
 /*
-- 
1.6.5
