Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqtjF-0006eW-N6
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 19:11:52 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/2] mtd/maps: gpio-addr-flash: pull in linux/ headers rather
	than asm/
Date: Thu, 24 Sep 2009 15:11:37 -0400
Message-Id: <1253819498-16780-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1253690210.4170.618.camel@macbook.infradead.org>
References: <1253690210.4170.618.camel@macbook.infradead.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that there are linux/ versions of gpio.h and io.h, include those
rather than hitting the asm/ versions.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/maps/gpio-addr-flash.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 44ef9a4..1ad5caf 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -13,7 +13,9 @@
  * Licensed under the GPL-2 or later.
  */
 
+#include <linux/gpio.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
@@ -23,9 +25,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#include <asm/gpio.h>
-#include <asm/io.h>
-
 #define pr_devinit(fmt, args...) ({ static const __devinitconst char __fmt[] = fmt; printk(__fmt, ## args); })
 
 #define DRIVER_NAME "gpio-addr-flash"
-- 
1.6.5.rc1
