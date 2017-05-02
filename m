Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5MNt-000122-6h
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 01:13:46 +0000
Received: by mail-pf0-x241.google.com with SMTP id v14so29849583pfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 18:13:23 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Ludovic Barre <ludovic.barre@st.com>
Subject: [PATCH] mtd: spi-nor: stm32-quadspi: allow building with COMPILE_TEST
Date: Mon,  1 May 2017 18:13:00 -0700
Message-Id: <20170502011300.137397-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index bfdfb1e72b38..293c8a4d1e49 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -108,7 +108,7 @@ config SPI_INTEL_SPI_PLATFORM
 
 config SPI_STM32_QUADSPI
 	tristate "STM32 Quad SPI controller"
-	depends on ARCH_STM32
+	depends on ARCH_STM32 || COMPILE_TEST
 	help
 	  This enables support for the STM32 Quad SPI controller.
 	  We only connect the NOR to this controller.
-- 
2.13.0.rc1.294.g07d810a77f-goog
