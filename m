Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEAQ8-00036x-AP
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 23:08:03 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MEAQ2-0005AJ-TU
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 23:07:50 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 23:07:50 +0000
Received: from nahor.j+gmane by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 23:07:50 +0000
To: linux-mtd@lists.infradead.org
From: Nahor <nahor.j+gmane@gmail.com>
Subject: Re: [PATCH 2/3] [MTD-UTILS] Use same kind of code for reading OOB
	than for regular data
Date: Tue, 09 Jun 2009 16:07:39 -0700
Message-ID: <h0mpvs$8nk$1@ger.gmane.org>
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
