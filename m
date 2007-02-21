Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJp7a-0002u6-FQ
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 05:54:53 -0500
Date: Wed, 21 Feb 2007 11:52:46 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@linux-foundation.org>, dedekind@infradead.org
Subject: [-mm patch] MTD_UBI_DEBUG must depend on SYSFS
Message-ID: <20070221105246.GB13958@stusta.de>
References: <20070217215146.30e7ffa3.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070217215146.30e7ffa3.akpm@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 17, 2007 at 09:51:46PM -0800, Andrew Morton wrote:
>...
> Changes since 2.6.20-mm1:
>...
>  git-ubi.patch
>...
>  git trees
>...


If you select an option, you have to ensure that the dependencies of all 
options you are select'ing are fulfilled.

This patch fixes the following compile error:

<--  snip  -->

...
  LD      .tmp_vmlinux1
fs/built-in.o: In function `debugfs_init':
inode.c:(.init.text+0x3621): undefined reference to `kernel_subsys'
make[1]: *** [.tmp_vmlinux1] Error 1

<--  snip  -->

I've also removed the superfluous "default n".

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---
--- linux-2.6.20-mm2/drivers/mtd/ubi/Kconfig.debug.old	2007-02-20 19:57:23.000000000 +0100
+++ linux-2.6.20-mm2/drivers/mtd/ubi/Kconfig.debug	2007-02-20 19:57:51.000000000 +0100
@@ -5,7 +5,7 @@
 
 config MTD_UBI_DEBUG
 	bool "UBI debugging"
-	default n
+	depends on SYSFS
 	depends on MTD_UBI
 	select DEBUG_FS
 	select KALLSYMS_ALL
