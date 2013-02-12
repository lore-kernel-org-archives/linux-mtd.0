Received: from imx12.toshiba.co.jp ([61.202.160.132])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U53hI-0000mN-Ha
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 00:26:11 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Tue, 12 Feb 2013 00:25:54 +0000
Message-ID: <F3B6523425E7914AA6214ED358D820AF25D9879D@TGXML316.toshiba.local>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <64C8DD7EA6537B43ABF55906E74CAC28@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This enables support for BENAND, which is an SLC NAND flash solution
with embedded error correction code (ECC), currently supports only
128bytes OOB type.

In the read sequence, "status read command" is executed to check the
ECC status after read data. If bitflips occur, these are
automatically corrected by BENAND and the status indicates the result.

The write sequence is the same as raw write and the ECC data are
automatically written to OOB by BENAND.

Signed-off-by: UWATOKO Katsuki <katsuki.uwatoko@toshiba.co.jp>
---
 drivers/mtd/nand/Kconfig        |   11 ++++
 drivers/mtd/nand/Makefile       |    1 +
 drivers/mtd/nand/nand_base.c    |   25 +++++++++
 drivers/mtd/nand/nand_benand.c  |  113 +++++++++++++++++++++++++++++++++++=
++++
 include/linux/mtd/nand.h        |    2 +
 include/linux/mtd/nand_benand.h |   47 ++++++++++++++++
 6 files changed, 199 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_benand.c
 create mode 100644 include/linux/mtd/nand_benand.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4883139..acf0c25 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -37,6 +37,17 @@ config MTD_NAND_ECC_BCH
 	  ECC codes. They are used with NAND devices requiring more than 1 bit
 	  of error correction.
=20
+config MTD_NAND_BENAND
+	bool "Support BENAND (embedded ECC NAND)"
+	default n
+	help
+	  This enables support for BENAND, which is an SLC NAND flash
+	  solution with embedded error correction code (ECC).
+	  currently supports only 128bytes OOB type.
+	  In the read sequence, "status read command" is executed to check
+	  the ECC status after read data.
+	  The write sequence is the same as raw write.
+
 config MTD_SM_COMMON
 	tristate
 	default n
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 2cbd091..f58dee8 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_MTD_NAND)			+=3D nand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+=3D nand_ecc.o
 obj-$(CONFIG_MTD_NAND_BCH)		+=3D nand_bch.o
+obj-$(CONFIG_MTD_NAND_BENAND)		+=3D nand_benand.o
 obj-$(CONFIG_MTD_NAND_IDS)		+=3D nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+=3D sm_common.o
=20
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1a03b7f..2b0c178 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -43,6 +43,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand_benand.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/leds.h>
@@ -3076,6 +3077,11 @@ static void nand_decode_ext_id(struct mtd_info *mtd,=
 struct nand_chip *chip,
 		extid >>=3D 2;
 		/* Get buswidth information */
 		*busw =3D (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+
+		/* check BENAND (embedded ECC) */
+		if (id_data[0] =3D=3D NAND_MFR_TOSHIBA &&
+		    (id_data[4] & 1 << 7))
+			nand_benand_setupecc(mtd, &(chip->ecc.mode));
 	}
 }
=20
@@ -3530,6 +3536,25 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.bytes * 8 / fls(8 * chip->ecc.size);
 		break;
=20
+	case NAND_ECC_BENAND:
+		if (!mtd_nand_has_benand()) {
+			pr_warn("CONFIG_MTD_BENAND not enabled\n");
+			BUG();
+		}
+
+		chip->ecc.read_page =3D nand_read_page_benand;
+		chip->ecc.write_page =3D nand_write_page_raw;
+		chip->ecc.read_page_raw =3D nand_read_page_raw;
+		chip->ecc.write_page_raw =3D nand_write_page_raw;
+		chip->ecc.read_oob =3D nand_read_oob_std;
+		chip->ecc.write_oob =3D nand_write_oob_std;
+
+		if (nand_benand_init(mtd)) {
+			pr_warn("BENAND initialization failed!\n");
+			BUG();
+		}
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. "
 			   "This is not recommended!\n");
