Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJQpU-0005Kc-5I
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2014 17:02:32 +0000
Received: by mail-ee0-f46.google.com with SMTP id d49so2407643eek.33
 for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2014 09:02:09 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V2] mtd: bcm47xxpart: allow enabling on ARCH_BCM_5301X
Date: Fri, 28 Feb 2014 18:02:01 +0100
Message-Id: <1393606921-9488-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1393422939-25360-1-git-send-email-zajec5@gmail.com>
References: <1393422939-25360-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Home routers based on SoCs like BCM53010 (AKA BCM4708) use flashes
which can be nicely partitioned with bcm47xxpart. Header bcm47xx_nvram.h
is not available on bcm53xx, so don't include it.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/Kconfig       | 2 +-
 drivers/mtd/bcm47xxpart.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 5ebcda3..5d49a21 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -150,7 +150,7 @@ config MTD_BCM63XX_PARTS
 
 config MTD_BCM47XX_PARTS
 	tristate "BCM47XX partitioning support"
-	depends on BCM47XX
+	depends on BCM47XX || ARCH_BCM_5301X
 	help
 	  This provides partitions parser for devices based on BCM47xx
 	  boards.
diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 23d7122..adfa74c 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -14,7 +14,6 @@
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-#include <bcm47xx_nvram.h>
 
 /* 10 parts were found on sflash on Netgear WNDR4500 */
 #define BCM47XXPART_MAX_PARTS		12
@@ -30,6 +29,7 @@
 #define BOARD_DATA_MAGIC2		0xBD0D0BBD
 #define CFE_MAGIC			0x43464531	/* 1EFC */
 #define FACTORY_MAGIC			0x59544346	/* FCTY */
+#define NVRAM_HEADER			0x48534C46	/* FLSH */
 #define POT_MAGIC1			0x54544f50	/* POTT */
 #define POT_MAGIC2			0x504f		/* OP */
 #define ML_MAGIC1			0x39685a42
-- 
1.8.4.5
