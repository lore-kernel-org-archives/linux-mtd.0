Received: from h87n1fls24o1073.telia.com ([213.65.68.87] helo=henrik.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kL5o-0005pR-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 09:55:56 +0100
From: Henrik Nordstrom <hno@marasystems.com>
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>, linux-mtd@lists.infradead.org
Subject: [patch] Re: the latest MTD code from CVS has compilation errors
Date: Thu, 29 Aug 2002 10:55:16 +0200
References: <3D6D8BC6.8000909@redswitch.com>
In-Reply-To: <3D6D8BC6.8000909@redswitch.com>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_4SKL93J8IKLQ40WBKDW6"
Message-Id: <200208291055.16498@henrik.marasystems.com>
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

--------------Boundary-00=_4SKL93J8IKLQ40WBKDW6
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

I have the same problem with 2.4.18. See post a few days ago about 
DOC2000.

A closer look at the problem inticates the problem is not the CVS 
sources but the patchin.sh script used to apply them to the kernel 
tree. It does not apply the new jffs2 sources to the kernel tree, 
crashing the old jffs2 code by replacing mtd headers..

However, applying the new code to stock 2.4.18 does not work either 
due to a missing include/linux/crc32.h (is in fs/jffs2/crc32.h)

Attached is a small patch to the patchin.sh script to have the new 
jffs2 code applied to the kernel tree.

Regards
Henrik

On Thursday 29 August 2002 04.49, Xiaogeng (Shawn) Jin wrote:
> Hi,
>
> I tried to compile the latest MTD code got from CVS tree on linux
> 2.4.4 (from DENX). When fs/jffs2/background.c is compiled, it
> complains that background.c:108: arguments given to macro
> 'recalc_sigpending' background.c:155: arguments given to macro
> 'recalc_sigpending' errors. I looked into the code and included
> header file. In linux/mtd/compatmac.h the macro is re-defined to
> have no arguments at all if kernel version < 2.5.5. So in my case
> 108 and 155 should be changed to have no arguments.
>
> Anybody reported this "bug" before?
>
> - Shawn.
>
> PS: compatmac.h's modification date is 2002/08/07, version v1.39.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------Boundary-00=_4SKL93J8IKLQ40WBKDW6
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="mtd-2.4.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mtd-2.4.patch"

Index: patches/patchin.sh
===================================================================
RCS file: /home/cvs/mtd/patches/patchin.sh,v
retrieving revision 1.6
diff -u -r1.6 patchin.sh
--- patches/patchin.sh	25 Apr 2001 12:10:23 -0000	1.6
+++ patches/patchin.sh	29 Aug 2002 08:52:37 -0000
@@ -30,6 +30,7 @@
 mkdir -p drivers/mtd/nand
 mkdir -p include/linux/mtd
 mkdir -p fs/jffs
+mkdir -p fs/jffs2
 ln -sf $TOPDIR/drivers/mtd/*.[ch] drivers/mtd
 ln -sf $TOPDIR/drivers/mtd/*akefile $TOPDIR/drivers/mtd/Rules.make $TOPDIR/drivers/mtd/Config.in drivers/mtd
 ln -sf $TOPDIR/drivers/mtd/chips/*.[ch] drivers/mtd/chips
@@ -43,7 +44,13 @@
 ln -sf $TOPDIR/fs/jffs/*.[ch] fs/jffs
 ln -sf $TOPDIR/fs/jffs/*akefile fs/jffs
 ln -sf $TOPDIR/include/linux/jffs.h include/linux
+ln -sf $TOPDIR/fs/jffs2/*.[ch] fs/jffs2
+ln -sf $TOPDIR/fs/jffs2/*akefile fs/jffs2
+ln -sf $TOPDIR/include/linux/jffs2*.h include/linux
+ln -sf $TOPDIR/include/linux/z*.h include/linux
+ln -sf $TOPDIR/fs/jffs2/crc32.h include/linux
 ln -sf $TOPDIR/include/linux/mtd/*.h include/linux/mtd
+
 
 #
 #	kernel patches

--------------Boundary-00=_4SKL93J8IKLQ40WBKDW6--
