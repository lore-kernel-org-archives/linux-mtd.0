Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZwL-0005NY-TV
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:50:08 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 09/12] mtd: document ABI
Date: Tue, 30 Aug 2011 18:45:44 -0700
Message-ID: <1314755147-17756-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We're missing a lot of important documentation in include/mtd/mtd-abi.h:

* add a simple description of each ioctl (feel free to expand!)
* give full explanations of recently added and modified operations
* explain the usage of "RAW" that appear in different modes and types of
  operations
* fix some comment style along the way

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/mtd.h |    2 +-
 include/mtd/mtd-abi.h   |   86 +++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index e02e65b..ead70ed 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -79,7 +79,7 @@ struct mtd_erase_region_info {
  * @ooblen:	number of oob bytes to write/read
  * @oobretlen:	number of oob bytes written/read
  * @ooboffs:	offset of oob data in the oob area (only relevant when
- *		mode = MTD_OPS_PLACE_OOB)
+ *		mode = MTD_OPS_PLACE_OOB or MTD_OPS_RAW)
  * @datbuf:	data buffer - if NULL only oob data are read/written
  * @oobbuf:	oob data buffer
  *
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 0a21ef5..d54ccf3 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -45,14 +45,18 @@ struct mtd_oob_buf64 {
 	__u64 usr_ptr;
 };
 
