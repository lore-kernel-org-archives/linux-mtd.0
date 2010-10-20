Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8SPY-0006RG-CK
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 06:44:33 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd-utils: nanddump: add 64-bit support, utilize
 libmtd
Date: Tue, 19 Oct 2010 23:45:25 -0700
Message-ID: <1287557125-2672-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1287557125-2672-1-git-send-email-computersforpeace@gmail.com>
References: <1287557125-2672-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adds support for 64-bit offsets (i.e., devices larger than 4GB).
Calls to ioctls are mostly replaced by libmtd interfaces; however,
a few remain and probably should be handled with more robust
interfaces, as some of these ioctls are considered "legacy."

Similar updates to nandwrite will come shortly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c  |  117 +++++++++++++++++++++++++++++------------------------------
 nandwrite.c |    7 ++--
 2 files changed, 60 insertions(+), 64 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 6428bc4..55dbd37 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -33,6 +33,7 @@
 #include <asm/types.h>
 #include <mtd/mtd-user.h>
 #include "common.h"
+#include <libmtd.h>
 
 static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
@@ -77,18 +78,18 @@ static void display_version(void)
 
 // Option variables
 
-static bool		pretty_print = false;	// print nice
-static bool		noecc = false;		// don't error correct
-static bool		noskipbad = false;	// don't skip bad blocks
-static bool		omitoob = false;	// omit oob data
-static unsigned long	start_addr;		// start address
-static unsigned long	length;			// dump length
-static const char	*mtddev;		// mtd device name
-static const char	*dumpfile;		// dump file name
-static bool		omitbad = false;
-static bool		quiet = false;		// suppress diagnostic output
-static bool		canonical = false;	// print nice + ascii
-static bool		forcebinary = false;	// force printing binary to tty
+static bool			pretty_print = false;	// print nice
+static bool			noecc = false;		// don't error correct
+static bool			noskipbad = false;	// don't skip bad blocks
+static bool			omitoob = false;	// omit oob data
+static unsigned long long	start_addr;		// start address
+static unsigned long		length;			// dump length
+static const char		*mtddev;		// mtd device name
+static const char		*dumpfile;		// dump file name
+static bool			omitbad = false;
+static bool			quiet = false;		// suppress diagnostic output
+static bool			canonical = false;	// print nice + ascii
+static bool			forcebinary = false;	// force printing binary to tty
 
 static void process_options(int argc, char * const argv[])
 {
@@ -135,7 +136,7 @@ static void process_options(int argc, char * const argv[])
 				omitbad = true;
 				break;
 			case 's':
-				start_addr = strtol(optarg, NULL, 0);
+				start_addr = strtoull(optarg, NULL, 0);
 				break;
 			case 'f':
 				if (!(dumpfile = strdup(optarg))) {
@@ -221,18 +222,16 @@ static void process_options(int argc, char * const argv[])
  */
 static void pretty_dump_to_buffer(const unsigned char *buf, size_t len,
 		char *linebuf, size_t linebuflen, bool pagedump, bool ascii,
-		unsigned int prefix)
+		unsigned long long prefix)
 {
 	static const char hex_asc[] = "0123456789abcdef";
 	unsigned char ch;
-	int j, lx = 0;
-	int ascii_column;
+	unsigned int j, lx = 0, ascii_column;
 
 	if (pagedump)
-		sprintf(linebuf, "0x%.8x: ", prefix);
+		lx += sprintf(linebuf, "0x%.8llx: ", prefix);
 	else
-		sprintf(linebuf, "  OOB Data: ");
-	lx += 12;
+		lx += sprintf(linebuf, "  OOB Data: ");
 
 	if (!len)
 		goto nil;
@@ -253,8 +252,10 @@ static void pretty_dump_to_buffer(const unsigned char *buf, size_t len,
 	if (!ascii)
 		goto nil;
 
-	while (lx < (linebuflen - 1) && lx < (ascii_column - 1))
+	do {
 		linebuf[lx++] = ' ';
+	} while (lx < (linebuflen - 1) && lx < (ascii_column - 1));
+
 	linebuf[lx++] = '|';
 	for (j = 0; (j < len) && (lx + 2) < linebuflen; j++)
 		linebuf[lx++] = (isascii(buf[j]) && isprint(buf[j])) ? buf[j]
@@ -271,20 +272,25 @@ nil:
  */
 int main(int argc, char * const argv[])
 {
-	unsigned long ofs, end_addr = 0;
+	unsigned long long ofs, end_addr = 0;
 	unsigned long long blockstart = 1;
 	int ret, i, fd, ofd = 0, bs, badblock = 0;
-	struct mtd_oob_buf oob;
-	mtd_info_t meminfo;
+	struct mtd_dev_info mtd;
 	char pretty_buf[PRETTY_BUF_LEN];
 	int oobinfochanged = 0, firstblock = 1;
 	struct nand_oobinfo old_oobinfo;
 	struct mtd_ecc_stats stat1, stat2;
 	bool eccstats = false;
 	unsigned char *readbuf = NULL, *oobbuf = NULL;
+	libmtd_t mtd_desc;
 
 	process_options(argc, argv);
 
+	/* Initialize libmtd */
+	mtd_desc = libmtd_open();
+	if (!mtd_desc)
+		return errmsg("can't initialize libmtd");
+
 	/* Open MTD device */
 	if ((fd = open(mtddev, O_RDONLY)) == -1) {
 		perror(mtddev);
@@ -292,20 +298,12 @@ int main(int argc, char * const argv[])
 	}
 
 	/* Fill in MTD device capability structure */
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		perror("MEMGETINFO");
-		close(fd);
-		exit(EXIT_FAILURE);
-	}
+	if (mtd_get_dev_info(mtd_desc, mtddev, &mtd) < 0)
+		return errmsg("mtd_get_dev_info failed");
 
 	/* Allocate buffers */
-	oobbuf = xmalloc(sizeof(oobbuf) * meminfo.oobsize);
-	readbuf = xmalloc(sizeof(readbuf) * meminfo.writesize);
-
-	/* Fill in oob info */
-	oob.start = 0;
-	oob.length = meminfo.oobsize;
-	oob.ptr = oobbuf;
+	oobbuf = xmalloc(sizeof(oobbuf) * mtd.oob_size);
+	readbuf = xmalloc(sizeof(readbuf) * mtd.min_io_size);
 
 	if (noecc)  {
 		ret = ioctl(fd, MTDFILEMODE, (void *)MTD_MODE_RAW);
@@ -359,27 +357,27 @@ int main(int argc, char * const argv[])
 	}
 
 	/* Initialize start/end addresses and block size */
-	if (start_addr & (meminfo.writesize - 1)) {
+	if (start_addr & (mtd.min_io_size - 1)) {
 		fprintf(stderr, "WARNING: The start address is not page-aligned !\n"
 				"The pagesize of this NAND Flash is 0x%x.\n"
 				"nandwrite doesn't allow writes starting at this location.\n"
 				"Future versions of nanddump will fail here.\n",
-				meminfo.writesize);
+				mtd.min_io_size);
 	}
 	if (length)
 		end_addr = start_addr + length;
-	if (!length || end_addr > meminfo.size)
-		end_addr = meminfo.size;
+	if (!length || end_addr > mtd.size)
+		end_addr = mtd.size;
 
-	bs = meminfo.writesize;
+	bs = mtd.min_io_size;
 
 	/* Print informative message */
 	if (!quiet) {
 		fprintf(stderr, "Block size %u, page size %u, OOB size %u\n",
-				meminfo.erasesize, meminfo.writesize, meminfo.oobsize);
+				mtd.eb_size, mtd.min_io_size, mtd.oob_size);
 		fprintf(stderr,
-				"Dumping data starting at 0x%08x and ending at 0x%08x...\n",
-				(unsigned int)start_addr, (unsigned int)end_addr);
+				"Dumping data starting at 0x%08llx and ending at 0x%08llx...\n",
+				start_addr, end_addr);
 	}
 
 	/* Dump the flash contents */
@@ -387,12 +385,12 @@ int main(int argc, char * const argv[])
 		/* Check for bad block */
 		if (noskipbad) {
 			badblock = 0;
-		} else if (blockstart != (ofs & (~meminfo.erasesize + 1)) ||
+		} else if (blockstart != (ofs & (~mtd.eb_size + 1)) ||
 				firstblock) {
-			blockstart = ofs & (~meminfo.erasesize + 1);
+			blockstart = ofs & (~mtd.eb_size + 1);
 			firstblock = 0;
-			if ((badblock = ioctl(fd, MEMGETBADBLOCK, &blockstart)) < 0) {
-				perror("ioctl(MEMGETBADBLOCK)");
+			if ((badblock = mtd_is_bad(&mtd, fd, ofs / mtd.eb_size)) < 0) {
+				errmsg("libmtd: mtd_is_bad");
 				goto closeall;
 			}
 		}
@@ -403,8 +401,8 @@ int main(int argc, char * const argv[])
 			memset(readbuf, 0xff, bs);
 		} else {
 			/* Read page data and exit on failure */
-			if (pread(fd, readbuf, bs, ofs) != bs) {
-				perror("pread");
+			if (mtd_read(&mtd, fd, ofs / mtd.eb_size, ofs % mtd.eb_size, readbuf, bs)) {
+				errmsg("mtd_read");
 				goto closeall;
 			}
 		}
@@ -417,11 +415,11 @@ int main(int argc, char * const argv[])
 			}
 			if (stat1.failed != stat2.failed)
 				fprintf(stderr, "ECC: %d uncorrectable bitflip(s)"
-						" at offset 0x%08lx\n",
+						" at offset 0x%08llx\n",
 						stat2.failed - stat1.failed, ofs);
 			if (stat1.corrected != stat2.corrected)
 				fprintf(stderr, "ECC: %d corrected bitflip(s) at"
-						" offset 0x%08lx\n",
+						" offset 0x%08llx\n",
 						stat2.corrected - stat1.corrected, ofs);
 			stat1 = stat2;
 		}
