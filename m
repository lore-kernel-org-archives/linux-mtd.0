Received: from viridian.itc.virginia.edu ([128.143.12.139])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TaW6t-0008Ik-Ks
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2012 18:30:20 +0000
From: Bill Pemberton <wfp5p@virginia.edu>
To: gregkh@linuxfoundation.org
Subject: [PATCH 363/493] mtd: remove use of __devinitconst
Date: Mon, 19 Nov 2012 13:25:12 -0500
Message-Id: <1353349642-3677-363-git-send-email-wfp5p@virginia.edu>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CONFIG_HOTPLUG is going away as an option so __devinitconst is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: David Woodhouse <dwmw2@infradead.org> 
Cc: linux-mtd@lists.infradead.org 
---
 drivers/mtd/maps/bfin-async-flash.c | 2 +-
 drivers/mtd/maps/gpio-addr-flash.c  | 2 +-
 drivers/mtd/maps/lantiq-flash.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 658a7d0..6057c64 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -30,7 +30,7 @@
 #include <linux/io.h>
 #include <asm/unaligned.h>
 
-#define pr_devinit(fmt, args...) ({ static const __devinitconst char __fmt[] = fmt; printk(__fmt, ## args); })
+#define pr_devinit(fmt, args...) ({ static const char __fmt[] = fmt; printk(__fmt, ## args); })
 
 #define DRIVER_NAME "bfin-async-flash"
 
diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 9a6a3e1..4babe04 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -26,7 +26,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define pr_devinit(fmt, args...) ({ static const __devinitconst char __fmt[] = fmt; printk(__fmt, ## args); })
+#define pr_devinit(fmt, args...) ({ static const char __fmt[] = fmt; printk(__fmt, ## args); })
 
 #define DRIVER_NAME "gpio-addr-flash"
 #define PFX DRIVER_NAME ": "
diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 58d1f61..0cf6c73 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -45,7 +45,7 @@ struct ltq_mtd {
 };
 
 static const char ltq_map_name[] = "ltq_nor";
-static const char *ltq_probe_types[] __devinitconst = {
+static const char *ltq_probe_types[] = {
 					"cmdlinepart", "ofpart", NULL };
 
 static map_word
-- 
1.8.0
