Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MuutR-0003tp-NF
	for linux-mtd@lists.infradead.org; Mon, 05 Oct 2009 21:14:58 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] mtd/maps: gpio-addr-flash: pull in linux/ headers rather
	than asm/
Date: Mon,  5 Oct 2009 17:14:48 -0400
Message-Id: <1254777289-32109-3-git-send-email-vapier@gentoo.org>
In-Reply-To: <1254777289-32109-1-git-send-email-vapier@gentoo.org>
References: <1254777289-32109-1-git-send-email-vapier@gentoo.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
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
1.6.5.rc2
