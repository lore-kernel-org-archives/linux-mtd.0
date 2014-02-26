Received: from mail-ea0-x236.google.com ([2a00:1450:4013:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIexz-0007tH-NB
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 13:56:08 +0000
Received: by mail-ea0-f182.google.com with SMTP id b10so6599eae.41
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 05:55:45 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: bcm47xxpart: allow enabling on ARCH_BCM_5301X
Date: Wed, 26 Feb 2014 14:55:39 +0100
Message-Id: <1393422939-25360-1-git-send-email-zajec5@gmail.com>
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
which can be nicely partitioned with bcm47xxpart.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.4.5
