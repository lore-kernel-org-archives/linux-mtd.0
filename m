Received: from mga14.intel.com ([143.182.124.37])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjVQ8-0004nr-HQ
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 10:54:01 +0000
Date: Thu, 12 Aug 2010 18:51:30 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v2 3/6]nand/denali: Fixed driver r/w bug
Message-ID: <20100812105130.GC11634@intel.com>
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

=46rom 2e36a92751c8002164396c003dd1472392af1b26 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 12 Aug 2010 18:01:28 +0800
Subject: [PATCH 3/6] nand/denali: Fixed driver r/w bug

This issue is happened when using large NAND and some ONFI nand:
1) Large NAND need 32bits number to represent page id
2) Some Micro ONFI nand has a special OOB size

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |    6 +++++-
 drivers/mtd/nand/denali.h |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index a7d71e8..920c1cf 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -2021,7 +2021,11 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 	 * MTD known nothing about multi nand,
 	 * so we should tell it the real pagesize
 	 * and anything necessery
-	 */
+	 * Some NAND chip has a spectial OOB size, so here do
+	 * a recheck
+	 * */
+	denali->mtd.oobsize =3D ioread32(denali->flash_reg +
+						DEVICE_SPARE_AREA_SIZE);
 	denali->devnum =3D ioread32(denali->flash_reg + DEVICES_CONNECTED);
 	denali->nand.chipsize <<=3D (denali->devnum - 1);
 	denali->nand.page_shift +=3D (denali->devnum - 1);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 05f7415..9c244f7 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -744,7 +744,7 @@ struct denali_nand_info {
 	struct pci_dev *dev;
 	int total_used_banks;
 	uint32_t block;  /* stored for future use */
-	uint16_t page;
+	uint32_t page;
 	void __iomem *flash_reg;  /* Mapped io reg base address */
 	void __iomem *flash_mem;  /* Mapped io reg base address */
=20
--=20
1.6.6.1
