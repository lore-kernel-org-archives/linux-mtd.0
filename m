Received: from chfdns02.ch.intel.com ([143.182.246.25] helo=melete.ch.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tAlD-0005hY-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2001 17:38:39 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by melete.ch.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.44 2001/10/01 19:10:43 root Exp $) with SMTP id QAA00956
	for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2001 16:47:48 GMT
Message-ID: <7C0E66E1B97BD5119B120002A50A63D22E419B@hasmsx101.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "'Larry Doolittle'" <ldoolitt@recycle.lbl.gov>,
        linux-mtd@lists.infradead.org
Subject: RE: linux/completion.h
Date: Mon, 15 Oct 2001 18:47:46 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C15599.1DECF3F0"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C15599.1DECF3F0
Content-Type: text/plain;
	charset="ISO-8859-1"


| From: Larry Doolittle [mailto:ldoolitt@recycle.lbl.gov]
| 
| You did merge the part that protects the BLKGETSIZE64 cases 
| with an #ifdef. All Alex has to do is disable the #define BLKGETSIZE64
from 
| compatmac.h.
| There might be good reason for _some_ people to define BLKGETSIZE64 in
| compatmac.h, but I don't think that's a robust default.

That is correct. It is already there. Maybe a CONFIG options are in place
here.

I'm attaching a patch that did the trick for me.



diff -urN mtd/drivers/mtd/Config.in mtd-fix/drivers/mtd/Config.in
--- mtd/drivers/mtd/Config.in   Wed Oct  3 13:38:38 2001
+++ mtd-fix/drivers/mtd/Config.in       Mon Oct 15 18:31:34 2001
@@ -11,6 +11,12 @@
    if [ "$CONFIG_MTD_DEBUG" = "y" ]; then
       int '  Debugging verbosity (0 = quiet, 3 = noisy)'
CONFIG_MTD_DEBUG_VERBOSE 0
    fi
+   bool 'Compatibility with kernels older than 2.4.8' CONFIG_MTD_COMPATMAC
+   
+   if [ "$CONFIG_MTD_COMPATMAC" = "y" ]; then
+      bool '     Enable 64 bit block operations'
CONFIG_MTD_COMPATMAC_BLKGETSIZE64
+   fi
+   
    dep_tristate '  MTD partitioning support' CONFIG_MTD_PARTITIONS
$CONFIG_MTD
    dep_tristate '  RedBoot partition table parsing'
CONFIG_MTD_REDBOOT_PARTS $CONFIG_M
TD_PARTITIONS
 if [ "$CONFIG_ARM" = "y" ]; then
diff -urN mtd/fs/jffs2/background.c mtd-fix/fs/jffs2/background.c
--- mtd/fs/jffs2/background.c   Mon Oct  8 11:22:38 2001
+++ mtd-fix/fs/jffs2/background.c       Mon Oct 15 18:31:20 2001
@@ -43,7 +43,11 @@
 #include <linux/jffs2.h>
 #include <linux/mtd/mtd.h>
 #include <linux/interrupt.h>
+#ifdef CONFIG_MTD_COMPATMAC
+#include <linux/mtd/compatmac.h>
+#else
 #include <linux/completion.h>
+#endif
 #include "nodelist.h"
 
 
diff -urN mtd/include/linux/jffs2_fs_sb.h
mtd-fix/include/linux/jffs2_fs_sb.h
--- mtd/include/linux/jffs2_fs_sb.h     Tue Sep 18 23:15:18 2001
+++ mtd-fix/include/linux/jffs2_fs_sb.h Mon Oct 15 18:31:20 2001
@@ -5,7 +5,11 @@
 
 #include <linux/types.h>
 #include <linux/spinlock.h>
+#ifdef CONFIG_MTD_COMPATMAC
+#include <linux/mtd/compatmac.h>
+#else
 #include <linux/completion.h>
+#endif
 #include <asm/semaphore.h>
 #include <linux/list.h>
 
diff -urN mtd/include/linux/mtd/compatmac.h
mtd-fix/include/linux/mtd/compatmac.h
--- mtd/include/linux/mtd/compatmac.h   Tue Oct  2 11:13:53 2001
+++ mtd-fix/include/linux/mtd/compatmac.h       Mon Oct 15 18:31:20 2001
@@ -463,7 +463,7 @@
                }
 }
 #endif
