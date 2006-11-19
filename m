Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GlkjS-0004oS-K6
	for linux-mtd@lists.infradead.org; Sun, 19 Nov 2006 06:21:22 -0500
Date: Sun, 19 Nov 2006 09:42:22 +0000 (GMT)
From: John <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD-UBI config settings for verbose debug
Message-ID: <Pine.LNX.4.33.0611190927260.4505-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] MTD-UBI config settings for verbose debug

For the ubi-2.6.git tree.
Without this change, I could not enable verbose error reporting.
With this change, I could enable verbose errors

Signed-off-by: John Smith <John.Smith <at> arrows.demon.co.uk>

Index: ubi-test/ubi-2.6/drivers/mtd/ubi/Kconfig.debug
===================================================================
--- ubi-test.orig/ubi-2.6/drivers/mtd/ubi/Kconfig.debug	2006-11-18 16:23:15.%N +0000
+++ ubi-test/ubi-2.6/drivers/mtd/ubi/Kconfig.debug	2006-11-18 19:31:27.%N +0000
@@ -71,7 +71,7 @@

 config MTD_UBI_DEBUG_MSG_VB_ERR
 	bool "Verbose errors reporting"
-	depends on JFFS3_FS_DEBUG
+	depends on MTD_UBI_DEBUG
 	default y
 	help
 	  This option enables verbose reporting about errors occurred in UBI.
