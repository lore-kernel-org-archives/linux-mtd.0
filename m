Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6tld-0004kn-R4
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 07:36:55 +0000
Received: by mail-pg0-x244.google.com with SMTP id a192so13833715pge.9
 for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2017 00:36:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
Subject: [PATCH] spi-nor: intel-spi: Remove EXPERT dependency
Date: Tue, 24 Oct 2017 00:40:53 -0700
Message-Id: <1508830853-4924-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The idea to have the intel-spi driver dependent on EXPERT was exactly
because we did not want ordinary users playing with the device and
inadvertently overwrite their BIOSes (if it is not protected). This
seems to be superfluous hence remove it.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 drivers/mtd/spi-nor/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index abf453a..be7cfb9 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -90,7 +90,7 @@ config SPI_INTEL_SPI
 	tristate
 
 config SPI_INTEL_SPI_PCI
-	tristate "Intel PCH/PCU SPI flash PCI driver" if EXPERT
+	tristate "Intel PCH/PCU SPI flash PCI driver"
 	depends on X86 && PCI
 	select SPI_INTEL_SPI
 	help
@@ -106,7 +106,7 @@ config SPI_INTEL_SPI_PCI
 	  will be called intel-spi-pci.
 
 config SPI_INTEL_SPI_PLATFORM
-	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
+	tristate "Intel PCH/PCU SPI flash platform driver"
 	depends on X86 && PCI
 	select SPI_INTEL_SPI
 	select LPC_ICH
-- 
2.7.4
