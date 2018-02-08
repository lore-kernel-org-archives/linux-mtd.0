Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ejqc3-0001ry-V9
 for linux-mtd@lists.infradead.org; Thu, 08 Feb 2018 18:08:03 +0000
Date: Thu, 8 Feb 2018 19:07:44 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 richard@nod.at, bpringle@sympatico.ca, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v2] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180208190744.615a25ef@xps13>
In-Reply-To: <20180114220012.30039-1-stefan@agner.ch>
References: <20180114220012.30039-1-stefan@agner.ch>
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

Hello Stefan,

On Sun, 14 Jan 2018 23:00:12 +0100
Stefan Agner <stefan@agner.ch> wrote:

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

First, thank you again for implementing this interface in the vf610
driver. Sorry for the very big delay I have been pretty busy these
days.

My comments are below.

> Hi,
>=20
> In this second version I was able to remove all special command
> handling. As Boris suggested, the special READID/STATUS handling
> is really not needed and all return values can be read from the
> regular data buffer. This simplified code even more and allowed
> to get rid of the hack in the MTD core. The driver is now able

That is great. A rule of thumb that I tend to also forget when I write
code: logic should not be in the NAND controller driver.

> to handle all commands in a single function. Therefor I also got
> rid of the command parser, since everything is handled in a single
> function anyway.
>=20
> The only thing which is somewhat unfortunate is the byte ordering
> which needs to be reversed for commands which read flash data (id,
> status and parameter page). All those request 8-bit handling, so
> I used this as an indicator to fix byte order.
>=20
> I did meassured a slight performance drop (before vs. now):
> - write speed is 4036 KiB/s vs 3495 KiB/s
> - read speed is 13741 KiB/s vs 13490 KiB/s
>=20
> --
> Stefan
>=20
>  drivers/mtd/nand/vf610_nfc.c | 444 +++++++++++++++++++------------------=
------
>  1 file changed, 194 insertions(+), 250 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 80d31a58e558..fb428a94bbd4 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -59,20 +59,20 @@
>  #define OOB_64				0x0040
>  #define OOB_MAX				0x0100
> =20
> -/*
> - * NFC_CMD2[CODE] values. See section:
> - *  - 31.4.7 Flash Command Code Description, Vybrid manual
> - *  - 23.8.6 Flash Command Sequencer, MPC5125 manual
> - *
> - * Briefly these are bitmasks of controller cycles.
> - */
> -#define READ_PAGE_CMD_CODE		0x7EE0
> -#define READ_ONFI_PARAM_CMD_CODE	0x4860
> -#define PROGRAM_PAGE_CMD_CODE		0x7FC0
> -#define ERASE_CMD_CODE			0x4EC0
> -#define READ_ID_CMD_CODE		0x4804
> -#define RESET_CMD_CODE			0x4040
> -#define STATUS_READ_CMD_CODE		0x4068
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
> =20
>  /* NFC ECC mode define */
>  #define ECC_BYPASS			0
> @@ -97,10 +97,21 @@
>  /* NFC_COL_ADDR Field */
>  #define COL_ADDR_MASK				0x0000FFFF
>  #define COL_ADDR_SHIFT				0
> +#define COL_ADDR_BYTE1_SHIFT			0
> +#define COL_ADDR_BYTE2_SHIFT			8
> +#define COL_ADDR_BYTE1(x)			((x & 0xFF) << COL_ADDR_BYTE1_SHIFT)
> +#define COL_ADDR_BYTE2(x)			((x & 0XFF) << COL_ADDR_BYTE2_SHIFT)
> +
> =20
>  /* NFC_ROW_ADDR Field */
>  #define ROW_ADDR_MASK				0x00FFFFFF
>  #define ROW_ADDR_SHIFT				0
> +#define ROW_ADDR_BYTE1_SHIFT			0
> +#define ROW_ADDR_BYTE2_SHIFT			8
> +#define ROW_ADDR_BYTE3_SHIFT			16
> +#define ROW_ADDR_BYTE1(x)			((x & 0xFF) << ROW_ADDR_BYTE1_SHIFT)
> +#define ROW_ADDR_BYTE2(x)			((x & 0XFF) << ROW_ADDR_BYTE2_SHIFT)
> +#define ROW_ADDR_BYTE3(x)			((x & 0XFF) << ROW_ADDR_BYTE3_SHIFT)
>  #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
>  #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
>  #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
> @@ -142,13 +153,6 @@
>  #define ECC_STATUS_MASK		0x80
>  #define ECC_STATUS_ERR_COUNT	0x3F
> =20
> -enum vf610_nfc_alt_buf {
> -	ALT_BUF_DATA =3D 0,
> -	ALT_BUF_ID =3D 1,
> -	ALT_BUF_STAT =3D 2,
> -	ALT_BUF_ONFI =3D 3,
> -};
> -
>  enum vf610_nfc_variant {
>  	NFC_VFC610 =3D 1,
>  };
> @@ -158,10 +162,7 @@ struct vf610_nfc {
>  	struct device *dev;
>  	void __iomem *regs;
>  	struct completion cmd_done;
> -	uint buf_offset;
> -	int write_sz;
>  	/* Status and ID are in alternate locations. */
> -	enum vf610_nfc_alt_buf alt_buf;
>  	enum vf610_nfc_variant variant;
>  	struct clk *clk;
>  	bool use_hw_ecc;
> @@ -173,6 +174,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mt=
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
> @@ -214,7 +220,6 @@ static inline void vf610_nfc_memcpy(void *dst, const =
void __iomem *src,
>  	memcpy(dst, src, n);
>  }
> =20
> -/* Clear flags for upcoming command */
>  static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
>  {
>  	u32 tmp =3D vf610_nfc_read(nfc, NFC_IRQ_STATUS);
> @@ -243,51 +248,22 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
>  	vf610_nfc_clear_status(nfc);
>  }
> =20
> -static u8 vf610_nfc_get_id(struct vf610_nfc *nfc, int col)
> -{
> -	u32 flash_id;
> -
> -	if (col < 4) {
> -		flash_id =3D vf610_nfc_read(nfc, NFC_FLASH_STATUS1);
> -		flash_id >>=3D (3 - col) * 8;
> -	} else {
> -		flash_id =3D vf610_nfc_read(nfc, NFC_FLASH_STATUS2);
> -		flash_id >>=3D 24;
> -	}
> -
> -	return flash_id & 0xff;
> -}
> -
> -static u8 vf610_nfc_get_status(struct vf610_nfc *nfc)
> +static void vf610_nfc_send_code(struct vf610_nfc *nfc, u32 cmd_code)
>  {
> -	return vf610_nfc_read(nfc, NFC_FLASH_STATUS2) & STATUS_BYTE1_MASK;
> +	vf610_nfc_set_field(nfc, NFC_FLASH_CMD2, CMD_CODE_MASK, CMD_CODE_SHIFT,
> +			    cmd_code);
>  }
> =20
> -static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_byte1,
> -				   u32 cmd_code)
> +static void vf610_nfc_set_cmd1(struct vf610_nfc *nfc, u32 cmd_byte1)
>  {
> -	u32 tmp;
> -
> -	vf610_nfc_clear_status(nfc);
> -
> -	tmp =3D vf610_nfc_read(nfc, NFC_FLASH_CMD2);
> -	tmp &=3D ~(CMD_BYTE1_MASK | CMD_CODE_MASK | BUFNO_MASK);
> -	tmp |=3D cmd_byte1 << CMD_BYTE1_SHIFT;
> -	tmp |=3D cmd_code << CMD_CODE_SHIFT;
> -	vf610_nfc_write(nfc, NFC_FLASH_CMD2, tmp);
> +	vf610_nfc_set_field(nfc, NFC_FLASH_CMD2, CMD_BYTE1_MASK,
> +			    CMD_BYTE1_SHIFT, cmd_byte1);
>  }
> =20
> -static void vf610_nfc_send_commands(struct vf610_nfc *nfc, u32 cmd_byte1,
> -				    u32 cmd_byte2, u32 cmd_code)
> +static void vf610_nfc_set_cmd2(struct vf610_nfc *nfc, u32 cmd_byte2)
>  {
> -	u32 tmp;
> -
> -	vf610_nfc_send_command(nfc, cmd_byte1, cmd_code);
> -
> -	tmp =3D vf610_nfc_read(nfc, NFC_FLASH_CMD1);
> -	tmp &=3D ~CMD_BYTE2_MASK;
> -	tmp |=3D cmd_byte2 << CMD_BYTE2_SHIFT;
> -	vf610_nfc_write(nfc, NFC_FLASH_CMD1, tmp);
> +	vf610_nfc_set_field(nfc, NFC_FLASH_CMD1, CMD_BYTE2_MASK,
> +			    CMD_BYTE2_SHIFT, cmd_byte2);
>  }
> =20
>  static irqreturn_t vf610_nfc_irq(int irq, void *data)
> @@ -301,19 +277,6 @@ static irqreturn_t vf610_nfc_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> -static void vf610_nfc_addr_cycle(struct vf610_nfc *nfc, int column, int =
page)
> -{
> -	if (column !=3D -1) {
> -		if (nfc->chip.options & NAND_BUSWIDTH_16)
> -			column =3D column / 2;
> -		vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
> -				    COL_ADDR_SHIFT, column);
> -	}
> -	if (page !=3D -1)
> -		vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> -				    ROW_ADDR_SHIFT, page);
> -}
> -
>  static inline void vf610_nfc_ecc_mode(struct vf610_nfc *nfc, int ecc_mod=
e)
>  {
>  	vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG,
> @@ -326,167 +289,158 @@ static inline void vf610_nfc_transfer_size(struct=
 vf610_nfc *nfc, int size)
>  	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, size);
>  }
> =20
> -static void vf610_nfc_command(struct mtd_info *mtd, unsigned command,
> -			      int column, int page)
> +static inline const struct nand_op_instr *vf610_get_next_instr(
> +	const struct nand_operation *op, int *op_id)
>  {
> -	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> -	int trfr_sz =3D nfc->chip.options & NAND_BUSWIDTH_16 ? 1 : 0;
> +	if (*op_id + 1 >=3D op->ninstrs)
> +		return NULL;
> =20
> -	nfc->buf_offset =3D max(column, 0);
> -	nfc->alt_buf =3D ALT_BUF_DATA;
> +	return &op->instrs[++(*op_id)];

I don't like very much this syntax because it is kind of unreadable.

Would you mind incrementing op_id before the return statement?

> +}
> =20
> -	switch (command) {
> -	case NAND_CMD_SEQIN:
> -		/* Use valid column/page from preread... */
> -		vf610_nfc_addr_cycle(nfc, column, page);
> -		nfc->buf_offset =3D 0;
> +static int vf610_nfc_exec_op(struct nand_chip *chip,
> +			     const struct nand_operation *op,
> +			     bool check_only)

The soul of ->exec_op() is here :) However this implementation looks
very specific to the kind of tasks you are used to do with one specific
chip. What if someone wants to support a new command that implies
several command/address/data cycles interleaved? Maybe one solution
would be to rework a bit by using a case statement in a for loop. If
the indentation level is too high, you may use helpers to do small
tasks like sending a command or addresse cycle. What do you think?

