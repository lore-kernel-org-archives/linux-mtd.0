Message-Id: <200807301934.m6UJYu62012273@imap1.linux-foundation.org>
Subject: [patch 01/13] drivers/mtd/nand/nandsim.c needs div64.h
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:34:56 -0700
Cc: sfr@canb.auug.org.au, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andrew Morton <akpm@linux-foundation.org>

drivers/mtd/nand/nandsim.c: In function 'divide':
drivers/mtd/nand/nandsim.c:462: error: implicit declaration of function 'do_div'

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nandsim.c |    1 +
 1 file changed, 1 insertion(+)

diff -puN drivers/mtd/nand/nandsim.c~drivers-mtd-nand-nandsimc-needs-div64h drivers/mtd/nand/nandsim.c
--- a/drivers/mtd/nand/nandsim.c~drivers-mtd-nand-nandsimc-needs-div64h
+++ a/drivers/mtd/nand/nandsim.c
@@ -28,6 +28,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/vmalloc.h>
+#include <asm/div64.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/string.h>
_
