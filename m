Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP4d7-0002gV-Fa
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 11:55:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>, <Cyrille.Pitchen@microchip.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
Date: Tue, 20 Nov 2018 11:55:21 +0000
Message-ID: <20181120115512.15958-1-tudor.ambarus@microchip.com>
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

From: Cyrille Pitchen <cyrille.pitchen@microchip.com>

Add support for SFDP (JESD216B) 4-byte Address Instruction Table. This
table is optional but when available, we parse it to get the 4-byte
address op codes supported by the memory.
Using these op codes is stateless as opposed to entering the 4-byte
address mode or setting the Base Address Register (BAR).

Flashes that have the 4BAIT table declared can now support
SPINOR_OP_PP_1_1_4_4B and SPINOR_OP_PP_1_4_4_4B opcodes.

Tested on MX25L25673G.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
[tudor.ambarus@microchip.com:
- rework erase and page program logic,
- pass DMA-able buffer to spi_nor_read_sfdp(),
- various minor updates.]
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Depends on spi_nor_sort_erase_mask() defined in
"[PATCH v2] mtd: spi-nor: fix selection of uniform erase type in flexible c=
onf".

 drivers/mtd/spi-nor/spi-nor.c | 189 ++++++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 189 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4c7e4dc25006..3495557b4948 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2268,6 +2268,7 @@ struct sfdp_parameter_header {
=20
 #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
 #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
+#define SFDP_4BAIT_ID		0xff84	/* 4-byte Address Instruction Table */
=20
 #define SFDP_SIGNATURE		0x50444653U
 #define SFDP_JESD216_MAJOR	1
@@ -3101,6 +3102,190 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
 	return ret;
 }
