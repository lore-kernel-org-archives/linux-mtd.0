Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MODRK-0007wt-Ly
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 16:22:50 +0000
Date: Tue, 7 Jul 2009 18:22:32 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: [Patch] Support large devices for flash_eraseaal
Message-ID: <20090707162231.GA26579@logfs.org>
References: <20090707140337.GA24749@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20090707140337.GA24749@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd-abi.h bits may be wrong, not sure.  Otherwise it allows me to
erase a large device.  No guarantees beyond that.

Signed-off-by: Joern Engel <joern@logfs.org>

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown

 flash_eraseall.c      |   88 +++++++++++++++++++++++++++++++++++++++++--------
 include/mtd/mtd-abi.h |   89 +++++++++++++++++++++++++++++---------------------
 2 files changed, 126 insertions(+), 51 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index a22fc49..d865cbc 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -48,33 +48,93 @@ static const char *mtd_device;
 static int quiet;		/* true -- don't output progress */
 static int jffs2;		// format for jffs2 usage
 
+struct mtd_info_user64 {
+	uint8_t type;
+	uint32_t flags;
+	uint64_t size;	 // Total size of the MTD
+	uint32_t erasesize;
+	uint32_t writesize;
+	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
+	/* The below two fields are obsolete and broken, do not use them
+	 * (TODO: remove at some point) */
+	uint32_t ecctype;
+	uint32_t eccsize;
+};
+
 static void process_options (int argc, char *argv[]);
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase);
+void show_progress(struct mtd_info_user64 *meminfo, struct erase_info_user64 *erase);
 static void display_help (void);
 static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
 
+static int get_info(const char *devname, struct mtd_info_user64 *mtd64)
+{
+	struct mtd_info_user mtd;
+	char buf[256];
+	int fd;
+
+	if ((fd = open(devname, O_RDWR)) < 0) {
+		fprintf(stderr, "%s: %s: %s\n", exe_name, devname, strerror(errno));
+		return 1;
+	}
+
+
+	if (ioctl(fd, MEMGETINFO, &mtd) != 0) {
+		fprintf(stderr, "%s: %s: unable to get MTD device info\n", exe_name, devname);
+		return 1;
+	}
+	close(fd);
+
+	mtd64->type = mtd.type;
+	mtd64->flags = mtd.flags;
+	mtd64->size = mtd.size;
+	mtd64->erasesize = mtd.erasesize;
+	mtd64->writesize = mtd.writesize;
+	mtd64->oobsize = mtd.oobsize;
+	mtd64->ecctype = mtd.ecctype;
+	mtd64->eccsize = mtd.eccsize;
+
+	/* I'm glad I only have to do this for one parameter. */
+	sprintf(buf, "/sys/class/mtd/%s/size", basename((char *)devname));
+	fd = open(buf, O_RDONLY);
+	if (fd < 0)
+		return 0;
+	read(fd, buf, 256);
+	mtd64->size = strtoull(buf, NULL, 0);
+	close(fd);
+	return 0;
+}
+
+static int do_erase(int fd, struct erase_info_user64 *ei64, struct mtd_info_user64 *mtd64)
+{
+	struct erase_info_user ei;
+
+	if (mtd64->size >= 0x100000000ull)
+		return ioctl(fd, MEMERASE64, ei64);
+	else {
+		ei.start = ei64->start;
+		ei.length = ei64->length;
+		return ioctl(fd, MEMERASE, &ei);
+	}
+}
+
 int main (int argc, char *argv[])
 {
-	mtd_info_t meminfo;
+	struct mtd_info_user64 meminfo;
 	int fd, clmpos = 0, clmlen = 8;
-	erase_info_t erase;
+	struct erase_info_user64 erase;
 	int isNAND, bbtest = 1;
 
 	process_options(argc, argv);
 
+	if (get_info(mtd_device, &meminfo))
+		return 1;
 	if ((fd = open(mtd_device, O_RDWR)) < 0) {
 		fprintf(stderr, "%s: %s: %s\n", exe_name, mtd_device, strerror(errno));
 		return 1;
 	}
 
-
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		fprintf(stderr, "%s: %s: unable to get MTD device info\n", exe_name, mtd_device);
-		return 1;
-	}
-
 	erase.length = meminfo.erasesize;
 	isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;
 
@@ -130,7 +190,7 @@ int main (int argc, char *argv[])
 			int ret = ioctl(fd, MEMGETBADBLOCK, &offset);
 			if (ret > 0) {
 				if (!quiet)
-					printf ("\nSkipping bad block at 0x%08x\n", erase.start);
+					printf ("\nSkipping bad block at 0x%08llx\n", erase.start);
 				continue;
 			} else if (ret < 0) {
 				if (errno == EOPNOTSUPP) {
@@ -149,7 +209,7 @@ int main (int argc, char *argv[])
 		if (!quiet)
 			show_progress(&meminfo, &erase);
 
-		if (ioctl(fd, MEMERASE, &erase) != 0) {
+		if (do_erase(fd, &erase, &meminfo) != 0) {
 			fprintf(stderr, "\n%s: %s: MTD Erase failure: %s\n", exe_name, mtd_device, strerror(errno));
 			continue;
 		}
@@ -179,7 +239,7 @@ int main (int argc, char *argv[])
 			}
 		}
 		if (!quiet)
-			printf (" Cleanmarker written at %x.", erase.start);
+			printf (" Cleanmarker written at %llx.", erase.start);
 	}
 	if (!quiet) {
 		show_progress(&meminfo, &erase);
@@ -250,9 +310,9 @@ void process_options (int argc, char *argv[])
 	mtd_device = argv[optind];
 }
 
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase)
+void show_progress(struct mtd_info_user64 *meminfo, struct erase_info_user64 *erase)
 {
-	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
+	printf("\rErasing %d Kibyte @ %llx -- %2llu %% complete.",
 		meminfo->erasesize / 1024, erase->start,
 		(unsigned long long) erase->start * 100 / meminfo->size);
 	fflush(stdout);
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
