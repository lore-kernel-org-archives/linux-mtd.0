Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U3P9J-0006kH-Hy
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2013 10:56:14 +0000
Received: by mail-ee0-f49.google.com with SMTP id d4so1199583eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2013 02:56:11 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] mtd: bcm47xxnflash: use pr_fmt for module prefix in messages
Date: Thu,  7 Feb 2013 11:56:04 +0100
Message-Id: <1360234564-6455-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |    4 ++++
 drivers/mtd/nand/bcm47xxnflash/main.c          |    4 ++--
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c   |    4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
index 0bdb2ce..c005a62 100644
--- a/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
+++ b/drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
@@ -1,6 +1,10 @@
 #ifndef __BCM47XXNFLASH_H
 #define __BCM47XXNFLASH_H
 
+#ifndef pr_fmt
+#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
+#endif
+
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 
diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index a52acdc..7bae569 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -9,14 +9,14 @@
  *
  */
 
+#include "bcm47xxnflash.h"
+
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/bcma/bcma.h>
 
-#include "bcm47xxnflash.h"
-
 MODULE_DESCRIPTION("NAND flash driver for BCMA bus");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rafał Miłecki");
diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index 595de40..b2ab373 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -9,13 +9,13 @@
  *
  */
 
+#include "bcm47xxnflash.h"
+
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/bcma/bcma.h>
 
-#include "bcm47xxnflash.h"
-
 /* Broadcom uses 1'000'000 but it seems to be too many. Tests on WNDR4500 has
  * shown ~1000 retries as maxiumum. */
 #define NFLASH_READY_RETRIES		10000
-- 
1.7.10.4
