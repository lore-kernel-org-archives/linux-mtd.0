Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MC20y-0003jh-PC
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 01:45:17 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MC20s-0003uN-P8
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 01:45:02 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Jun 2009 01:45:02 +0000
Received: from nahor.j+gmane by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Jun 2009 01:45:02 +0000
To: linux-mtd@lists.infradead.org
From: Nahor <nahor.j+gmane@gmail.com>
Subject: [PATCH] [MTD-UTILS] Incorrect loop condition
Date: Wed, 03 Jun 2009 18:18:25 -0700
Message-ID: <h077d2$ra9$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi all,

Here is a small patch to fix an obvious typo.

If the file contains only a few bytes in the last page and the padding 
option is selected, the loop may exit early (readlen < meminfo.oobsize).
Most of the time it will still work though because the code tries to 
read the whole OOB in one chunk.


On a similar issue, shouldn't the loop reading the input file exit with 
error if cnt == 0? The loop should alread exit when all the expected 
data is read. So if cnt == 0, it means that nandwrite didn't get all the 
data it wanted. The code then goes on as if everything was correctly 
read so it will write the data from the previous page. This is a 
security risk (even though the necessary conditions make it nearly 
impossible in practice).


Regards,
    Nahor



--- a/nandwrite.c        2009-06-01 18:03:55.000000000 -0700
+++ b/nandwrite.c 2009-06-03 15:29:24.000000000 -0700
@@ -531,7 +531,7 @@
                if (writeoob) {
                        int tinycnt = 0;

-                       while(tinycnt < readlen) {
+                       while(tinycnt < meminfo.oobsize) {
                                cnt = read(ifd, oobreadbuf + tinycnt,
meminfo.oobsize - tinycnt);
                                if (cnt == 0) { // EOF
                                        break;
