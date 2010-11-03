Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYjt-0007lL-6g
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:39 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/10] mtd-utils: nandwrite: Use libmtd to get correct
	mtd parameters
Date: Wed, 3 Nov 2010 01:27:22 -0700
Message-ID: <1288772847-8120-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, Jehan Bing <jehan@orb.com>,
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

Begin utilizing libmtd for MTD operations: use mtd_get_dev_info() to return
a more detailed set of information about our MTD. Most importantly, libmtd
will yield a 64-bit "size" parameter. This is necessary to properly detect
devices larer than 4GB.

printf() arguments needed reformatted for the new mtd_dev_info data types.
In addition, the printf() was restructured to keep lines shorter.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   60 +++++++++++++++++++++++++++++++---------------------------
 1 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index a3ac968..d05d257 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -42,6 +42,7 @@
 #include <asm/types.h>
 #include "mtd/mtd-user.h"
 #include "common.h"
+#include <libmtd.h>
 
 // oob layouts to pass into the kernel as default
 static struct nand_oobinfo none_oobinfo = {
@@ -259,7 +260,7 @@ int main(int argc, char * const argv[])
 	int imglen = 0, pagelen;
 	bool baderaseblock = false;
 	int blockstart = -1;
-	struct mtd_info_user meminfo;
+	struct mtd_dev_info mtd;
 	struct mtd_oob_buf oob;
 	loff_t offs;
 	int ret;
@@ -275,6 +276,7 @@ int main(int argc, char * const argv[])
 	// points to the OOB for the current page in filebuf
 	unsigned char *oobreadbuf = NULL;
 	unsigned char *oobbuf = NULL;
+	libmtd_t mtd_desc;
 	int ebsize_aligned;
 
 	process_options(argc, argv);
@@ -290,24 +292,24 @@ int main(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	mtd_desc = libmtd_open();
+	if (!mtd_desc)
+		return errmsg("can't initialize libmtd");
 	/* Fill in MTD device capability structure */
-	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
-		perror("MEMGETINFO");
-		close(fd);
-		exit(EXIT_FAILURE);
-	}
+	if (mtd_get_dev_info(mtd_desc, mtd_device, &mtd) < 0)
+		return errmsg("mtd_get_dev_info failed");
 
 	/*
 	 * Pretend erasesize is specified number of blocks - to match jffs2
 	 *   (virtual) block size
 	 * Use this value throughout unless otherwise necessary
 	 */
-	ebsize_aligned = meminfo.erasesize * blockalign;
+	ebsize_aligned = mtd.eb_size * blockalign;
 
-	if (mtdoffset & (meminfo.writesize - 1)) {
+	if (mtdoffset & (mtd.min_io_size - 1)) {
 		fprintf(stderr, "The start address is not page-aligned !\n"
 				"The pagesize of this NAND Flash is 0x%x.\n",
-				meminfo.writesize);
+				mtd.min_io_size);
 		close(fd);
 		exit(EXIT_FAILURE);
 	}
@@ -373,7 +375,7 @@ int main(int argc, char * const argv[])
 			fprintf(stderr, "Use -f option to enforce legacy placement on autoplacement enabled mtd device\n");
 			goto restoreoob;
 		}
-		if (meminfo.oobsize == 8) {
+		if (mtd.oob_size == 8) {
 			if (forceyaffs) {
 				fprintf(stderr, "YAFSS cannot operate on 256 Byte page size");
 				goto restoreoob;
@@ -388,7 +390,7 @@ int main(int argc, char * const argv[])
 		}
 	}
 
-	oob.length = meminfo.oobsize;
+	oob.length = mtd.oob_size;
 	oob.ptr = noecc ? oobreadbuf : oobbuf;
 
 	/* Determine if we are reading from standard input or from a file. */
@@ -403,7 +405,7 @@ int main(int argc, char * const argv[])
 		goto restoreoob;
 	}
 
