Received: from mail.windriver.com ([147.11.1.11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akDMc-00070X-UP
 for linux-mtd@lists.infradead.org; Sun, 27 Mar 2016 16:16:32 +0000
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linux-kernel@vger.kernel.org>
CC: Paul Gortmaker <paul.gortmaker@windriver.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Greg
 Ungerer <gerg@snapgear.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] drivers/mtd: make maps/uclinux.c driver more explicitly
 non-modular
Date: Sun, 27 Mar 2016 12:13:54 -0400
Message-ID: <1459095234-20386-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Kconfig for this support is currently declared with:

config MTD_UCLINUX
        bool "Generic uClinux RAM/ROM filesystem support"

...meaning that it currently is not being built as a module by anyone.
Lets remove as much of the modular evidence that we can, so that when
reading the driver there is less doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

We also replace module.h with moduleparam.h since the file does use
a module_param,  and leaving it as such is currently the easiest way
to remain compatible with existing boot arg use cases.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Greg Ungerer <gerg@snapgear.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mtd/maps/uclinux.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index c1af83db5202..00a8190797ec 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -4,11 +4,13 @@
  *	uclinux.c -- generic memory mapped MTD driver for uclinux
  *
  *	(C) Copyright 2002, Greg Ungerer (gerg@snapgear.com)
+ *
+ *      License: GPL
  */
 
 /****************************************************************************/
 
-#include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -117,27 +119,6 @@ static int __init uclinux_mtd_init(void)
 
 	return(0);
 }
-
-/****************************************************************************/
-
-static void __exit uclinux_mtd_cleanup(void)
-{
-	if (uclinux_ram_mtdinfo) {
-		mtd_device_unregister(uclinux_ram_mtdinfo);
-		map_destroy(uclinux_ram_mtdinfo);
-		uclinux_ram_mtdinfo = NULL;
-	}
-	if (uclinux_ram_map.virt)
-		uclinux_ram_map.virt = 0;
-}
-
-/****************************************************************************/
-
-module_init(uclinux_mtd_init);
-module_exit(uclinux_mtd_cleanup);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Greg Ungerer <gerg@snapgear.com>");
-MODULE_DESCRIPTION("Generic MTD for uClinux");
+device_initcall(uclinux_mtd_init);
 
 /****************************************************************************/
-- 
2.6.1
