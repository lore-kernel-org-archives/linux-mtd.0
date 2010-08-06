Received: from mga14.intel.com ([143.182.124.37])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OhKWC-0001qN-IV
	for linux-mtd@lists.infradead.org; Fri, 06 Aug 2010 10:51:18 +0000
Date: Fri, 6 Aug 2010 18:49:06 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com, dwmw2@infradead.org
Subject: [PATCH v1 3/4]mtd: denali: Remove set_ecc_config function
Message-ID: <20100806104906.GC7326@intel.com>
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


=46rom 397bc9a8e7f007343c28c301dc4bf2f7f0174cf5 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Fri, 6 Aug 2010 18:02:03 +0800
Subject: [PATCH 3/4] mtd: denali: Remove set_ecc_config function

set_ecc_config function only set ECC_CORRECTION register, so
move register setting to probe function.
Since controller only support 15bit and 8bit ecc correction,
updated nand ecc layout information.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   87 ++++++++++++++++++++++++-----------------=
---
 drivers/mtd/nand/denali.h |    1 +
 2 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e67a9d3..d486c0e 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -354,17 +354,6 @@ static void nand_onfi_timing_set(struct denali_nand_in=
fo *denali,
 	denali_write32(cs_cnt, denali->flash_reg + CS_SETUP_CNT);
 }
=20
-/* configures the initial ECC settings for the controller */
-static void set_ecc_config(struct denali_nand_info *denali)
-{
-#if SUPPORT_8BITECC
-	if ((ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE) < 4096) ||
-		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) <=3D 128))
-		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
-#endif
-
-}
-
 /* queries the NAND device to see what ONFI modes it supports. */
 static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 {
@@ -576,8 +565,6 @@ static uint16_t denali_nand_timing_set(struct denali_na=
nd_info *denali)
 			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
 			ioread32(denali->flash_reg + CS_SETUP_CNT));
=20
-	set_ecc_config(denali);
-
 	find_valid_banks(denali);
=20
 	detect_partition_feature(denali);
@@ -1450,6 +1437,13 @@ static void denali_ecc_hwctl(struct mtd_info *mtd, i=
nt mode)
 /* Initialization code to bring the device up to a known good state */
 static void denali_hw_init(struct denali_nand_info *denali)
 {
+	/* tell driver how many bit controller will skip before
+	 * writing ECC code in OOB, this register may be already
+	 * set by firmware. So we read this value out.
+	 * if this value is 0, just let it be.
+	 * */
+	denali->bbtskipbytes =3D ioread32(denali->flash_reg +
+						SPARE_AREA_SKIP_BYTES);
 	denali_irq_init(denali);
 	denali_nand_reset(denali);
 	denali_write32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
@@ -1464,29 +1458,18 @@ static void denali_hw_init(struct denali_nand_info =
*denali)
 	denali_write32(1, denali->flash_reg + ECC_ENABLE);
 }
=20
-/* ECC layout for SLC devices. Denali spec indicates SLC fixed at 4 bytes =
*/
-#define ECC_BYTES_SLC   (4 * (2048 / ECC_SECTOR_SIZE))
-static struct nand_ecclayout nand_oob_slc =3D {
-	.eccbytes =3D 4,
-	.eccpos =3D { 0, 1, 2, 3 }, /* not used */
-	.oobfree =3D {
-		{
-			.offset =3D ECC_BYTES_SLC,
-			.length =3D 64 - ECC_BYTES_SLC
-		}
-	}
+/* Althogh controller spec said SLC ECC is forceb to be 4bit,
+ * but denali controller in MRST only support 15bit and 8bit ECC
+ * correction
+ * */
+#define ECC_8BITS	14
+static struct nand_ecclayout nand_8bit_oob =3D {
+	.eccbytes =3D 14,
 };
=20
-#define ECC_BYTES_MLC   (14 * (2048 / ECC_SECTOR_SIZE))
-static struct nand_ecclayout nand_oob_mlc_14bit =3D {
-	.eccbytes =3D 14,
-	.eccpos =3D { 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13 }, /* not used */
-	.oobfree =3D {
-		{
-			.offset =3D ECC_BYTES_MLC,
-			.length =3D 64 - ECC_BYTES_MLC
-		}
-	}
+#define ECC_15BITS	26
+static struct nand_ecclayout nand_15bit_oob =3D {
+	.eccbytes =3D 26,
 };
=20
 static uint8_t bbt_pattern[] =3D {'B', 'b', 't', '0' };
@@ -1705,14 +1688,38 @@ static int denali_pci_probe(struct pci_dev *dev, co=
nst struct pci_device_id *id)
 	denali->nand.options |=3D NAND_USE_FLASH_BBT | NAND_SKIP_BBTSCAN;
 	denali->nand.ecc.mode =3D NAND_ECC_HW_SYNDROME;
=20
-	if (denali->nand.cellinfo & 0xc) {
-		denali->nand.ecc.layout =3D &nand_oob_mlc_14bit;
-		denali->nand.ecc.bytes =3D ECC_BYTES_MLC;
-	} else {/* SLC */
-		denali->nand.ecc.layout =3D &nand_oob_slc;
-		denali->nand.ecc.bytes =3D ECC_BYTES_SLC;
+	/* Denali Controller only support 15bit and 8bit ECC in MRST,
+	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
+	 * SLC if possible.
+	 * */
+	if (denali->nand.cellinfo & 0xc &&
+			(denali->mtd.oobsize > (denali->bbtskipbytes +
+			ECC_15BITS * (denali->mtd.writesize /
+			ECC_SECTOR_SIZE)))) {
+		/* if MLC OOB size is large enough, use 15bit ECC*/
+		denali->nand.ecc.layout =3D &nand_15bit_oob;
+		denali->nand.ecc.bytes =3D ECC_15BITS;
+		denali_write32(15, denali->flash_reg + ECC_CORRECTION);
+	} else if (denali->mtd.oobsize < (denali->bbtskipbytes +
+			ECC_8BITS * (denali->mtd.writesize /
+			ECC_SECTOR_SIZE))) {
+		printk(KERN_ERR "Your NAND chip OOB is not large enough to"
+				" contain 8bit ECC correction codes");
+		goto failed_nand;
+	} else {
+		denali->nand.ecc.layout =3D &nand_8bit_oob;
+		denali->nand.ecc.bytes =3D ECC_8BITS;
+		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
 	}
=20
+	denali->nand.ecc.layout->eccbytes *=3D
+		denali->mtd.writesize / ECC_SECTOR_SIZE;
+	denali->nand.ecc.layout->oobfree[0].offset =3D
+		denali->bbtskipbytes + denali->nand.ecc.layout->eccbytes;
+	denali->nand.ecc.layout->oobfree[0].length =3D
+		denali->mtd.oobsize - denali->nand.ecc.layout->eccbytes -
+		denali->bbtskipbytes;
+
 	/* Let driver know the total blocks number and
 	 * how many blocks contained by each nand chip.
 	 * blksperchip will help driver to know how many
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index fcac241..bdf5c2a 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -767,6 +767,7 @@ struct denali_nand_info {
 	uint32_t fwblks; /* represent how many blocks FW used */
 	uint32_t totalblks;
 	uint32_t blksperchip;
+	uint32_t bbtskipbytes;
 };
=20
 #endif /*_LLD_NAND_*/
--=20
1.6.6.1
