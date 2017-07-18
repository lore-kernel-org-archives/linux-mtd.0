Received: from smtp.transmode.se ([31.15.61.139])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dXRCg-0004oS-6N
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 12:02:19 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: linux-mtd@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH] lpc_ich: Avoton/Rangeley uses SPI_BYT method.
Date: Tue, 18 Jul 2017 14:01:45 +0200
Message-Id: <20170718120145.13585-1-joakim.tjernlund@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 drivers/mfd/lpc_ich.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 985135828cfc..023d88dfad0e 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -532,6 +532,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 		.name = "Avoton SoC",
 		.iTCO_version = 3,
 		.gpio_version = AVOTON_GPIO,
+		.spi_type = INTEL_SPI_BYT,
 	},
 	[LPC_BAYTRAIL] = {
 		.name = "Bay Trail SoC",
-- 
2.13.0
