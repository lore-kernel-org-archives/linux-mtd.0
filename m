Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkYnd-0004PX-RM
 for linux-mtd@lists.infradead.org; Thu, 15 Sep 2016 15:42:10 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Michal Suchanek <hramrach@gmail.com>,
 =?UTF-8?q?Ezequiel=20Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: don't include linux/mtd/cfi.h from header
Date: Thu, 15 Sep 2016 17:41:11 +0200
Message-Id: <20160915154139.3003332-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The newly added broadcom qspi driver in drivers/spi produces a build
warning when CONFIG_MTD is disabled:

include/linux/mtd/cfi.h:76:2: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]

Since drivers like this one don't actually need the cfi.h header,
we can just remove it from the spi-nor.h file and add it to
the only place that actually needs it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: fa236a7ef240 ("spi: bcm-qspi: Add Broadcom MSPI driver")
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 include/linux/mtd/spi-nor.h   | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165d7d66..94afcb9fdaf7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -21,6 +21,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
 #include <linux/spi/flash.h>
+#include <linux/mtd/cfi.h>
 #include <linux/mtd/spi-nor.h>
 
 /* Define max times to check status register before we give up. */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c425c7b4c2a0..60ef29565743 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -11,7 +11,6 @@
 #define __LINUX_MTD_SPI_NOR_H
 
 #include <linux/bitops.h>
-#include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 
 /*
-- 
2.9.0
