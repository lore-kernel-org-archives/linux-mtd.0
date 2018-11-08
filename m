Received: from skedge03.snt-world.com ([91.208.41.68])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKfjm-0005t0-DN
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 08:32:28 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.De>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
CC: Schrempf Frieder <frieder.schrempf@kontron.De>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: spi: Add initial support for Toshiba TC58CVG2S0H
Date: Thu, 8 Nov 2018 08:32:11 +0000
Message-ID: <1541665796-21092-1-git-send-email-frieder.schrempf@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add minimal support for the Toshiba TC58CVG2S0H SPI NAND chip.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |   1 +
 drivers/mtd/nand/spi/toshiba.c | 136 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   1 +
 4 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index b74e074..be5f735 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs :=3D core.o macronix.o micron.o winbond.o
+spinand-objs :=3D core.o macronix.o micron.o toshiba.o winbond.o
 obj-$(CONFIG_MTD_SPI_NAND) +=3D spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 30f8364..87bdf2a 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -766,6 +766,7 @@ static const struct nand_ops spinand_ops =3D {
 static const struct spinand_manufacturer *spinand_manufacturers[] =3D {
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
+	&toshiba_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
 };
=20
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.=
c
new file mode 100644
index 0000000..294bcf6
--- /dev/null
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 exceet electronics GmbH
+ * Copyright (c) 2018 Kontron Electronics GmbH
+ *
+ * Author: Frieder Schrempf <frieder.schrempf@kontron.de>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_TOSHIBA		0x98
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static int tc58cvg2s0h_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset =3D 128 + 16 * section;
+	region->length =3D 16;
+
+
+	return 0;
+}
+
+static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset =3D 2 + 16 * section;
+	region->length =3D 14;
+
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops tc58cvg2s0h_ooblayout =3D {
+	.ecc =3D tc58cvg2s0h_ooblayout_ecc,
+	.free =3D tc58cvg2s0h_ooblayout_free,
+};
+
+static int tc58cvg2s0h_ecc_get_status(struct spinand_device *spinand,
+				      u8 status)
+{
+	struct nand_device *nand =3D spinand_to_nand(spinand);
+	u8 mbf =3D 0;
+	struct spi_mem_op op =3D SPINAND_GET_FEATURE_OP(0x30, &mbf);
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		/*
+		 * Let's try to retrieve the real maximum number of bitflips
+		 * in order to avoid forcing the wear-leveling layer to move
+		 * data around if it's not necessary.
+		 */
+		if (spi_mem_exec_op(spinand->spimem, &op))
+			return nand->eccreq.strength;
+
+		mbf >>=3D 4;
+
+		if (WARN_ON(mbf > nand->eccreq.strength || !mbf))
+			return nand->eccreq.strength;
+
+		return mbf;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info toshiba_spinand_table[] =3D {
+	SPINAND_INFO("TC58CVG2S0H", 0xCD,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&tc58cvg2s0h_ooblayout,
+				     tc58cvg2s0h_ecc_get_status)),
+};
+
+static int toshiba_spinand_detect(struct spinand_device *spinand)
+{
+	u8 *id =3D spinand->id.data;
+	int ret;
+
+	/*
+	 * Toshiba SPI NAND read ID needs a dummy byte,
+	 * so the first byte in id is garbage.
+	 */
+	if (id[1] !=3D SPINAND_MFR_TOSHIBA)
+		return 0;
+
+	ret =3D spinand_match_and_init(spinand, toshiba_spinand_table,
+				     ARRAY_SIZE(toshiba_spinand_table),
+				     id[2]);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops =3D=
 {
+	.detect =3D toshiba_spinand_detect,
+};
+
+const struct spinand_manufacturer toshiba_spinand_manufacturer =3D {
+	.id =3D SPINAND_MFR_TOSHIBA,
+	.name =3D "Toshiba",
+	.ops =3D &toshiba_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 088ff96..816c4b0 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -196,6 +196,7 @@ struct spinand_manufacturer {
 /* SPI NAND manufacturers */
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
+extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
=20
 /**
--=20
2.7.4
