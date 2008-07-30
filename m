Message-Id: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
Subject: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:34:56 -0700
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	trimarchimichael@yahoo.it, akpm@linux-foundation.org,
	jwboyer@gmail.com, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michael Trimarchi <trimarchimichael@yahoo.it>

arm:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
[00000000] *pgd=00000000
stopped custom tracer.
Internal error: Oops: 817 [#1] PREEMPT
Modules linked in:
CPU: 0    Not tainted  (2.6.24-rc5-rt1 #37)
PC is at dma_cache_maint+0x40/0x80
LR is at atmel_spi_transfer+0x94/0x178

This is because the SPI layer is using DMA transfers to support jffs2 I/O, and
apparently jffs2 isn't used to having DMA done against this buffer.  DMA
against vmalloced memory plain isn't allowed.

This patch will probably break all sorts of things because that buffer is
&*large*: up to half a meg.

So this patch isn't mergeable.  I'll hang onto it to bug dmwm2 with when he
reincarnates.

Cc: David Brownell <david-b@pacbell.net>
Cc: Josh Boyer <jwboyer@gmail.com>
Cc: Russell King <rmk@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/jffs2/summary.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff -puN fs/jffs2/summary.c~jffs2-summary-allocation-dont-use-vmalloc fs/jffs2/summary.c
--- a/fs/jffs2/summary.c~jffs2-summary-allocation-dont-use-vmalloc
+++ a/fs/jffs2/summary.c
@@ -17,7 +17,6 @@
 #include <linux/pagemap.h>
 #include <linux/crc32.h>
 #include <linux/compiler.h>
-#include <linux/vmalloc.h>
 #include "nodelist.h"
 #include "debug.h"
 
@@ -30,7 +29,7 @@ int jffs2_sum_init(struct jffs2_sb_info 
 		return -ENOMEM;
 	}
 
-	c->summary->sum_buf = vmalloc(c->sector_size);
+	c->summary->sum_buf = kmalloc(c->sector_size, GFP_KERNEL);
 
 	if (!c->summary->sum_buf) {
 		JFFS2_WARNING("Can't allocate buffer for writing out summary information!\n");
@@ -49,7 +48,7 @@ void jffs2_sum_exit(struct jffs2_sb_info
 
 	jffs2_sum_disable_collecting(c->summary);
 
-	vfree(c->summary->sum_buf);
+	kfree(c->summary->sum_buf);
 	c->summary->sum_buf = NULL;
 
 	kfree(c->summary);
_
