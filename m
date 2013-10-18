From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v2 05/27] mtd: nand: pxa3xx: Make config menu show supported
 platforms
Date: Fri, 18 Oct 2013 20:02:32 -0300
Message-Id: <1382137374-21251-6-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since we have now support for the NFCv2 controller found on
Armada 370/XP platforms.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index d885298..791d219 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -354,11 +354,11 @@ config MTD_NAND_ATMEL
 	  on Atmel AT91 and AVR32 processors.
 
 config MTD_NAND_PXA3xx
-	tristate "Support for NAND flash devices on PXA3xx"
+	tristate "NAND support on PXA3xx and Armada 370/XP"
 	depends on PXA3xx || ARCH_MMP || PLAT_ORION
 	help
 	  This enables the driver for the NAND flash device found on
-	  PXA3xx processors
+	  PXA3xx processors (NFCv1) and also on Armada 370/XP (NFCv2).
 
 config MTD_NAND_SLC_LPC32XX
 	tristate "NXP LPC32xx SLC Controller"
-- 
1.8.1.5
