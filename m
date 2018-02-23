Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1epCYo-0006c3-Ct
 for linux-mtd@lists.infradead.org; Fri, 23 Feb 2018 12:35:03 +0000
Date: Fri, 23 Feb 2018 13:34:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 richard@nod.at, bpringle@sympatico.ca, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v4 1/2] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180223133421.76648493@xps13>
In-Reply-To: <20180222202918.8708-2-stefan@agner.ch>
References: <20180222202918.8708-1-stefan@agner.ch>
 <20180222202918.8708-2-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

Thanks for the work.

Just a few comments below, nothing big.

On Thu, 22 Feb 2018 21:29:17 +0100, Stefan Agner <stefan@agner.ch>
wrote:

> This reworks the driver to make use of ->exec_op() callback. The
> command sequencer of the VF610 NFC aligns well with the new ops
> interface.
>=20
> The ops are translated to a NFC command code while filling the

I am not a fan of contractions in plain English, mostly when
"operations" is an actual noun for something that is clear in the NAND
framework.

> necessary registers. Instead of using the special status and
> read id command codes (which require the status/id form special

s/id/ID? ^                                         ^
from?                                                 ^

The sentence is not very clear, maybe something like "Instead of using
the special status and read ID command codes (which require a special
configuration in the controller registers)." ?

> registers) the driver now uses the main data buffer for all
> commands. This simplifies the driver as no special casing is
> needed.
>=20
> For control data (status byte, id bytes and parameter page) the
> driver needs to reverse byte order for little endian CPUs since
> the controller seems to store the bytes in big endian order in
> the data buffer.
>=20
> The current state seems to pass MTD tests on a Colibri VF61.
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 439 +++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 425 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf61=
0_nfc.c
> index 5d7a1f8f580f..9baf80766307 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -74,6 +74,22 @@
>  #define RESET_CMD_CODE			0x4040
>  #define STATUS_READ_CMD_CODE		0x4068
> =20
> +/* NFC_CMD2[CODE] controller cycle bit masks */
> +#define COMMAND_CMD_BYTE1		BIT(14)
> +#define COMMAND_CAR_BYTE1		BIT(13)
> +#define COMMAND_CAR_BYTE2		BIT(12)
> +#define COMMAND_RAR_BYTE1		BIT(11)
> +#define COMMAND_RAR_BYTE2		BIT(10)
> +#define COMMAND_RAR_BYTE3		BIT(9)
> +#define COMMAND_NADDR_BYTES(x)		GENMASK(13, 13 - (x) - 1)
> +#define COMMAND_WRITE_DATA		BIT(8)
> +#define COMMAND_CMD_BYTE2		BIT(7)
> +#define COMMAND_RB_HANDSHAKE		BIT(6)
> +#define COMMAND_READ_DATA		BIT(5)
> +#define COMMAND_CMD_BYTE3		BIT(4)
> +#define COMMAND_READ_STATUS		BIT(3)
> +#define COMMAND_READ_ID			BIT(2)
> +
>  /* NFC ECC mode define */
>  #define ECC_BYPASS			0
>  #define ECC_45_BYTE			6
> @@ -97,10 +113,14 @@
>  /* NFC_COL_ADDR Field */
>  #define COL_ADDR_MASK				0x0000FFFF
>  #define COL_ADDR_SHIFT				0
> +#define COL_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
> +

Extra space