-#ifndef BLKGETSIZE64 /* LINUX_VERSION_CODE < KERNEL_VERSION(2,4,10-pre13)
*/
+#ifdef CONFIG_MTD_COMPATMAC_BLKGETSIZE64
 #define BLKGETSIZE64 _IOR(0x12,114,sizeof(u64)) /* return device size in
bytes (u64 *a
rg) */
 #endif



------_=_NextPart_000_01C15599.1DECF3F0
Content-Type: application/octet-stream;
	name="mtd-compat.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd-compat.patch"

diff -urN mtd/drivers/mtd/Config.in mtd-fix/drivers/mtd/Config.in=0A=
--- mtd/drivers/mtd/Config.in	Wed Oct  3 13:38:38 2001=0A=
+++ mtd-fix/drivers/mtd/Config.in	Mon Oct 15 18:31:34 2001=0A=
@@ -11,6 +11,12 @@=0A=
    if [ "$CONFIG_MTD_DEBUG" =3D "y" ]; then=0A=
       int '  Debugging verbosity (0 =3D quiet, 3 =3D noisy)' =
CONFIG_MTD_DEBUG_VERBOSE 0=0A=
    fi=0A=
+   bool 'Compatibility with kernels older than 2.4.8' =
CONFIG_MTD_COMPATMAC=0A=
+   =0A=
+   if [ "$CONFIG_MTD_COMPATMAC" =3D "y" ]; then=0A=
+      bool '     Enable 64 bit block operations' =
CONFIG_MTD_COMPATMAC_BLKGETSIZE64=0A=
+   fi=0A=
+   =0A=
    dep_tristate '  MTD partitioning support' CONFIG_MTD_PARTITIONS =
$CONFIG_MTD=0A=
    dep_tristate '  RedBoot partition table parsing' =
CONFIG_MTD_REDBOOT_PARTS $CONFIG_MTD_PARTITIONS=0A=
 if [ "$CONFIG_ARM" =3D "y" ]; then=0A=
diff -urN mtd/fs/jffs2/background.c mtd-fix/fs/jffs2/background.c=0A=
--- mtd/fs/jffs2/background.c	Mon Oct  8 11:22:38 2001=0A=
+++ mtd-fix/fs/jffs2/background.c	Mon Oct 15 18:31:20 2001=0A=
@@ -43,7 +43,11 @@=0A=
 #include <linux/jffs2.h>=0A=
 #include <linux/mtd/mtd.h>=0A=
 #include <linux/interrupt.h>=0A=
+#ifdef CONFIG_MTD_COMPATMAC=0A=
+#include <linux/mtd/compatmac.h>=0A=
+#else=0A=
 #include <linux/completion.h>=0A=
+#endif=0A=
 #include "nodelist.h"=0A=
 =0A=
 =0A=
diff -urN mtd/include/linux/jffs2_fs_sb.h =
mtd-fix/include/linux/jffs2_fs_sb.h=0A=
--- mtd/include/linux/jffs2_fs_sb.h	Tue Sep 18 23:15:18 2001=0A=
+++ mtd-fix/include/linux/jffs2_fs_sb.h	Mon Oct 15 18:31:20 2001=0A=
@@ -5,7 +5,11 @@=0A=
 =0A=
 #include <linux/types.h>=0A=
 #include <linux/spinlock.h>=0A=
+#ifdef CONFIG_MTD_COMPATMAC=0A=
+#include <linux/mtd/compatmac.h>=0A=
+#else=0A=
 #include <linux/completion.h>=0A=
+#endif=0A=
 #include <asm/semaphore.h>=0A=
 #include <linux/list.h>=0A=
 =0A=
diff -urN mtd/include/linux/mtd/compatmac.h =
mtd-fix/include/linux/mtd/compatmac.h=0A=
--- mtd/include/linux/mtd/compatmac.h	Tue Oct  2 11:13:53 2001=0A=
+++ mtd-fix/include/linux/mtd/compatmac.h	Mon Oct 15 18:31:20 2001=0A=
@@ -463,7 +463,7 @@=0A=
 		}=0A=
 }=0A=
 #endif=0A=
-#ifndef BLKGETSIZE64 /* LINUX_VERSION_CODE < =
KERNEL_VERSION(2,4,10-pre13) */=0A=
+#ifdef CONFIG_MTD_COMPATMAC_BLKGETSIZE64=0A=
 #define BLKGETSIZE64 _IOR(0x12,114,sizeof(u64)) /* return device size =
in bytes (u64 *arg) */=0A=
 #endif=0A=
 =0A=

------_=_NextPart_000_01C15599.1DECF3F0--
