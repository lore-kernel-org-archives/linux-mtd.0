Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ek3vW-0003gN-8m
 for linux-mtd@lists.infradead.org; Fri, 09 Feb 2018 08:21:01 +0000
Date: Fri, 9 Feb 2018 09:20:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180209092034.729e45b9@xps13>
In-Reply-To: <20180208235921.31840-3-stefan@agner.ch>
References: <20180208235921.31840-1-stefan@agner.ch>
 <20180208235921.31840-3-stefan@agner.ch>
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

Thanks for splitting the series, it is much easier to review.

On Fri,  9 Feb 2018 00:59:20 +0100, Stefan Agner <stefan@agner.ch>
wrote:

> This reworks the driver to make use of ->exec_op() callback. The
> command sequencer of the VF610 NFC aligns well with the new ops
> interface.
>=20
> The ops are translated to a NFC command code while filling the
> necessary registers. Instead of using the special status and
> read id command codes (which require the status/id form special
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
>  drivers/mtd/nand/vf610_nfc.c | 279 +++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 267 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 2fa61cbdbaf7..eae95877422d 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -74,6 +74,21 @@
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
> @@ -97,10 +112,14 @@
>  /* NFC_COL_ADDR Field */
>  #define COL_ADDR_MASK				0x0000FFFF
>  #define COL_ADDR_SHIFT				0
> +#define COL_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
> +
> =20
>  /* NFC_ROW_ADDR Field */
>  #define ROW_ADDR_MASK				0x00FFFFFF
>  #define ROW_ADDR_SHIFT				0
> +#define ROW_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
> +
>  #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
>  #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
>  #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
> @@ -173,6 +192,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mt=
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
> @@ -489,6 +513,184 @@ static int vf610_nfc_dev_ready(struct mtd_info *mtd)
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
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int op_id =3D -1, addr =3D 0, trfr_sz =3D 0;
> +	u32 col =3D 0, row =3D 0, cmd1 =3D 0, cmd2 =3D 0, code =3D 0;
> +
> +	/* Some ops are optional, but they need to be in order */
> +	instr =3D vf610_get_next_instr(subop, &op_id);
> +	if (!instr)
> +		return -EINVAL;

Maybe here you don't need to call get_next_instr but just derive the
pointer from the subop parameter?

> +
> +	if (instr && instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +		dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
> +		cmd2 |=3D instr->ctx.cmd.opcode << CMD_BYTE1_SHIFT;
> +		code |=3D COMMAND_CMD_BYTE1;
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> +
> +		if (instr->ctx.addr.naddrs > 1) {
> +			col =3D COL_ADDR(0, instr->ctx.addr.addrs[addr++]);
> +			code |=3D COMMAND_CAR_BYTE1;
> +
> +			if (mtd->writesize > 512) {
> +				col |=3D COL_ADDR(1, instr->ctx.addr.addrs[addr++]);
> +				code |=3D COMMAND_CAR_BYTE2;
> +			}
> +		}
> +
> +		row =3D ROW_ADDR(0, instr->ctx.addr.addrs[addr++]);
> +		code |=3D COMMAND_RAR_BYTE1;
> +		if (addr < instr->ctx.addr.naddrs) {
> +			row |=3D ROW_ADDR(1, instr->ctx.addr.addrs[addr++]);
> +			code |=3D COMMAND_RAR_BYTE2;
> +		}
> +		if (addr < instr->ctx.addr.naddrs) {
> +			row |=3D ROW_ADDR(2, instr->ctx.addr.addrs[addr++]);
> +			code |=3D COMMAND_RAR_BYTE3;
> +		}
> +
> +		dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_OUT_INSTR) {
> +		int len =3D nand_subop_get_data_len(subop, op_id);
> +		int offset =3D nand_subop_get_data_start_off(subop, op_id);
> +
> +		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n", len, offset);
> +
> +		vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + offset,
> +				 instr->ctx.data.buf.in + offset,
> +				 len);
> +		code |=3D COMMAND_WRITE_DATA;
> +		trfr_sz +=3D len;
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
> +		//dev_dbg(nfc->dev, "WAITRDY [max %d ms]\n",
> +		//		  instr->ctx.waitrdy.timeout_ms);

Debug comment   ^

> +		code |=3D COMMAND_RB_HANDSHAKE;
> +
> +		instr =3D vf610_get_next_instr(subop, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +		int len =3D nand_subop_get_data_len(subop, op_id);
> +		code |=3D COMMAND_READ_DATA;
> +		trfr_sz +=3D len;
> +	}
> +
> +	cmd2 |=3D code << CMD_CODE_SHIFT;
> +
> +	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +		int len =3D nand_subop_get_data_len(subop, op_id);
> +		int offset =3D nand_subop_get_data_start_off(subop, op_id);
> +		bool fix_byte_order =3D false;
> +
> +#ifdef __LITTLE_ENDIAN
> +		fix_byte_order =3D true;
> +#endif
> +		dev_dbg(nfc->dev, "OP_DATA_IN: 8-bit: %d, len %d, offset %d\n",
> +			instr->ctx.data.force_8bit , len, offset);
> +
> +		/*
> +		 * HACK: force_8bit indicates reading of the parameter, status
> +		 * or id data. The controllers seems to store data in big endian
> +		 * byte order to the buffers. Reverse on little endian machines.
> +		 */
> +		if (instr->ctx.data.force_8bit && fix_byte_order) {
> +			u8 *buf =3D instr->ctx.data.buf.in;
> +
> +			while (len--) {
> +				int c =3D offset ^ 0x3;
> +
> +				*buf =3D *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
> +				buf++; offset++;
> +			}
> +		} else {
> +			vf610_nfc_memcpy(instr->ctx.data.buf.in + offset,
> +					 nfc->regs + NFC_MAIN_AREA(0) + offset,
> +					 len);
> +		}
> +	}
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

