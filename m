Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDnP6-0008VZ-Sm
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 22:33:27 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDnOr-00062S-QV
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 22:33:05 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 22:33:05 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 22:33:05 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: [PATCH] [MTD-UTILS] Bad block handling in nandwrite when reading
	from standard input
Date: Mon, 08 Jun 2009 15:32:53 -0700
Message-ID: <h0k3il$ij6$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nandwrite tries to use lseek() when failing to write on a page. lseek() will fail when used on the standard input so nandwrite fails. This code replaces lseek with a buffer.

When the data is read, it is put in a buffer (filebuf). This buffer is reset at each block boundary. So a "seek" just means reading from the beginning of the buffer. writebuf and oobreadbuf are now just pointers to locations in filebuf.

With this change, reading from stdin or from a file now uses the same code path.


Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-06-08 13:33:32.000000000 -0700
+++ b/nandwrite.c	2009-06-08 14:46:59.000000000 -0700
@@ -45,13 +45,6 @@
 #define MAX_PAGE_SIZE	4096
 #define MAX_OOB_SIZE	128
 
-/*
- * Buffer array used for writing data
- */
-static unsigned char writebuf[MAX_PAGE_SIZE];
-static unsigned char oobbuf[MAX_OOB_SIZE];
-static unsigned char oobreadbuf[MAX_OOB_SIZE];
-
 // oob layouts to pass into the kernel as default
 static struct nand_oobinfo none_oobinfo = {
 	.useecc = MTD_NANDECC_OFF,
@@ -260,8 +253,16 @@ int main(int argc, char * const argv[])
 	int ret, readlen;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
-	int readcnt = 0;
 	bool failed = true;
+	// contains all the data read from the file so far for the current eraseblock
+	unsigned char *filebuf = NULL;
+	size_t filebuf_max = 0;
+	size_t filebuf_len = 0; 
+	// points to the current page inside filebuf
+	unsigned char *writebuf = NULL;
+	// points to the OOB for the current page in filebuf
+	unsigned char *oobreadbuf = NULL;
+	unsigned char oobbuf[MAX_OOB_SIZE];
 
 	process_options(argc, argv);
 
@@ -432,6 +433,16 @@ int main(int argc, char * const argv[])
 		goto closeall;
 	}
 
+	// Allocate a buffer big enough to contain all the data (OOB included) for one eraseblock
+	filebuf_max = pagelen * meminfo.erasesize / meminfo.writesize;
+	filebuf = (unsigned char*)malloc(filebuf_max);
+	if (!filebuf) {
+		fprintf(stderr, "Failed to allocate memory for file buffer (%d bytes)\n",
+				pagelen * meminfo.erasesize / meminfo.writesize);
+		goto closeall;
+	}
+	erase_buffer(filebuf, filebuf_max);
+
 	/*
 	 * Get data from input and write to the device while there is
 	 * still input to read and we are still within the device
@@ -439,7 +450,9 @@ int main(int argc, char * const argv[])
 	 * length is simply a quasi-boolean flag whose values are page
 	 * length or zero.
 	 */