diff --git a/drivers/mtd/nand/nand_benand.c b/drivers/mtd/nand/nand_benand.=
c
new file mode 100644
index 0000000..fe8008d
--- /dev/null
+++ b/drivers/mtd/nand/nand_benand.c
@@ -0,0 +1,113 @@
+/*
+ * This file provides functions for BENAND, which is an SLC NAND flash
+ * solution with embedded error correction code (ECC).
+ *
+ * (C) Copyright TOSHIBA CORPORATION 2013
+ * All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  =
USA
+ */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/bitops.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_benand.h>
+
+static struct nand_ecclayout benand_oob_128 =3D {
+	.oobfree =3D {
+		{.offset =3D 2, .length =3D 3},
+		{.offset =3D 18, .length =3D 3},
+		{.offset =3D 34, .length =3D 3},
+		{.offset =3D 50, .length =3D 3},
+		{.offset =3D 66, .length =3D 3},
+		{.offset =3D 82, .length =3D 3},
+		{.offset =3D 98, .length =3D 3},
+		{.offset =3D 114, .length =3D 3},
+	}
+};
+
+/**
+ * nand_read_page_raw - [Intern] read raw page data with benand.
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
+ *
+ * Not for syndrome calculating ECC controllers, which use a special oob l=
ayout.
+ */
+
+int nand_read_page_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			  uint8_t *buf, int oob_required, int page)
+{
+	u8 status;
+	unsigned int max_bitflips =3D 0;
+
+	chip->ecc.read_page_raw(mtd, chip, buf, oob_required, page);
+
+	/* Check Read Status */
+
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status =3D chip->read_byte(mtd);
+
+	if (status & NAND_STATUS_FAIL)
+		/* uncorrectable error */
+		mtd->ecc_stats.failed++;
+	else if (status & NAND_CHIP_READ_STATUS) {
+		/* correctable error
+		   How many bits have been corrected is unknown.
+		   therefore bitflips is set to ecc.strength. */
+		mtd->ecc_stats.corrected +=3D chip->ecc.strength;
+		max_bitflips =3D chip->ecc.strength;
+	}
+
+	return max_bitflips;
+}
+EXPORT_SYMBOL(nand_read_page_benand);
+
+void nand_benand_setupecc(struct mtd_info *mtd, nand_ecc_modes_t *mode)
+{
+	/* support only 128bytes OOB type */
+	if (mtd->oobsize =3D=3D 128)
+		*mode =3D NAND_ECC_BENAND;
+}
+
+int nand_benand_init(struct mtd_info *mtd)
+{
+	struct nand_chip *chip =3D mtd->priv;
+
+	chip->ecc.size =3D mtd->writesize;
+
+	if (mtd->oobsize =3D=3D 128) {
+		chip->ecc.layout =3D &benand_oob_128;
+		chip->ecc.bytes =3D 72;      /* 9B * (4096B/512B) */
+		chip->ecc.strength =3D 32;   /* 4b * (4096B/512B) */
+	} else {
+		pr_warn("%d unsupported oobsize in benand_init\n",
+			mtd->oobsize);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(nand_benand_init);
+
+MODULE_AUTHOR("TOSHIBA Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("BENAND (embedded ECC NAND) support");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 24e9159..2163ae9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -129,6 +129,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs=
, uint64_t len);
 /* Status bits */
 #define NAND_STATUS_FAIL	0x01
 #define NAND_STATUS_FAIL_N1	0x02
+#define NAND_CHIP_READ_STATUS   0x08  /* for BENAND */
 #define NAND_STATUS_TRUE_READY	0x20
 #define NAND_STATUS_READY	0x40
 #define NAND_STATUS_WP		0x80
@@ -143,6 +144,7 @@ typedef enum {
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_SOFT_BCH,
+	NAND_ECC_BENAND,
 } nand_ecc_modes_t;
=20
 /*
diff --git a/include/linux/mtd/nand_benand.h b/include/linux/mtd/nand_benan=
d.h
new file mode 100644
index 0000000..ac043e5
--- /dev/null
+++ b/include/linux/mtd/nand_benand.h
@@ -0,0 +1,47 @@
+/*
+ * (C) Copyright TOSHIBA CORPORATION 2013
+ * All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This file is the header for the NAND BENAND implementation.
+ */
+
+#ifndef __MTD_NAND_BENAND_H__
+#define __MTD_NAND_BENAND_H__
+
+#if defined(CONFIG_MTD_NAND_BENAND)
+
+static inline int mtd_nand_has_benand(void) { return 1; }
+
+void nand_benand_setupecc(struct mtd_info *mtd, nand_ecc_modes_t *mode);
+
+int nand_read_page_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			  uint8_t *buf, int oob_required, int page);
+
+int nand_benand_init(struct mtd_info *mtd);
+
+#else /* !CONFIG_MTD_NAND_BENAND */
+
+static inline int mtd_nand_has_benand(void) { return 0; }
+
+static inline void nand_benand_setupecc(struct mtd_info *mtd,
+					nand_ecc_modes_t *mode) {}
+
+static inline int nand_read_page_benand(struct mtd_info *mtd,
+					struct nand_chip *chip,
+					uint8_t *buf, int oob_required,
+					int page)
+{
+	return -1;
+}
+
+static inline int nand_benand_init(struct mtd_info *mtd)
+{
+	return -1;
+}
+
+#endif /* CONFIG_MTD_NAND_BENAND */
+#endif /* __MTD_NAND_BENAND_H__ */
--=20
1.7.4.1
