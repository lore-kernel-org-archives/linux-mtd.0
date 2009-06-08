Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDhmQ-00020S-6p
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 16:33:08 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDhmJ-0006O2-0Q
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 16:32:55 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 16:32:55 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 16:32:55 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: [PATH] [MTD-UTILS] Return error if failure when reading from
	standard input
Date: Mon, 08 Jun 2009 09:32:38 -0700
Message-ID: <4A2D3D26.4090703@orb.com>
References: <h08vuc$uut$1@ger.gmane.org>
	<1244441802.5847.337.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244441802.5847.337.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix nandwrite to return EXIT_FAILURE in case of error when using the
standard input instead of a file for input.


Signed-off-by: Jehan Bing <jehan@orb.com>

diff -up mtd-utils.loop/nandwrite.c mtd-utils.failed_patch/nandwrite.c
--- mtd-utils.loop/nandwrite.c	2009-06-05 18:32:56.000000000 -0700
+++ mtd-utils.failed_patch/nandwrite.c	2009-06-03 17:25:19.000000000 -0700
@@ -261,6 +261,7 @@ int main(int argc, char * const argv[])
 	int oobinfochanged = 0;
 	struct nand_oobinfo old_oobinfo;
 	int readcnt = 0;
+	bool failed = true;
 
 	process_options(argc, argv);
 
@@ -623,6 +624,8 @@ int main(int argc, char * const argv[])
 		mtdoffset += meminfo.writesize;
 	}
 
+	failed = false;
+
 closeall:
 	close(ifd);
 
@@ -637,7 +640,7 @@ restoreoob:
 
 	close(fd);
 
-	if ((ifd != STDIN_FILENO) && (imglen > 0)) {
+	if (failed || ((ifd != STDIN_FILENO) && (imglen > 0))) {
 		perror ("Data was only partially written due to error\n");
 		exit (EXIT_FAILURE);
 	}
