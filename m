Received: from keymaster.cadence.com ([158.140.2.26]
 helo=mx-sanjose5.cadence.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clWY0-0005Wc-Fr
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 08:02:16 +0000
From: Artur Jedrysek <jartur@cadence.com>
To: <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Artur Jedrysek <jartur@cadence.com>
Subject: [v2, 1/4] mtd: spi-nor: Add support for Octal SPI mode.
Date: Wed, 8 Mar 2017 07:58:52 +0000
Message-ID: <1488959932-6657-1-git-send-email-jartur@cadence.com>
In-Reply-To: <1488803423-10767-1-git-send-email-jartur@cadence.com>
References: <1488803423-10767-1-git-send-email-jartur@cadence.com>
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

This patch adds support for Octal SPI data reads in SPI NOR framework.
Opcodes for programming using octal interface are also present for the
sake of completeness, despite not being used.

Micron mt35xu512 flash is added as an example chip supporting that mode.

Signed-off-by: Artur Jedrysek <jartur@cadence.com>
---
Changelog:
v2: None.
---
 drivers/mtd/spi-nor/spi-nor.c | 20 ++++++++++++++++++--
 include/linux/mtd/spi-nor.h   |  9 +++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1ae872b..db188e2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -85,6 +85,7 @@ struct flash_info {
 					 * Use dedicated 4byte address op codes
 					 * to support memory size above 128Mib.
 					 */
+#define SPI_NOR_OCTAL_READ	BIT(12)	/* Flash supports Octal Read */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -159,6 +160,7 @@ static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
 	case SPI_NOR_FAST:
 	case SPI_NOR_DUAL:
 	case SPI_NOR_QUAD:
+	case SPI_NOR_OCTAL:
 		return 8;
 	case SPI_NOR_NORMAL:
 		return 0;
@@ -220,6 +222,8 @@ static inline u8 spi_nor_convert_3to4_read(u8 opcode)
 		{ SPINOR_OP_READ_1_2_2,	SPINOR_OP_READ_1_2_2_4B },
 		{ SPINOR_OP_READ_1_1_4,	SPINOR_OP_READ_1_1_4_4B },
 		{ SPINOR_OP_READ_1_4_4,	SPINOR_OP_READ_1_4_4_4B },
+		{ SPINOR_OP_READ_1_1_8,	SPINOR_OP_READ_1_1_8_4B },
+		{ SPINOR_OP_READ_1_8_8,	SPINOR_OP_READ_1_8_8_4B },
 	};
 
 	return spi_nor_convert_opcode(opcode, spi_nor_3to4_read,
@@ -232,6 +236,8 @@ static inline u8 spi_nor_convert_3to4_program(u8 opcode)
 		{ SPINOR_OP_PP,		SPINOR_OP_PP_4B },
 		{ SPINOR_OP_PP_1_1_4,	SPINOR_OP_PP_1_1_4_4B },
 		{ SPINOR_OP_PP_1_4_4,	SPINOR_OP_PP_1_4_4_4B },
+		{ SPINOR_OP_PP_1_1_8,	SPINOR_OP_PP_1_1_8_4B },
+		{ SPINOR_OP_PP_1_8_8,	SPINOR_OP_PP_1_8_8_4B },
 	};
 
 	return spi_nor_convert_opcode(opcode, spi_nor_3to4_program,
@@ -1035,6 +1041,11 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{
+		"mt35xu512", INFO(0x2c5b1a, 0, 128 * 1024, 512,
+			SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
@@ -1667,8 +1678,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (info->flags & SPI_NOR_NO_FR)
 		nor->flash_read = SPI_NOR_NORMAL;
 
-	/* Quad/Dual-read mode takes precedence over fast/normal */
-	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
+	/* Octal/Quad/Dual-read mode takes precedence over fast/normal */
+	if (mode == SPI_NOR_OCTAL && info->flags & SPI_NOR_OCTAL_READ) {
+		nor->flash_read = SPI_NOR_OCTAL;
+	} else if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
 		ret = set_quad_mode(nor, info);
 		if (ret) {
 			dev_err(dev, "quad mode not supported\n");
@@ -1681,6 +1694,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	/* Default commands */
 	switch (nor->flash_read) {
+	case SPI_NOR_OCTAL:
+		nor->read_opcode = SPINOR_OP_READ_1_1_8;
+		break;
 	case SPI_NOR_QUAD:
 		nor->read_opcode = SPINOR_OP_READ_1_1_4;
 		break;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f2a7180..aad6318 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -47,9 +47,13 @@
 #define SPINOR_OP_READ_1_2_2	0xbb	/* Read data bytes (Dual I/O SPI) */
 #define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad Output SPI) */
 #define SPINOR_OP_READ_1_4_4	0xeb	/* Read data bytes (Quad I/O SPI) */
+#define SPINOR_OP_READ_1_1_8	0x8b	/* Read data bytes (Octal Output SPI) */
+#define SPINOR_OP_READ_1_8_8	0xcb	/* Read data bytes (Octal I/O SPI) */
 #define SPINOR_OP_PP		0x02	/* Page program (up to 256 bytes) */
 #define SPINOR_OP_PP_1_1_4	0x32	/* Quad page program */
 #define SPINOR_OP_PP_1_4_4	0x38	/* Quad page program */
+#define SPINOR_OP_PP_1_1_8	0x82	/* Octal page program */
+#define SPINOR_OP_PP_1_8_8	0xc2	/* Octal page program */
 #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
 #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
 #define SPINOR_OP_BE_32K	0x52	/* Erase 32KiB block */
@@ -66,9 +70,13 @@
 #define SPINOR_OP_READ_1_2_2_4B	0xbc	/* Read data bytes (Dual I/O SPI) */
 #define SPINOR_OP_READ_1_1_4_4B	0x6c	/* Read data bytes (Quad Output SPI) */
 #define SPINOR_OP_READ_1_4_4_4B	0xec	/* Read data bytes (Quad I/O SPI) */
+#define SPINOR_OP_READ_1_1_8_4B	0x7c	/* Read data bytes (Octal Output SPI) */
+#define SPINOR_OP_READ_1_8_8_4B	0xcc	/* Read data bytes (Octal I/O SPI) */
 #define SPINOR_OP_PP_4B		0x12	/* Page program (up to 256 bytes) */
 #define SPINOR_OP_PP_1_1_4_4B	0x34	/* Quad page program */
 #define SPINOR_OP_PP_1_4_4_4B	0x3e	/* Quad page program */
+#define SPINOR_OP_PP_1_1_8_4B	0x84	/* Octal page program */
+#define SPINOR_OP_PP_1_8_8_4B	0x8e	/* Octal page program */
 #define SPINOR_OP_BE_4K_4B	0x21	/* Erase 4KiB block */
 #define SPINOR_OP_BE_32K_4B	0x5c	/* Erase 32KiB block */
 #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
@@ -124,6 +132,7 @@ enum read_mode {
 	SPI_NOR_FAST,
 	SPI_NOR_DUAL,
 	SPI_NOR_QUAD,
+	SPI_NOR_OCTAL,
 };
 
 #define SPI_NOR_MAX_CMD_SIZE	8
-- 
2.2.2
