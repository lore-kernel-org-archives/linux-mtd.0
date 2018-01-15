Received: from mail-ve1eur01on0085.outbound.protection.outlook.com
 ([104.47.1.85] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb2BM-0004LQ-L4
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 10:40:22 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Frieder
 Schrempf" <frieder.schrempf@exceet.de>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, Han Xu
 <han.xu@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "Prabhakar
 Kushwaha" <prabhakar.kushwaha@nxp.com>, Suresh Gupta <suresh.gupta@nxp.com>
Subject: RE: [PATCH v2 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
Date: Mon, 15 Jan 2018 10:39:45 +0000
Message-ID: <DB6PR0402MB2838F8D4EAE61DB0F05EFBB399EB0@DB6PR0402MB2838.eurprd04.prod.outlook.com>
References: <1516011288-6936-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1516011288-6936-2-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1516011288-6936-2-git-send-email-yogeshnarayan.gaur@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Checked performance with this patch set for Read, Write and Erase operation=
 started using mtd_debug utility.
	time mtd_debug <ops> /dev/mtd0 0xc00000 0x100000

For Read/Write perform operation with data size of 1MB and for erase perfor=
m erase of 4MB data size.

For write and erase performance degradation is in range of ~(1-2)% for abov=
e data size
For read performance degradation is in range of ~(0-1)% for above data size=
.

--
Regards
Yogesh Gaur.

> -----Original Message-----
> From: Yogesh Gaur [mailto:yogeshnarayan.gaur@nxp.com]
> Sent: Monday, January 15, 2018 3:45 PM
> To: linux-mtd@lists.infradead.org
> Cc: boris.brezillon@free-electrons.com; cyrille.pitchen@wedev4u.fr;
> computersforpeace@gmail.com; Han Xu <han.xu@nxp.com>;
> festevam@gmail.com; Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>;
> Suresh Gupta <suresh.gupta@nxp.com>; Yogesh Narayan Gaur
> <yogeshnarayan.gaur@nxp.com>
> Subject: [PATCH v2 1/2] mtd: fsl-quadspi: add support to create dynamic L=
UT
> entry
>=20
> Add support to create dynamic LUT entry.
>=20
> Current approach of creating LUT entries for various cmds like read, writ=
e,
> erase, readid, readsr, we, wd etc is that when QSPI controller gets initi=
alized at
> that time static LUT entries for these cmds get created.
>=20
> Patch add support to create the LUT at run time based on the operation be=
ing
> performed.
>=20
> Added API fsl_qspi_prepare_lut(), this API would going to be called from
> fsl_qspi_read_reg, fsl_qspi_write_reg, fsl_qspi_write, fsl_qspi_read and
> fsl_qspi_erase APIs.
> This API would fetch required info like opcode, protocol info, dummy info=
 for
> creating LUT from instance of 'struct spi_nor' and then prepare LUT entry=
 for the
> required command.
>=20
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
>=20
> v1: Swap patch sequences in the series to solve git bissect issue.
> v2: Add STOP instruction for prepared LUT and remove memset of 4 LUT reg.
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 290 ++++++++++++++++++++------------=
------
>  1 file changed, 149 insertions(+), 141 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-=
quadspi.c
> index c22e3eb..48d0639 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -183,7 +183,7 @@
>=20
>  /* Macros for constructing the LUT register. */
>  #define LUT0(ins, pad, opr)						\
> -		(((opr) << OPRND0_SHIFT) | ((LUT_##pad) << PAD0_SHIFT) | \
> +		(((opr) << OPRND0_SHIFT) | ((pad) << PAD0_SHIFT) | \
>  		((LUT_##ins) << INSTR0_SHIFT))
>=20
>  #define LUT1(ins, pad, opr)	(LUT0(ins, pad, opr) << OPRND1_SHIFT)
> @@ -193,21 +193,21 @@
>  #define QUADSPI_LUT_NUM		64
>=20
>  /* SEQID -- we can have 16 seqids at most. */
> +/* LUT0 programmed by bootloader, for run-time create entry for LUT
> +seqid 1 */
>  #define SEQID_READ		0
> -#define SEQID_WREN		1
> -#define SEQID_WRDI		2
> -#define SEQID_RDSR		3
> -#define SEQID_SE		4
> -#define SEQID_CHIP_ERASE	5
> -#define SEQID_PP		6
> -#define SEQID_RDID		7
> -#define SEQID_WRSR		8
> -#define SEQID_RDCR		9
> -#define SEQID_EN4B		10
> -#define SEQID_BRWR		11
> +#define SEQID_RUN_CMD		1
>=20
>  #define QUADSPI_MIN_IOMAP SZ_4M
>=20
> +enum fsl_qspi_ops {
> +	FSL_QSPI_OPS_READ =3D 0,
> +	FSL_QSPI_OPS_WRITE,
> +	FSL_QSPI_OPS_ERASE,
> +	FSL_QSPI_OPS_READ_REG,
> +	FSL_QSPI_OPS_WRITE_REG,
> +	FSL_QSPI_OPS_WRITE_BUF_REG,
> +};
> +
>  enum fsl_qspi_devtype {
>  	FSL_QUADSPI_VYBRID,
>  	FSL_QUADSPI_IMX6SX,
> @@ -368,136 +368,140 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, =
void
> *dev_id)
>  	return IRQ_HANDLED;
>  }
>=20
> -static void fsl_qspi_init_lut(struct fsl_qspi *q)
> +static inline s8 pad_count(s8 pad_val)
> +{
> +	s8 count =3D -1;
> +
> +	if (!pad_val)
> +		return 0;
> +
> +	while (pad_val) {
> +		pad_val >>=3D 1;
> +		count++;
> +	}
> +	return count;
> +}
> +
> +/*
> + * Prepare LUT entry for the input cmd.
> + * Protocol info is present in instance of struct spi_nor, using which
> +fields
> + * like cmd, data, addrlen along with pad info etc can be parsed.
> + */
> +static void fsl_qspi_prepare_lut(struct spi_nor *nor,
> +				 enum fsl_qspi_ops ops, u8 cmd)
>  {
> +	struct fsl_qspi *q =3D nor->priv;
>  	void __iomem *base =3D q->iobase;
>  	int rxfifo =3D q->devtype_data->rxfifo;
> +	int txfifo =3D q->devtype_data->txfifo;
>  	u32 lut_base;
> -	int i;
> -
> -	struct spi_nor *nor =3D &q->nor[0];
> +	u8 cmd_pad, addr_pad, data_pad, dummy_pad;
> +	enum spi_nor_protocol protocol =3D 0;
>  	u8 addrlen =3D (nor->addr_width =3D=3D 3) ? ADDR24BIT : ADDR32BIT;
> -	u8 read_op =3D nor->read_opcode;
> -	u8 read_dm =3D nor->read_dummy;
> +	u8 read_dm, opcode;
> +	int stop_lut;
> +
> +	read_dm =3D opcode =3D cmd_pad =3D addr_pad =3D data_pad =3D dummy_pad =
=3D
> 0;
> +
> +	switch (ops) {
> +	case FSL_QSPI_OPS_READ_REG:
> +	case FSL_QSPI_OPS_WRITE_REG:
> +	case FSL_QSPI_OPS_WRITE_BUF_REG:
> +		opcode =3D cmd;
> +		protocol =3D nor->reg_proto;
> +		break;
> +	case FSL_QSPI_OPS_READ:
> +		opcode =3D cmd;
> +		read_dm =3D nor->read_dummy;
> +		protocol =3D nor->read_proto;
> +		break;
> +	case FSL_QSPI_OPS_WRITE:
> +		opcode =3D cmd;
> +		protocol =3D nor->write_proto;
> +		break;
> +	case FSL_QSPI_OPS_ERASE:
> +		opcode =3D cmd;
> +		break;
> +	default:
> +		dev_err(q->dev, "Unsupported operation 0x%.2x\n", ops);
> +		return;
> +	}
> +
> +	if (protocol) {
> +		cmd_pad =3D spi_nor_get_protocol_inst_nbits(protocol);
> +		addr_pad =3D spi_nor_get_protocol_addr_nbits(protocol);
> +		data_pad =3D spi_nor_get_protocol_data_nbits(protocol);
> +	}
> +
> +	dummy_pad =3D data_pad;
> +
> +	dev_dbg(q->dev, "ops:%x opcode:%x pad[cmd:%d, addr:%d,
> data:%d]\n",
> +			ops, opcode, cmd_pad, addr_pad, data_pad);
>=20
>  	fsl_qspi_unlock_lut(q);
>=20
> -	/* Clear all the LUT table */
> -	for (i =3D 0; i < QUADSPI_LUT_NUM; i++)
> -		qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i * 4);
> -
> -	/* Read */
> -	lut_base =3D SEQID_READ * 4;
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> -		    LUT1(FSL_READ, PAD4, rxfifo),
> -			base + QUADSPI_LUT(lut_base + 1));
> -
> -	/* Write enable */
> -	lut_base =3D SEQID_WREN * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WREN),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Page Program */
> -	lut_base =3D SEQID_PP * 4;
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, nor->program_opcode) |
> -		    LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 0),
> -			base + QUADSPI_LUT(lut_base + 1));
> -
> -	/* Read Status */
> -	lut_base =3D SEQID_RDSR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDSR) |
> -			LUT1(FSL_READ, PAD1, 0x1),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Erase a sector */
> -	lut_base =3D SEQID_SE * 4;
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, nor->erase_opcode) |
> -		    LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Erase the whole chip */
> -	lut_base =3D SEQID_CHIP_ERASE * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* READ ID */
> -	lut_base =3D SEQID_RDID * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDID) |
> -			LUT1(FSL_READ, PAD1, 0x8),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Write Register */
> -	lut_base =3D SEQID_WRSR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRSR) |
> -			LUT1(FSL_WRITE, PAD1, 0x2),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Read Configuration Register */
> -	lut_base =3D SEQID_RDCR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDCR) |
> -			LUT1(FSL_READ, PAD1, 0x1),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Write disable */
> -	lut_base =3D SEQID_WRDI * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRDI),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Enter 4 Byte Mode (Micron) */
> -	lut_base =3D SEQID_EN4B * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_EN4B),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Enter 4 Byte Mode (Spansion) */
> -	lut_base =3D SEQID_BRWR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),
> -			base + QUADSPI_LUT(lut_base));
> +	/* Dynamic LUT */
> +	lut_base =3D SEQID_RUN_CMD * 4;
>=20
> -	fsl_qspi_lock_lut(q);
> -}
> +	/* default, STOP instruction to be programmed in (lut_base + 1) reg */
> +	stop_lut =3D 1;
> +	switch (ops) {
> +	case FSL_QSPI_OPS_READ_REG:
> +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad), opcode) |
> +			  LUT1(FSL_READ, pad_count(data_pad), rxfifo),
> +			  base + QUADSPI_LUT(lut_base));
> +		break;
> +	case FSL_QSPI_OPS_WRITE_REG:
> +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad), opcode),
> +			  base + QUADSPI_LUT(lut_base));
> +		break;
> +	case FSL_QSPI_OPS_WRITE_BUF_REG:
> +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad), opcode) |
> +			  LUT1(FSL_WRITE, pad_count(data_pad), txfifo),
> +			  base + QUADSPI_LUT(lut_base));
> +		break;
> +	case FSL_QSPI_OPS_READ:
> +	case FSL_QSPI_OPS_WRITE:
> +	case FSL_QSPI_OPS_ERASE:
> +		/* Common for Read, Write and Erase ops. */
> +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad), opcode) |
> +				LUT1(ADDR, pad_count(addr_pad), addrlen),
> +				base + QUADSPI_LUT(lut_base));
> +		/*
> +		 * For Erase ops - Data and Dummy not required.
> +		 * For Write ops - Dummy not required.
> +		 */
>=20
> -/* Get the SEQID for the command */
> -static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd) -{
> -	switch (cmd) {
> -	case SPINOR_OP_READ_1_1_4:
> -		return SEQID_READ;
> -	case SPINOR_OP_WREN:
> -		return SEQID_WREN;
> -	case SPINOR_OP_WRDI:
> -		return SEQID_WRDI;
> -	case SPINOR_OP_RDSR:
> -		return SEQID_RDSR;
> -	case SPINOR_OP_SE:
> -		return SEQID_SE;
> -	case SPINOR_OP_CHIP_ERASE:
> -		return SEQID_CHIP_ERASE;
> -	case SPINOR_OP_PP:
> -		return SEQID_PP;
> -	case SPINOR_OP_RDID:
> -		return SEQID_RDID;
> -	case SPINOR_OP_WRSR:
> -		return SEQID_WRSR;
> -	case SPINOR_OP_RDCR:
> -		return SEQID_RDCR;
> -	case SPINOR_OP_EN4B:
> -		return SEQID_EN4B;
> -	case SPINOR_OP_BRWR:
> -		return SEQID_BRWR;
> +		if (ops =3D=3D FSL_QSPI_OPS_READ) {
> +			qspi_writel(q,
> +				    LUT0(DUMMY, pad_count(dummy_pad),
> read_dm) |
> +				    LUT1(FSL_READ, pad_count(data_pad),
> rxfifo),
> +				    base + QUADSPI_LUT(lut_base + 1));
> +			stop_lut =3D 2;
> +
> +			/* TODO Add condition to check if READ is IP/AHB. */
> +
> +			/* For AHB read, add seqid in BFGENCR register. */
> +			qspi_writel(q,
> +				SEQID_RUN_CMD <<
> QUADSPI_BFGENCR_SEQID_SHIFT,
> +				q->iobase + QUADSPI_BFGENCR);
> +		}
> +
> +		if (ops =3D=3D FSL_QSPI_OPS_WRITE) {
> +			qspi_writel(q, LUT0(FSL_WRITE, pad_count(data_pad),
> 0),
> +					base + QUADSPI_LUT(lut_base + 1));
> +			stop_lut =3D 2;
> +		}
> +		break;
>  	default:
> -		if (cmd =3D=3D q->nor[0].erase_opcode)
> -			return SEQID_SE;
> -		dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
> +		dev_err(q->dev, "Unsupported operation 0x%.2x\n", ops);
>  		break;
>  	}
> -	return -EINVAL;
> +
> +	/* prepare LUT for STOP instruction. */
> +	qspi_writel(q, 0, base +  QUADSPI_LUT(lut_base + stop_lut));
> +
> +	fsl_qspi_lock_lut(q);
>  }
>=20
>  static int
> @@ -532,7 +536,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 =
cmd)
>  	} while (1);
>=20
>  	/* trigger the LUT now */
> -	seqid =3D fsl_qspi_get_seqid(q, cmd);
> +	seqid =3D SEQID_RUN_CMD;
>  	qspi_writel(q, (seqid << QUADSPI_IPCR_SEQID_SHIFT) | len,
>  			base + QUADSPI_IPCR);
>=20
> @@ -684,8 +688,8 @@ static void fsl_qspi_init_ahb_read(struct fsl_qspi *q=
)
>  	qspi_writel(q, 0, base + QUADSPI_BUF1IND);
>  	qspi_writel(q, 0, base + QUADSPI_BUF2IND);
>=20
> -	/* Set the default lut sequence for AHB Read. */
> -	seqid =3D fsl_qspi_get_seqid(q, q->nor[0].read_opcode);
> +	/* Set dynamic LUT entry as lut sequence for AHB Read . */
> +	seqid =3D SEQID_RUN_CMD;
>  	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
>  		q->iobase + QUADSPI_BFGENCR);
>  }
> @@ -728,7 +732,6 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>  	void __iomem *base =3D q->iobase;
>  	u32 reg;
>  	int ret;
> -
>  	/* disable and unprepare clock to avoid glitch pass to controller */
>  	fsl_qspi_clk_disable_unprep(q);
>=20
> @@ -746,9 +749,6 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>  		base + QUADSPI_MCR);
>  	udelay(1);
>=20
> -	/* Init the LUT table. */
> -	fsl_qspi_init_lut(q);
> -
>  	/* Disable the module */
>  	qspi_writel(q, QUADSPI_MCR_MDIS_MASK |
> QUADSPI_MCR_RESERVED_MASK,
>  			base + QUADSPI_MCR);
> @@ -794,9 +794,6 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q=
)
>  	if (ret)
>  		return ret;
>=20
> -	/* Init the LUT table again. */
> -	fsl_qspi_init_lut(q);
> -
>  	return 0;
>  }
>=20
> @@ -820,6 +817,7 @@ static int fsl_qspi_read_reg(struct spi_nor *nor, u8
> opcode, u8 *buf, int len)
>  	int ret;
>  	struct fsl_qspi *q =3D nor->priv;
>=20
> +	fsl_qspi_prepare_lut(nor, FSL_QSPI_OPS_READ_REG, opcode);
>  	ret =3D fsl_qspi_runcmd(q, opcode, 0, len);
>  	if (ret)
>  		return ret;
> @@ -834,6 +832,8 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8
> opcode, u8 *buf, int len)
>  	int ret;
>=20
>  	if (!buf) {
> +		/* Prepare LUT for WRITE_REG cmd with input BUF as NULL. */
> +		fsl_qspi_prepare_lut(nor, FSL_QSPI_OPS_WRITE_REG, opcode);
>  		ret =3D fsl_qspi_runcmd(q, opcode, 0, 1);
>  		if (ret)
>  			return ret;
> @@ -842,6 +842,8 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8
> opcode, u8 *buf, int len)
>  			fsl_qspi_invalid(q);
>=20
>  	} else if (len > 0) {
> +		/* Prepare LUT for WRITE_REG cmd with input BUF non-NULL.
> */
> +		fsl_qspi_prepare_lut(nor, FSL_QSPI_OPS_WRITE_BUF_REG,
> opcode);
>  		ret =3D fsl_qspi_nor_write(q, nor, opcode, 0,
>  					(u32 *)buf, len);
>  		if (ret > 0)
> @@ -858,8 +860,11 @@ static ssize_t fsl_qspi_write(struct spi_nor *nor, l=
off_t
> to,
>  			      size_t len, const u_char *buf)  {
>  	struct fsl_qspi *q =3D nor->priv;
> -	ssize_t ret =3D fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
> -					 (u32 *)buf, len);
> +	ssize_t ret;
> +
> +	fsl_qspi_prepare_lut(nor, FSL_QSPI_OPS_WRITE, nor-
> >program_opcode);
> +	ret =3D fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
> +				 (u32 *)buf, len);
>=20
>  	/* invalid the data in the AHB buffer. */
>  	fsl_qspi_invalid(q);
> @@ -872,6 +877,8 @@ static ssize_t fsl_qspi_read(struct spi_nor *nor, lof=
f_t
> from,
>  	struct fsl_qspi *q =3D nor->priv;
>  	u8 cmd =3D nor->read_opcode;
>=20
> +	fsl_qspi_prepare_lut(nor, FSL_QSPI_OPS_READ, nor->read_opcode);
> +
>  	/* if necessary,ioremap buffer before AHB read, */
>  	if (!q->ahb_addr) {
>  		q->memmap_offs =3D q->chip_base_addr + from; @@ -920,6
> +927,7 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
>  	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
>  		nor->mtd.erasesize / 1024, q->chip_base_addr, (u32)offs);
>=20
> +	fsl_qspi_prepare_lut(nor, FSL_QSPI_OPS_ERASE, nor->erase_opcode);
>  	ret =3D fsl_qspi_runcmd(q, nor->erase_opcode, offs, 0);
>  	if (ret)
>  		return ret;
> --
> 1.9.1