> =20
>  /* NFC_ROW_ADDR Field */
>  #define ROW_ADDR_MASK				0x00FFFFFF
>  #define ROW_ADDR_SHIFT				0
> +#define ROW_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
> +
>  #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
>  #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
>  #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
> @@ -165,6 +185,7 @@ struct vf610_nfc {
>  	enum vf610_nfc_variant variant;
>  	struct clk *clk;
>  	bool use_hw_ecc;
> +	bool page_access;
>  	u32 ecc_mode;
>  };
> =20
> @@ -173,6 +194,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mt=
d_info *mtd)
>  	return container_of(mtd_to_nand(mtd), struct vf610_nfc, chip);
>  }
> =20
> +static inline struct vf610_nfc *chip_to_nfc(struct nand_chip *chip)
> +{
> +	return container_of(chip, struct vf610_nfc, chip);
> +}
> +
>  static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
>  {
>  	return readl(nfc->regs + reg);
> @@ -214,6 +240,86 @@ static inline void vf610_nfc_memcpy(void *dst, const=
 void __iomem *src,
>  	memcpy(dst, src, n);
>  }
> =20
> +static inline bool vf610_nfc_is_little_endian(void)
> +{
> +#ifdef __LITTLE_ENDIAN
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
> +/**
> + * Read accessor for internal SRAM buffer
> + * @dst: destination address in regular memory
> + * @src: source address in SRAM buffer
> + * @len: bytes to copy
> + * @fix_endian: Fix endianness if required
> + *
> + * Use this accessor for the internal SRAM buffers. On the ARM
> + * Freescale Vybrid SoC it's known that the driver can treat
> + * the SRAM buffer as if it's memory. Other platform might need
> + * to treat the buffers differently.
> + *
> + * The controller stores bytes from the NAND chip internally in big
> + * endianness. On little endian platforms such as Vybrid this leads
> + * to reversed byte order.
> + * For performance reason (and earlier probably due to unanawareness)
> + * the driver avoids correcting endianness where it has control over
> + * write and read side (e.g. page wise data access).
> + * In case endianness matters len should be a multiple of 4.
> + */
> +static inline void vf610_nfc_rd_from_sram(void *dst, const void __iomem =
*src,
> +					  size_t len, bool fix_endian)
> +{
> +	if (vf610_nfc_is_little_endian() && fix_endian) {
> +		unsigned int i;
> +
> +		for (i =3D 0; i < len; i +=3D 4) {
> +			u32 val =3D be32_to_cpu(__raw_readl(src + i));
> +			memcpy(dst + i, &val, min(sizeof(val), len - i));
> +		}
> +	} else {
> +		memcpy_fromio(dst, src, len);
> +	}
> +}
> +
> +/**
> + * Write accessor for internal SRAM buffer
> + * @dst: destination address in SRAM buffer
> + * @src: source address in regular memory
> + * @len: bytes to copy
> + * @fix_endian: Fix endianness if required
> + *
> + * Use this accessor for the internal SRAM buffers. On the ARM
> + * Freescale Vybrid SoC it's known that the driver can treat
> + * the SRAM buffer as if it's memory. Other platform might need
> + * to treat the buffers differently.
> + *
> + * The controller stores bytes from the NAND chip internally in big
> + * endianness. On little endian platforms such as Vybrid this leads
> + * to reversed byte order.
> + * For performance reason (and earlier probably due to unanawareness)
> + * the driver avoids correcting endianness where it has control over
> + * write and read side (e.g. page wise data access).
> + * In case endianness matters len should be a multiple of 4.
> + */
> +static inline void vf610_nfc_wr_to_sram(void __iomem *dst, const void *s=
rc,
> +					size_t len, bool fix_endian)
> +{
> +	if (vf610_nfc_is_little_endian() && fix_endian) {
> +		unsigned int i;
> +
> +		for (i =3D 0; i < len; i +=3D 4) {
> +			u32 val;
> +			memcpy(&val, src + i, min(sizeof(val), len - i));
> +			__raw_writel(cpu_to_be32(val), dst + i);
> +		}
> +	} else {
> +		memcpy_toio(dst, src, len);
> +	}
> +}
> +
>  /* Clear flags for upcoming command */
>  static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
>  {
> @@ -489,6 +595,170 @@ static int vf610_nfc_dev_ready(struct mtd_info *mtd)
>  	return 1;
>  }
> =20
> +static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row=
, u32 cmd1, u32 cmd2, u32 trfr_sz)
> +{
> +	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
> +			    COL_ADDR_SHIFT, col);
> +
> +	vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +			    ROW_ADDR_SHIFT, row);
> +
> +	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, trfr_sz);
> +	vf610_nfc_write(nfc, NFC_FLASH_CMD1, cmd1);
> +	vf610_nfc_write(nfc, NFC_FLASH_CMD2, cmd2);
> +
> +	dev_dbg(nfc->dev, "col 0x%08x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, tr=
fr_sz %d\n",

Do you really need 8 digits? Commands are bytes, col is two bytes.
"trfr_sz" is not very explicit for a debug message.

> +		col, row, cmd1, cmd2, trfr_sz);
> +
> +	vf610_nfc_done(nfc);
> +}
> +
> +static inline const struct nand_op_instr *vf610_get_next_instr(
> +	const struct nand_subop *subop, int *op_id)
> +{
> +	if (*op_id + 1 >=3D subop->ninstrs)
> +		return NULL;
> +
> +	(*op_id)++;
> +
> +	return &subop->instrs[*op_id];
> +}
> +
> +static int vf610_nfc_cmd(struct nand_chip *chip,
> +				const struct nand_subop *subop)
> +{
> +	const struct nand_op_instr *instr;
> +	struct vf610_nfc *nfc =3D chip_to_nfc(chip);
> +	int op_id =3D -1, trfr_sz =3D 0, offset;
> +	u32 col =3D 0, row =3D 0, cmd1 =3D 0, cmd2 =3D 0, code =3D 0;
> +	bool force8bit =3D false;
> +
> +	/*
> +	 * Some ops are optional, but the hardware requires the operations
> +	 * to be in this exact order.
> +	 * The op parser enforces the order and makes sure that there isn't
> +	 * a read and write element in a single operation.
> +	 */
> +	instr =3D vf610_get_next_instr(subop, &op_id);
> +	if (!instr)
> +		return -EINVAL;
> +
> +	if (instr && instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +		dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
> +		cmd2 |=3D instr->ctx.cmd.opcode << CMD_BYTE1_SHIFT;
> +		code |=3D COMMAND_CMD_BYTE1;
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}

I still don't like the syntax, but if Boris is okay, then let's forget
about it.

> +
> +	if (instr && instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> +		int naddrs =3D nand_subop_get_num_addr_cyc(subop, op_id);
> +		int i =3D nand_subop_get_addr_start_off(subop, op_id);
> +
> +		for (; i < naddrs; i++) {
> +			u8 val =3D instr->ctx.addr.addrs[i];
> +			if (i < 2)
> +				col |=3D COL_ADDR(i, val);
> +			else
> +				row |=3D ROW_ADDR(i - 2, val);
> +		}
> +		code |=3D COMMAND_NADDR_BYTES(naddrs);
> +
> +		dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_OUT_INSTR) {
> +		trfr_sz =3D nand_subop_get_data_len(subop, op_id);
> +		offset =3D nand_subop_get_data_start_off(subop, op_id);
> +		force8bit =3D instr->ctx.data.force_8bit;
> +
> +		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n",
> +			trfr_sz, offset);
> +
> +		/* We don't care about endianness when writing a NAND page */
> +		vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + offset,
> +				     instr->ctx.data.buf.in + offset,
> +				     trfr_sz, !nfc->page_access);
> +		code |=3D COMMAND_WRITE_DATA;
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +		cmd1 |=3D instr->ctx.cmd.opcode << CMD_BYTE2_SHIFT;
> +		code |=3D COMMAND_CMD_BYTE2;
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> +		code |=3D COMMAND_RB_HANDSHAKE;
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +		trfr_sz =3D nand_subop_get_data_len(subop, op_id);
> +		offset =3D nand_subop_get_data_start_off(subop, op_id);
> +		force8bit =3D instr->ctx.data.force_8bit;
> +
> +		dev_dbg(nfc->dev, "OP_DATA_IN: len %d, offset %d\n",
> +			trfr_sz, offset);
> +
> +		code |=3D COMMAND_READ_DATA;
> +	}
> +
> +	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
> +		vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
> +
> +	cmd2 |=3D code << CMD_CODE_SHIFT;
> +
> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +		/* We don't care about endianness when reading a NAND page */
> +		vf610_nfc_rd_from_sram(instr->ctx.data.buf.in + offset,
> +				       nfc->regs + NFC_MAIN_AREA(0) + offset,
> +				       trfr_sz, !nfc->page_access);
> +	}
> +
> +	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
> +		vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
> +
> +	return 0;
> +}
> +
> +static const struct nand_op_parser vf610_nfc_op_parser =3D NAND_OP_PARSE=
R(
> +	NAND_OP_PARSER_PATTERN(
> +		vf610_nfc_cmd,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> +	NAND_OP_PARSER_PATTERN(
> +		vf610_nfc_cmd,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
> +	);
> +
> +static int vf610_nfc_exec_op(struct nand_chip *chip,
> +			     const struct nand_operation *op,
> +			     bool check_only)
> +{
> +	struct vf610_nfc *nfc =3D chip_to_nfc(chip);
> +
> +	dev_dbg(nfc->dev, "exec_op, opcode 0x%02x\n", op->instrs[0].ctx.cmd.opc=
ode);
> +
> +	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op, check_onl=
y);
> +}
> +
> +

Extra space.

>  /*
>   * This function supports Vybrid only (MPC5125 would have full RB and fo=
ur CS)
>   */
> @@ -526,9 +796,14 @@ static inline int vf610_nfc_correct_data(struct mtd_=
info *mtd, uint8_t *dat,
>  	if (!(ecc_status & ECC_STATUS_MASK))
>  		return ecc_count;
> =20
> -	/* Read OOB without ECC unit enabled */
> -	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
> -	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
> +	/*
> +	 * Read OOB without ECC unit enabled. We temporarily set ->page_access
> +	 * to true to make sure vf610_nfc_cmd() does not swap bytes when
> +	 * reading data from the internal SRAM.
> +	 */
> +	nfc->page_access =3D true;
> +	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
> +	nfc->page_access =3D false;
> =20
>  	/*
>  	 * On an erased page, bit count (including OOB) should be zero or
> @@ -542,12 +817,46 @@ static inline int vf610_nfc_correct_data(struct mtd=
_info *mtd, uint8_t *dat,
>  static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *c=
hip,
>  				uint8_t *buf, int oob_required, int page)
>  {
> -	int eccsize =3D chip->ecc.size;
> +	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> +	int trfr_sz =3D mtd->writesize + mtd->oobsize;
> +	u32 col =3D 0, row =3D 0, cmd1 =3D 0, cmd2 =3D 0, code =3D 0;
>  	int stat;
> =20
> -	nand_read_page_op(chip, page, 0, buf, eccsize);
> +	cmd2 |=3D NAND_CMD_READ0 << CMD_BYTE1_SHIFT;
> +	code |=3D COMMAND_CMD_BYTE1;
> +
> +	code |=3D COMMAND_CAR_BYTE1;
> +	code |=3D COMMAND_CAR_BYTE2;
> +
> +	row =3D ROW_ADDR(0, page & 0xff);
> +	code |=3D COMMAND_RAR_BYTE1;
> +	row |=3D ROW_ADDR(1, page >> 8);
> +	code |=3D COMMAND_RAR_BYTE2;
> +
> +	if (chip->options & NAND_ROW_ADDR_3) {
> +		row |=3D ROW_ADDR(2, page >> 16);
> +		code |=3D COMMAND_RAR_BYTE3;
> +	}
> +
> +	cmd1 |=3D NAND_CMD_READSTART << CMD_BYTE2_SHIFT;
> +	code |=3D COMMAND_CMD_BYTE2;
> +
> +	code |=3D COMMAND_RB_HANDSHAKE;
> +	code |=3D COMMAND_READ_DATA;
> +	cmd2 |=3D code << CMD_CODE_SHIFT;
> +
> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> +
> +	/* We don't care about endianness when reading a NAND page */

Well, if I understand correctly, this comment is not very accurate. It
is more like we don't care because this is how it was handled in the
passed and we cannot change it. Also, endianness is picked by the user
and it will work as long as read and write operations use the same
convention.

> +	vf610_nfc_rd_from_sram(buf, nfc->regs + NFC_MAIN_AREA(0),
> +			       mtd->writesize, false);
>  	if (oob_required)
> -		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +		vf610_nfc_rd_from_sram(chip->oob_poi,
> +				       nfc->regs + NFC_MAIN_AREA(0) +
> +						   mtd->writesize,
> +				       mtd->oobsize, false);
> =20
>  	stat =3D vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
> =20
> @@ -564,16 +873,113 @@ static int vf610_nfc_write_page(struct mtd_info *m=
td, struct nand_chip *chip,
>  				const uint8_t *buf, int oob_required, int page)
>  {
>  	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> +	int trfr_sz =3D mtd->writesize + mtd->oobsize;
> +	u32 col =3D 0, row =3D 0, cmd1 =3D 0, cmd2 =3D 0, code =3D 0;
> +	int ret =3D 0;
> +
> +	cmd2 |=3D NAND_CMD_SEQIN << CMD_BYTE1_SHIFT;
> +	code |=3D COMMAND_CMD_BYTE1;
> +
> +	code |=3D COMMAND_CAR_BYTE1;
> +	code |=3D COMMAND_CAR_BYTE2;
> +
> +	row =3D ROW_ADDR(0, page & 0xff);
> +	code |=3D COMMAND_RAR_BYTE1;
> +	row |=3D ROW_ADDR(1, page >> 8);
> +	code |=3D COMMAND_RAR_BYTE2;
> +	if (chip->options & NAND_ROW_ADDR_3) {
> +		row |=3D ROW_ADDR(2, page >> 16);
> +		code |=3D COMMAND_RAR_BYTE3;
> +	}
> =20
> -	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
> -	if (oob_required)
> -		vf610_nfc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	cmd1 |=3D NAND_CMD_PAGEPROG << CMD_BYTE2_SHIFT;
> +	code |=3D COMMAND_CMD_BYTE2;
> +
> +	code |=3D COMMAND_WRITE_DATA;
> +
> +	/* We don't care about endianness when writing a NAND page */

Same.

> +	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
> +			     mtd->writesize, false);
> =20
> -	/* Always write whole page including OOB due to HW ECC */
> -	nfc->use_hw_ecc =3D true;
> -	nfc->write_sz =3D mtd->writesize + mtd->oobsize;
> +	code |=3D COMMAND_RB_HANDSHAKE;
> +	cmd2 |=3D code << CMD_CODE_SHIFT;
> =20
> -	return nand_prog_page_end_op(chip);
> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> +
> +	return ret;
> +}
> +
> +static int vf610_nfc_read_page_raw(struct mtd_info *mtd, struct nand_chi=
p *chip,
> +				uint8_t *buf, int oob_required, int page)
> +{
> +	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> +	int ret;
> +
> +	/*
> +	 * We temporarily set ->page_access to true to make sure
> +	 * vf610_nfc_cmd() does not swap bytes when reading data
> +	 * from the internal SRAM.
> +	 */
> +	nfc->page_access =3D true;
> +	ret =3D nand_read_page_raw(mtd, chip, buf, oob_required, page);
> +	nfc->page_access =3D false;
> +
> +	return ret;
> +}
> +
> +static int vf610_nfc_write_page_raw(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> +				const uint8_t *buf, int oob_required, int page)
> +{
> +	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> +	int ret;
> +
> +	/*
> +	 * We temporarily set ->page_access to true to make sure
> +	 * vf610_nfc_cmd() does not swap bytes when reading data
> +	 * from the internal SRAM.
> +	 */
> +	nfc->page_access =3D true;
> +	ret =3D nand_write_page_raw(mtd, chip, buf, oob_required, page);
> +	nfc->page_access =3D false;
> +
> +	return ret;
> +}
> +
> +static int vf610_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *ch=
ip,
> +			int page)
> +{
> +	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> +	int ret;
> +
> +	/*
> +	 * We temporarily set ->page_access to true to make sure
> +	 * vf610_nfc_cmd() does not swap bytes when reading data
> +	 * from the internal SRAM.
> +	 */
> +	nfc->page_access =3D true;
> +	ret =3D nand_read_oob_std(mtd, chip, page);
> +	nfc->page_access =3D false;
> +
> +	return ret;
> +}
> +static int vf610_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *c=
hip,
> +			int page)
> +{
> +	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> +	int ret;
> +
> +	/*
> +	 * We temporarily set ->page_access to true to make sure
> +	 * vf610_nfc_cmd() does not swap bytes when reading data
> +	 * from the internal SRAM.
> +	 */
> +	nfc->page_access =3D true;

It looks like most of the time you use ->page_access it is for
something else than just "configuring page access for actual page
access". Maybe you should rename this variable?

Also, I don't know what Boris prefers but maybe we should move this
comment to the variable declaration and here just mention what you do
(prevent byte swapping) instead of how you do it.

> +	ret =3D nand_write_oob_std(mtd, chip, page);
> +	nfc->page_access =3D false;
> +
> +	return ret;
>  }
> =20
>  static const struct of_device_id vf610_nfc_dt_ids[] =3D {
> @@ -590,6 +996,7 @@ static void vf610_nfc_preinit_controller(struct vf610=
_nfc *nfc)
>  	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_BOOT_MODE_BIT);
>  	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_DMA_REQ_BIT);
>  	vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_FAST_FLASH_BIT);
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> =20
>  	/* Disable virtual pages, only one elementary transfer unit */
>  	vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG, CONFIG_PAGE_CNT_MASK,
> @@ -686,6 +1093,7 @@ static int vf610_nfc_probe(struct platform_device *p=
dev)
>  	chip->read_word =3D vf610_nfc_read_word;
>  	chip->read_buf =3D vf610_nfc_read_buf;
>  	chip->write_buf =3D vf610_nfc_write_buf;
> +	chip->exec_op =3D vf610_nfc_exec_op;
>  	chip->select_chip =3D vf610_nfc_select_chip;
>  	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;
>  	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;
> @@ -755,7 +1163,10 @@ static int vf610_nfc_probe(struct platform_device *=
pdev)
> =20
>  		chip->ecc.read_page =3D vf610_nfc_read_page;
>  		chip->ecc.write_page =3D vf610_nfc_write_page;
> -
> +		chip->ecc.read_page_raw =3D vf610_nfc_read_page_raw;
> +		chip->ecc.write_page_raw =3D vf610_nfc_write_page_raw;
> +		chip->ecc.read_oob =3D vf610_nfc_read_oob;
> +		chip->ecc.write_oob =3D vf610_nfc_write_oob;
>  		chip->ecc.size =3D PAGE_2K;
>  	}
> =20

Best regards,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
