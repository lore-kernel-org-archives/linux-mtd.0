Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eif1P-0001V1-Us
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 11:33:17 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/2] spi-nor: intel-spi: Explicitly mark the driver as
 dangerous in Kconfig
Date: Mon,  5 Feb 2018 14:33:00 +0300
Message-Id: <20180205113300.21270-2-mika.westerberg@linux.intel.com>
In-Reply-To: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
References: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver is not meant for normal users at all but instead such users
who really know what they are doing and are able to build their own
kernel to enable it. Mark both driver Kconfig entries as dangerous to
make sure the driver is not accidentally enabled without understanding
possible consequences in doing so.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
No changes from v1.

 drivers/mtd/spi-nor/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 89da88e59121..f480b227a6b8 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -90,7 +90,7 @@ config SPI_INTEL_SPI
 	tristate
 
 config SPI_INTEL_SPI_PCI
-	tristate "Intel PCH/PCU SPI flash PCI driver"
+	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
 	depends on X86 && PCI
 	select SPI_INTEL_SPI
 	help
@@ -106,7 +106,7 @@ config SPI_INTEL_SPI_PCI
 	  will be called intel-spi-pci.
 
 config SPI_INTEL_SPI_PLATFORM
-	tristate "Intel PCH/PCU SPI flash platform driver"
+	tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
 	depends on X86
 	select SPI_INTEL_SPI
 	help
-- 
2.15.1
