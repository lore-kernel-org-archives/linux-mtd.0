Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhTFj-0004s6-Gv
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 17:29:31 +0000
Message-Id: <20080401181332.853833001@logfs.org>
References: <20080401181308.512473173@logfs.org>
Date: Tue, 01 Apr 2008 20:13:08 +0200
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [patch 1/15] Makefiles and Kconfig
From: joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- linux-2.6.24logfs/fs/Kconfig~logfs	2008-03-24 12:39:10.190939342 +0100
+++ linux-2.6.24logfs/fs/Kconfig	2008-04-01 19:48:18.517351063 +0200
@@ -1385,6 +1385,23 @@ config JFFS2_CMODE_FAVOURLZO
 
 endchoice
 
+config LOGFS
+	bool "Log Filesystem (EXPERIMENTAL)"
+	depends on (MTD || BLOCK) && EXPERIMENTAL
+	select ZLIB_INFLATE
+	select ZLIB_DEFLATE
+	select CRC32
+	help
+	  Flash filesystem aimed to scale efficiently to large devices.
+	  In comparison to JFFS2 it offers significantly faster mount
+	  times and potentially less RAM usage, although the latter has
+	  not been measured yet.
+
+	  In its current state it is still very experimental and should
+	  not be used for other than testing purposes.
+
+	  If unsure, say N.
+
 config CRAMFS
 	tristate "Compressed ROM file system support (cramfs)"
 	depends on BLOCK
--- linux-2.6.24logfs/fs/Makefile~logfs	2008-03-24 12:39:10.190939342 +0100
+++ linux-2.6.24logfs/fs/Makefile	2008-03-24 12:40:08.127616634 +0100
@@ -99,6 +99,7 @@ obj-$(CONFIG_NTFS_FS)		+= ntfs/
 obj-$(CONFIG_UFS_FS)		+= ufs/
 obj-$(CONFIG_EFS_FS)		+= efs/
 obj-$(CONFIG_JFFS2_FS)		+= jffs2/
+obj-$(CONFIG_LOGFS)		+= logfs/
 obj-$(CONFIG_AFFS_FS)		+= affs/
 obj-$(CONFIG_ROMFS_FS)		+= romfs/
 obj-$(CONFIG_QNX4FS_FS)		+= qnx4/
--- /dev/null	2008-03-30 12:15:48.586669308 +0200
+++ linux-2.6.24logfs/fs/logfs/Makefile	2008-04-01 19:48:07.170961891 +0200
@@ -0,0 +1,14 @@
+obj-$(CONFIG_LOGFS)	+= logfs.o
+
+logfs-y	+= compr.o
+logfs-y	+= dir.o
+logfs-y	+= file.o
+logfs-y	+= gc.o
+logfs-y	+= inode.o
+logfs-y	+= journal.o
+logfs-y	+= memtree.o
+logfs-y	+= readwrite.o
+logfs-y	+= segment.o
+logfs-y	+= super.o
+logfs-$(CONFIG_BLOCK)	+= dev_bdev.o
+logfs-$(CONFIG_MTD)	+= dev_mtd.o
