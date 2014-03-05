Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLKo1-0003tr-6G
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 23:00:54 +0000
From: Philippe De Muyter <phdm@macqel.be>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND] mtd: allow CONFIG_MTD_PHYSMAP_OF also for
 CONFIG_MTD_RAM
Date: Thu,  6 Mar 2014 00:00:00 +0100
Message-Id: <1394060400-25149-1-git-send-email-phdm@macqel.be>
In-Reply-To: <1392223785-21067-1-git-send-email-phdm@macqel.be>
References: <1392223785-21067-1-git-send-email-phdm@macqel.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Up to now mtd-ram devices described in device trees were only accessible
if mtd-flash or mtd-rom were also configured at linux configuration
time, because MTD_PHYSMAP_OF was only available if (MTD_CFI ||
MTD_JEDECPROBE || MTD_ROM).  Allow MTD_PHYSMAP_OF selection also
when only MTD_RAM is set.

Signed-off-by: Philippe De Muyter <phdm@macqel.be>
---
 drivers/mtd/maps/Kconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 310dc7c..aa9addd 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -66,11 +66,11 @@ config MTD_PHYSMAP_BANKWIDTH
 	  used internally by the CFI drivers.
 
 config MTD_PHYSMAP_OF
-	tristate "Flash device in physical memory map based on OF description"
-	depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM)
+	tristate "Memory device in physical memory map based on OF description"
+	depends on OF && (MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_RAM)
 	help
-	  This provides a 'mapping' driver which allows the NOR Flash and
-	  ROM driver code to communicate with chips which are mapped
+	  This provides a 'mapping' driver which allows the NOR Flash, ROM
+	  and RAM driver code to communicate with chips which are mapped
 	  physically into the CPU's memory. The mapping description here is
 	  taken from OF device tree.
 
-- 
1.7.5.3
