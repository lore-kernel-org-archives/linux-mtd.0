Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emLXR-0004Ir-NT
 for linux-mtd@lists.infradead.org; Thu, 15 Feb 2018 15:34:04 +0000
Date: Thu, 15 Feb 2018 16:33:18 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 cyrille.pitchen@wedev4u.fr, han.xu@nxp.com, computersforpeace@gmail.com,
 festevam@gmail.com, Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: Re: [PATCH v5 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
Message-ID: <20180215163318.2a0ac5c1@bbrezillon>
In-Reply-To: <1517330970-15197-2-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1517330970-15197-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1517330970-15197-2-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Frieder

Hi Yogesh,

On Tue, 30 Jan 2018 22:19:29 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Add support to create dynamic LUT entry.
> 
> Current approach of creating LUT entries for various cmds like read, write,
> erase, readid, readsr, we, wd etc is that when QSPI controller gets
> initialized at that time static LUT entries for these cmds get created.
> 
> Patch add support to create the LUT at run time based on the operation
> being performed.
> 
> Added API fsl_qspi_prepare_lut(), this API would going to be called from
> fsl_qspi_read_reg, fsl_qspi_write_reg, fsl_qspi_write, fsl_qspi_read and
> fsl_qspi_erase APIs.
> This API would fetch required info like opcode, protocol info, dummy info
> for creating LUT from instance of 'struct spi_nor' and then prepare LUT
> entry for the required command.

You're probably already aware that I proposed a new "generic spi-mem
API" [1] and started to port the fsl-qspi driver [2] to this new
interface. While doing that I came to the same conclusion: given the
small overhead implied by LUT preparation, we can prepare OP sequences
dynamically instead of hardcoding them at probe time.

I know I'm talking about hypothetical changes while you're providing
patches for something that already exists and is in use, but maybe it'd
be worth discussing things a bit so that your changes go in the
direction of the spi-mem ones.

> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
> Changes for v5:
> - Fix LUT preparation for SPINOR_OP_READ and SPINOR_OP_READ_4B cmds.
> Changes for v4:
> - Correct version numbering.
> Changes for v3:
> - Add STOP instruction for prepared LUT and remove memset of 4 LUT reg.
> Changes for v2:
> - Swap patch sequences in the series to solve git bissect issue.
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 310 +++++++++++++++++++++-----------------
>  1 file changed, 168 insertions(+), 142 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 89306cf..84c341b 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -183,7 +183,7 @@
>  
>  /* Macros for constructing the LUT register. */
>  #define LUT0(ins, pad, opr)						\
> -		(((opr) << OPRND0_SHIFT) | ((LUT_##pad) << PAD0_SHIFT) | \
> +		(((opr) << OPRND0_SHIFT) | ((pad) << PAD0_SHIFT) | \
>  		((LUT_##ins) << INSTR0_SHIFT))
>  
>  #define LUT1(ins, pad, opr)	(LUT0(ins, pad, opr) << OPRND1_SHIFT)
> @@ -193,21 +193,21 @@
>  #define QUADSPI_LUT_NUM		64
>  
>  /* SEQID -- we can have 16 seqids at most. */
> -#define SEQID_READ		0
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
> +/* LUT0 programmed by bootloader, for run-time create entry for LUT seqid 1 */
> +#define SEQID_LUT0_BOOTLOADER	0
> +#define SEQID_LUT1_RUNTIME	1
>  
>  #define QUADSPI_MIN_IOMAP SZ_4M
>  
> +enum fsl_qspi_ops {
> +	FSL_QSPI_OPS_READ = 0,
> +	FSL_QSPI_OPS_WRITE,
> +	FSL_QSPI_OPS_ERASE,
> +	FSL_QSPI_OPS_READ_REG,
> +	FSL_QSPI_OPS_WRITE_REG,
> +	FSL_QSPI_OPS_WRITE_BUF_REG,
> +};

Could we express things in something more extensible? I mean, something
closer to the spi_mem_op structure I add here [1]. This way the
transition to the spi-mem interface will be easier.

> +
>  enum fsl_qspi_devtype {
>  	FSL_QUADSPI_VYBRID,
>  	FSL_QUADSPI_IMX6SX,
> @@ -368,136 +368,158 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static void fsl_qspi_init_lut(struct fsl_qspi *q)
> +static inline s8 pad_count(s8 pad_val)
>  {
> +	s8 count = -1;
> +
> +	if (!pad_val)
> +		return 0;
> +
> +	while (pad_val) {
> +		pad_val >>= 1;
> +		count++;
> +	}
> +	return count;
> +}
> +
> +/*
> + * Prepare LUT entry for the input cmd.
> + * Protocol info is present in instance of struct spi_nor, using which fields
> + * like cmd, data, addrlen along with pad info etc can be parsed.
> + */
> +static void fsl_qspi_prepare_lut(struct spi_nor *nor,
> +				 enum fsl_qspi_ops ops, u8 cmd)
> +{
> +	struct fsl_qspi *q = nor->priv;
>  	void __iomem *base = q->iobase;
>  	int rxfifo = q->devtype_data->rxfifo;
> +	int txfifo = q->devtype_data->txfifo;
>  	u32 lut_base;
> -	int i;
> +	u8 cmd_pad, addr_pad, data_pad, dummy_pad;
> +	enum spi_nor_protocol protocol = 0;
> +	u8 addrlen = 0;
> +	u8 read_dm, opcode;
> +	int stop_lut;
> +
> +	read_dm = opcode = cmd_pad = addr_pad = data_pad = dummy_pad = 0;
> +
> +	switch (ops) {
> +	case FSL_QSPI_OPS_READ_REG:
> +	case FSL_QSPI_OPS_WRITE_REG:
> +	case FSL_QSPI_OPS_WRITE_BUF_REG:
> +		opcode = cmd;
> +		protocol = nor->reg_proto;
> +		break;
> +	case FSL_QSPI_OPS_READ:
> +		opcode = cmd;
> +		read_dm = nor->read_dummy;
> +		protocol = nor->read_proto;
> +		break;
> +	case FSL_QSPI_OPS_WRITE:
> +		opcode = cmd;
> +		protocol = nor->write_proto;
> +		break;
> +	case FSL_QSPI_OPS_ERASE:
> +		opcode = cmd;
> +		break;
> +	default:
> +		dev_err(q->dev, "Unsupported operation 0x%.2x\n", ops);
> +		return;
> +	}
> +
> +	if (protocol) {
> +		cmd_pad = spi_nor_get_protocol_inst_nbits(protocol);
> +		addr_pad = spi_nor_get_protocol_addr_nbits(protocol);
> +		data_pad = spi_nor_get_protocol_data_nbits(protocol);
> +	}
>  
> -	struct spi_nor *nor = &q->nor[0];
> -	u8 addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
> -	u8 read_op = nor->read_opcode;
> -	u8 read_dm = nor->read_dummy;
> +	dummy_pad = data_pad;
> +
> +	dev_dbg(q->dev, "ops:%x opcode:%x pad[cmd:%d, addr:%d, data:%d]\n",
> +			ops, opcode, cmd_pad, addr_pad, data_pad);
>  
>  	fsl_qspi_unlock_lut(q);
>  
> -	/* Clear all the LUT table */
> -	for (i = 0; i < QUADSPI_LUT_NUM; i++)
> -		qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i * 4);
> -
> -	/* Read */
> -	lut_base = SEQID_READ * 4;
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> -		    LUT1(FSL_READ, PAD4, rxfifo),
> -			base + QUADSPI_LUT(lut_base + 1));
> -
> -	/* Write enable */
> -	lut_base = SEQID_WREN * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WREN),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Page Program */
> -	lut_base = SEQID_PP * 4;
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, nor->program_opcode) |
> -		    LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 0),
> -			base + QUADSPI_LUT(lut_base + 1));
> -
> -	/* Read Status */
> -	lut_base = SEQID_RDSR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDSR) |
> -			LUT1(FSL_READ, PAD1, 0x1),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Erase a sector */
> -	lut_base = SEQID_SE * 4;
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, nor->erase_opcode) |
> -		    LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Erase the whole chip */
> -	lut_base = SEQID_CHIP_ERASE * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* READ ID */
> -	lut_base = SEQID_RDID * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDID) |
> -			LUT1(FSL_READ, PAD1, 0x8),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Write Register */
> -	lut_base = SEQID_WRSR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRSR) |
> -			LUT1(FSL_WRITE, PAD1, 0x2),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Read Configuration Register */
> -	lut_base = SEQID_RDCR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDCR) |
> -			LUT1(FSL_READ, PAD1, 0x1),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Write disable */
> -	lut_base = SEQID_WRDI * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRDI),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Enter 4 Byte Mode (Micron) */
> -	lut_base = SEQID_EN4B * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_EN4B),
> -			base + QUADSPI_LUT(lut_base));
> -
> -	/* Enter 4 Byte Mode (Spansion) */
> -	lut_base = SEQID_BRWR * 4;
> -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),
> -			base + QUADSPI_LUT(lut_base));
> +	/* Dynamic LUT */
> +	lut_base = SEQID_LUT1_RUNTIME * 4;
>  
> -	fsl_qspi_lock_lut(q);
> -}
> +	/* default, STOP instruction to be programmed in (lut_base + 1) reg */
> +	stop_lut = 1;
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
>  
> -/* Get the SEQID for the command */
> -static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
> -{
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
> +		addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
> +
> +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad), opcode) |
> +				LUT1(ADDR, pad_count(addr_pad), addrlen),
> +				base + QUADSPI_LUT(lut_base));
> +		/*
> +		 * For Erase ops - Data and Dummy not required.
> +		 * For Write ops - Dummy not required.
> +		 */
> +
> +		if (ops == FSL_QSPI_OPS_READ) {
> +
> +			/*
> +			 * For cmds SPINOR_OP_READ and SPINOR_OP_READ_4B value
> +			 * of dummy cycles are 0.
> +			 */
> +			if (read_dm)
> +				qspi_writel(q,
> +					    LUT0(DUMMY, pad_count(dummy_pad),
> +					    read_dm) |
> +					    LUT1(FSL_READ, pad_count(data_pad),
> +					    rxfifo),
> +					    base + QUADSPI_LUT(lut_base + 1));
> +			else
> +				qspi_writel(q,
> +					    LUT0(FSL_READ, pad_count(data_pad),
> +					    rxfifo),
> +					    base + QUADSPI_LUT(lut_base + 1));
> +
> +			stop_lut = 2;
> +
> +			/* TODO Add condition to check if READ is IP/AHB. */
> +
> +			/* For AHB read, add seqid in BFGENCR register. */
> +			qspi_writel(q,
> +				    SEQID_LUT1_RUNTIME <<
> +				    QUADSPI_BFGENCR_SEQID_SHIFT,
> +				    q->iobase + QUADSPI_BFGENCR);
> +		}
> +
> +		if (ops == FSL_QSPI_OPS_WRITE) {
> +			qspi_writel(q, LUT0(FSL_WRITE, pad_count(data_pad), 0),
> +					base + QUADSPI_LUT(lut_base + 1));
> +			stop_lut = 2;
> +		}
> +		break;
>  	default:
> -		if (cmd == q->nor[0].erase_opcode)
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

If you express operations in a generic way (with opcode, addr-cycles,
dummy-cycles and data-in/out-cycles), this function would not have to
grow every time a new operation is added to the SPI framework, and more
importantly, you would be able to support SPI NAND operations with
almost no modifications.

Regards,

Boris

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=27088
[2]https://github.com/bbrezillon/linux/commit/43cc45764b975bfbb191de3f6a37e073da1a2706
[3]https://github.com/bbrezillon/linux/commit/15782494b0850533e9417ae31954e33e157bbbae#diff-2f804a2dee71d794fa82981b87f9fe0aR1291

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
