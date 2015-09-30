Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhKef-0006VK-2F
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 16:54:58 +0000
Received: by pacex6 with SMTP id ex6so45860141pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 09:54:35 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Alexey Klimov <klimov.linux@gmail.com>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH] mtd: nand: vf610_nfc: include missing pincrl/consumer.h
Date: Wed, 30 Sep 2015 09:54:26 -0700
Message-Id: <1443632066-69967-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This must have been implicitly included on the builds I tested. Reported
by numerous test bots:

   drivers/mtd/nand/vf610_nfc.c: In function 'vf610_nfc_resume':
   drivers/mtd/nand/vf610_nfc.c:660:2: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Werror=implicit-function-declaration]
     pinctrl_pm_select_default_state(dev);
     ^

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Bill Pringlemeir <bpringlemeir@nbsps.com>
Cc: Alexey Klimov <klimov.linux@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/vf610_nfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 42dad8e4b26f..ae1f84e3d635 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -35,6 +35,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of_mtd.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-- 
2.6.0.rc2.230.g3dd15c0
