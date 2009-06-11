Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEoJj-0001D1-Th
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 17:44:06 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MEoJf-0001gU-LN
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 17:43:55 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2009 17:43:55 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2009 17:43:55 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: [PATCH 1/3 v2] [MTD-UTILS] Unified reading from standard input
	and from file
Date: Thu, 11 Jun 2009 10:43:41 -0700
Message-ID: <4A31424D.802@orb.com>
References: <h0k3il$ij6$1@ger.gmane.org>	<1244551983.5847.388.camel@localhost.localdomain>	<4A2E98BD.30704@orb.com>
	<h0mppp$7v2$1@ger.gmane.org>
	<1244705541.5847.412.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244705541.5847.412.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2009-06-09 at 16:04 -0700, Jehan Bing wrote:
>   
>> Use same code path for reading data (not the OOB) from either the 
>> standard input or a regular file.
>>
>> Signed-off-by: Jehan Bing <jehan@orb.com>
>>     
>
> The patches look OK to me, but I do not have time to review them very
> really well. So would it please be possible to describe how you tested
> them to convince me they are ok? Then I'd push them to mtd-utils.git
> tree. Did you test writing with/without oob, from file/stdin, etc?
>
> Thanks

For the tests, I used the nandsim driver and 
"eraseall-nandwrite-nanddump-md5sum". I did  a first one with the 
official nandwrite from Ubuntu as a reference, then tried different 
options with my changes.

And here the same patch with a couple of blank lines removed and a 
comment moved. I forgot the regenerate it with the others after cleaning 
up the code. The third patch won't apply without it.


Signed-off-by: Jehan Bing <jehan@orb.com>

--- mtd-utils.orig/nandwrite.c	2009-06-08 13:33:32.000000000 -0700
+++ mtd-utils.unified/nandwrite.c	2009-06-09 13:20:56.000000000 -0700
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
 
