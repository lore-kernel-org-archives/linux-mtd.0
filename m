From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/3] MTD: atmel_nand can be modular
Date: Fri, 20 Jun 2008 09:48:32 +0200
Message-Id: <1213948112-22348-3-git-send-email-haavard.skinnemoen@atmel.com>
In-Reply-To: <1213948112-22348-2-git-send-email-haavard.skinnemoen@atmel.com>
References: <1213948112-22348-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1213948112-22348-2-git-send-email-haavard.skinnemoen@atmel.com>
Cc: Andrew Victor <andrew@sanpeople.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

There's no reason to prevent the Atmel NAND driver from
building as a module.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 drivers/mtd/nand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index d8c0d86..71406e5 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -272,7 +272,7 @@ config MTD_NAND_CS553X
 	  If you say "m", the module will be called "cs553x_nand.ko".
 
 config MTD_NAND_ATMEL
-	bool "Support for NAND Flash / SmartMedia on AT91 and AVR32"
+	tristate "Support for NAND Flash / SmartMedia on AT91 and AVR32"
 	depends on ARCH_AT91 || AVR32
 	help
 	  Enables support for NAND Flash / Smart Media Card interface
-- 
1.5.5.3
