Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEAbI-0001YV-GM
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 23:19:35 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MEAbE-0005Yu-SP
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 23:19:24 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 23:19:24 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 23:19:24 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: [PATCH 3/3] [MTD-UTILS] Handle bad block when reading from
	standard input
Date: Tue, 09 Jun 2009 16:19:12 -0700
Message-ID: <h0mqlg$ab3$1@ger.gmane.org>
References: <h0k3il$ij6$1@ger.gmane.org>	<1244551983.5847.388.camel@localhost.localdomain>
	<4A2E98BD.30704@orb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <4A2E98BD.30704@orb.com>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's still a fairly big patch but I don't see how I can cut more and 
keep a compilable tree. I can make "sub-patch" (init+free, buffer reset, 
buffer filling, bad block handling) if it's okay that they break the 
compilation.


Nandwrite tries to use lseek() when failing to write on a page. lseek() 
will fail when used on the standard input so nandwrite fails. This code 
replaces lseek with a buffer.

When the data is read, it is put in a buffer (filebuf). This buffer is 
reset at each block boundary. So a "seek" just means reading from the 
beginning of the buffer. writebuf and oobreadbuf are now just pointers 
to locations in filebuf.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-06-09 13:20:44.000000000 -0700
+++ b/nandwrite.c	2009-06-09 15:41:39.000000000 -0700
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
@@ -257,10 +250,19 @@ int main(int argc, char * const argv[])
 	struct mtd_info_user meminfo;
 	struct mtd_oob_buf oob;
 	loff_t offs;
-	int ret, readlen;
+	int ret;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
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
 
@@ -431,6 +433,16 @@ int main(int argc, char * const argv[])
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
@@ -438,7 +450,9 @@ int main(int argc, char * const argv[])
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
@@ -448,6 +462,15 @@ int main(int argc, char * const argv[])
 		while (blockstart != (mtdoffset & (~meminfo.erasesize + 1))) {
 			blockstart = mtdoffset & (~meminfo.erasesize + 1);
 			offs = blockstart;
+
+			// if writebuf == filebuf, we are rewinding so we must not
+			// reset the buffer but just replay it
+			if (writebuf != filebuf) {
+				erase_buffer(filebuf, filebuf_len);
+				filebuf_len = 0;
+				writebuf = filebuf;
+			}
+
 			baderaseblock = false;
 			if (!quiet)
 				fprintf (stdout, "Writing data to block %d at offset 0x%x\n",
@@ -475,10 +498,12 @@ int main(int argc, char * const argv[])
 
 		}
 
-		{
-			readlen = meminfo.writesize;
+		// Read more data from the input if there isn't enough in the buffer
+		if ((writebuf + meminfo.writesize) > (filebuf + filebuf_len)) {
+			int readlen = meminfo.writesize;
 
-			int tinycnt = 0;
+			int alreadyread = (filebuf + filebuf_len) - writebuf;
+			int tinycnt = alreadyread;
 
 			while (tinycnt < readlen) {
 				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
@@ -513,17 +538,25 @@ int main(int argc, char * const argv[])
 				erase_buffer(writebuf + tinycnt, readlen - tinycnt);
 			}
 
-			if ((ifd == STDIN_FILENO) && (cnt == 0)) {
+			filebuf_len += readlen - alreadyread;
+			if (ifd != STDIN_FILENO) {
+				imglen -= tinycnt - alreadyread;
+			}
+			else if (cnt == 0) {
 				/* No more bytes - we are done after writing the remaining bytes */
 				imglen = 0;
 			}
 		}
 
 		if (writeoob) {
-			{
+			oobreadbuf = writebuf + meminfo.writesize;
+
+			// Read more data for the OOB from the input if there isn't enough in the buffer
+			if ((oobreadbuf + meminfo.oobsize) > (filebuf + filebuf_len)) {
 				int readlen = meminfo.oobsize;
 
-				int tinycnt = 0;
+				int alreadyread = (filebuf + filebuf_len) - oobreadbuf;
+				int tinycnt = alreadyread;
 
 				while (tinycnt < readlen) {
 					cnt = read(ifd, oobreadbuf + tinycnt, readlen - tinycnt);
@@ -542,13 +575,19 @@ int main(int argc, char * const argv[])
 					goto closeall;
 				}
 
-				if ((ifd == STDIN_FILENO) && (cnt == 0)) {
+				filebuf_len += readlen - alreadyread;
+				if (ifd != STDIN_FILENO) {
+					imglen -= tinycnt - alreadyread;
+				}
+				else if (cnt == 0) {
 					/* No more bytes - we are done after writing the remaining bytes */
 					imglen = 0;
 				}
 			}
 
-			if (!noecc) {
+			if (noecc) {
+				oob.ptr = oobreadbuf;
+			} else {
 				int i, start, len;
 				/*
 				 *  We use autoplacement and have the oobinfo with the autoplacement
@@ -581,13 +620,10 @@ int main(int argc, char * const argv[])
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
@@ -596,15 +632,8 @@ int main(int argc, char * const argv[])
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
@@ -625,19 +654,20 @@ int main(int argc, char * const argv[])
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
@@ -651,7 +681,10 @@ restoreoob:
 
 	close(fd);
 
-	if (failed || ((ifd != STDIN_FILENO) && (imglen > 0))) {
+	if (failed
+		|| ((ifd != STDIN_FILENO) && (imglen > 0))
+		|| (writebuf < (filebuf + filebuf_len)))
+	{
 		perror ("Data was only partially written due to error\n");
 		exit (EXIT_FAILURE);
 	}
