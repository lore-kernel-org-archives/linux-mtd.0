Received: from asav1.lyse.net ([213.167.96.68])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAOtM-00018m-Vh
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 05:28:39 -0400
Received: from asav1.lyse.net (asav1.lyse.net [127.0.0.1])
	by localhost.lyse.net (Postfix) with ESMTP id 0F45290184
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2005 11:22:11 +0200 (CEST)
Received: from mail1.lyse.net (unknown [192.168.42.2])by asav1.lyse.net (Pos
	tfix) with ESMTP id F3145900F2for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2005 11:22:10 +0200 (CEST)
Received: from [84.234.138.230] (helo=[192.168.0.193])by mail1.lyse.net with
	esmtp (Exim 4.34)id 1EAOsS-0006Z2-DOfor linux-mtd@lists.infradead.org;
	Wed , 31 Aug 2005 11:27:28 +0200
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
	boundary="=-ja9aZYDYPMcfraNRsKP2"
Date: Wed, 31 Aug 2005 11:28:12 +0200
Message-Id: <1125480492.18626.42.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ja9aZYDYPMcfraNRsKP2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The attached patch allows JFFS2 to write to really small JFFS2 disks.

This is e.g. useful when using JFFS2 for in-system one time programming
of embedded device parameters: serial number, MAC, etc.


Comments?

--=20
=D8yvind Harboe
http://www.zylin.com

--=-ja9aZYDYPMcfraNRsKP2
Content-Disposition: attachment; filename=jffs2rom.txt
Content-Type: text/x-patch; name=jffs2rom.txt; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Index: build.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/build.c,v
retrieving revision 1.76
diff -u -r1.76 build.c
--- build.c    30 Jul 2005 15:29:27 -0000	1.76
+++ build.c    31 Aug 2005 09:01:34 -0000
@@ -279,6 +279,14 @@
 
	c->resv_blocks_write = c->resv_blocks_deletion + (size / c->sector_size);
 
+	/* If the flash disk is smaller than resv_blocks_write, then we 
+	   allow writing to the disk anyway. The flash disk is then most likely
+	      being used as write once - read many medimum, e.g. in-system configuration of 
+	         static parameters(e.g. MAC address of device in stored in "ROM"). */
+		 if (c->resv_blocks_write * c->sector_size > c->flash_size) {
+		   c->resv_blocks_write = 0; 
+		   }
+
	/* When do we let the GC thread run in the background */
 
	c->resv_blocks_gctrigger = c->resv_blocks_write + 1;

--=-ja9aZYDYPMcfraNRsKP2--
