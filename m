Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjVQf-0005cW-Hn
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 10:54:34 +0000
Date: Thu, 12 Aug 2010 18:51:58 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v2 6/6]nand/denali: change denali write page method
Message-ID: <20100812105158.GF11634@intel.com>
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

=46rom 51c0771e113f9707a7cb6ff3d3300196c8ba4379 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 12 Aug 2010 18:41:32 +0800
Subject: [PATCH 6/6] nand/denali: change denali write page method

In this way, driver will write data to MAIN and OOB area at
the same time. This feature will be used by Spectra FTL

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   48 +++++++++++++++++++++++++++++++++--------=
---
 1 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index aa8f334..a807c1d 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1077,23 +1077,43 @@ static void write_page(struct mtd_info *mtd, struct=
 nand_chip *chip,
 	 * !raw_xfer - enable ecc
 	 * raw_xfer - transfer spare
 	 */
-	setup_ecc_for_xfer(denali, !raw_xfer, raw_xfer);
-
+	setup_ecc_for_xfer(denali, !raw_xfer, true);
+	clear_interrupts(denali);
 	/* copy buffer into DMA buffer */
-	memcpy(denali->buf.buf, buf, mtd->writesize);
-
 	if (raw_xfer) {
+		memcpy(denali->buf.buf, buf, mtd->writesize);
 		/* transfer the data to the spare area */
 		memcpy(denali->buf.buf + mtd->writesize,
 			chip->oob_poi,
 			mtd->oobsize);
+	} else {
+		uint8_t *datadest, *oobsrc;
+		const uint8_t *src;
+		uint32_t i, cpysize;
+		datadest =3D denali->buf.buf;
+		src =3D buf;
+		oobsrc =3D chip->oob_poi + (mtd->oobsize - mtd->oobavail);
+		for (i =3D 0; i < chip->ecc.steps - 1; i++,
+				src +=3D chip->ecc.size,
+				datadest +=3D chip->ecc.size + chip->ecc.bytes)
+			memcpy(datadest, src, chip->ecc.size);
+		cpysize =3D mtd->writesize -
+			(chip->ecc.size + chip->ecc.bytes) * i;
+		memcpy(datadest, src, cpysize);
+		src +=3D cpysize;
+		datadest +=3D cpysize;
+		for (i =3D 0; i < denali->bbtskipbytes; i++)
+			*datadest++ =3D 0xff;
+		cpysize =3D mtd->oobsize - mtd->oobavail -
+			denali->bbtskipbytes - chip->ecc.bytes;
+		memcpy(datadest, src, cpysize);
+		datadest +=3D cpysize + chip->ecc.bytes;
+		memcpy(datadest, oobsrc, mtd->oobavail);
 	}
+	denali_enable_dma(denali, true);
=20
 	pci_dma_sync_single_for_device(pci_dev, addr, size, PCI_DMA_TODEVICE);
=20
-	clear_interrupts(denali);
-	denali_enable_dma(denali, true);
-
 	denali_setup_dma(denali, DENALI_WRITE);
=20
 	/* wait for operation to complete */
@@ -1103,13 +1123,17 @@ static void write_page(struct mtd_info *mtd, struct=
 nand_chip *chip,
 		dev_err(&denali->dev->dev,
 				"timeout on write_page (type =3D %d)\n",
 				raw_xfer);
-		denali->status =3D
-			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ?
-			NAND_STATUS_FAIL : PASS;
-	}
+		denali->status =3D NAND_STATUS_FAIL;
+	} else if (irq_status & INTR_STATUS0__PROGRAM_FAIL)
+		denali->status =3D NAND_STATUS_FAIL;
+	else
+		denali->status =3D PASS;
=20
-	denali_enable_dma(denali, false);
 	pci_dma_sync_single_for_cpu(pci_dev, addr, size, PCI_DMA_TODEVICE);
+
+	denali_enable_dma(denali, false);
+
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
 }
=20
 /* NAND core entry points */
--=20
1.6.6.1
