Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F0c5-0006qg-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 22:43:13 +0100
Message-ID: <3B390418.8957E048@daniel.com>
Date: Tue, 26 Jun 2001 16:52:24 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Patch to patchin.sh file
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Any reason the following patch to the file patches/patchin.sh should not
be applied to the file in CVS?

It adds the JFFS2 dir/file/include stuff to a stock kernel that knows
nothing about it.

Vipin


Index: patchin.sh
===================================================================
RCS file: /home/cvs/mtd/patches/patchin.sh,v
retrieving revision 1.6
diff -u -r1.6 patchin.sh
--- patchin.sh  2001/04/25 12:10:23     1.6
+++ patchin.sh  2001/06/26 21:40:06
@@ -24,12 +24,16 @@
 #

 mkdir -p drivers/mtd
+rm -rf    drivers/mtd/* # clear out old junk
 mkdir -p drivers/mtd/chips
 mkdir -p drivers/mtd/devices
 mkdir -p drivers/mtd/maps
 mkdir -p drivers/mtd/nand
 mkdir -p include/linux/mtd
 mkdir -p fs/jffs
+rm -rf   fs/jffs/* # clear out old junk
+mkdir -p fs/jffs2
+rm -rf   fs/jffs2/* # clear out old junk
 ln -sf $TOPDIR/drivers/mtd/*.[ch] drivers/mtd
 ln -sf $TOPDIR/drivers/mtd/*akefile $TOPDIR/drivers/mtd/Rules.make
$TOPDIR/drivers/mtd/Config.in drivers/mtd
 ln -sf $TOPDIR/drivers/mtd/chips/*.[ch] drivers/mtd/chips
@@ -42,7 +46,10 @@
 ln -sf $TOPDIR/drivers/mtd/nand/*akefile
$TOPDIR/drivers/mtd/nand/Config.in drivers/mtd/nand
 ln -sf $TOPDIR/fs/jffs/*.[ch] fs/jffs
 ln -sf $TOPDIR/fs/jffs/*akefile fs/jffs
-ln -sf $TOPDIR/include/linux/jffs.h include/linux
+ln -sf $TOPDIR/fs/jffs2/*.[ch] fs/jffs2
+ln -sf $TOPDIR/fs/jffs2/*akefile fs/jffs2
+#ln -sf $TOPDIR/include/linux/jffs.h include/linux
+ln -sf $TOPDIR/include/linux/jffs*.h include/linux
 ln -sf $TOPDIR/include/linux/mtd/*.h include/linux/mtd

 #
