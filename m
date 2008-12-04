Received: from an-out-0708.google.com ([209.85.132.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L82Hn-0005q7-QW
	for linux-mtd@lists.infradead.org; Thu, 04 Dec 2008 00:41:43 +0000
Received: by an-out-0708.google.com with SMTP id d40so1855775and.27
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Dec 2008 16:41:42 -0800 (PST)
Message-ID: <a4423d670812031641r70044496pb65eea3469c56283@mail.gmail.com>
Date: Thu, 4 Dec 2008 03:41:42 +0300
From: "Alexander Beregalov" <a.beregalov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2/UBIFS select zlib/lzo even if compression is disabled
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I have found the following misbehaviour:

# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set

# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y

config JFFS2_ZLIB
        bool "JFFS2 ZLIB compression support" if JFFS2_COMPRESSION_OPTIONS
        select ZLIB_INFLATE
        select ZLIB_DEFLATE
        depends on JFFS2_FS
        default y

Is it an error in kconfig scripts for a long time or should it be
described differently in Kconfig?
Something like this

config JFFS2_ZLIB
        bool "JFFS2 ZLIB compression support" if JFFS2_COMPRESSION_OPTIONS
        select ZLIB_INFLATE
        select ZLIB_DEFLATE
-        depends on JFFS2_FS
+        depends on JFFS2_FS && JFFS2_COMPRESSION_OPTIONS

But it looks ugly