> +{
> +	const struct nand_op_instr *instr;
> +	struct vf610_nfc *nfc =3D chip_to_nfc(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int op_id =3D -1, trfr_sz =3D 0, code =3D 0;
> =20
> -		/*
> -		 * SEQIN =3D> data =3D> PAGEPROG sequence is done by the controller
> -		 * hence we do not need to issue the command here...
> -		 */
> -		return;
> -	case NAND_CMD_PAGEPROG:
> -		trfr_sz +=3D nfc->write_sz;
> -		vf610_nfc_transfer_size(nfc, trfr_sz);
> -		vf610_nfc_send_commands(nfc, NAND_CMD_SEQIN,
> -					command, PROGRAM_PAGE_CMD_CODE);
> -		if (nfc->use_hw_ecc)
> -			vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> -		else
> -			vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> -		break;
> -
> -	case NAND_CMD_RESET:
> -		vf610_nfc_transfer_size(nfc, 0);
> -		vf610_nfc_send_command(nfc, command, RESET_CMD_CODE);
> -		break;
> -
> -	case NAND_CMD_READOOB:
> -		trfr_sz +=3D mtd->oobsize;
> -		column =3D mtd->writesize;
> -		vf610_nfc_transfer_size(nfc, trfr_sz);
> -		vf610_nfc_send_commands(nfc, NAND_CMD_READ0,
> -					NAND_CMD_READSTART, READ_PAGE_CMD_CODE);
> -		vf610_nfc_addr_cycle(nfc, column, page);
> -		vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> -		break;
> -
> -	case NAND_CMD_READ0:
> -		trfr_sz +=3D mtd->writesize + mtd->oobsize;
> -		vf610_nfc_transfer_size(nfc, trfr_sz);
> -		vf610_nfc_send_commands(nfc, NAND_CMD_READ0,
> -					NAND_CMD_READSTART, READ_PAGE_CMD_CODE);
> -		vf610_nfc_addr_cycle(nfc, column, page);
> -		vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> -		break;
> -
> -	case NAND_CMD_PARAM:
> -		nfc->alt_buf =3D ALT_BUF_ONFI;
> -		trfr_sz =3D 3 * sizeof(struct nand_onfi_params);
> -		vf610_nfc_transfer_size(nfc, trfr_sz);
> -		vf610_nfc_send_command(nfc, command, READ_ONFI_PARAM_CMD_CODE);
> -		vf610_nfc_addr_cycle(nfc, -1, column);
> -		vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> -		break;
> -
> -	case NAND_CMD_ERASE1:
> -		vf610_nfc_transfer_size(nfc, 0);
> -		vf610_nfc_send_commands(nfc, command,
> -					NAND_CMD_ERASE2, ERASE_CMD_CODE);
> -		vf610_nfc_addr_cycle(nfc, column, page);
> -		break;
> -
> -	case NAND_CMD_READID:
> -		nfc->alt_buf =3D ALT_BUF_ID;
> -		nfc->buf_offset =3D 0;
> -		vf610_nfc_transfer_size(nfc, 0);
> -		vf610_nfc_send_command(nfc, command, READ_ID_CMD_CODE);
> -		vf610_nfc_addr_cycle(nfc, -1, column);
> -		break;
> -
> -	case NAND_CMD_STATUS:
> -		nfc->alt_buf =3D ALT_BUF_STAT;
> -		vf610_nfc_transfer_size(nfc, 0);
> -		vf610_nfc_send_command(nfc, command, STATUS_READ_CMD_CODE);
> -		break;
> -	default:
> -		return;
> +
> +	/* Some ops are optional, but they need to be in order */
> +	instr =3D vf610_get_next_instr(op, &op_id);
> +	if (!instr)
> +		return -EINVAL;
> +
> +	if (instr && instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +		dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
> +		vf610_nfc_set_cmd1(nfc, instr->ctx.cmd.opcode);
> +		code |=3D COMMAND_CMD_BYTE1;
> +
> +		instr =3D vf610_get_next_instr(op, &op_id);
>  	}
> =20
> -	vf610_nfc_done(nfc);
> +	if (instr && instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> +		int addr =3D 0;
> +		u32 col =3D 0, row;
> =20
> -	nfc->use_hw_ecc =3D false;
> -	nfc->write_sz =3D 0;
> -}
> +		if (instr->ctx.addr.naddrs > 1) {
> +			col =3D COL_ADDR_BYTE1(instr->ctx.addr.addrs[addr++]);
> +			code |=3D COMMAND_CAR_BYTE1;
> =20
> -static void vf610_nfc_read_buf(struct mtd_info *mtd, u_char *buf, int le=
n)
> -{
> -	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> -	uint c =3D nfc->buf_offset;
> +			if (mtd->writesize > 512) {
> +				col |=3D COL_ADDR_BYTE2(instr->ctx.addr.addrs[addr++]);
> +				code |=3D COMMAND_CAR_BYTE2;
> +			}
> +		}
> =20
> -	/* Alternate buffers are only supported through read_byte */
> -	WARN_ON(nfc->alt_buf);
> +		row =3D ROW_ADDR_BYTE1(instr->ctx.addr.addrs[addr++]);
> +		code |=3D COMMAND_RAR_BYTE1;
> +		if (addr < instr->ctx.addr.naddrs) {
> +			row |=3D ROW_ADDR_BYTE2(instr->ctx.addr.addrs[addr++]);
> +			code |=3D COMMAND_RAR_BYTE2;
> +		}
> +		if (addr < instr->ctx.addr.naddrs) {
> +			row |=3D ROW_ADDR_BYTE3(instr->ctx.addr.addrs[addr++]);
> +			code |=3D COMMAND_RAR_BYTE3;
> +		}
> =20
> -	vf610_nfc_memcpy(buf, nfc->regs + NFC_MAIN_AREA(0) + c, len);
> +		dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
> +		vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
> +			    COL_ADDR_SHIFT, col);
> =20
> -	nfc->buf_offset +=3D len;
> -}
> +		vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +			    ROW_ADDR_SHIFT, row);
> =20
> -static void vf610_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
> -				int len)
> -{
> -	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> -	uint c =3D nfc->buf_offset;
> -	uint l;
> +		instr =3D vf610_get_next_instr(op, &op_id);
> +	}
> =20
> -	l =3D min_t(uint, len, mtd->writesize + mtd->oobsize - c);
> -	vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + c, buf, l);
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_OUT_INSTR) {
> +		int len =3D instr->ctx.data.len;
> +		int offset =3D 0;
> =20
> -	nfc->write_sz +=3D l;
> -	nfc->buf_offset +=3D l;
> -}
> +		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n", len, offset);
> +
> +		vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + offset,
> +				 instr->ctx.data.buf.in + offset,
> +				 len);
> +		code |=3D COMMAND_WRITE_DATA;
> +		trfr_sz +=3D len;
> +
> +		instr =3D vf610_get_next_instr(op, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +		vf610_nfc_set_cmd2(nfc, instr->ctx.cmd.opcode);
> +		code |=3D COMMAND_CMD_BYTE2;
> +
> +		instr =3D vf610_get_next_instr(op, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> +		//dev_dbg(nfc->dev, "WAITRDY [max %d ms]\n",
> +		//		  instr->ctx.waitrdy.timeout_ms);
> +		code |=3D COMMAND_RB_HANDSHAKE;
> +
> +		instr =3D vf610_get_next_instr(op, &op_id);
> +	}
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +		int len =3D instr->ctx.data.len;
> +		code |=3D COMMAND_READ_DATA;
> +		trfr_sz +=3D len;
> +	}
> +
> +	if (nfc->use_hw_ecc) {
> +		vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
> +
> +		/* Always transfer complete page with OOB when using HW ECC */
> +		trfr_sz =3D mtd->writesize + mtd->oobsize;
> +	} else {
> +		vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
> +	}
> +	vf610_nfc_transfer_size(nfc, trfr_sz);
> +	vf610_nfc_send_code(nfc, code);
> +
> +	dev_dbg(nfc->dev, "Start: code: 0x%04x, hw ecc: %d, trfr_sz %d\n",
> +		code, nfc->use_hw_ecc, trfr_sz);
> +	vf610_nfc_done(nfc);
> +
> +	if (instr && instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +		int len =3D instr->ctx.data.len;
> +		int offset =3D 0;
> +		bool fix_byte_order =3D false;
> =20
> -static uint8_t vf610_nfc_read_byte(struct mtd_info *mtd)
> -{
> -	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> -	u8 tmp;
> -	uint c =3D nfc->buf_offset;
> -
> -	switch (nfc->alt_buf) {
> -	case ALT_BUF_ID:
> -		tmp =3D vf610_nfc_get_id(nfc, c);
> -		break;
> -	case ALT_BUF_STAT:
> -		tmp =3D vf610_nfc_get_status(nfc);
> -		break;
>  #ifdef __LITTLE_ENDIAN
> -	case ALT_BUF_ONFI:
> -		/* Reverse byte since the controller uses big endianness */
> -		c =3D nfc->buf_offset ^ 0x3;
> -		/* fall-through */
> +		fix_byte_order =3D true;
>  #endif
> -	default:
> -		tmp =3D *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
> -		break;
> -	}
> -	nfc->buf_offset++;
> -	return tmp;
> -}
> +		dev_dbg(nfc->dev, "OP_DATA_IN: 8-bit: %d, len %d, offset %d\n",
> +			instr->ctx.data.force_8bit , len, offset);
> =20
> -static u16 vf610_nfc_read_word(struct mtd_info *mtd)
> -{
> -	u16 tmp;
> +		/*
> +		 * HACK: force_8bit indicates reading of the parameter, status
> +		 * or id data. The controllers seems to store data in big endian

Well this is right today, but tomorrow, who knows which command will be
executed in 8-bit mode?

> +		 * byte order to the buffers. Reverse on little endian machines.
> +		 */
> +		if (instr->ctx.data.force_8bit && fix_byte_order) {
> +			u8 *buf =3D instr->ctx.data.buf.in;
> =20
> -	vf610_nfc_read_buf(mtd, (u_char *)&tmp, sizeof(tmp));
> -	return tmp;
> -}
> +			while (len--) {
> +				int c =3D offset ^ 0x3;
> =20
> -/* If not provided, upper layers apply a fixed delay. */
> -static int vf610_nfc_dev_ready(struct mtd_info *mtd)
> -{
> -	/* NFC handles R/B internally; always ready.  */
> -	return 1;
> +				*buf =3D *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
> +				//dev_info(nfc->dev, "[%d]: %02x\n", offset, *buf);
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
>  }

When using ->exec_op, I don't think you actually need a proper
->dev_ready() like before.

> =20
>  /*
> @@ -511,21 +465,6 @@ static void vf610_nfc_select_chip(struct mtd_info *m=
td, int chip)
>  	vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);
>  }
> =20
> -/* Count the number of 0's in buff up to max_bits */
> -static inline int count_written_bits(uint8_t *buff, int size, int max_bi=
ts)
> -{
> -	uint32_t *buff32 =3D (uint32_t *)buff;
> -	int k, written_bits =3D 0;
> -
> -	for (k =3D 0; k < (size / 4); k++) {
> -		written_bits +=3D hweight32(~buff32[k]);
> -		if (unlikely(written_bits > max_bits))
> -			break;
> -	}
> -
> -	return written_bits;
> -}
> -
>  static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *=
dat,
>  					 uint8_t *oob, int page)
>  {
> @@ -542,8 +481,7 @@ static inline int vf610_nfc_correct_data(struct mtd_i=
nfo *mtd, uint8_t *dat,
>  		return ecc_count;
> =20
>  	/* Read OOB without ECC unit enabled */
> -	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
> -	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
> +	nand_read_page_op(&nfc->chip, page, mtd->writesize, oob, mtd->oobsize);

Would not a nand_read_oob_op() fit better here if you only need the OOB?

> =20
>  	/*
>  	 * On an erased page, bit count (including OOB) should be zero or
> @@ -557,12 +495,17 @@ static inline int vf610_nfc_correct_data(struct mtd=
_info *mtd, uint8_t *dat,
>  static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *c=
hip,
>  				uint8_t *buf, int oob_required, int page)
>  {
> +	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
>  	int eccsize =3D chip->ecc.size;
>  	int stat;
> =20
> +	nfc->use_hw_ecc =3D true;
>  	nand_read_page_op(chip, page, 0, buf, eccsize);
>  	if (oob_required)
> -		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +		vf610_nfc_memcpy(chip->oob_poi,
> +				 nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
> +				 mtd->oobsize);
> +	nfc->use_hw_ecc =3D false;
> =20
>  	stat =3D vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
> =20
> @@ -579,16 +522,20 @@ static int vf610_nfc_write_page(struct mtd_info *mt=
d, struct nand_chip *chip,
>  				const uint8_t *buf, int oob_required, int page)
>  {
>  	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> +	int ret;
> =20
> -	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
> -	if (oob_required)
> -		vf610_nfc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> -
> -	/* Always write whole page including OOB due to HW ECC */
>  	nfc->use_hw_ecc =3D true;
> -	nfc->write_sz =3D mtd->writesize + mtd->oobsize;
> +	ret =3D nand_prog_page_op(chip, page, 0, buf, mtd->writesize);
> +	nfc->use_hw_ecc =3D false;

What about calling the default ->write_page_raw() instead, which I
guess should do exactly this by default (must check).

> =20
> -	return nand_prog_page_end_op(chip);
> +	return ret;
> +}
> +
> +static int vf610_nfc_write_page_raw(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> +				const uint8_t *buf, int oob_required, int page)
> +{
> +	return nand_prog_page_op(chip, page, 0, buf,
> +			mtd->writesize + oob_required ? mtd->oobsize : 0);
>  }

I think this is already handled by the core if you don't populate the
->write_page_raw entry.

> =20
>  static const struct of_device_id vf610_nfc_dt_ids[] =3D {
> @@ -606,6 +553,9 @@ static void vf610_nfc_preinit_controller(struct vf610=
_nfc *nfc)
>  	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_DMA_REQ_BIT);
>  	vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_FAST_FLASH_BIT);
> =20
> +	/* Make sure flags are cleared on startup */
> +	vf610_nfc_clear_status(nfc);
> +

This should probably be in another patch?

>  	/* Disable virtual pages, only one elementary transfer unit */
>  	vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG, CONFIG_PAGE_CNT_MASK,
>  			    CONFIG_PAGE_CNT_SHIFT, 1);
> @@ -695,15 +645,8 @@ static int vf610_nfc_probe(struct platform_device *p=
dev)
>  		goto err_clk;
>  	}
> =20
> -	chip->dev_ready =3D vf610_nfc_dev_ready;
> -	chip->cmdfunc =3D vf610_nfc_command;
> -	chip->read_byte =3D vf610_nfc_read_byte;
> -	chip->read_word =3D vf610_nfc_read_word;
> -	chip->read_buf =3D vf610_nfc_read_buf;
> -	chip->write_buf =3D vf610_nfc_write_buf;
> +	chip->exec_op =3D vf610_nfc_exec_op;
>  	chip->select_chip =3D vf610_nfc_select_chip;
> -	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;
> -	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;
> =20
>  	chip->options |=3D NAND_NO_SUBPAGE_WRITE;
> =20
> @@ -770,6 +713,7 @@ static int vf610_nfc_probe(struct platform_device *pd=
ev)
> =20
>  		chip->ecc.read_page =3D vf610_nfc_read_page;
>  		chip->ecc.write_page =3D vf610_nfc_write_page;
> +		chip->ecc.write_page_raw =3D vf610_nfc_write_page_raw;
> =20
>  		chip->ecc.size =3D PAGE_2K;
>  	}


Thank you again for this work.
Miqu=C3=A8l

--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