Is this '5 address cycles' a real limit of the controller?

> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),

If PAGE_2K is 2048, you should use SZ_2K instead.

> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
> +	);

Actually, because this driver is very sequential in its way of handling
the instructions, you should split the *_exec_op() function into
smaller helpers, and declare one parser pattern per helper. I'm sure it
will be very easy to do.

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
>  /*
>   * This function supports Vybrid only (MPC5125 would have full RB and fo=
ur CS)
>   */
> @@ -527,8 +729,7 @@ static inline int vf610_nfc_correct_data(struct mtd_i=
nfo *mtd, uint8_t *dat,
>  		return ecc_count;
> =20
>  	/* Read OOB without ECC unit enabled */
> -	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
> -	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
> +	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
> =20
>  	/*
>  	 * On an erased page, bit count (including OOB) should be zero or
> @@ -542,12 +743,42 @@ static inline int vf610_nfc_correct_data(struct mtd=
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

I don't mind if you want to split all the '|=3D' flagging work in
multiple lines but perhaps some comments would be welcome too if there
is a particular logic.

> +
> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
> +
> +	vf610_nfc_memcpy(buf, nfc->regs + NFC_MAIN_AREA(0), mtd->writesize);
>  	if (oob_required)
> -		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +		vf610_nfc_memcpy(chip->oob_poi,
> +				 nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
> +				 mtd->oobsize);
> =20
>  	stat =3D vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
> =20
> @@ -564,16 +795,39 @@ static int vf610_nfc_write_page(struct mtd_info *mt=
d, struct nand_chip *chip,
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
> +	vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0), buf, mtd->writesize);
> +
> +	code |=3D COMMAND_RB_HANDSHAKE;
> +	cmd2 |=3D code << CMD_CODE_SHIFT;

Same here.

> =20
> -	/* Always write whole page including OOB due to HW ECC */
> -	nfc->use_hw_ecc =3D true;
> -	nfc->write_sz =3D mtd->writesize + mtd->oobsize;
> +	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
> =20
> -	return nand_prog_page_end_op(chip);
> +	return ret;
>  }
> =20
>  static const struct of_device_id vf610_nfc_dt_ids[] =3D {
> @@ -686,6 +940,7 @@ static int vf610_nfc_probe(struct platform_device *pd=
ev)
>  	chip->read_word =3D vf610_nfc_read_word;
>  	chip->read_buf =3D vf610_nfc_read_buf;
>  	chip->write_buf =3D vf610_nfc_write_buf;
> +	chip->exec_op =3D vf610_nfc_exec_op;
>  	chip->select_chip =3D vf610_nfc_select_chip;
>  	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;
>  	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;

This is in a good shape :)

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