@@ -429,8 +427,8 @@ int main(int argc, char * const argv[])
 		/* Write out page data */
 		if (pretty_print) {
 			for (i = 0; i < bs; i += PRETTY_ROW_SIZE) {
-				pretty_dump_to_buffer(readbuf+i, PRETTY_ROW_SIZE,
-						pretty_buf, PRETTY_BUF_LEN, true, canonical, ofs+i);
+				pretty_dump_to_buffer(readbuf + i, PRETTY_ROW_SIZE,
+						pretty_buf, PRETTY_BUF_LEN, true, canonical, ofs + i);
 				write(ofd, pretty_buf, strlen(pretty_buf));
 			}
 		} else
@@ -440,25 +438,24 @@ int main(int argc, char * const argv[])
 			continue;
 
 		if (badblock) {
-			memset(oobbuf, 0xff, meminfo.oobsize);
+			memset(oobbuf, 0xff, mtd.oob_size);
 		} else {
 			/* Read OOB data and exit on failure */
-			oob.start = ofs;
-			if (ioctl(fd, MEMREADOOB, &oob) != 0) {
-				perror("ioctl(MEMREADOOB)");
+			if (mtd_read_oob(mtd_desc, &mtd, fd, ofs, mtd.oob_size, oobbuf)) {
+				errmsg("libmtd: mtd_read_oob");
 				goto closeall;
 			}
 		}
 
 		/* Write out OOB data */
 		if (pretty_print) {
-			for (i = 0; i < meminfo.oobsize; i += 16) {
-				pretty_dump_to_buffer(oobbuf+i, meminfo.oobsize-i,
+			for (i = 0; i < mtd.oob_size; i += 16) {
+				pretty_dump_to_buffer(oobbuf + i, mtd.oob_size - i,
 						pretty_buf, PRETTY_BUF_LEN, false, canonical, 0);
 				write(ofd, pretty_buf, strlen(pretty_buf));
 			}
 		} else
-			write(ofd, oobbuf, meminfo.oobsize);
+			write(ofd, oobbuf, mtd.oob_size);
 	}
 
 	/* reset oobinfo */
diff --git a/nandwrite.c b/nandwrite.c
index fe03115..9eb63a4 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -108,7 +108,7 @@ static void display_version(void)
 
 static const char	*standard_input = "-";
 static const char	*mtd_device, *img;
-static int		mtdoffset = 0;
+static unsigned int	mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
 static bool		rawoob = false;
@@ -200,7 +200,7 @@ static void process_options(int argc, char * const argv[])
 				writeoob = true;
 				break;
 			case 's':
-				mtdoffset = strtol(optarg, NULL, 0);
+				mtdoffset = strtoul(optarg, NULL, 0);
 				break;
 			case 'b':
 				blockalign = atoi(optarg);
@@ -318,7 +318,6 @@ int main(int argc, char * const argv[])
 
 		// autoplace ECC ?
 		if (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE) {
-
 			if (ioctl(fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
 				perror("MEMSETOOBSEL");
 				close(fd);
@@ -480,7 +479,7 @@ int main(int argc, char * const argv[])
 			if (noskipbad)
 				continue;
 			do {
-				if ((ret = ioctl(fd, MEMGETBADBLOCK, &offs)) < 0) {
+				if ((ret = 0 /*ioctl(fd, MEMGETBADBLOCK, &offs)*/) < 0) {
 					perror("ioctl(MEMGETBADBLOCK)");
 					goto closeall;
 				}
-- 
1.7.0.4
