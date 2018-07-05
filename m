Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb0q6-0002IN-CZ
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 09:46:35 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org
Subject: [PATCH 21/27] bcma: Allow selection of this driver when COMPILE_TEST=y
Date: Thu,  5 Jul 2018 11:45:16 +0200
Message-Id: <20180705094522.12138-22-boris.brezillon@bootlin.com>
In-Reply-To: <20180705094522.12138-1-boris.brezillon@bootlin.com>
References: <20180705094522.12138-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allows us to increase compile-test coverage without having to build
a kernel for MIPS.  That's particularly interesting for subsystem
maintainers that want to test as many drivers as possible in a single
build.

We also add a dependency on HAS_IOMEM in BCMA_HOST_SOC to make sure the
driver is not selected when the arch does not implement IO accessors.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/bcma/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bcma/Kconfig b/drivers/bcma/Kconfig
index cb0f1aad20b7..b9558ff20830 100644
--- a/drivers/bcma/Kconfig
+++ b/drivers/bcma/Kconfig
@@ -30,6 +30,7 @@ config BCMA_HOST_PCI
 
 config BCMA_HOST_SOC
 	bool "Support for BCMA in a SoC"
+	depends on HAS_IOMEM
 	help
 	  Host interface for a Broadcom AIX bus directly mapped into
 	  the memory. This only works with the Broadcom SoCs from the
@@ -61,7 +62,7 @@ config BCMA_DRIVER_PCI_HOSTMODE
 
 config BCMA_DRIVER_MIPS
 	bool "BCMA Broadcom MIPS core driver"
-	depends on MIPS
+	depends on MIPS || COMPILE_TEST
 	help
 	  Driver for the Broadcom MIPS core attached to Broadcom specific
 	  Advanced Microcontroller Bus.
-- 
2.14.1
