Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaEKf-0004pz-33
 for linux-mtd@lists.infradead.org; Thu, 09 May 2013 00:03:38 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 208E833BE52
 for <linux-mtd@lists.infradead.org>; Thu,  9 May 2013 00:03:13 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH [mtd-utils] 2/3] nandwrite: clean up length types
Date: Wed,  8 May 2013 20:03:13 -0400
Message-Id: <1368057794-32735-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1368054125-32214-1-git-send-email-vapier@gentoo.org>
References: <1368054125-32214-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We use 'int' in many places to represent offsets/sizes.  That obviously
does not play well with larger NAND devices on 32bit systems.  Instead,
use the right type as needed:
 - long long to represent the length of the image
 - use fstat() rather than lseek();lseek(); to get the length of the image
 - use size_t/ssize_t when working with read()
 - tweak the printf formats as needed

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 nandwrite.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index edf9f83..14414b6 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -218,10 +218,10 @@ static void erase_buffer(void *buffer, size_t size)
  */
 int main(int argc, char * const argv[])
 {
-	int cnt = 0;
 	int fd = -1;
 	int ifd = -1;
-	int imglen = 0, pagelen;
+	int pagelen;
+	long long imglen = 0;
 	bool baderaseblock = false;
 	long long blockstart = -1;
 	struct mtd_dev_info mtd;
@@ -313,8 +313,12 @@ int main(int argc, char * const argv[])
 	if (ifd == STDIN_FILENO) {
 	    imglen = pagelen;
 	} else {
-	    imglen = lseek(ifd, 0, SEEK_END);
-	    lseek(ifd, 0, SEEK_SET);
+		struct stat st;
+		if (fstat(ifd, &st)) {
+			sys_errmsg("unable to stat input image");
+			goto closeall;
+		}
+	    imglen = st.st_size;
 	}
 
 	/* Check, if file is page-aligned */
@@ -326,7 +330,7 @@ int main(int argc, char * const argv[])
 
 	/* Check, if length fits into device */
 	if ((imglen / pagelen) * mtd.min_io_size > mtd.size - mtdoffset) {
-		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %d"
+		fprintf(stderr, "Image %lld bytes, NAND page %d bytes, OOB area %d"
 				" bytes, device size %lld bytes\n",
 				imglen, pagelen, mtd.oob_size, mtd.size);
 		sys_errmsg("Input file does not fit into device");
@@ -412,9 +416,10 @@ int main(int argc, char * const argv[])
 
 		/* Read more data from the input if there isn't enough in the buffer */
 		if (writebuf + mtd.min_io_size > filebuf + filebuf_len) {
-			int readlen = mtd.min_io_size;
-			int alreadyread = (filebuf + filebuf_len) - writebuf;
-			int tinycnt = alreadyread;
+			size_t readlen = mtd.min_io_size;
+			size_t alreadyread = (filebuf + filebuf_len) - writebuf;
+			size_t tinycnt = alreadyread;
+			ssize_t cnt = 0;
 
 			while (tinycnt < readlen) {
 				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
@@ -444,7 +449,7 @@ int main(int argc, char * const argv[])
 			if (tinycnt < readlen) {
 				if (!pad) {
 					fprintf(stderr, "Unexpected EOF. Expecting at least "
-							"%d more bytes. Use the padding option.\n",
+							"%zu more bytes. Use the padding option.\n",
 							readlen - tinycnt);
 					goto closeall;
 				}
@@ -465,9 +470,10 @@ int main(int argc, char * const argv[])
 
 			/* Read more data for the OOB from the input if there isn't enough in the buffer */
 			if (oobbuf + mtd.oob_size > filebuf + filebuf_len) {
-				int readlen = mtd.oob_size;
-				int alreadyread = (filebuf + filebuf_len) - oobbuf;
-				int tinycnt = alreadyread;
+				size_t readlen = mtd.oob_size;
+				size_t alreadyread = (filebuf + filebuf_len) - oobbuf;
+				size_t tinycnt = alreadyread;
+				ssize_t cnt;
 
 				while (tinycnt < readlen) {
 					cnt = read(ifd, oobbuf + tinycnt, readlen - tinycnt);
@@ -482,7 +488,7 @@ int main(int argc, char * const argv[])
 
 				if (tinycnt < readlen) {
 					fprintf(stderr, "Unexpected EOF. Expecting at least "
-							"%d more bytes for OOB\n", readlen - tinycnt);
+							"%zu more bytes for OOB\n", readlen - tinycnt);
 					goto closeall;
 				}
 
@@ -505,7 +511,7 @@ int main(int argc, char * const argv[])
 				writeoob ? mtd.oob_size : 0,
 				write_mode);
 		if (ret) {
-			int i;
+			long long i;
 			if (errno != EIO) {
 				sys_errmsg("%s: MTD write failure", mtd_device);
 				goto closeall;
@@ -520,9 +526,8 @@ int main(int argc, char * const argv[])
 				if (mtd_erase(mtd_desc, &mtd, fd, i / mtd.eb_size)) {
 					int errno_tmp = errno;
 					sys_errmsg("%s: MTD Erase failure", mtd_device);
-					if (errno_tmp != EIO) {
+					if (errno_tmp != EIO)
 						goto closeall;
-					}
 				}
 			}
 
-- 
1.8.2.1