-	pagelen = meminfo.writesize + ((writeoob) ? meminfo.oobsize : 0);
+	pagelen = mtd.min_io_size + ((writeoob) ? mtd.oob_size : 0);
 
 	/*
 	 * For the standard input case, the input size is merely an
@@ -431,20 +433,21 @@ int main(int argc, char * const argv[])
 	}
 
 	// Check, if length fits into device
-	if (((imglen / pagelen) * meminfo.writesize) > (meminfo.size - mtdoffset)) {
-		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %u bytes, device size %u bytes\n",
-				imglen, pagelen, meminfo.oobsize, meminfo.size);
+	if (((imglen / pagelen) * mtd.min_io_size) > (mtd.size - mtdoffset)) {
+		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %d"
+				" bytes, device size %lld bytes\n",
+				imglen, pagelen, mtd.oob_size, mtd.size);
 		perror("Input file does not fit into device");
 		goto closeall;
 	}
 
 	// Allocate a buffer big enough to contain all the data (OOB included) for one eraseblock
-	filebuf_max = pagelen * ebsize_aligned / meminfo.writesize;
+	filebuf_max = pagelen * ebsize_aligned / mtd.min_io_size;
 	filebuf = xmalloc(filebuf_max);
 	erase_buffer(filebuf, filebuf_max);
 
-	oobbuf = xmalloc(meminfo.oobsize);
-	erase_buffer(oobbuf, meminfo.oobsize);
+	oobbuf = xmalloc(mtd.oob_size);
+	erase_buffer(oobbuf, mtd.oob_size);
 
 	/*
 	 * Get data from input and write to the device while there is
@@ -454,7 +457,7 @@ int main(int argc, char * const argv[])
 	 * length or zero.
 	 */
 	while (((imglen > 0) || (writebuf < (filebuf + filebuf_len)))
-		&& (mtdoffset < meminfo.size)) {
+		&& (mtdoffset < mtd.size)) {
 		/*
 		 * New eraseblock, check for bad block(s)
 		 * Stay in the loop to be sure that, if mtdoffset changes because
@@ -504,8 +507,8 @@ int main(int argc, char * const argv[])
 		}
 
 		// Read more data from the input if there isn't enough in the buffer
-		if ((writebuf + meminfo.writesize) > (filebuf + filebuf_len)) {
-			int readlen = meminfo.writesize;
+		if ((writebuf + mtd.min_io_size) > (filebuf + filebuf_len)) {
+			int readlen = mtd.min_io_size;
 
 			int alreadyread = (filebuf + filebuf_len) - writebuf;
 			int tinycnt = alreadyread;
@@ -556,11 +559,11 @@ int main(int argc, char * const argv[])
 		}
 
 		if (writeoob) {
-			oobreadbuf = writebuf + meminfo.writesize;
+			oobreadbuf = writebuf + mtd.min_io_size;
 
 			// Read more data for the OOB from the input if there isn't enough in the buffer
-			if ((oobreadbuf + meminfo.oobsize) > (filebuf + filebuf_len)) {
-				int readlen = meminfo.oobsize;
+			if ((oobreadbuf + mtd.oob_size) > (filebuf + filebuf_len)) {
+				int readlen = mtd.oob_size;
 				int alreadyread = (filebuf + filebuf_len) - oobreadbuf;
 				int tinycnt = alreadyread;
 
@@ -619,7 +622,7 @@ int main(int argc, char * const argv[])
 				} else {
 					/* Set at least the ecc byte positions to 0xff */
 					start = old_oobinfo.eccbytes;
-					len = meminfo.oobsize - start;
+					len = mtd.oob_size - start;
 					memcpy(oobbuf + start,
 							oobreadbuf + start,
 							len);
@@ -634,7 +637,7 @@ int main(int argc, char * const argv[])
 		}
 
 		/* Write out the Page data */
-		if (pwrite(fd, writebuf, meminfo.writesize, mtdoffset) != meminfo.writesize) {
+		if (pwrite(fd, writebuf, mtd.min_io_size, mtdoffset) != mtd.min_io_size) {
 			erase_info_t erase;
 
 			if (errno != EIO) {
@@ -658,7 +661,7 @@ int main(int argc, char * const argv[])
 			}
 
 			if (markbad) {
-				loff_t bad_addr = mtdoffset & (~meminfo.erasesize + 1);
+				loff_t bad_addr = mtdoffset & (~mtd.eb_size + 1);
 				fprintf(stderr, "Marking block at %08lx bad\n", (long)bad_addr);
 				if (ioctl(fd, MEMSETBADBLOCK, &bad_addr)) {
 					perror("MEMSETBADBLOCK");
@@ -669,7 +672,7 @@ int main(int argc, char * const argv[])
 
 			continue;
 		}
-		mtdoffset += meminfo.writesize;
+		mtdoffset += mtd.min_io_size;
 		writebuf += pagelen;
 	}
 
@@ -679,6 +682,7 @@ closeall:
 	close(ifd);
 
 restoreoob:
+	libmtd_close(mtd_desc);
 	free(filebuf);
 	free(oobbuf);
 
-- 
1.7.0.4
