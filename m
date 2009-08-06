Received: from exhub015-4.exch015.msoutlookonline.net ([207.5.72.96])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MYr1v-00045a-2h
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 00:40:31 +0000
Message-ID: <4A7A2678.6030303@orb.com>
Date: Wed, 5 Aug 2009 17:40:24 -0700
From: Jehan Bing <jehan@orb.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5 v3] [MTD-UTILS] Unified reading from standard input and
	from file
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use same code path for reading data (not the OOB) from either the 
standard input or a regular file.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-06-08 13:33:32.000000000 -0700
+++ b/nandwrite.c	2009-06-09 13:20:56.000000000 -0700
@@ -260,7 +260,6 @@ int main(int argc, char * const argv[])
 	int ret, readlen;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
-	int readcnt = 0;
 	bool failed = true;
 
 	process_options(argc, argv);
@@ -476,37 +475,17 @@ int main(int argc, char * const argv[])
 
 		}
 
-		readlen = meminfo.writesize;
+		{
+			readlen = meminfo.writesize;
 
-		if (ifd != STDIN_FILENO) {
 			int tinycnt = 0;
 
-			if (pad && (imglen < readlen))
-			{
-				readlen = imglen;
-				erase_buffer(writebuf + readlen, meminfo.writesize - readlen);
-			}
-
-			/* Read Page Data from input file */
-			while(tinycnt < readlen) {
+			while (tinycnt < readlen) {
 				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
 				if (cnt == 0) { // EOF
 					break;
 				} else if (cnt < 0) {
-					perror ("File I/O error on input file");
-					goto closeall;
-				}
-				tinycnt += cnt;
-			}
-		} else {
-			int tinycnt = 0;
-
-			while(tinycnt < readlen) {
-				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
-				if (cnt == 0) { // EOF
-					break;
-				} else if (cnt < 0) {
-					perror ("File I/O error on stdin");
+					perror ("File I/O error on input");
 					goto closeall;
 				}
 				tinycnt += cnt;
@@ -514,18 +493,29 @@ int main(int argc, char * const argv[])
 
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
 
-			/* No more bytes - we are done after writing the remaining bytes */
-			if (cnt == 0) {
-				imglen = 0;
+			/* Padding */
+			if (tinycnt < readlen) {
+				if (!pad) {
+					fprintf(stderr, "Unexpected EOF. Expecting at least "
+							"%d more bytes. Use the padding option.\n",
+							readlen - tinycnt);
+					goto closeall;
+				}
+				erase_buffer(writebuf + tinycnt, readlen - tinycnt);
 			}
 
-			/* Padding */
-			if (pad && (tinycnt < readlen)) {
-				erase_buffer(writebuf + tinycnt, meminfo.writesize - tinycnt);
+			if ((ifd == STDIN_FILENO) && (cnt == 0)) {
+				/* No more bytes - we are done after writing the remaining bytes */
+				imglen = 0;
 			}
 		}
 