-	while (imglen && (mtdoffset < meminfo.size)) {
+	while (((imglen > 0) || (writebuf < (filebuf + filebuf_len)))
+		&& (mtdoffset < meminfo.size))
+	{
 		// new eraseblock , check for bad block(s)
 		// Stay in the loop to be sure if the mtdoffset changes because
 		// of a bad block, that the next block that will be written to
@@ -449,6 +462,15 @@ int main(int argc, char * const argv[])
 		while (blockstart != (mtdoffset & (~meminfo.erasesize + 1))) {
 			blockstart = mtdoffset & (~meminfo.erasesize + 1);
 			offs = blockstart;
+
+			// if writebuf == filebuf, we are rewinding so we must not
+			// reset it but just replay it
+			if (writebuf != filebuf) {
+				erase_buffer(filebuf, filebuf_len);
+				filebuf_len = 0;
+				writebuf = filebuf;
+			}
+
 			baderaseblock = false;
 			if (!quiet)
 				fprintf (stdout, "Writing data to block %d at offset 0x%x\n",
@@ -476,71 +498,91 @@ int main(int argc, char * const argv[])
 
 		}
 
-		readlen = meminfo.writesize;
-
-		if (ifd != STDIN_FILENO) {
-			int tinycnt = 0;
-
-			if (pad && (imglen < readlen))
-			{
-				readlen = imglen;
-				erase_buffer(writebuf + readlen, meminfo.writesize - readlen);
-			}
-
-			/* Read Page Data from input file */
-			while(tinycnt < readlen) {
-				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
-				if (cnt == 0) { // EOF
-					break;
-				} else if (cnt < 0) {
-					perror ("File I/O error on input file");
-					goto closeall;
-				}
-				tinycnt += cnt;
-			}
-		} else {
-			int tinycnt = 0;
-
+		// Read more data from the input if there isn't enough in the buffer
+		if ((writebuf + meminfo.writesize) > (filebuf + filebuf_len)) {
+			readlen = meminfo.writesize;
+
+			int alreadyread = (filebuf + filebuf_len) - writebuf;
+			int tinycnt = alreadyread;
+			
 			while(tinycnt < readlen) {
 				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
 				if (cnt == 0) { // EOF
 					break;
 				} else if (cnt < 0) {
-					perror ("File I/O error on stdin");
+					perror ("File I/O error on input");
 					goto closeall;
 				}
 				tinycnt += cnt;
 			}
-
+			
 			/* No padding needed - we are done */
 			if (tinycnt == 0) {
-				imglen = 0;
+				// For standard input, set the imglen to 0 to signal
+				// the end of the "file". For non standard input, leave
+				// it as-is to detect an early EOF
+				if (ifd == STDIN_FILENO) {
+					imglen = 0;
+				}
 				break;
 			}
-
-			/* No more bytes - we are done after writing the remaining bytes */
-			if (cnt == 0) {
-				imglen = 0;
-			}
-
+			
 			/* Padding */
-			if (pad && (tinycnt < readlen)) {
+			if (tinycnt < readlen) {
+				if (!pad) {
+					fprintf(stderr, "Unexpected EOF. Expecting at least "
+							"%d more bytes. Use the padding option.\n",
+							readlen - tinycnt);
+					goto closeall;
+				}
 				erase_buffer(writebuf + tinycnt, meminfo.writesize - tinycnt);
 			}
+
+			filebuf_len += readlen - alreadyread;
+			if (ifd != STDIN_FILENO) {
+				imglen -= tinycnt - alreadyread;
+			}
+			else if (cnt == 0) {
+				/* No more bytes - we are done after writing the remaining bytes */
+				imglen = 0;
+			}
 		}
 
 		if (writeoob) {
-			int tinycnt = 0;
+			oobreadbuf = writebuf + meminfo.writesize;
 
-			while(tinycnt < meminfo.oobsize) {
-				cnt = read(ifd, oobreadbuf + tinycnt, meminfo.oobsize - tinycnt);
-				if (cnt == 0) { // EOF
-					break;
-				} else if (cnt < 0) {
-					perror ("File I/O error on input file");
+			// Read more data for the OOB from the input if there isn't enough in the buffer
+			if ((oobreadbuf + meminfo.oobsize) > (filebuf + filebuf_len)) {
+				readlen = meminfo.oobsize;
+
+				int alreadyread = (filebuf + filebuf_len) - oobreadbuf;
+				int tinycnt = alreadyread;
+
+				while(tinycnt < readlen) {
+					cnt = read(ifd, oobreadbuf + tinycnt, readlen - tinycnt);
+					if (cnt == 0) { // EOF
+						break;
+					} else if (cnt < 0) {
+						perror ("File I/O error on input");
+						goto closeall;
+					}
+					tinycnt += cnt;
+				}
+
+				if (tinycnt < readlen) {
+					fprintf(stderr, "Unexpected EOF. Expecting at least "
+							"%d more bytes for OOB\n", readlen - tinycnt);
 					goto closeall;
 				}
-				tinycnt += cnt;
+
+				filebuf_len += readlen - alreadyread;
+				if (ifd != STDIN_FILENO) {
+					imglen -= tinycnt - alreadyread;
+				}
+				else if (cnt == 0) {
+					/* No more bytes - we are done after writing the remaining bytes */
+					imglen = 0;
+				}
 			}
 
 			if (!noecc) {
@@ -570,19 +612,20 @@ int main(int argc, char * const argv[])
 							len);
 				}
 			}
+			else {
+				oob.ptr = oobreadbuf;				
+			}
+
 			/* Write OOB data first, as ecc will be placed in there*/
 			oob.start = mtdoffset;
 			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
 				perror ("ioctl(MEMWRITEOOB)");
 				goto closeall;
 			}
-			imglen -= meminfo.oobsize;
 		}
 
 		/* Write out the Page data */
 		if (pwrite(fd, writebuf, meminfo.writesize, mtdoffset) != meminfo.writesize) {
-			int rewind_blocks;
-			off_t rewind_bytes;
 			erase_info_t erase;
 
 			perror ("pwrite");
@@ -591,15 +634,8 @@ int main(int argc, char * const argv[])
 			}
 
 			/* Must rewind to blockstart if we can */
-			rewind_blocks = (mtdoffset - blockstart) / meminfo.writesize; /* Not including the one we just attempted */
-			rewind_bytes = (rewind_blocks * meminfo.writesize) + readlen;
-			if (writeoob)
-				rewind_bytes += (rewind_blocks + 1) * meminfo.oobsize;
-			if (lseek(ifd, -rewind_bytes, SEEK_CUR) == -1) {
-				perror("lseek");
-				fprintf(stderr, "Failed to seek backwards to recover from write error\n");
-				goto closeall;
-			}
+			writebuf = filebuf;
+
 			erase.start = blockstart;
 			erase.length = meminfo.erasesize;
 			fprintf(stderr, "Erasing failed write from %08lx-%08lx\n",
@@ -620,19 +656,20 @@ int main(int argc, char * const argv[])
 				}
 			}
 			mtdoffset = blockstart + meminfo.erasesize;
-			imglen += rewind_blocks * meminfo.writesize;
 
 			continue;
 		}
-		if (ifd != STDIN_FILENO) {
-			imglen -= readlen;
-		}
 		mtdoffset += meminfo.writesize;
+		writebuf += pagelen;
 	}
 
 	failed = false;
 
 closeall:
+	if (filebuf) {
+		free(filebuf);
+	}
+
 	close(ifd);
 
 restoreoob:
@@ -646,7 +683,10 @@ restoreoob:
 
 	close(fd);
 
-	if (failed || ((ifd != STDIN_FILENO) && (imglen > 0))) {
+	if (failed
+		|| ((ifd != STDIN_FILENO) && (imglen > 0))
+		|| (writebuf < (filebuf + filebuf_len)))
+	{
 		perror ("Data was only partially written due to error\n");
 		exit (EXIT_FAILURE);
 	}
