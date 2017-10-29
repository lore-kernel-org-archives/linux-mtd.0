Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8vue-0003sX-TW
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 22:18:38 +0000
From: sathyanarayanan.kuppuswamy@linux.intel.com
To: marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 mika.westerberg@linux.intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sathyaosid@gmail.com,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v2 1/1] mtd: intel-spi: Add Intel Lewisburg PCH SPI super SKU
 PCI ID
Date: Sun, 29 Oct 2017 15:17:35 -0700
Message-Id: <77788f0c0cf55ee9fc0087364827da28c6951180.1509315023.git.sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20171029195809.GH29656@lahna.fi.intel.com>
References: <20171029195809.GH29656@lahna.fi.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

This patch adds Intel Lewisburg PCH SPI serial flash controller super
SKU PCI ID.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
 1 file changed, 1 insertion(+)

Changes since v1:
 * Rebased on top of Mika's SPI support patch.
 * Fixed the commit header to reflect the changes made.

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
index 7fa5b81..048c007 100644
--- a/drivers/mtd/spi-nor/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -65,6 +65,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
 static const struct pci_device_id intel_spi_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
+	{ PCI_VDEVICE(INTEL, 0xa224), (unsigned long)&bxt_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, intel_spi_pci_ids);
-- 
2.7.4
