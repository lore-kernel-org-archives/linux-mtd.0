Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCGfG-0007b8-Pi
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 17:23:50 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MCGfE-0001p3-9W
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 17:23:40 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Jun 2009 17:23:40 +0000
Received: from nahor.j+gmane by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Jun 2009 17:23:40 +0000
To: linux-mtd@lists.infradead.org
From: Nahor <nahor.j+gmane@gmail.com>
Subject: [PATH] [MTD-UTILS] Return error if failure when reading from standard
	input
Date: Thu, 04 Jun 2009 10:23:22 -0700
Message-ID: <h08vuc$uut$1@ger.gmane.org>
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

The test to return SUCCESS or FAILURE at the end of nandwrite is done 
only when reading from a file. When reading from the standard input, 
nandwrite always returns success except for some cases at the begining.

This patches aims at fixing that by returning an error when jumping to 
the closeall label.

Regards,
	Nahor


--- a/nandwrite.c       2009-06-01 18:03:55.000000000 -0700
+++ b/nandwrite.c       2009-06-03 17:25:19.000000000 -0700
@@ -261,6 +261,7 @@
         int oobinfochanged = 0;
         struct nand_oobinfo old_oobinfo;
         int readcnt = 0;
+       bool failed = true;

         process_options(argc, argv);

@@ -623,6 +624,8 @@
                 mtdoffset += meminfo.writesize;
         }

+       failed = false;
+
  closeall:
         close(ifd);

@@ -637,7 +640,7 @@

         close(fd);

-       if ((ifd != STDIN_FILENO) && (imglen > 0)) {
+       if (failed || ((ifd != STDIN_FILENO) && (imglen > 0))) {
                 perror ("Data was only partially written due to error\n");
                 exit (EXIT_FAILURE);
         }
