Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNKqp-0005Nv-5v
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 13:04:51 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 4/4] mtd: denali_pci: switch to dev_err()
Date: Thu,  6 Aug 2015 16:04:24 +0300
Message-Id: <1438866264-11091-4-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1438866264-11091-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1438866264-11091-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is better to have device name prefixed the actual error message.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/nand/denali_pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index ad16e2e..de31514 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -41,7 +41,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	ret = pcim_enable_device(dev);
 	if (ret) {
-		pr_err("Spectra: pci_enable_device failed.\n");
+		dev_err(&dev->dev, "Spectra: pci_enable_device failed.\n");
 		return ret;
 	}
 
@@ -69,19 +69,19 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
-		pr_err("Spectra: Unable to request memory regions\n");
+		dev_err(&dev->dev, "Spectra: Unable to request memory regions\n");
 		return ret;
 	}
 
 	denali->flash_reg = ioremap_nocache(csr_base, csr_len);
 	if (!denali->flash_reg) {
-		pr_err("Spectra: Unable to remap memory region\n");
+		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
 		return -ENOMEM;
 	}
 
 	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
 	if (!denali->flash_mem) {
-		pr_err("Spectra: ioremap_nocache failed!");
+		dev_err(&dev->dev, "Spectra: ioremap_nocache failed!");
 		ret = -ENOMEM;
 		goto failed_remap_reg;
 	}
-- 
2.4.6