-/*
+/**
  * MTD operation modes
  *
- * MTD_OPS_PLACE_OOB:	oob data are placed at the given offset (default)
- * MTD_OPS_AUTO_OOB:	oob data are automatically placed at the free areas
+ * @MTD_OPS_PLACE_OOB:	OOB data are placed at the given offset (default)
+ * @MTD_OPS_AUTO_OOB:	OOB data are automatically placed at the free areas
  *			which are defined by the internal ecclayout
- * MTD_OPS_RAW:		mode to read or write oob and data without doing ECC
- *			checking
+ * @MTD_OPS_RAW:	data are transferred as-is, with no error correction;
+ *			this mode implies %MTD_OPS_PLACE_OOB
+ *
+ * These modes can be passed to ioctl(MEMWRITE) and are also used internally.
+ * See notes on "MTD file modes" for discussion on %MTD_OPS_RAW vs.
+ * %MTD_FILE_MODE_RAW.
  */
 enum {
 	MTD_OPS_PLACE_OOB = 0,
@@ -60,6 +64,22 @@ enum {
 	MTD_OPS_RAW = 2,
 };
 
+/**
+ * struct mtd_write_req - data structure for requesting a write operation
+ *
+ * @start:	start address
+ * @len:	length of data buffer
+ * @ooblen:	length of OOB buffer
+ * @usr_data:	user-provided data buffer
+ * @usr_oob:	user-provided OOB buffer
+ * @mode:	MTD mode (see "MTD operation modes")
+ * @padding:	reserved, must be set to 0
+ *
+ * This structure supports ioctl(MEMWRITE) operations, allowing data and/or OOB
+ * writes in various modes. To write to OOB-only, set @usr_data == NULL, and to
+ * write data-only, set @usr_oob == NULL. However, setting both @usr_data and
+ * @usr_oob to NULL is not allowed.
+ */
 struct mtd_write_req {
 	__u64 start;
 	__u32 len;
@@ -84,13 +104,13 @@ struct mtd_write_req {
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
 #define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
 
-// Some common devices / combinations of capabilities
+/* Some common devices / combinations of capabilities */
 #define MTD_CAP_ROM		0
 #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
 #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
 #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
 
-/* ECC byte placement */
+/* Obsolete ECC byte placement modes (used with obsolete MEMGETOOBSEL) */
 #define MTD_NANDECC_OFF		0	// Switch off ECC (Not recommended)
 #define MTD_NANDECC_PLACE	1	// Use the given placement in the structure (YAFFS1 legacy mode)
 #define MTD_NANDECC_AUTOPLACE	2	// Use the default placement scheme
@@ -105,10 +125,10 @@ struct mtd_write_req {
 struct mtd_info_user {
 	__u8 type;
 	__u32 flags;
-	__u32 size;	 // Total size of the MTD
+	__u32 size;	/* Total size of the MTD */
 	__u32 erasesize;
 	__u32 writesize;
-	__u32 oobsize;   // Amount of OOB data per block (e.g. 16)
+	__u32 oobsize;	/* Amount of OOB data per block (e.g. 16) */
 	/* The below two fields are obsolete and broken, do not use them
 	 * (TODO: remove at some point) */
 	__u32 ecctype;
@@ -117,9 +137,9 @@ struct mtd_info_user {
 
 struct region_info_user {
 	__u32 offset;		/* At which this region starts,
-					 * from the beginning of the MTD */
-	__u32 erasesize;		/* For this region */
-	__u32 numblocks;		/* Number of blocks in this region */
+				 * from the beginning of the MTD */
+	__u32 erasesize;	/* For this region */
+	__u32 numblocks;	/* Number of blocks in this region */
 	__u32 regionindex;
 };
 
@@ -135,28 +155,54 @@ struct otp_info {
  * Try to avoid adding a new ioctl with the same ioctl number.
  */
 
+/* Get basic MTD characteristics info (better to use sysfs) */
 #define MEMGETINFO		_IOR('M', 1, struct mtd_info_user)
+/* Erase segment of MTD */
 #define MEMERASE		_IOW('M', 2, struct erase_info_user)
+/* Write out-of-band data from MTD */
 #define MEMWRITEOOB		_IOWR('M', 3, struct mtd_oob_buf)
+/* Read out-of-band data from MTD */
 #define MEMREADOOB		_IOWR('M', 4, struct mtd_oob_buf)
+/* Lock a chip (for MTD that supports it) */
 #define MEMLOCK			_IOW('M', 5, struct erase_info_user)
+/* Unlock a chip (for MTD that supports it) */
 #define MEMUNLOCK		_IOW('M', 6, struct erase_info_user)
+/* Get the number of different erase regions */
 #define MEMGETREGIONCOUNT	_IOR('M', 7, int)
+/* Get information about the erase region for a specific index */
 #define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
+/* Get info about OOB modes (e.g., RAW, PLACE, AUTO) - legacy interface */
 #define MEMGETOOBSEL		_IOR('M', 10, struct nand_oobinfo)
+/* Check if an eraseblock is bad */
 #define MEMGETBADBLOCK		_IOW('M', 11, __kernel_loff_t)
+/* Mark an eraseblock as bad */
 #define MEMSETBADBLOCK		_IOW('M', 12, __kernel_loff_t)
+/* Set OTP (One-Time Programmable) mode (factory vs. user) */
 #define OTPSELECT		_IOR('M', 13, int)
+/* Get number of OTP (One-Time Programmable) regions */
 #define OTPGETREGIONCOUNT	_IOW('M', 14, int)
+/* Get all OTP (One-Time Programmable) info about MTD */
 #define OTPGETREGIONINFO	_IOW('M', 15, struct otp_info)
+/* Lock a given range of user data (must be in mode %MTD_FILE_MODE_OTP_USER) */
 #define OTPLOCK			_IOR('M', 16, struct otp_info)
+/* Get ECC layout (deprecated) */
 #define ECCGETLAYOUT		_IOR('M', 17, struct nand_ecclayout_user)
+/* Get statistics about corrected/uncorrected errors */
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
+/* Set MTD mode on a per-file-descriptor basis (see "MTD file modes") */
 #define MTDFILEMODE		_IO('M', 19)
+/* Erase segment of MTD (supports 64-bit address) */
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
+/* Write data to OOB (64-bit version) */
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
+/* Read data from OOB (64-bit version) */
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+/* Check if chip is locked (for MTD that supports it) */
 #define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
+/*
+ * Most generic write interface; can write in-band and/or out-of-band in various
+ * modes (see "struct mtd_write_req")
+ */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
 
 /*
@@ -208,7 +254,21 @@ struct mtd_ecc_stats {
 };
 
 /*
- * Read/write file modes for access to MTD
+ * MTD file modes - for read/write access to MTD
+ *
+ * @MTD_FILE_MODE_NORMAL:	OTP disabled, ECC enabled
+ * @MTD_FILE_MODE_OTP_FACTORY:	OTP enabled in factory mode
+ * @MTD_FILE_MODE_OTP_USER:	OTP enabled in user mode
+ * @MTD_FILE_MODE_RAW:		OTP disabled, ECC disabled
+ *
+ * These modes can be set via ioctl(MTDFILEMODE). The mode mode will be retained
+ * separately for each open file descriptor.
+ *
+ * Note: %MTD_FILE_MODE_RAW provides the same functionality as %MTD_OPS_RAW -
+ * raw access to the flash, without error correction or autoplacement schemes.
+ * Wherever possible, the MTD_OPS_* mode will override the MTD_FILE_MODE_* mode
+ * (e.g., when using ioctl(MEMWRITE)), but in some cases, the MTD_FILE_MODE is
+ * used out of necessity (e.g., `write()', ioctl(MEMWRITEOOB64)).
  */
 enum mtd_file_modes {
 	MTD_FILE_MODE_NORMAL = MTD_OTP_OFF,
-- 
1.7.5.4
