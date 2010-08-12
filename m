Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjNVF-00016G-Lq
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 02:26:46 +0000
Date: Thu, 12 Aug 2010 10:24:17 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 5/5]nand/denali: move all hardware initialization work
	to denali_hw_init
Message-ID: <20100812022417.GE25657@intel.com>
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


=46rom a2466d732864307416db04519e49da9f77c3431f Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 12 Aug 2010 10:07:18 +0800
Subject: [PATCH 5/5] nand/denali: move all hardware initialization work to =
denali_hw_init

All hardware initialization will be done in denali_hw_init before
irq handler registered
Change mtd name from "DENALI NAND" to be "denali-nand" since whitespace in
name can cause problems if we use cmdlinepart

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 017cde4..532fe07 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1364,18 +1364,18 @@ static void denali_hw_init(struct denali_nand_info =
*denali)
 	 * */
 	denali->bbtskipbytes =3D ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
-	denali_irq_init(denali);
 	denali_nand_reset(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
=20
-	iowrite32(0x0, denali->flash_reg + SPARE_AREA_SKIP_BYTES);
 	iowrite32(0xffff, denali->flash_reg + SPARE_AREA_MARKER);
=20
 	/* Should set value for these registers when init */
 	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(1, denali->flash_reg + ECC_ENABLE);
+	denali_nand_timing_set(denali);
+	denali_irq_init(denali);
 }
=20
 /* Althogh controller spec said SLC ECC is forceb to be 4bit,
@@ -1501,6 +1501,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
=20
 	pci_set_master(dev);
 	denali->dev =3D dev;
+	denali->mtd.dev.parent =3D &dev->dev;
=20
 	ret =3D pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
@@ -1525,6 +1526,8 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	denali_hw_init(denali);
 	denali_drv_init(denali);
=20
+	/* denali_isr register is done after all the hardware
+	 * initilization is finished*/
 	if (request_irq(dev->irq, denali_isr, IRQF_SHARED,
 			DENALI_NAND_NAME, denali)) {
 		printk(KERN_ERR "Spectra: Unable to allocate IRQ\n");
@@ -1537,9 +1540,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
=20
 	pci_set_drvdata(dev, denali);
=20
-	denali_nand_timing_set(denali);
-
-	denali->mtd.name =3D "Denali NAND";
+	denali->mtd.name =3D "denali-nand";
 	denali->mtd.owner =3D THIS_MODULE;
 	denali->mtd.priv =3D &denali->nand;
=20
--=20
1.6.6.1
