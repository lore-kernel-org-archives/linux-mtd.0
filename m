Received: from mail.gmx.de ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BUjvW-0007wo-Bj
	for linux-mtd@lists.infradead.org; Mon, 31 May 2004 06:22:00 -0400
From: dkey <dk.dbox2@gmx.net>
To: linux-mtd@lists.infradead.org
Date: Mon, 31 May 2004 12:30:57 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_hlwuAqgbpzwIBm1"
Message-Id: <200405311230.57838.dk.dbox2@gmx.net>
Cc: 
Subject: [PATCH] fs/Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_hlwuAqgbpzwIBm1
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

this patch selects ZLIB_INFLATE/DEFLATE if JFFS2_ZLIB is selected.

greets dkey

--Boundary-00=_hlwuAqgbpzwIBm1
Content-Type: text/x-diff;
  charset="us-ascii";
  name="Kconfig.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Kconfig.diff"

--- Kconfig.orig	2004-05-31 12:24:49.000000000 +0200
+++ Kconfig	2004-05-31 12:24:11.000000000 +0200
@@ -69,6 +69,8 @@ config JFFS2_FS_NAND
 
 config JFFS2_ZLIB
 	bool "JFFS2 ZLIB compression support"
+	select ZLIB_INFLATE
+	select ZLIB_DEFLATE
 	depends on JFFS2_FS
 	default y
         help

--Boundary-00=_hlwuAqgbpzwIBm1--
