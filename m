Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dl9fh-0000fW-2O
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 08:08:54 +0000
Received: by mail-io0-x243.google.com with SMTP id o196so1003841ioe.1
 for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2017 01:08:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
Subject: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
Date: Fri, 25 Aug 2017 01:12:51 -0700
Message-Id: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
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

 drivers/mtd/spi-nor/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index bfdfb1e..e998800 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -93,6 +93,7 @@ config SPI_INTEL_SPI_PLATFORM
 	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
 	depends on X86
 	select SPI_INTEL_SPI
+	select LPC_ICH
 	help
 	  This enables platform support for the Intel PCH/PCU SPI
 	  controller in master mode. This controller is present in modern
-- 
2.9.2
