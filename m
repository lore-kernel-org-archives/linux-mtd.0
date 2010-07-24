Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OcT5e-0003ex-3w
	for linux-mtd@lists.infradead.org; Sat, 24 Jul 2010 00:59:47 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Fri, 23 Jul 2010 17:46:15 -0700
Subject: [PATCH v3 1/2] mtd-utils: change flash_eraseall to use libmtd-wrapped
	ioctls
Message-Id: <5a5041da4e200221d33e0e25594438e3@localhost>
To: <dedekind1@gmail.com>, <saeed.bishara@gmail.com>, <jwboyer@gmail.com>,
	<vapier.adi@gmail.com>
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

ERASE/ERASE64 were tested on 2.6.18 and 2.6.31.  OOB is untested.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 flash_eraseall.c |   58 +++++++++++++++++++++++++++--------------------------
 1 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/flash_eraseall.c b/flash_eraseall.c
index e6f8d50..a2a6b0a 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -36,6 +36,7 @@
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 #include <crc32.h>
+#include <libmtd.h>
 
 #include <mtd/mtd-user.h>
 #include <mtd/jffs2-user.h>
@@ -49,7 +50,7 @@ static int quiet;		/* true -- don't output progress */
 static int jffs2;		// format for jffs2 usage
 
 static void process_options (int argc, char *argv[]);
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase);
+void show_progress (struct mtd_dev_info *mtd, uint64_t start);
 static void display_help (void);
 static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
@@ -57,26 +58,31 @@ int target_endian = __BYTE_ORDER;
 
 int main (int argc, char *argv[])
 {
-	mtd_info_t meminfo;
-	int fd, clmpos = 0, clmlen = 8;
-	erase_info_t erase;
+	libmtd_t mtd_desc;
+	struct mtd_dev_info mtd;
+	int fd, clmpos = 0, clmlen = 8, eb;
 	int isNAND, bbtest = 1;
+	uint64_t offset = 0;
 
 	process_options(argc, argv);
 
+	mtd_desc = libmtd_open();
+	if (mtd_desc == NULL) {
+		fprintf(stderr, "%s: can't initialize libmtd\n", exe_name);
+		return 1;
+	}
+
 	if ((fd = open(mtd_device, O_RDWR)) < 0) {
 		fprintf(stderr, "%s: %s: %s\n", exe_name, mtd_device, strerror(errno));
 		return 1;
 	}
 
-
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		fprintf(stderr, "%s: %s: unable to get MTD device info\n", exe_name, mtd_device);
+	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0) {
+		fprintf(stderr, "%s: mtd_get_dev_info failed\n", exe_name);
 		return 1;
 	}
 
-	erase.length = meminfo.erasesize;
-	isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;
+	isNAND = mtd.type == MTD_NANDFLASH ? 1 : 0;
 
 	if (jffs2) {
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
@@ -104,7 +110,7 @@ int main (int argc, char *argv[])
 					clmlen = 8;
 			} else {
 				/* Legacy mode */
-				switch (meminfo.oobsize) {
+				switch (mtd.oob_size) {
 					case 8:
 						clmpos = 6;
 						clmlen = 2;
@@ -124,13 +130,13 @@ int main (int argc, char *argv[])
 		cleanmarker.hdr_crc =  cpu_to_je32 (crc32 (0, &cleanmarker,  sizeof (struct jffs2_unknown_node) - 4));
 	}
 
-	for (erase.start = 0; erase.start < meminfo.size; erase.start += meminfo.erasesize) {
+	for (eb = 0; eb < (mtd.size / mtd.eb_size); eb++) {
+		offset = eb * mtd.eb_size;
 		if (bbtest) {
-			loff_t offset = erase.start;
-			int ret = ioctl(fd, MEMGETBADBLOCK, &offset);
+			int ret = mtd_is_bad(&mtd, fd, eb);
 			if (ret > 0) {
 				if (!quiet)
-					printf ("\nSkipping bad block at 0x%08x\n", erase.start);
+					printf ("\nSkipping bad block at 0x%08llx\n", (unsigned long long)offset);
 				continue;
 			} else if (ret < 0) {
 				if (errno == EOPNOTSUPP) {
@@ -147,9 +153,9 @@ int main (int argc, char *argv[])
 		}
 
 		if (!quiet)
-			show_progress(&meminfo, &erase);
+			show_progress(&mtd, offset);
 
-		if (ioctl(fd, MEMERASE, &erase) != 0) {
+		if (mtd_erase(mtd_desc, &mtd, fd, eb) != 0) {
 			fprintf(stderr, "\n%s: %s: MTD Erase failure: %s\n", exe_name, mtd_device, strerror(errno));
 			continue;
 		}
@@ -160,16 +166,12 @@ int main (int argc, char *argv[])
 
 		/* write cleanmarker */
 		if (isNAND) {
-			struct mtd_oob_buf oob;
-			oob.ptr = (unsigned char *) &cleanmarker;
-			oob.start = erase.start + clmpos;
-			oob.length = clmlen;
-			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {
+			if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, clmlen, &cleanmarker) != 0) {
 				fprintf(stderr, "\n%s: %s: MTD writeoob failure: %s\n", exe_name, mtd_device, strerror(errno));
 				continue;
 			}
 		} else {
-			if (lseek (fd, erase.start, SEEK_SET) < 0) {
+			if (lseek (fd, (loff_t)offset, SEEK_SET) < 0) {
 				fprintf(stderr, "\n%s: %s: MTD lseek failure: %s\n", exe_name, mtd_device, strerror(errno));
 				continue;
 			}
@@ -179,10 +181,10 @@ int main (int argc, char *argv[])
 			}
 		}
 		if (!quiet)
-			printf (" Cleanmarker written at %x.", erase.start);
+			printf (" Cleanmarker written at %llx.", (unsigned long long)offset);
 	}
 	if (!quiet) {
-		show_progress(&meminfo, &erase);
+		show_progress(&mtd, offset);
 		printf("\n");
 	}
 
@@ -250,11 +252,11 @@ void process_options (int argc, char *argv[])
 	mtd_device = argv[optind];
 }
 
-void show_progress (mtd_info_t *meminfo, erase_info_t *erase)
+void show_progress (struct mtd_dev_info *mtd, uint64_t start)
 {
-	printf("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
-		meminfo->erasesize / 1024, erase->start,
-		(unsigned long long) erase->start * 100 / meminfo->size);
+	printf("\rErasing %d Kibyte @ %llx -- %2llu %% complete.",
+		mtd->eb_size / 1024, (unsigned long long)start,
+		(unsigned long long) start * 100 / mtd->size);
 	fflush(stdout);
 }
 
-- 
1.7.0.4
