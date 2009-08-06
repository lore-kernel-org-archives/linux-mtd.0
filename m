Received: from exhub015-4.exch015.msoutlookonline.net ([207.5.72.96])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MYr2C-00047s-FE
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 00:40:52 +0000
Message-ID: <4A7A268A.7040502@orb.com>
Date: Wed, 5 Aug 2009 17:40:42 -0700
From: Jehan Bing <jehan@orb.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5 v3] [MTD-UTILS] Unified reading from standard input and
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

Use the same code structure when reading the OOB than when reading the 
regular data.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-06-09 13:20:56.000000000 -0700
+++ b/nandwrite.c	2009-06-09 13:20:44.000000000 -0700
@@ -520,17 +520,32 @@ int main(int argc, char * const argv[])
 		}
 
 		if (writeoob) {
-			int tinycnt = 0;
+			{
+				int readlen = meminfo.oobsize;
 
-			while(tinycnt < meminfo.oobsize) {
-				cnt = read(ifd, oobreadbuf + tinycnt, meminfo.oobsize - tinycnt);
-				if (cnt == 0) { // EOF
-					break;
-				} else if (cnt < 0) {
-					perror ("File I/O error on input file");
+				int tinycnt = 0;
+
+				while (tinycnt < readlen) {
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
+				if ((ifd == STDIN_FILENO) && (cnt == 0)) {
+					/* No more bytes - we are done after writing the remaining bytes */
+					imglen = 0;
+				}
 			}
 
 			if (!noecc) {
