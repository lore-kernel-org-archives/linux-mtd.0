Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGQsn-0004z4-S7
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2010 06:43:42 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 09/10] mtd-utils: nandwrite: full 64-bit support w/ libmtd
Date: Wed, 10 Nov 2010 22:39:13 -0800
Message-ID: <1289457554-24155-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>
References: <AANLkTimUr8Dvmz7=Owk9dEgWt7hdTFFT+NDXczWd9DfV@mail.gmail.com>
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

Several ioctls are replaced with libmtd calls which should give us 64-bit
support for large devices. libmtd mostly provides drop-in replacements
for the functionality we need. However, when we require erasure of a
badly-written block, mtd_erase() only erases a single block, whereas
MEMERASE could erase a larger region. In nandwrite, we may have a "virtual
blocksize" of more than one (when blockalign > 1). Thus, I added a loop
for this case.

The mtd_oob_buf struct is no longer needed, nor is "erase_info_t".

Error messages for the new libmtd calls reflect the style found in
flash_erase.

Tested with nandsim and with NAND chips up to 4GB in size (I don't have
a device that truly requires 64-bit addressing yet).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |   49 +++++++++++++++++++++++--------------------------
 1 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index aea7572..00e7c28 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -261,7 +261,6 @@ int main(int argc, char * const argv[])
 	bool baderaseblock = false;
 	long long blockstart = -1;
 	struct mtd_dev_info mtd;
-	struct mtd_oob_buf oob;
 	loff_t offs;
 	int ret;
 	int oobinfochanged = 0;
@@ -390,8 +389,6 @@ int main(int argc, char * const argv[])
 		}
 	}
 
-	oob.length = mtd.oob_size;
-
 	/* Determine if we are reading from standard input or from a file. */
 	if (strcmp(img, standard_input) == 0) {
 		ifd = STDIN_FILENO;
@@ -491,8 +488,8 @@ int main(int argc, char * const argv[])
 			if (noskipbad)
 				continue;
 			do {
-				if ((ret = ioctl(fd, MEMGETBADBLOCK, &offs)) < 0) {
-					perror("ioctl(MEMGETBADBLOCK)");
+				if ((ret = mtd_is_bad(&mtd, fd, offs / ebsize_aligned)) < 0) {
+					sys_errmsg("%s: MTD get bad block failed", mtd_device);
 					goto closeall;
 				} else if (ret == 1) {
 					baderaseblock = true;
@@ -631,43 +628,43 @@ int main(int argc, char * const argv[])
 				}
 			}
 			/* Write OOB data first, as ecc will be placed in there */
-			oob.start = mtdoffset;
-			oob.ptr = noecc ? oobreadbuf : oobbuf;
-			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
-				perror("ioctl(MEMWRITEOOB)");
+			if (mtd_write_oob(mtd_desc, &mtd, fd, mtdoffset,
+						mtd.oob_size,
+						noecc ? oobreadbuf : oobbuf)) {
+				sys_errmsg("%s: MTD writeoob failure", mtd_device);
 				goto closeall;
 			}
 		}
 
 		/* Write out the Page data */
-		if (pwrite(fd, writebuf, mtd.min_io_size, mtdoffset) != mtd.min_io_size) {
-			erase_info_t erase;
-
+		if (mtd_write(&mtd, fd, mtdoffset / mtd.eb_size, mtdoffset % mtd.eb_size,
+					writebuf, mtd.min_io_size)) {
+			int i;
 			if (errno != EIO) {
-				perror("pwrite");
+				sys_errmsg("%s: MTD write failure", mtd_device);
 				goto closeall;
 			}
 
 			/* Must rewind to blockstart if we can */
 			writebuf = filebuf;
 
-			erase.start = blockstart;
-			erase.length = ebsize_aligned;
-			fprintf(stderr, "Erasing failed write from %08lx-%08lx\n",
-				(long)erase.start, (long)erase.start+erase.length-1);
-			if (ioctl(fd, MEMERASE, &erase) != 0) {
-				int errno_tmp = errno;
-				perror("MEMERASE");
-				if (errno_tmp != EIO) {
-					goto closeall;
+			fprintf(stderr, "Erasing failed write from %#08llx to %#08llx\n",
+				blockstart, blockstart + ebsize_aligned - 1);
+			for (i = blockstart; i < blockstart + ebsize_aligned; i += mtd.eb_size) {
+				if (mtd_erase(mtd_desc, &mtd, fd, mtd.eb_size)) {
+					int errno_tmp = errno;
+					sys_errmsg("%s: MTD Erase failure", mtd_device);
+					if (errno_tmp != EIO) {
+						goto closeall;
+					}
 				}
 			}
 
 			if (markbad) {
-				loff_t bad_addr = mtdoffset & (~mtd.eb_size + 1);
-				fprintf(stderr, "Marking block at %08lx bad\n", (long)bad_addr);
-				if (ioctl(fd, MEMSETBADBLOCK, &bad_addr)) {
-					perror("MEMSETBADBLOCK");
+				fprintf(stderr, "Marking block at %08llx bad\n",
+						mtdoffset & (~mtd.eb_size + 1));
+				if (mtd_mark_bad(&mtd, fd, mtdoffset / mtd.eb_size)) {
+					sys_errmsg("%s: MTD Mark bad block failure", mtd_device);
 					goto closeall;
 				}
 			}
-- 
1.7.0.4
