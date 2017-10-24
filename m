Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6t7c-000759-Qd
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 06:55:34 +0000
Received: by mail-pf0-x241.google.com with SMTP id x7so18999125pfa.1
 for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2017 23:55:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
Subject: [PATCH v2] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
Date: Mon, 23 Oct 2017 23:59:39 -0700
Message-Id: <1508828379-3479-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Intel SPI-NOR driver is dependent on LPC_ICH to get the platform
data. Select it in the Kconfig.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- Enforce dependency on PCI

 drivers/mtd/spi-nor/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index f26aaa6..abf453a 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -107,8 +107,9 @@ config SPI_INTEL_SPI_PCI
 
 config SPI_INTEL_SPI_PLATFORM
 	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
-	depends on X86
+	depends on X86 && PCI
 	select SPI_INTEL_SPI
+	select LPC_ICH
 	help
 	  This enables platform support for the Intel PCH/PCU SPI
 	  controller in master mode. This controller is present in modern
-- 
2.7.4
