Received: from asav1.lyse.net ([213.167.96.68])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EBAul-00043B-2j
	for linux-mtd@lists.infradead.org; Fri, 02 Sep 2005 08:45:11 -0400
Received: from asav1.lyse.net (asav1.lyse.net [127.0.0.1])
	by localhost.lyse.net (Postfix) with ESMTP id 0AFEF904CE
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Sep 2005 14:38:45 +0200 (CEST)
Received: from mail1.lyse.net (unknown [192.168.42.2])by asav1.lyse.net (Pos
	tfix) with ESMTP id EE2B1904C1for <linux-mtd@lists.infradead.org>;
	Fri,  2 Sep 2005 14:38:44 +0200 (CEST)
Received: from [84.234.138.230] (helo=[192.168.0.193])by mail1.lyse.net with
	esmtp (Exim 4.34)id 1EBAto-0004Cp-Vufor linux-mtd@lists.infradead.org;
	Fri , 02 Sep 2005 14:44:04 +0200
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20050901125707.GA1623@wohnheim.fh-wedel.de>
References: <20050901120030.GB694@wohnheim.fh-wedel.de><1125578756.4884.10.c
	amel@localhost.localdomain><20050901125707.GA1623@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed;
	boundary="=-n6HrmXqObrPuxBfEPeu6"
Date: Fri, 02 Sep 2005 14:44:47 +0200
Message-Id: <1125665087.32593.41.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-n6HrmXqObrPuxBfEPeu6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

How about this patch?

It adds a mount option to allow Write Once Read Many if the disk is too
small to support read/write many times.

W.r.t. eCos, I expect the WORM capability to be enabled via a CDL
option.


--=20
=D8yvind Harboe
http://www.zylin.com

--=-n6HrmXqObrPuxBfEPeu6
Content-Disposition: attachment; filename=jffs2worm.txt
Content-Type: text/x-patch; name=jffs2worm.txt; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Index: fs/jffs2/build.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/build.c,v
retrieving revision 1.77
diff -u -r1.77 build.c
--- fs/jffs2/build.c	31 Aug 2005 13:51:00 -0000	1.77
+++ fs/jffs2/build.c	2 Sep 2005 12:42:49 -0000
@@ -279,6 +279,18 @@
 
 	c->resv_blocks_write = c->resv_blocks_deletion + (size / c->sector_size);
 
+	/* It is possible to mount a JFFS2 in a mode where it allows
+	   Write Once Read Many operation if the flash disk is too small
+	   to support read/write many times.
+	   
+	   If the flash disk is smaller than resv_blocks_write, then we 
+	   allow writing to the disk anyway. The flash disk is then most likely
+       being used as write once - read many medimum, e.g. in-system configuration of 
+	   static parameters(e.g. MAC address of device in stored in "ROM"). */
+	if ((c->flags & JFFS2_SB_FLAG_ALLOW_WORM)!=0)&& (c->resv_blocks_write * c->sector_size > c->flash_size)) {
+		c->resv_blocks_write = 0; 
+	}
+
 	/* When do we let the GC thread run in the background */
 
 	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;
Index: include/linux/jffs2_fs_sb.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/jffs2_fs_sb.h,v
retrieving revision 1.52
diff -u -r1.52 jffs2_fs_sb.h
--- include/linux/jffs2_fs_sb.h	19 May 2005 16:12:17 -0000	1.52
+++ include/linux/jffs2_fs_sb.h	2 Sep 2005 12:42:49 -0000
@@ -16,6 +16,9 @@
 #define JFFS2_SB_FLAG_RO 1
 #define JFFS2_SB_FLAG_SCANNING 2 /* Flash scanning is in progress */
 #define JFFS2_SB_FLAG_BUILDING 4 /* File system building is in progress */
+#define JFFS2_SB_FLAG_ALLOW_WORM 8 /* allow write once read many if the
+                                      disk is too small to support read/write
+                                      many times*/
 
 struct jffs2_inodirty;
 

--=-n6HrmXqObrPuxBfEPeu6--
