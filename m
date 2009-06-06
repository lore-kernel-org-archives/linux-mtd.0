Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCl2u-0003XG-IR
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 01:50:15 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MCl2o-0000UC-WB
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 01:50:03 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 06 Jun 2009 01:50:02 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 06 Jun 2009 01:50:02 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: [PATCH] [MTD-UTILS] Incorrect loop condition
Date: Fri, 05 Jun 2009 18:45:53 -0700
Message-ID: <4A29CA51.1070906@orb.com>
References: <h077d2$ra9$1@ger.gmane.org>
	<1244204148.5847.54.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244204148.5847.54.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Small patch to fix an obvious typo.

If the file contains only a few bytes in the last page and the --oob option is selected, the loop may exit early (readlen < meminfo.oobsize).
Most of the time it will still work though because the code tries to read the whole OOB in one chunk.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-06-01 18:03:55.000000000 -0700
+++ b/nandwrite.c	2009-06-05 18:32:56.000000000 -0700
@@ -531,7 +531,7 @@ int main(int argc, char * const argv[])
 		if (writeoob) {
 			int tinycnt = 0;
 
-			while(tinycnt < readlen) {
+			while(tinycnt < meminfo.oobsize) {
 				cnt = read(ifd, oobreadbuf + tinycnt, meminfo.oobsize - tinycnt);
 				if (cnt == 0) { // EOF
 					break;
