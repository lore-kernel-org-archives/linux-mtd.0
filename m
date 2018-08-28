Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuhD0-0001id-8J
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 16:51:15 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI serial
 flash
Date: Tue, 28 Aug 2018 19:50:59 +0300
Message-Id: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Intel Ice Lake exposes the SPI serial flash controller as a PCI device
in the same way than Intel Denverton. Add Ice Lake SPI serial flash PCI
ID to the driver list of supported devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
index c0976f2e3dd1..872b40922608 100644
--- a/drivers/mtd/spi-nor/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -65,6 +65,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
 static const struct pci_device_id intel_spi_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
+	{ PCI_VDEVICE(INTEL, 0x34a4), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0xa224), (unsigned long)&bxt_info },
 	{ },
-- 
2.18.0
