Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIzWr-0005M1-Ps
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 15:07:12 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 2/2] mtd: spi-nor: add a stateless method to support memory
 size above 128Mib
Date: Mon, 19 Dec 2016 16:05:57 +0100
Message-ID: <da3ef28917d3ad8ed9e8ee76c543dd12846c295c.1482158909.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1482158909.git.cyrille.pitchen@atmel.com>
References: <cover.1482158909.git.cyrille.pitchen@atmel.com>
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

This patch provides an alternative mean to support memory above 16MiB
(128Mib) by replacing 3byte address op codes by their associated 4byte
address versions.

Using the dedicated 4byte address op codes doesn't change the internal
state of the SPI NOR memory as opposed to using other means such as
updating a Base Address Register (BAR) and sending command to enter/leave
the 4byte mode.

Hence when a CPU reset occurs, early bootloaders don't need to be aware
of BAR value or 4byte mode being enabled: they can still access the first
16MiB of the SPI NOR memory using the regular 3byte address op codes.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Tested-by: Vignesh R <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 101 +++++++++++++++++++++++++++++++++---------
 1 file changed, 80 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9bb8f91fa42e..a5120fd7095e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -81,6 +81,10 @@ struct flash_info {
 					 * because it has the same value as
 					 * ATMEL flashes)
 					*/
+#define SPI_NOR_4B_OPCODES	BIT(11)	/*
+					 * Use dedicated 4byte address op codes
+					 * to support memory size above 128Mib.
+					 */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -194,6 +198,78 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 	return mtd->priv;
 }
 
+
+static u8 spi_nor_convert_opcode(u8 opcode, const u8 table[][2])
+{
+	size_t i;
+
+	for (i = 0; table[i][0]; ++i)
+		if (table[i][0] == opcode)
+			return table[i][1];
+
+	/* No conversion found, keep input op code. */
+	return opcode;
+}
+
+static inline u8 spi_nor_convert_3to4_read(u8 opcode)
+{
+	static const u8 spi_nor_3to4_read[][2] = {
+		{ SPINOR_OP_READ,	SPINOR_OP_READ_4B },
+		{ SPINOR_OP_READ_FAST,	SPINOR_OP_READ_FAST_4B },
+		{ SPINOR_OP_READ_1_1_2,	SPINOR_OP_READ_1_1_2_4B },
+		{ SPINOR_OP_READ_1_2_2,	SPINOR_OP_READ_1_2_2_4B },
+		{ SPINOR_OP_READ_1_1_4,	SPINOR_OP_READ_1_1_4_4B },
+		{ SPINOR_OP_READ_1_4_4,	SPINOR_OP_READ_1_4_4_4B },
+		{0, 0}
+	};
+
+	return spi_nor_convert_opcode(opcode, spi_nor_3to4_read);
+}
+
+static inline u8 spi_nor_convert_3to4_program(u8 opcode)
+{
+	static const u8 spi_nor_3to4_program[][2] = {
+		{ SPINOR_OP_PP,		SPINOR_OP_PP_4B },
+		{ SPINOR_OP_PP_1_1_4,	SPINOR_OP_PP_1_1_4_4B },
+		{ SPINOR_OP_PP_1_4_4,	SPINOR_OP_PP_1_4_4_4B },
+		{0, 0}
+	};
+
+	return spi_nor_convert_opcode(opcode, spi_nor_3to4_program);
+}
+
+static inline u8 spi_nor_convert_3to4_erase(u8 opcode)
+{
+	static const u8 spi_nor_3to4_erase[][2] = {
+		{ SPINOR_OP_BE_4K,	SPINOR_OP_BE_4K_4B },
+		{ SPINOR_OP_BE_32K,	SPINOR_OP_BE_32K_4B },
+		{ SPINOR_OP_SE,		SPINOR_OP_SE_4B },
+		{0, 0}
+	};
+
+	return spi_nor_convert_opcode(opcode, spi_nor_3to4_erase);
+}
+
+static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
+				      const struct flash_info *info)
+{
+	/* Do some manufacturer fixups first */
+	switch (JEDEC_MFR(info)) {
+	case SNOR_MFR_SPANSION:
+		/* No small sector erase for 4-byte command set */
+		nor->erase_opcode = SPINOR_OP_SE;
+		nor->mtd.erasesize = info->sector_size;
+		break;
+
+	default:
+		break;
+	}
+
+	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
+	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
+	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
+}
+
 /* Enable/disable 4-byte addressing mode. */
 static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 			    int enable)
@@ -1621,27 +1697,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION) {
-			/* Dedicated 4-byte command set */
-			switch (nor->flash_read) {
-			case SPI_NOR_QUAD:
-				nor->read_opcode = SPINOR_OP_READ_1_1_4_4B;
-				break;
-			case SPI_NOR_DUAL:
-				nor->read_opcode = SPINOR_OP_READ_1_1_2_4B;
-				break;
-			case SPI_NOR_FAST:
-				nor->read_opcode = SPINOR_OP_READ_FAST_4B;
-				break;
-			case SPI_NOR_NORMAL:
-				nor->read_opcode = SPINOR_OP_READ_4B;
-				break;
-			}
-			nor->program_opcode = SPINOR_OP_PP_4B;
-			/* No small sector erase for 4-byte command set */
-			nor->erase_opcode = SPINOR_OP_SE_4B;
-			mtd->erasesize = info->sector_size;
-		} else
+		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
+		    info->flags & SPI_NOR_4B_OPCODES)
+			spi_nor_set_4byte_opcodes(nor, info);
+		else
 			set_4byte(nor, info, 1);
 	} else {
 		nor->addr_width = 3;
-- 
2.7.4
