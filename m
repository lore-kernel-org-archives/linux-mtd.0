Received: from mail.oco.net ([216.171.163.254] helo=oco.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHngB-0006lh-9h
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 17:12:19 +0000
Message-ID: <3FAA807B.30607@celerity.net>
Date: Thu, 06 Nov 2003 09:10:19 -0800
From: Chris Ellec <cellec@celerity.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: nftl_format
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I got an older Diskonchip with NFTL all messed up after trying to 
install Grub on it, so I had to nftl_format it.

First I had to make the changes below to get nftldump and nftl_format to 
compile again.

When I ran nftl_format, it took about 20 minutes for a 96MB DOC, is that 
normal ?

The nftl_format worked and the DOC is now back to its original state.

Chris.

-------

Please note that the following breaks the compilation of the kernel, so 
you can only do it to compile  nftl_format then you have to change it 
back if you need to recompile bzImage.

in mtd/include/linux/mtd:

--- nftl.h~    2003-10-27 15:47:40.000000000 -0800
+++ nftl.h    2003-10-28 17:18:36.000000000 -0800
@@ -8,7 +8,7 @@
 #define __MTD_NFTL_H__
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/blktrans.h>
+//#include <linux/mtd/blktrans.h>
 
 /* Block Control Information */
 

in mtd/util:

--- Makefile~    2003-10-28 17:05:35.000000000 -0800
+++ Makefile    2003-10-28 17:06:00.000000000 -0800
@@ -10,7 +10,8 @@
 TARGETS = ftl_format erase eraseall  nanddump doc_loadbios \
     mkfs.jffs ftl_check mkfs.jffs2 lock unlock \
     einfo mtd_debug fcp nandwrite jffs2dump \
-    jffs2reader nftldump nftl_format
+    nftldump nftl_format
+    #jffs2reader
 
 SYMLINKS = crc32.h crc32.c compr_rtime.c
 
