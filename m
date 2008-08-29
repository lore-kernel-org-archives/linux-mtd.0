Received: from mu-out-0910.google.com ([209.85.134.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYuV6-00068j-St
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 03:18:17 +0000
Received: by mu-out-0910.google.com with SMTP id w1so641499mue.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Aug 2008 20:18:14 -0700 (PDT)
Date: Fri, 29 Aug 2008 07:19:50 +0400
From: Alexey Dobriyan <adobriyan@gmail.com>
To: akpm@osdl.org
Subject: [PATCH] fs/Kconfig: move JFFS2 out
Message-ID: <20080829031950.GC10703@x200.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 fs/Kconfig       |  190 -------------------------------------------------------
 fs/jffs2/Kconfig |  188 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+), 189 deletions(-)

--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -634,195 +634,7 @@ config EFS_FS
 	  To compile the EFS file system support as a module, choose M here: the
 	  module will be called efs.
 
-config JFFS2_FS
-	tristate "Journalling Flash File System v2 (JFFS2) support"
-	select CRC32
-	depends on MTD
-	help
-	  JFFS2 is the second generation of the Journalling Flash File System
-	  for use on diskless embedded devices. It provides improved wear
-	  levelling, compression and support for hard links. You cannot use
-	  this on normal block devices, only on 'MTD' devices.
-
-	  Further information on the design and implementation of JFFS2 is
-	  available at <http://sources.redhat.com/jffs2/>.
-
-config JFFS2_FS_DEBUG
-	int "JFFS2 debugging verbosity (0 = quiet, 2 = noisy)"
-	depends on JFFS2_FS
-	default "0"
-	help
-	  This controls the amount of debugging messages produced by the JFFS2
-	  code. Set it to zero for use in production systems. For evaluation,
-	  testing and debugging, it's advisable to set it to one. This will
-	  enable a few assertions and will print debugging messages at the
-	  KERN_DEBUG loglevel, where they won't normally be visible. Level 2
-	  is unlikely to be useful - it enables extra debugging in certain
-	  areas which at one point needed debugging, but when the bugs were
-	  located and fixed, the detailed messages were relegated to level 2.
-
-	  If reporting bugs, please try to have available a full dump of the
-	  messages at debug level 1 while the misbehaviour was occurring.
-
-config JFFS2_FS_WRITEBUFFER
-	bool "JFFS2 write-buffering support"
-	depends on JFFS2_FS
-	default y
-	help
-	  This enables the write-buffering support in JFFS2.
-
-	  This functionality is required to support JFFS2 on the following
-	  types of flash devices:
-	    - NAND flash
-	    - NOR flash with transparent ECC
-	    - DataFlash
-
-config JFFS2_FS_WBUF_VERIFY
-	bool "Verify JFFS2 write-buffer reads"
-	depends on JFFS2_FS_WRITEBUFFER
-	default n
-	help
-	  This causes JFFS2 to read back every page written through the
-	  write-buffer, and check for errors.
-
-config JFFS2_SUMMARY
-	bool "JFFS2 summary support (EXPERIMENTAL)"
-	depends on JFFS2_FS && EXPERIMENTAL
-	default n
-	help
-	  This feature makes it possible to use summary information
-	  for faster filesystem mount.
-
-	  The summary information can be inserted into a filesystem image
-	  by the utility 'sumtool'.
-
-	  If unsure, say 'N'.
-
-config JFFS2_FS_XATTR
-	bool "JFFS2 XATTR support (EXPERIMENTAL)"
-	depends on JFFS2_FS && EXPERIMENTAL
-	default n
-	help
-	  Extended attributes are name:value pairs associated with inodes by
-	  the kernel or by users (see the attr(5) manual page, or visit
-	  <http://acl.bestbits.at/> for details).
-
-	  If unsure, say N.
-
-config JFFS2_FS_POSIX_ACL
-	bool "JFFS2 POSIX Access Control Lists"
-	depends on JFFS2_FS_XATTR
-	default y
-	select FS_POSIX_ACL
-	help
-	  Posix Access Control Lists (ACLs) support permissions for users and
-	  groups beyond the owner/group/world scheme.
-
-	  To learn more about Access Control Lists, visit the Posix ACLs for
-	  Linux website <http://acl.bestbits.at/>.
-
-	  If you don't know what Access Control Lists are, say N
-
-config JFFS2_FS_SECURITY
-	bool "JFFS2 Security Labels"
-	depends on JFFS2_FS_XATTR
-	default y
-	help
-	  Security labels support alternative access control models
-	  implemented by security modules like SELinux.  This option
-	  enables an extended attribute handler for file security
-	  labels in the jffs2 filesystem.
-
-	  If you are not using a security module that requires using
-	  extended attributes for file security labels, say N.
-
-config JFFS2_COMPRESSION_OPTIONS
-	bool "Advanced compression options for JFFS2"
-	depends on JFFS2_FS
-	default n
-	help
-	  Enabling this option allows you to explicitly choose which
-	  compression modules, if any, are enabled in JFFS2. Removing
-	  compressors can mean you cannot read existing file systems,
-	  and enabling experimental compressors can mean that you
-	  write a file system which cannot be read by a standard kernel.
-
-	  If unsure, you should _definitely_ say 'N'.
-
-config JFFS2_ZLIB
-	bool "JFFS2 ZLIB compression support" if JFFS2_COMPRESSION_OPTIONS
-	select ZLIB_INFLATE
-	select ZLIB_DEFLATE
-	depends on JFFS2_FS
-	default y
-	help
-	  Zlib is designed to be a free, general-purpose, legally unencumbered,
-	  lossless data-compression library for use on virtually any computer
-	  hardware and operating system. See <http://www.gzip.org/zlib/> for
-	  further information.
-
-	  Say 'Y' if unsure.
-
-config JFFS2_LZO
-	bool "JFFS2 LZO compression support" if JFFS2_COMPRESSION_OPTIONS
-	select LZO_COMPRESS
-	select LZO_DECOMPRESS
-	depends on JFFS2_FS
-	default n
-	help
-	  minilzo-based compression. Generally works better than Zlib.
-
-	  This feature was added in July, 2007. Say 'N' if you need
-	  compatibility with older bootloaders or kernels.
-
-config JFFS2_RTIME
-	bool "JFFS2 RTIME compression support" if JFFS2_COMPRESSION_OPTIONS
-	depends on JFFS2_FS
-	default y
-	help
-	  Rtime does manage to recompress already-compressed data. Say 'Y' if unsure.
-
-config JFFS2_RUBIN
-	bool "JFFS2 RUBIN compression support" if JFFS2_COMPRESSION_OPTIONS
-	depends on JFFS2_FS
-	default n
-	help
-	  RUBINMIPS and DYNRUBIN compressors. Say 'N' if unsure.
-
-choice
-	prompt "JFFS2 default compression mode" if JFFS2_COMPRESSION_OPTIONS
-	default JFFS2_CMODE_PRIORITY
-	depends on JFFS2_FS
-	help
-	  You can set here the default compression mode of JFFS2 from
-	  the available compression modes. Don't touch if unsure.
-
-config JFFS2_CMODE_NONE
-	bool "no compression"
-	help
-	  Uses no compression.
-
-config JFFS2_CMODE_PRIORITY
-	bool "priority"
-	help
-	  Tries the compressors in a predefined order and chooses the first
-	  successful one.
-
-config JFFS2_CMODE_SIZE
-	bool "size (EXPERIMENTAL)"
-	help
-	  Tries all compressors and chooses the one which has the smallest
-	  result.
-
-config JFFS2_CMODE_FAVOURLZO
-	bool "Favour LZO"
-	help
-	  Tries all compressors and chooses the one which has the smallest
-	  result but gives some preference to LZO (which has faster
-	  decompression) at the expense of size.
-
-endchoice
-
+source "fs/jffs2/Kconfig"
 # UBIFS File system configuration
 source "fs/ubifs/Kconfig"
 
new file mode 100644
--- /dev/null
+++ b/fs/jffs2/Kconfig
@@ -0,0 +1,188 @@
+config JFFS2_FS
+	tristate "Journalling Flash File System v2 (JFFS2) support"
+	select CRC32
+	depends on MTD
+	help
+	  JFFS2 is the second generation of the Journalling Flash File System
+	  for use on diskless embedded devices. It provides improved wear
+	  levelling, compression and support for hard links. You cannot use
+	  this on normal block devices, only on 'MTD' devices.
+
+	  Further information on the design and implementation of JFFS2 is
+	  available at <http://sources.redhat.com/jffs2/>.
+
+config JFFS2_FS_DEBUG
+	int "JFFS2 debugging verbosity (0 = quiet, 2 = noisy)"
+	depends on JFFS2_FS
+	default "0"
+	help
+	  This controls the amount of debugging messages produced by the JFFS2
+	  code. Set it to zero for use in production systems. For evaluation,
+	  testing and debugging, it's advisable to set it to one. This will
+	  enable a few assertions and will print debugging messages at the
+	  KERN_DEBUG loglevel, where they won't normally be visible. Level 2
+	  is unlikely to be useful - it enables extra debugging in certain
+	  areas which at one point needed debugging, but when the bugs were
+	  located and fixed, the detailed messages were relegated to level 2.
+
+	  If reporting bugs, please try to have available a full dump of the
+	  messages at debug level 1 while the misbehaviour was occurring.
+
+config JFFS2_FS_WRITEBUFFER
+	bool "JFFS2 write-buffering support"
+	depends on JFFS2_FS
+	default y
+	help
+	  This enables the write-buffering support in JFFS2.
+
+	  This functionality is required to support JFFS2 on the following
+	  types of flash devices:
+	    - NAND flash
+	    - NOR flash with transparent ECC
+	    - DataFlash
+
+config JFFS2_FS_WBUF_VERIFY
+	bool "Verify JFFS2 write-buffer reads"
+	depends on JFFS2_FS_WRITEBUFFER
+	default n
+	help
+	  This causes JFFS2 to read back every page written through the
+	  write-buffer, and check for errors.
+
+config JFFS2_SUMMARY
+	bool "JFFS2 summary support (EXPERIMENTAL)"
+	depends on JFFS2_FS && EXPERIMENTAL
+	default n
+	help
+	  This feature makes it possible to use summary information
+	  for faster filesystem mount.
+
+	  The summary information can be inserted into a filesystem image
+	  by the utility 'sumtool'.
+
+	  If unsure, say 'N'.
+
+config JFFS2_FS_XATTR
+	bool "JFFS2 XATTR support (EXPERIMENTAL)"
+	depends on JFFS2_FS && EXPERIMENTAL
+	default n
+	help
+	  Extended attributes are name:value pairs associated with inodes by
+	  the kernel or by users (see the attr(5) manual page, or visit
+	  <http://acl.bestbits.at/> for details).
+
+	  If unsure, say N.
+
+config JFFS2_FS_POSIX_ACL
+	bool "JFFS2 POSIX Access Control Lists"
+	depends on JFFS2_FS_XATTR
+	default y
+	select FS_POSIX_ACL
+	help
+	  Posix Access Control Lists (ACLs) support permissions for users and
+	  groups beyond the owner/group/world scheme.
+
+	  To learn more about Access Control Lists, visit the Posix ACLs for
+	  Linux website <http://acl.bestbits.at/>.
+
+	  If you don't know what Access Control Lists are, say N
+
+config JFFS2_FS_SECURITY
+	bool "JFFS2 Security Labels"
+	depends on JFFS2_FS_XATTR
+	default y
+	help
+	  Security labels support alternative access control models
+	  implemented by security modules like SELinux.  This option
+	  enables an extended attribute handler for file security
+	  labels in the jffs2 filesystem.
+
+	  If you are not using a security module that requires using
+	  extended attributes for file security labels, say N.
+
+config JFFS2_COMPRESSION_OPTIONS
+	bool "Advanced compression options for JFFS2"
+	depends on JFFS2_FS
+	default n
+	help
+	  Enabling this option allows you to explicitly choose which
+	  compression modules, if any, are enabled in JFFS2. Removing
+	  compressors can mean you cannot read existing file systems,
+	  and enabling experimental compressors can mean that you
+	  write a file system which cannot be read by a standard kernel.
+
+	  If unsure, you should _definitely_ say 'N'.
+
+config JFFS2_ZLIB
+	bool "JFFS2 ZLIB compression support" if JFFS2_COMPRESSION_OPTIONS
+	select ZLIB_INFLATE
+	select ZLIB_DEFLATE
+	depends on JFFS2_FS
+	default y
+	help
+	  Zlib is designed to be a free, general-purpose, legally unencumbered,
+	  lossless data-compression library for use on virtually any computer
+	  hardware and operating system. See <http://www.gzip.org/zlib/> for
+	  further information.
+
+	  Say 'Y' if unsure.
+
+config JFFS2_LZO
+	bool "JFFS2 LZO compression support" if JFFS2_COMPRESSION_OPTIONS
+	select LZO_COMPRESS
+	select LZO_DECOMPRESS
+	depends on JFFS2_FS
+	default n
+	help
+	  minilzo-based compression. Generally works better than Zlib.
+
+	  This feature was added in July, 2007. Say 'N' if you need
+	  compatibility with older bootloaders or kernels.
+
+config JFFS2_RTIME
+	bool "JFFS2 RTIME compression support" if JFFS2_COMPRESSION_OPTIONS
+	depends on JFFS2_FS
+	default y
+	help
+	  Rtime does manage to recompress already-compressed data. Say 'Y' if unsure.
+
+config JFFS2_RUBIN
+	bool "JFFS2 RUBIN compression support" if JFFS2_COMPRESSION_OPTIONS
+	depends on JFFS2_FS
+	default n
+	help
+	  RUBINMIPS and DYNRUBIN compressors. Say 'N' if unsure.
+
+choice
+	prompt "JFFS2 default compression mode" if JFFS2_COMPRESSION_OPTIONS
+	default JFFS2_CMODE_PRIORITY
+	depends on JFFS2_FS
+	help
+	  You can set here the default compression mode of JFFS2 from
+	  the available compression modes. Don't touch if unsure.
+
+config JFFS2_CMODE_NONE
+	bool "no compression"
+	help
+	  Uses no compression.
+
+config JFFS2_CMODE_PRIORITY
+	bool "priority"
+	help
+	  Tries the compressors in a predefined order and chooses the first
+	  successful one.
+
+config JFFS2_CMODE_SIZE
+	bool "size (EXPERIMENTAL)"
+	help
+	  Tries all compressors and chooses the one which has the smallest
+	  result.
+
+config JFFS2_CMODE_FAVOURLZO
+	bool "Favour LZO"
+	help
+	  Tries all compressors and chooses the one which has the smallest
+	  result but gives some preference to LZO (which has faster
+	  decompression) at the expense of size.
+
+endchoice
