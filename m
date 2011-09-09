Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R24cc-0005l9-Ug
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 17:12:12 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 02/10] mtd-utils: update mtd-abi.h
Date: Fri, 9 Sep 2011 10:11:49 -0700
Message-ID: <1315588309-17745-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-3-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kernel ABI header added a new ioctl, killed an old one, and exposed OOB
modes to user-space. Plus, it added a lot of documentation.

We have some trivial name changes for some MTD mode constants as well.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: change __u32 to __u64 in mtd_write_req for future-proofing; this
    depends on the v2 patch for ioctl(MEMWRITE); see
    http://lists.infradead.org/pipermail/linux-mtd/2011-September/037838.html

 include/mtd/mtd-abi.h |  122 ++++++++++++++++++++++++++++++++++++++++++-------
 nanddump.c            |    2 +-
 nandwrite.c           |    2 +-
 3 files changed, 107 insertions(+), 19 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index a86364a..4de167b 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -45,6 +45,51 @@ struct mtd_oob_buf64 {
 	__u64 usr_ptr;
 };
 
+/**
+ * MTD operation modes
+ *
+ * @MTD_OPS_PLACE_OOB:	OOB data are placed at the given offset (default)
+ * @MTD_OPS_AUTO_OOB:	OOB data are automatically placed at the free areas
+ *			which are defined by the internal ecclayout
+ * @MTD_OPS_RAW:	data are transferred as-is, with no error correction;
+ *			this mode implies %MTD_OPS_PLACE_OOB
+ *
+ * These modes can be passed to ioctl(MEMWRITE) and are also used internally.
+ * See notes on "MTD file modes" for discussion on %MTD_OPS_RAW vs.
+ * %MTD_FILE_MODE_RAW.
+ */
+enum {
+	MTD_OPS_PLACE_OOB = 0,
+	MTD_OPS_AUTO_OOB = 1,
+	MTD_OPS_RAW = 2,
+};
+
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
+struct mtd_write_req {
+	__u64 start;
+	__u64 len;
+	__u64 ooblen;
+	__u64 usr_data;
+	__u64 usr_oob;
+	__u8 mode;
+	__u8 padding[7];
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -59,13 +104,13 @@ struct mtd_oob_buf64 {
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
@@ -80,21 +125,18 @@ struct mtd_oob_buf64 {
 struct mtd_info_user {
 	__u8 type;
 	__u32 flags;
-	__u32 size;	 // Total size of the MTD
+	__u32 size;	/* Total size of the MTD */
 	__u32 erasesize;
 	__u32 writesize;
-	__u32 oobsize;   // Amount of OOB data per block (e.g. 16)
-	/* The below two fields are obsolete and broken, do not use them
-	 * (TODO: remove at some point) */
-	__u32 ecctype;
-	__u32 eccsize;
+	__u32 oobsize;	/* Amount of OOB data per block (e.g. 16) */
+	__u64 padding;	/* Old obsolete field; do not use */
 };
 
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
 
@@ -104,29 +146,61 @@ struct otp_info {
 	__u32 locked;
 };
 
+/*
+ * Note, the following ioctl existed in the past and was removed:
+ * #define MEMSETOOBSEL           _IOW('M', 9, struct nand_oobinfo)
+ * Try to avoid adding a new ioctl with the same ioctl number.
+ */
+
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
-#define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)
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
+#define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
@@ -177,13 +251,27 @@ struct mtd_ecc_stats {
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
-	MTD_MODE_NORMAL = MTD_OTP_OFF,
-	MTD_MODE_OTP_FACTORY = MTD_OTP_FACTORY,
-	MTD_MODE_OTP_USER = MTD_OTP_USER,
-	MTD_MODE_RAW,
+	MTD_FILE_MODE_NORMAL = MTD_OTP_OFF,
+	MTD_FILE_MODE_OTP_FACTORY = MTD_OTP_FACTORY,
+	MTD_FILE_MODE_OTP_USER = MTD_OTP_USER,
+	MTD_FILE_MODE_RAW,
 };
 
 #endif /* __MTD_ABI_H__ */
diff --git a/nanddump.c b/nanddump.c
index 7a24c0d..be458c6 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -336,7 +336,7 @@ int main(int argc, char * const argv[])
 	readbuf = xmalloc(sizeof(readbuf) * mtd.min_io_size);
 
 	if (noecc)  {
-		if (ioctl(fd, MTDFILEMODE, MTD_MODE_RAW) != 0) {
+		if (ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW) != 0) {
 				perror("MTDFILEMODE");
 				goto closeall;
 		}
diff --git a/nandwrite.c b/nandwrite.c
index 17a717c..3f70cb3 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -274,7 +274,7 @@ int main(int argc, char * const argv[])
 	}
 
 	if (noecc)  {
-		ret = ioctl(fd, MTDFILEMODE, MTD_MODE_RAW);
+		ret = ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW);
 		if (ret) {
 			switch (errno) {
 			case ENOTTY:
-- 
1.7.5.4
