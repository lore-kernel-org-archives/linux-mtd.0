Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4eY8-0006V3-06
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 16:12:20 +0000
Received: from bagnes.atmel.com ([10.175.100.4])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id m56GBbx0003324
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2008 09:11:38 -0700 (PDT)
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: linux-mtd@lists.infradead.org, kernel@avr32linux.org
Subject: [PATCH 7/8] atmel_nand: make available on AVR32
Date: Fri,  6 Jun 2008 18:04:57 +0200
Message-Id: <1212768298-13614-8-git-send-email-haavard.skinnemoen@atmel.com>
In-Reply-To: <1212768298-13614-7-git-send-email-haavard.skinnemoen@atmel.com>
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-6-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-7-git-send-email-haavard.skinnemoen@atmel.com>
Cc: Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Andrew Victor <avictor.za@gmail.com>,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make the atmel_nand driver selectable on AVR32, and update the Kconfig
help text to reflect this.

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 drivers/mtd/nand/Kconfig |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 7bbf386..fcbdf87 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -273,18 +273,18 @@ config MTD_NAND_CS553X
 	  If you say "m", the module will be called "cs553x_nand.ko".
 
 config MTD_NAND_ATMEL
-	bool "Support for NAND Flash / SmartMedia on AT91"
-	depends on ARCH_AT91
+	bool "Support for NAND Flash / SmartMedia on AT91 and AVR32"
+	depends on ARCH_AT91 || AVR32
 	help
 	  Enables support for NAND Flash / Smart Media Card interface
-	  on Atmel AT91 processors.
+	  on Atmel AT91 and AVR32 processors.
 choice
-	prompt "ECC management for NAND Flash / SmartMedia on AT91"
+	prompt "ECC management for NAND Flash / SmartMedia on AT91 / AVR32"
 	depends on MTD_NAND_ATMEL
 
 config MTD_NAND_ATMEL_ECC_HW
 	bool "Hardware ECC"
-	depends on ARCH_AT91SAM9263 || ARCH_AT91SAM9260
+	depends on ARCH_AT91SAM9263 || ARCH_AT91SAM9260 || AVR32
 	help
 	  Use hardware ECC instead of software ECC when the chip
 	  supports it.
-- 
1.5.5.1