=20
+#define SFDP_4BAIT_DWORD_MAX	2
+
+struct sfdp_4bait {
+	/* The hardware capability. */
+	u32		hwcaps;
+
+	/*
+	 * The <supported_bit> bit in DWORD1 of the 4BAIT tells us whether
+	 * the associated 4-byte address op code is supported.
+	 */
+	u32		supported_bit;
+};
+
+/**
+ * spi_nor_parse_4bait() - parse the 4-Byte Address Instruction Table
+ * @nor:		pointer to a 'struct spi_nor'.
+ * @param_header:	pointer to the 'struct sfdp_parameter_header' describing
+ *			the 4-Byte Address Instruction Table length and version.
+ * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_parse_4bait(struct spi_nor *nor,
+			       const struct sfdp_parameter_header *param_header,
+			       struct spi_nor_flash_parameter *params)
+{
+	static const struct sfdp_4bait reads[] =3D {
+		{ SNOR_HWCAPS_READ,		BIT(0) },
+		{ SNOR_HWCAPS_READ_FAST,	BIT(1) },
+		{ SNOR_HWCAPS_READ_1_1_2,	BIT(2) },
+		{ SNOR_HWCAPS_READ_1_2_2,	BIT(3) },
+		{ SNOR_HWCAPS_READ_1_1_4,	BIT(4) },
+		{ SNOR_HWCAPS_READ_1_4_4,	BIT(5) },
+		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
+		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
+		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
+	};
+	static const struct sfdp_4bait programs[] =3D {
+		{ SNOR_HWCAPS_PP,		BIT(6) },
+		{ SNOR_HWCAPS_PP_1_1_4,		BIT(7) },
+		{ SNOR_HWCAPS_PP_1_4_4,		BIT(8) },
+	};
+	static const struct sfdp_4bait erases[SNOR_ERASE_TYPE_MAX] =3D {
+		{ 0u /* not used */,		BIT(9) },
+		{ 0u /* not used */,		BIT(10) },
+		{ 0u /* not used */,		BIT(11) },
+		{ 0u /* not used */,		BIT(12) },
+	};
+	struct spi_nor_pp_command *params_pp =3D params->page_programs;
+	struct spi_nor_erase_map *map =3D &nor->erase_map;
+	struct spi_nor_erase_type *erase_type =3D map->erase_type;
+	u32 *dwords;
+	size_t len;
+	u32 addr, discard_hwcaps, read_hwcaps, pp_hwcaps, erase_mask;
+	int i, ret;
+
+	if (param_header->major !=3D SFDP_JESD216_MAJOR ||
+	    param_header->length < SFDP_4BAIT_DWORD_MAX)
+		return -EINVAL;
+
+	/* Read the 4-byte Address Instruction Table. */
+	len =3D sizeof(*dwords) * SFDP_4BAIT_DWORD_MAX;
+
+	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
+	dwords =3D kmalloc(len, GFP_KERNEL);
+	if (!dwords)
+		return -ENOMEM;
+
+	addr =3D SFDP_PARAM_HEADER_PTP(param_header);
+	ret =3D spi_nor_read_sfdp(nor, addr, len, dwords);
+	if (ret)
+		return ret;
+
+	/* Fix endianness of the 4BAIT DWORDs. */
+	for (i =3D 0; i < SFDP_4BAIT_DWORD_MAX; i++)
+		dwords[i] =3D le32_to_cpu(dwords[i]);
+
+	/*
+	 * Compute the subset of (Fast) Read commands for which the 4-byte
+	 * version is supported.
+	 */
+	discard_hwcaps =3D 0;
+	read_hwcaps =3D 0;
+	for (i =3D 0; i < ARRAY_SIZE(reads); i++) {
+		const struct sfdp_4bait *read =3D &reads[i];
+
+		discard_hwcaps |=3D read->hwcaps;
+		if ((params->hwcaps.mask & read->hwcaps) &&
+		    (dwords[0] & read->supported_bit))
+			read_hwcaps |=3D read->hwcaps;
+	}
+
+	/*
+	 * Compute the subset of Page Program commands for which the 4-byte
+	 * version is supported.
+	 */
+	pp_hwcaps =3D 0;
+	for (i =3D 0; i < ARRAY_SIZE(programs); i++) {
+		const struct sfdp_4bait *program =3D &programs[i];
+
+		/*
+		 * The 4 Byte Address Instruction (Optional) Table is the only
+		 * SFDP table that indicates support for Page Program Commands.
+		 * Bypass the params->hwcaps.mask and consider 4BAIT the biggest
+		 * authority for specifying Page Program support.
+		 */
+		discard_hwcaps |=3D program->hwcaps;
+		if (dwords[0] & program->supported_bit)
+			pp_hwcaps |=3D program->hwcaps;
+	}
+
+	/*
+	 * Compute the subset of Sector Erase commands for which the 4-byte
+	 * version is supported.
+	 */
+	erase_mask =3D 0;
+	for (i =3D 0; i < SNOR_ERASE_TYPE_MAX; i++) {
+		const struct sfdp_4bait *erase =3D &erases[i];
+
+		if (dwords[0] & erase->supported_bit)
+			erase_mask |=3D BIT(i);
+	}
+
+	/* Replicate the sort done for the map's erase types in BFPT. */
+	erase_mask =3D spi_nor_sort_erase_mask(map, erase_mask);
+
+	/*
+	 * We need at least one 4-byte op code per read, program and erase
+	 * operation; the .read(), .write() and .erase() hooks share the
+	 * nor->addr_width value.
+	 */
+	if (!read_hwcaps || !pp_hwcaps || !erase_mask)
+		goto out;
+
+	/*
+	 * Discard all operations from the 4-byte instruction set which are
+	 * not supported by this memory.
+	 */
+	params->hwcaps.mask &=3D ~discard_hwcaps;
+	params->hwcaps.mask |=3D (read_hwcaps | pp_hwcaps);
+
+	/* Use the 4-byte address instruction set. */
+	for (i =3D 0; i < SNOR_CMD_READ_MAX; i++) {
+		struct spi_nor_read_command *read_cmd =3D &params->reads[i];
+
+		read_cmd->opcode =3D spi_nor_convert_3to4_read(read_cmd->opcode);
+	}
+
+	/* 4BAIT is the only SFDP table that indicates page program support. */
+	if (pp_hwcaps & SNOR_HWCAPS_PP)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP],
+					SPINOR_OP_PP_4B, SNOR_PROTO_1_1_1);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_4)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_4],
+					SPINOR_OP_PP_1_1_4_4B,
+					SNOR_PROTO_1_1_4);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_4_4)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_4_4],
+					SPINOR_OP_PP_1_4_4_4B,
+					SNOR_PROTO_1_4_4);
+
+	for (i =3D 0; i < SNOR_ERASE_TYPE_MAX; i++) {
+		if (erase_mask & BIT(i))
+			erase_type[i].opcode =3D (dwords[1] >>
+						erase_type[i].idx * 8) & 0xFF;
+		else
+			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
+	}
+
+	/*
+	 * We set nor->addr_width here to skip spi_nor_set_4byte_opcodes()
+	 * later because this latest function implements a legacy quirk for
+	 * the erase size of Spansion memory. However this quirk is no longer
+	 * needed with new SFDP compliant memories.
+	 */
+	nor->addr_width =3D 4;
+	nor->flags |=3D SPI_NOR_4B_OPCODES;
+
+	/* fall through */
+out:
+	kfree(dwords);
+	return ret;
+}
+
 /**
  * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
  * @nor:		pointer to a 'struct spi_nor'
@@ -3198,6 +3383,10 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 			err =3D spi_nor_parse_smpt(nor, param_header);
 			break;
=20
+		case SFDP_4BAIT_ID:
+			err =3D spi_nor_parse_4bait(nor, param_header, params);
+			break;
+
 		default:
 			break;
 		}
--=20
2.9.4
