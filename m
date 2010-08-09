Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiV9M-0001Am-CL
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 16:24:33 +0000
Date: Tue, 10 Aug 2010 00:22:09 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 1/4]nand/denali: Fixed probe function bugs
Message-ID: <20100809162209.GA10968@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


=46rom 25d2402fc8fd70c041cb8d0b976359b366a96e9d Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Mon, 9 Aug 2010 18:37:00 +0800
Subject: [PATCH 1/4] nand/denali: Fixed probe function bugs

Fixed a pci_resource_len function error;
Changed returning sequence of probe function;

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   44 +++++++++++++++++++++++------------------=
---
 1 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 1422edd..b8b7b93 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1536,7 +1536,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	ret =3D pci_enable_device(dev);
 	if (ret) {
 		printk(KERN_ERR "Spectra: pci_enable_device failed.\n");
-		goto failed_enable;
+		goto failed_alloc_memery;
 	}
=20
 	if (id->driver_data =3D=3D INTEL_CE4100) {
@@ -1547,7 +1547,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 			printk(KERN_ERR "Intel CE4100 only supports"
 					" ONFI timing mode 1 or below\n");
 			ret =3D -EINVAL;
-			goto failed_enable;
+			goto failed_enable_dev;
 		}
 		denali->platform =3D INTEL_CE4100;
 		mem_base =3D pci_resource_start(dev, 0);
@@ -1557,7 +1557,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	} else {
 		denali->platform =3D INTEL_MRST;
 		csr_base =3D pci_resource_start(dev, 0);
-		csr_len =3D pci_resource_start(dev, 0);
+		csr_len =3D pci_resource_len(dev, 0);
 		mem_base =3D pci_resource_start(dev, 1);
 		mem_len =3D pci_resource_len(dev, 1);
 		if (!mem_len) {
@@ -1576,7 +1576,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
=20
 	if (ret) {
 		printk(KERN_ERR "Spectra: no usable DMA configuration\n");
-		goto failed_enable;
+		goto failed_enable_dev;
 	}
 	denali->buf.dma_buf =3D
 		pci_map_single(dev, denali->buf.buf,
@@ -1585,7 +1585,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
=20
 	if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
 		printk(KERN_ERR "Spectra: failed to map DMA buffer\n");
-		goto failed_enable;
+		goto failed_enable_dev;
 	}
=20
 	pci_set_master(dev);
@@ -1594,14 +1594,14 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
 	ret =3D pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
 		printk(KERN_ERR "Spectra: Unable to request memory regions\n");
-		goto failed_req_csr;
+		goto failed_dma_map;
 	}
=20
 	denali->flash_reg =3D ioremap_nocache(csr_base, csr_len);
 	if (!denali->flash_reg) {
 		printk(KERN_ERR "Spectra: Unable to remap memory region\n");
 		ret =3D -ENOMEM;
-		goto failed_remap_csr;
+		goto failed_req_regions;
 	}
 	nand_dbg_print(NAND_DBG_DEBUG, "Spectra: CSR 0x%08Lx -> 0x%p (0x%lx)\n",
 		       (uint64_t)csr_base, denali->flash_reg, csr_len);
@@ -1609,9 +1609,8 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	denali->flash_mem =3D ioremap_nocache(mem_base, mem_len);
 	if (!denali->flash_mem) {
 		printk(KERN_ERR "Spectra: ioremap_nocache failed!");
-		iounmap(denali->flash_reg);
 		ret =3D -ENOMEM;
-		goto failed_remap_csr;
+		goto failed_remap_reg;
 	}
=20
 	nand_dbg_print(NAND_DBG_WARN,
@@ -1627,7 +1626,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 			DENALI_NAND_NAME, denali)) {
 		printk(KERN_ERR "Spectra: Unable to allocate IRQ\n");
 		ret =3D -ENODEV;
-		goto failed_request_irq;
+		goto failed_remap_mem;
 	}
=20
 	/* now that our ISR is registered, we can enable interrupts */
@@ -1664,7 +1663,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	 * with the nand subsystem */
 	if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL)) {
 		ret =3D -ENXIO;
-		goto failed_nand;
+		goto failed_req_irq;
 	}
=20
 	/* MTD supported page sizes vary by kernel. We validate our
@@ -1674,7 +1673,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 		ret =3D -ENODEV;
 		printk(KERN_ERR "Spectra: device size not supported by this "
 			"version of MTD.");
-		goto failed_nand;
+		goto failed_req_irq;
 	}
=20
 	/* support for multi nand
@@ -1725,7 +1724,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 			ECC_SECTOR_SIZE))) {
 		printk(KERN_ERR "Your NAND chip OOB is not large enough to"
 				" contain 8bit ECC correction codes");
-		goto failed_nand;
+		goto failed_req_irq;
 	} else {
 		denali->nand.ecc.layout =3D &nand_8bit_oob;
 		denali->nand.ecc.bytes =3D ECC_8BITS;
@@ -1769,28 +1768,31 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
=20
 	if (nand_scan_tail(&denali->mtd)) {
 		ret =3D -ENXIO;
-		goto failed_nand;
+		goto failed_req_irq;
 	}
=20
 	ret =3D add_mtd_device(&denali->mtd);
 	if (ret) {
 		printk(KERN_ERR "Spectra: Failed to register"
 				" MTD device: %d\n", ret);
-		goto failed_nand;
+		goto failed_req_irq;
 	}
 	return 0;
=20
- failed_nand:
+failed_req_irq:
 	denali_irq_cleanup(dev->irq, denali);
- failed_request_irq:
-	iounmap(denali->flash_reg);
+failed_remap_mem:
 	iounmap(denali->flash_mem);
- failed_remap_csr:
+failed_remap_reg:
+	iounmap(denali->flash_reg);
+failed_req_regions:
 	pci_release_regions(dev);
- failed_req_csr:
+failed_dma_map:
 	pci_unmap_single(dev, denali->buf.dma_buf, DENALI_BUF_SIZE,
 							PCI_DMA_BIDIRECTIONAL);
- failed_enable:
+failed_enable_dev:
+	pci_disable_device(dev);
+failed_alloc_memery:
 	kfree(denali);
 	return ret;
 }
--=20
1.6.6.1
