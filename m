Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEAMz-0006vz-Jl
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 23:04:48 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MEAMv-00053S-Bd
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 23:04:37 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 23:04:37 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 23:04:37 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: [PATCH 1/3] [MTD-UTILS] Unified reading from standard input and
	from file
Date: Tue, 09 Jun 2009 16:04:25 -0700
Message-ID: <h0mppp$7v2$1@ger.gmane.org>
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

Use same code path for reading data (not the OOB) from either the 
standard input or a regular file.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-06-08 13:33:32.000000000 -0700
+++ b/nandwrite.c	2009-06-09 13:15:17.000000000 -0700
@@ -260,7 +260,6 @@ int main(int argc, char * const argv[])
 	int ret, readlen;
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
-	int readcnt = 0;
 	bool failed = true;
 
 	process_options(argc, argv);
@@ -476,37 +475,18 @@ int main(int argc, char * const argv[])
 
 		}
 
-		readlen = meminfo.writesize;
 
-		if (ifd != STDIN_FILENO) {
-			int tinycnt = 0;
-
-			if (pad && (imglen < readlen))
-			{
-				readlen = imglen;
-				erase_buffer(writebuf + readlen, meminfo.writesize - readlen);
-			}
+		{
+			readlen = meminfo.writesize;
 
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
 			int tinycnt = 0;
 
-			while(tinycnt < readlen) {
+			while (tinycnt < readlen) {
 				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
 				if (cnt == 0) { // EOF
 					break;
 				} else if (cnt < 0) {
-					perror ("File I/O error on stdin");
+					perror ("File I/O error on input");
 					goto closeall;
 				}
 				tinycnt += cnt;
@@ -514,18 +494,30 @@ int main(int argc, char * const argv[])
 
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
-			}
 
 			/* Padding */
-			if (pad && (tinycnt < readlen)) {
-				erase_buffer(writebuf + tinycnt, meminfo.writesize - tinycnt);
+			if (tinycnt < readlen) {
+				if (!pad) {
+					fprintf(stderr, "Unexpected EOF. Expecting at least "
+							"%d more bytes. Use the padding option.\n",
+							readlen - tinycnt);
+					goto closeall;
+				}
+				erase_buffer(writebuf + tinycnt, readlen - tinycnt);
+			}
+
+			/* No more bytes - we are done after writing the remaining bytes */
+			if ((ifd == STDIN_FILENO) && (cnt == 0)) {
+				imglen = 0;
 			}
 		}
 
