Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIoQF-0005rh-3F
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 17:30:13 +0100
Date: Wed, 8 Aug 2007 18:23:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: [Patch 16/18] fs/Kconfig
Message-ID: <20070808162339.GR15319@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20070808161234.GB15319@lazybastard.org>
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- linux-2.6.21logfs/fs/Kconfig~logfs	2007-08-08 02:57:37.000000000 +0200
+++ linux-2.6.21logfs/fs/Kconfig	2007-08-08 02:57:37.000000000 +0200
@@ -1351,6 +1351,32 @@ config JFFS2_CMODE_SIZE
 
 endchoice
 
+config LOGFS
+	bool "Log Filesystem (EXPERIMENTAL)"
+	depends on MTD && BLOCK && EXPERIMENTAL
+	select ZLIB_INFLATE
+	select ZLIB_DEFLATE
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
+config LOGFS_FSCK
+	bool "Run LogFS fsck at mount time"
+	depends on LOGFS
+	help
+	  Run a full filesystem check on every mount.  If any errors are
+	  found, mounting the filesystem will fail.  This is a debug option
+	  for developers.
+
+	  If unsure, say N.
+
 config CRAMFS
 	tristate "Compressed ROM file system support (cramfs)"
 	depends on BLOCK
