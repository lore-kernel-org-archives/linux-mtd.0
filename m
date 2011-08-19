Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSZ2-0003fN-Iy
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:09:01 +0000
Received: by mail-pz0-f41.google.com with SMTP id 4so7209431pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:09:00 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 04/10] nandwrite: remove C99 comment style
Date: Fri, 19 Aug 2011 10:07:50 -0700
Message-Id: <1313773676-12879-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
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
 nandwrite.c |   24 +++++++++++++-----------
 1 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 1700d61..f58bbfa 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -274,13 +274,13 @@ int main(int argc, char * const argv[])
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
 	bool failed = true;
-	// contains all the data read from the file so far for the current eraseblock
+	/* contains all the data read from the file so far for the current eraseblock */
 	unsigned char *filebuf = NULL;
 	size_t filebuf_max = 0;
 	size_t filebuf_len = 0;
-	// points to the current page inside filebuf
+	/* points to the current page inside filebuf */
 	unsigned char *writebuf = NULL;
-	// points to the OOB for the current page in filebuf
+	/* points to the OOB for the current page in filebuf */
 	unsigned char *oobreadbuf = NULL;
 	unsigned char *oobbuf = NULL;
 	libmtd_t mtd_desc;
@@ -429,14 +429,14 @@ int main(int argc, char * const argv[])
 	    lseek(ifd, 0, SEEK_SET);
 	}
 
-	// Check, if file is page-aligned
+	/* Check, if file is page-aligned */
 	if ((!pad) && ((imglen % pagelen) != 0)) {
 		fprintf(stderr, "Input file is not page-aligned. Use the padding "
 				 "option.\n");
 		goto closeall;
 	}
 
-	// Check, if length fits into device
+	/* Check, if length fits into device */
 	if (((imglen / pagelen) * mtd.min_io_size) > (mtd.size - mtdoffset)) {
 		fprintf(stderr, "Image %d bytes, NAND page %d bytes, OOB area %d"
 				" bytes, device size %lld bytes\n",
@@ -479,8 +479,10 @@ int main(int argc, char * const argv[])
 			blockstart = mtdoffset & (~ebsize_aligned + 1);
 			offs = blockstart;
 
-			// if writebuf == filebuf, we are rewinding so we must not
-			// reset the buffer but just replay it
+			/*
+			 * if writebuf == filebuf, we are rewinding so we must
+			 * not reset the buffer but just replay it
+			 */
 			if (writebuf != filebuf) {
 				erase_buffer(filebuf, filebuf_len);
 				filebuf_len = 0;
@@ -515,7 +517,7 @@ int main(int argc, char * const argv[])
 
 		}
 
-		// Read more data from the input if there isn't enough in the buffer
+		/* Read more data from the input if there isn't enough in the buffer */
 		if ((writebuf + mtd.min_io_size) > (filebuf + filebuf_len)) {
 			int readlen = mtd.min_io_size;
 
@@ -524,7 +526,7 @@ int main(int argc, char * const argv[])
 
 			while (tinycnt < readlen) {
 				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
-				if (cnt == 0) { // EOF
+				if (cnt == 0) { /* EOF */
 					break;
 				} else if (cnt < 0) {
 					perror("File I/O error on input");
@@ -570,7 +572,7 @@ int main(int argc, char * const argv[])
 		if (writeoob) {
 			oobreadbuf = writebuf + mtd.min_io_size;
 
-			// Read more data for the OOB from the input if there isn't enough in the buffer
+			/* Read more data for the OOB from the input if there isn't enough in the buffer */
 			if ((oobreadbuf + mtd.oob_size) > (filebuf + filebuf_len)) {
 				int readlen = mtd.oob_size;
 				int alreadyread = (filebuf + filebuf_len) - oobreadbuf;
@@ -578,7 +580,7 @@ int main(int argc, char * const argv[])
 
 				while (tinycnt < readlen) {
 					cnt = read(ifd, oobreadbuf + tinycnt, readlen - tinycnt);
-					if (cnt == 0) { // EOF
+					if (cnt == 0) { /* EOF */
 						break;
 					} else if (cnt < 0) {
 						perror("File I/O error on input");
-- 
1.7.6
