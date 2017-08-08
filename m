Received: from mga06.intel.com ([134.134.136.31])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfDSe-0003yx-JC
 for linux-mtd@lists.infradead.org; Tue, 08 Aug 2017 22:58:54 +0000
From: matthew.gerlach@linux.intel.com
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 ludovic.barre@st.com, linux-kernel@vger.kernel.org
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH] mtd: spi-nor: fix "No newline at end of file"
Date: Tue,  8 Aug 2017 15:58:26 -0700
Message-Id: <1502233106-24777-1-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Add a newline to the end of drivers/spi-nor/Makefile to get rid the message,
"No newline at end of file", produced by git.  This fix will allow subsequent
changes to the file to be able to produce clean patches.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
 drivers/mtd/spi-nor/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index c5f171d..7d84c51 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -9,4 +9,4 @@ obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
 obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
 obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
-obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
\ No newline at end of file
+obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
-- 
2.7.4
