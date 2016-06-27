Received: from mail-db3on0120.outbound.protection.outlook.com
 ([157.55.234.120] helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHTgj-0001U9-P7
 for linux-mtd@lists.infradead.org; Mon, 27 Jun 2016 10:22:47 +0000
From: <marcin.krzeminski@nokia.com>
To: <linux-mtd@lists.infradead.org>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <hramrach@gmail.com>, <jteki@openedev.com>, <cyrille.pitchen@atmel.com>,
 <rfsw-patches@mlist.nokia.com>, <pawel.lenkow@itlen.com>
Subject: [RFC 1/3] mtd: spi-nor: DUAL I/O and QUAD I/O modes support
Date: Mon, 27 Jun 2016 12:20:58 +0200
Message-ID: <1467022860-17552-2-git-send-email-marcin.krzeminski@nokia.com>
In-Reply-To: <1467022860-17552-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1467022860-17552-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

This commit adds support for DUAL/QUAD I/O modes.
The work is based on Pawel Lenkow work for 3.18 kernel.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 drivers/mtd/spi-nor/Kconfig   |  8 +++++++
 drivers/mtd/spi-nor/spi-nor.c | 54 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   | 12 ++++++++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index d42c98e..8975977 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -49,4 +49,12 @@ config SPI_NXP_SPIFI
 	  Flash. Enable this option if you have a device with a SPIFI
 	  controller and want to access the Flash as a mtd device.
 
+config DUAL_QUAD_IO
+	bool "Dual and Quad I/O support"
+	help
+	   Enable support for Dual I/O and Quad I/O read commands that are
+	   available in some Spansion and Macronix devices.
+	   In Spansion FS-S family you must enable this if you want to use
+	   Quad/Dual but not QPI mode.
+
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a63922e..847db69 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -75,6 +75,10 @@ struct flash_info {
 					 * bit. Must be used with
 					 * SPI_NOR_HAS_LOCK.
 					 */
+#ifdef CONFIG_DUAL_QUAD_IO
+#define	SPI_NOR_DUALIO_READ	BIT(10)	/* Flash supports Dual I/O Read */
+#define	SPI_NOR_QUADIO_READ	BIT(11)	/* Flash supports Quad I/O Read */
+#endif
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -149,6 +153,10 @@ static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
 	case SPI_NOR_FAST:
 	case SPI_NOR_DUAL:
 	case SPI_NOR_QUAD:
+#ifdef CONFIG_DUAL_QUAD_IO
+	case SPI_NOR_DUALIO:
+	case SPI_NOR_QUADIO:
+#endif
 		return 8;
 	case SPI_NOR_NORMAL:
 		return 0;
@@ -1415,7 +1423,37 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	/* Some devices cannot do fast-read, no matter what DT tells us */
 	if (info->flags & SPI_NOR_NO_FR)
 		nor->flash_read = SPI_NOR_NORMAL;
+#ifdef CONFIG_DUAL_QUAD_IO
+	/*
+	 * Quad/Dual-read mode takes precedence over fast/normal
+	 * and Quad/Dual I/O take precedence over Quad/Dual
+	 */
+	if (mode == SPI_NOR_QUADIO) {
+		if (info->flags & SPI_NOR_QUADIO_READ)
+			nor->flash_read = SPI_NOR_QUADIO;
+		else
+			mode = SPI_NOR_QUAD;
+	} else if (mode == SPI_NOR_DUALIO) {
+		if (info->flags & SPI_NOR_DUALIO_READ)
+			nor->flash_read = SPI_NOR_DUALIO;
+		else
+			mode = SPI_NOR_DUAL;
+	}
 
+	if (mode == SPI_NOR_QUAD && (info->flags & SPI_NOR_QUAD_READ))
+		nor->flash_read = SPI_NOR_QUAD;
+	else if (mode == SPI_NOR_DUAL && (info->flags & SPI_NOR_DUAL_READ))
+		nor->flash_read = SPI_NOR_DUAL;
+
+	if (nor->flash_read == SPI_NOR_QUAD
+			|| nor->flash_read == SPI_NOR_QUADIO) {
+		ret = set_quad_mode(nor, info);
+		if (ret) {
+			dev_err(dev, "quad mode not supported\n");
+			return ret;
+		}
+	}
+#else
 	/* Quad/Dual-read mode takes precedence over fast/normal */
 	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
 		ret = set_quad_mode(nor, info);
@@ -1442,6 +1480,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	case SPI_NOR_NORMAL:
 		nor->read_opcode = SPINOR_OP_READ;
 		break;
+#ifdef CONFIG_DUAL_QUAD_IO
+	case SPI_NOR_DUALIO:
+		nor->read_opcode = SPINOR_OP_READ_1_2_2;
+		break;
+	case SPI_NOR_QUADIO:
+		nor->read_opcode = SPINOR_OP_READ_1_4_4;
+		break;
+#endif
 	default:
 		dev_err(dev, "No Read opcode defined\n");
 		return -EINVAL;
@@ -1469,6 +1515,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 			case SPI_NOR_NORMAL:
 				nor->read_opcode = SPINOR_OP_READ4;
 				break;
+#ifdef CONFIG_DUAL_QUAD_IO
+			case SPI_NOR_DUALIO:
+				nor->read_opcode = SPINOR_OP_READ4_1_2_2;
+				break;
+			case SPI_NOR_QUADIO:
+				nor->read_opcode = SPINOR_OP_READ4_1_4_4;
+				break;
+#endif
 			}
 			nor->program_opcode = SPINOR_OP_PP_4B;
 			/* No small sector erase for 4-byte command set */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c425c7b..652a8d2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -45,6 +45,10 @@
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
 #define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual SPI) */
 #define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad SPI) */
+#ifdef CONFIG_DUAL_QUAD_IO
+#define SPINOR_OP_READ_1_2_2	0xbb	/* Read data bytes (DualIO SPI) */
+#define SPINOR_OP_READ_1_4_4	0xeb    /* Read data bytes (QuadIO SPI) */
+#endif
 #define SPINOR_OP_PP		0x02	/* Page program (up to 256 bytes) */
 #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
 #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
@@ -60,6 +64,10 @@
 #define SPINOR_OP_READ4_FAST	0x0c	/* Read data bytes (high frequency) */
 #define SPINOR_OP_READ4_1_1_2	0x3c	/* Read data bytes (Dual SPI) */
 #define SPINOR_OP_READ4_1_1_4	0x6c	/* Read data bytes (Quad SPI) */
+#ifdef CONFIG_DUAL_QUAD_IO
+#define SPINOR_OP_READ4_1_2_2	0xbc    /* Read data bytes (DualIO SPI) */
+#define SPINOR_OP_READ4_1_4_4	0xec    /* Read data bytes (QuadIO SPI) */
+#endif
 #define SPINOR_OP_PP_4B		0x12	/* Page program (up to 256 bytes) */
 #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
@@ -105,6 +113,10 @@ enum read_mode {
 	SPI_NOR_FAST,
 	SPI_NOR_DUAL,
 	SPI_NOR_QUAD,
+#ifdef CONFIG_DUAL_QUAD_IO
+	SPI_NOR_DUALIO,
+	SPI_NOR_QUADIO,
+#endif
 };
 
 #define SPI_NOR_MAX_CMD_SIZE	8
-- 
2.7.4
