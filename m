Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj1jD-0006Uk-32
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 00:30:23 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: joern@logfs.org
Subject: Re: [patch 1/15] Makefiles and Kconfig
Date: Tue, 8 Apr 2008 02:30:16 +0200
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833001@logfs.org>
In-Reply-To: <20080401181332.853833001@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804080230.17426.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 01 April 2008, joern@logfs.org wrote:
> --- linux-2.6.24logfs/fs/Kconfig~logfs	2008-03-24 12:39:10.190939342 +0100
> +++ linux-2.6.24logfs/fs/Kconfig	2008-04-01 19:48:18.517351063 +0200
> @@ -1385,6 +1385,23 @@ config JFFS2_CMODE_FAVOURLZO
>  
>  endchoice
>  
> +config LOGFS
> +	bool "Log Filesystem (EXPERIMENTAL)"

Is it really still the "Log Filesystem"? By now, I had the impression
that "logfs" is a name by itself, so it should be called the
"Logfs file system", and "config LOGFS_FS" respectively, like
JFFS2_FS, REISERFS_FS, AUTOFS_FS, UDF_FS etc.

> --- /dev/null	2008-03-30 12:15:48.586669308 +0200
> +++ linux-2.6.24logfs/fs/logfs/Makefile	2008-04-01 19:48:07.170961891 +0200
> @@ -0,0 +1,14 @@
> +obj-$(CONFIG_LOGFS)	+= logfs.o
> +
> +logfs-y	+= compr.o
> +logfs-y	+= dir.o
> +logfs-y	+= file.o
> +logfs-y	+= gc.o
> +logfs-y	+= inode.o
> +logfs-y	+= journal.o
> +logfs-y	+= memtree.o
> +logfs-y	+= readwrite.o
> +logfs-y	+= segment.o
> +logfs-y	+= super.o
> +logfs-$(CONFIG_BLOCK)	+= dev_bdev.o
> +logfs-$(CONFIG_MTD)	+= dev_mtd.o

You shouldn't add the Makefile and Kconfig before adding the actual
files, or you could cause git-bisect problems.

	Arnd <><
