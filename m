Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OhKX7-00024r-UQ
	for linux-mtd@lists.infradead.org; Fri, 06 Aug 2010 10:52:14 +0000
Date: Fri, 6 Aug 2010 18:50:03 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com, dwmw2@infradead.org
Subject: [PATCH v1 4/4]mtd: denali: Add multi connected NAND support
Message-ID: <20100806105003.GD7326@intel.com>
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


=46rom 2d0afaca42e1a861480c6bd7966b8ec24e7e1851 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Fri, 6 Aug 2010 18:19:09 +0800
Subject: [PATCH 4/4] mtd: denali: Add multi connected NAND support

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   22 +++++++++++++++++++++-
 drivers/mtd/nand/denali.h |    1 +
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d486c0e..ba7e620 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1676,6 +1676,25 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 		goto failed_nand;
 	}
=20
+	/* support for multi nand
+	 * MTD known nothing about multi nand,
+	 * so we should tell it the real pagesize
+	 * and anything necessery
+	 */
+	denali->devnum =3D ioread32(denali->flash_reg + DEVICES_CONNECTED);
+	denali->nand.chipsize <<=3D (denali->devnum - 1);
+	denali->nand.page_shift +=3D (denali->devnum - 1);
+	denali->nand.pagemask =3D (denali->nand.chipsize >>
+						denali->nand.page_shift) - 1;
+	denali->nand.bbt_erase_shift +=3D (denali->devnum - 1);
+	denali->nand.phys_erase_shift =3D denali->nand.bbt_erase_shift;
+	denali->nand.chip_shift +=3D (denali->devnum - 1);
+	denali->mtd.writesize <<=3D (denali->devnum - 1);
+	denali->mtd.oobsize <<=3D (denali->devnum - 1);
+	denali->mtd.erasesize <<=3D (denali->devnum - 1);
+	denali->mtd.size =3D denali->nand.numchips * denali->nand.chipsize;
+	denali->bbtskipbytes *=3D denali->devnum;
+
 	/* second stage of the NAND scan
 	 * this stage requires information regarding ECC and
 	 * bad block management. */
@@ -1712,6 +1731,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 	}
=20
+	denali->nand.ecc.bytes *=3D denali->devnum;
 	denali->nand.ecc.layout->eccbytes *=3D
 		denali->mtd.writesize / ECC_SECTOR_SIZE;
 	denali->nand.ecc.layout->oobfree[0].offset =3D
@@ -1737,7 +1757,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	denali->nand.ecc.hwctl =3D denali_ecc_hwctl;
=20
 	/* override the default read operations */
-	denali->nand.ecc.size =3D denali->mtd.writesize;
+	denali->nand.ecc.size =3D ECC_SECTOR_SIZE * denali->devnum;
 	denali->nand.ecc.read_page =3D denali_read_page;
 	denali->nand.ecc.read_page_raw =3D denali_read_page_raw;
 	denali->nand.ecc.write_page =3D denali_write_page;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index bdf5c2a..b680474 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -764,6 +764,7 @@ struct denali_nand_info {
 	int irq_debug_array[32];
 	int idx;
=20
+	uint32_t devnum;	/* represent how many nands connected */
 	uint32_t fwblks; /* represent how many blocks FW used */
 	uint32_t totalblks;
 	uint32_t blksperchip;
--=20
1.6.6.1
