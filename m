Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDd1F-0001O0-8g
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 16:50:42 +0000
From: Philippe De Muyter <phdm@macqel.be>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: allow CONFIG_MTD_PHYSMAP_OF also for CONFIG_MTD_RAM
Date: Wed, 12 Feb 2014 17:49:45 +0100
Message-Id: <1392223785-21067-1-git-send-email-phdm@macqel.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Up to now mtd-ram devices described in device trees were only accessible
if mtd-flash or mtd-rom were also needed, because MTD_PHYSMAP_OF was
only available if (MTD_CFI || MTD_JEDECPROBE || MTD_ROM).  Allow
MTD_PHYSMAP_OF selection also when only MTD_RAM is set.

Signed-off-by: Philippe De Muyter <phdm@macqel.be>
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 310dc7c..a5ec303 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -67,7 +67,7 @@ config MTD_PHYSMAP_BANKWIDTH
 
 config MTD_PHYSMAP_OF
 	tristate "Flash device in physical memory map based on OF description"
-	depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
+	depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_RAM)
 	help
 	  This provides a 'mapping' driver which allows the NOR Flash and
 	  ROM driver code to communicate with chips which are mapped
-- 
1.7.5.3
