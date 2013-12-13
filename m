Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrTGa-00073v-1a
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 13:58:56 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] mtd: Hide CONFIG_MTD_BLKDEVS from the menu
Date: Fri, 13 Dec 2013 10:58:44 -0300
Message-Id: <1386943124-8005-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make this option a hidden one and get a cleaner configuration.
This option just selects a common infrastructure for MTD-based devices
to expose a block interface. There is no point in allowing a separate
enable/disable.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 5fab4e6e..2a0ca2a 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -158,9 +158,7 @@ config MTD_BCM47XX_PARTS
 comment "User Modules And Translation Layers"
 
 config MTD_BLKDEVS
-	tristate "Common interface to block layer for MTD 'translation layers'"
-	depends on BLOCK
-	default n
+	bool
 
 config MTD_BLOCK
 	tristate "Caching block device access to MTD devices"
-- 
1.8.1.5
