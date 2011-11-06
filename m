Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RN1MV-0006Nb-5N
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2011 11:58:07 +0000
Received: by bkat2 with SMTP id t2so4725546bka.36
 for <linux-mtd@lists.infradead.org>; Sun, 06 Nov 2011 03:58:01 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] MTD: MAPS: bcm963xx-flash.c: explicitly include module.h
Date: Sun,  6 Nov 2011 12:57:31 +0100
Message-Id: <1320580651-4860-1-git-send-email-jonas.gorski@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

module.h was previously implicitly included through mtd/mtd.h.

Fixes the following build failure after the module.h cleanup:

  CC      drivers/mtd/maps/bcm963xx-flash.o
drivers/mtd/maps/bcm963xx-flash.c: In function 'bcm963xx_probe':
drivers/mtd/maps/bcm963xx-flash.c:208:29: error: 'THIS_MODULE' undeclared (first use in this function)
drivers/mtd/maps/bcm963xx-flash.c:208:29: note: each undeclared identifier is reported only once for each function it appears in
drivers/mtd/maps/bcm963xx-flash.c: At top level:
drivers/mtd/maps/bcm963xx-flash.c:255:12: error: 'THIS_MODULE' undeclared here (not in a function)
drivers/mtd/maps/bcm963xx-flash.c:272:16: error: expected declaration specifiers or '...' before string constant
drivers/mtd/maps/bcm963xx-flash.c:272:1: warning: data definition has no type or storage class
drivers/mtd/maps/bcm963xx-flash.c:272:1: warning: type defaults to 'int' in declaration of 'MODULE_LICENSE'
drivers/mtd/maps/bcm963xx-flash.c:272:16: warning: function declaration isn't a prototype
drivers/mtd/maps/bcm963xx-flash.c:273:20: error: expected declaration specifiers or '...' before string constant
drivers/mtd/maps/bcm963xx-flash.c:273:1: warning: data definition has no type or storage class
drivers/mtd/maps/bcm963xx-flash.c:273:1: warning: type defaults to 'int' in declaration of 'MODULE_DESCRIPTION'
drivers/mtd/maps/bcm963xx-flash.c:273:20: warning: function declaration isn't a prototype
drivers/mtd/maps/bcm963xx-flash.c:274:15: error: expected declaration specifiers or '...' before string constant
drivers/mtd/maps/bcm963xx-flash.c:274:1: warning: data definition has no type or storage class
drivers/mtd/maps/bcm963xx-flash.c:274:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
drivers/mtd/maps/bcm963xx-flash.c:274:15: warning: function declaration isn't a prototype
drivers/mtd/maps/bcm963xx-flash.c:275:15: error: expected declaration specifiers or '...' before string constant
drivers/mtd/maps/bcm963xx-flash.c:275:1: warning: data definition has no type or storage class
drivers/mtd/maps/bcm963xx-flash.c:275:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
drivers/mtd/maps/bcm963xx-flash.c:275:15: warning: function declaration isn't a prototype
drivers/mtd/maps/bcm963xx-flash.c:276:15: error: expected declaration specifiers or '...' before string constant
drivers/mtd/maps/bcm963xx-flash.c:276:1: warning: data definition has no type or storage class
drivers/mtd/maps/bcm963xx-flash.c:276:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
drivers/mtd/maps/bcm963xx-flash.c:276:15: warning: function declaration isn't a prototype
make[7]: *** [drivers/mtd/maps/bcm963xx-flash.o] Error 1

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---

This patch is based on next-20111104 and probably should go through Paul's module.h cleanup tree.

 drivers/mtd/maps/bcm963xx-flash.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index 608967f..736ca10 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -21,6 +21,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/module.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-- 
1.7.2.5
