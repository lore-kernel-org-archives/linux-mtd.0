Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUoPd-00057g-Ol
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 10:41:37 -0500
Date: Thu, 18 Nov 2004 16:41:10 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>, dwmw2@infradead.org
Message-ID: <20041118154110.GE4943@stusta.de>
References: <20041118021538.5764d58c.akpm@osdl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20041118021538.5764d58c.akpm@osdl.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 18, 2004 at 02:15:38AM -0800, Andrew Morton wrote:
>...
> Changes since 2.6.10-rc2-mm1:
>...
>  bk-mtd.patch
>...

Ths causes the following compile error:

<--  snip  -->

...
  CC      drivers/mtd/chips/cfi_probe.o
In file included from drivers/mtd/chips/cfi_probe.c:18:
include/linux/mtd/xip.h:77:2: #error "missing IRQ and timer primitives for XIP MTD support"
{standard input}: Assembler messages:
{standard input}:5: Warning: ignoring changed section attributes for .data
make[3]: *** [drivers/mtd/chips/cfi_probe.o] Error 1

<--  snip  -->


Let's put the dependencies from the #error into the Kconfig file:


Signed-off-by: Adrian Bunk <bunk@fs.tum.de>

--- linux-2.6.10-rc2-mm2-full/drivers/mtd/chips/Kconfig.old	2004-11-18 16:35:40.000000000 +0100
+++ linux-2.6.10-rc2-mm2-full/drivers/mtd/chips/Kconfig	2004-11-18 16:38:37.000000000 +0100
@@ -274,7 +274,7 @@
 
 config MTD_XIP
 	bool "XIP aware MTD support"
-	depends on !SMP && MTD_CFI_INTELEXT && EXPERIMENTAL
+	depends on !SMP && MTD_CFI_INTELEXT && (ARCH_SA1100 || ARCH_PXA) && EXPERIMENTAL
 	default y if XIP_KERNEL
 	help
 	  This allows MTD support to work with flash memory which is also
