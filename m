Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNKqn-0005Nv-Eo
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 13:04:51 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 3/4] mtd: denali_pci: refactor driver using devres API
Date: Thu,  6 Aug 2015 16:04:23 +0300
Message-Id: <1438866264-11091-3-git-send-email-andriy.shevchenko@linux.intel.com>
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

In recent kernels we have a lot of helper functions, including
devres API, to make life of device driver developer easy.

Convert the driver using devm_kzalloc() and pcim_enable_device().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/nand/denali_pci.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 29e5d0c..ad16e2e 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -30,19 +30,19 @@ MODULE_DEVICE_TABLE(pci, denali_pci_ids);
 
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	int ret = -ENODEV;
+	int ret;
 	resource_size_t csr_base, mem_base;
 	unsigned long csr_len, mem_len;
 	struct denali_nand_info *denali;
 
-	denali = kzalloc(sizeof(*denali), GFP_KERNEL);
+	denali = devm_kzalloc(&dev->dev, sizeof(*denali), GFP_KERNEL);
 	if (!denali)
 		return -ENOMEM;
 
-	ret = pci_enable_device(dev);
+	ret = pcim_enable_device(dev);
 	if (ret) {
 		pr_err("Spectra: pci_enable_device failed.\n");
-		goto failed_alloc_memery;
+		return ret;
 	}
 
 	if (id->driver_data == INTEL_CE4100) {
@@ -70,14 +70,13 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
 		pr_err("Spectra: Unable to request memory regions\n");
-		goto failed_enable_dev;
+		return ret;
 	}
 
 	denali->flash_reg = ioremap_nocache(csr_base, csr_len);
 	if (!denali->flash_reg) {
 		pr_err("Spectra: Unable to remap memory region\n");
-		ret = -ENOMEM;
-		goto failed_req_regions;
+		return -ENOMEM;
 	}
 
 	denali->flash_mem = ioremap_nocache(mem_base, mem_len);
@@ -99,13 +98,6 @@ failed_remap_mem:
 	iounmap(denali->flash_mem);
 failed_remap_reg:
 	iounmap(denali->flash_reg);
-failed_req_regions:
-	pci_release_regions(dev);
-failed_enable_dev:
-	pci_disable_device(dev);
-failed_alloc_memery:
-	kfree(denali);
-
 	return ret;
 }
 
@@ -117,9 +109,6 @@ static void denali_pci_remove(struct pci_dev *dev)
 	denali_remove(denali);
 	iounmap(denali->flash_reg);
 	iounmap(denali->flash_mem);
-	pci_release_regions(dev);
-	pci_disable_device(dev);
-	kfree(denali);
 }
 
 static struct pci_driver denali_pci_driver = {
-- 
2.4.6
