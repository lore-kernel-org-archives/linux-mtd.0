Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enhsV-0005Iw-5A
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 09:36:57 +0000
Date: Mon, 19 Feb 2018 10:36:29 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, Han Xu
 <han.xu@nxp.com>, Marek Vasut <marex@denx.de>
Cc: "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Suresh Gupta <suresh.gupta@nxp.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH v5 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
Message-ID: <20180219103629.234dfea9@bbrezillon>
In-Reply-To: <VI1PR0402MB2845E9CB695B2E3CBB8A7F9F99C80@VI1PR0402MB2845.eurprd04.prod.outlook.com>
References: <1517330970-15197-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1517330970-15197-2-git-send-email-yogeshnarayan.gaur@nxp.com>
 <20180215163318.2a0ac5c1@bbrezillon>
 <VI1PR0402MB2845E9CB695B2E3CBB8A7F9F99C80@VI1PR0402MB2845.eurprd04.prod.outlook.com>
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

Hi Yogesh,

On Mon, 19 Feb 2018 07:07:50 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi Boris,
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > Sent: Thursday, February 15, 2018 9:03 PM
> > To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> > Cc: linux-mtd@lists.infradead.org;
> > boris.brezillon@free-electrons.com; Prabhakar Kushwaha
> > <prabhakar.kushwaha@nxp.com>; Suresh Gupta <suresh.gupta@nxp.com>;
> > cyrille.pitchen@wedev4u.fr; Han Xu <han.xu@nxp.com>;
> > computersforpeace@gmail.com; festevam@gmail.com; Frieder Schrempf
> > <frieder.schrempf@exceet.de> Subject: Re: [PATCH v5 1/2] mtd:
> > fsl-quadspi: add support to create dynamic LUT entry
> > 
> > +Frieder
> > 
> > Hi Yogesh,
> > 
> > On Tue, 30 Jan 2018 22:19:29 +0530
> > Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:
> >   
> > > Add support to create dynamic LUT entry.
> > >
> > > Current approach of creating LUT entries for various cmds like
> > > read, write, erase, readid, readsr, we, wd etc is that when QSPI
> > > controller gets initialized at that time static LUT entries for
> > > these cmds get created.
> > >
> > > Patch add support to create the LUT at run time based on the
> > > operation being performed.
> > >
> > > Added API fsl_qspi_prepare_lut(), this API would going to be
> > > called from fsl_qspi_read_reg, fsl_qspi_write_reg, fsl_qspi_write,
> > > fsl_qspi_read and fsl_qspi_erase APIs.
> > > This API would fetch required info like opcode, protocol info,
> > > dummy info for creating LUT from instance of 'struct spi_nor' and
> > > then prepare LUT entry for the required command.  
> > 
> > You're probably already aware that I proposed a new "generic
> > spi-mem API" [1] and started to port the fsl-qspi driver [2] to
> > this new interface. While doing that I came to the same conclusion:
> > given the small overhead implied by LUT preparation, we can prepare
> > OP sequences dynamically instead of hardcoding them at probe time.
> > 
> > I know I'm talking about hypothetical changes while you're
> > providing patches for something that already exists and is in use,
> > but maybe it'd be worth discussing things a bit so that your
> > changes go in the direction of the spi-mem ones. 
> Thanks for reviewing the code and design changes.
> 
> The new design "generic spi-mem API" proposed is completely
> orthogonal as per existing framework in which FSL QuadSPI driver is
> present in MTD subsystem.

Well, it's not completely orthogonal in that the fsl-qspi driver will
have to be adapted to implement the spi-mem interface, and that work is
likely to be done on top of your changes, so converging to a solution
that will be easily adaptable to the new approach is IMO a good thing.

> Proposed design changes might take time to come into the mainline
> also this needs to be validated on different controller and on
> different flashes.

That's true, but note that I'm not asking to make your patch series
depend on the spi-mem stuff, only think about implementing the dynamic
LUT config stuff in a way that makes it easy to then move to the
spi-mem interface.

> 
> Right now we are focusing to have support of different modes,
> flashes/vendors on existing framework with current LUT number
> limitation.

I understand that.

> My patch-set is a step towards achieving that by preparing LUT for
> individual command dynamically instead of hard-coding at probe time.

Yes, and that's also something we need if we transition to spi-mem,
hence the suggestion to implement this feature in a way that simplifies
the conversion to spi-mem.

> > > +/*
> > > + * Prepare LUT entry for the input cmd.
> > > + * Protocol info is present in instance of struct spi_nor, using
> > > +which fields
> > > + * like cmd, data, addrlen along with pad info etc can be parsed.
> > > + */
> > > +static void fsl_qspi_prepare_lut(struct spi_nor *nor,
> > > +				 enum fsl_qspi_ops ops, u8 cmd)
> > > +{
> > > +	struct fsl_qspi *q = nor->priv;
> > >  	void __iomem *base = q->iobase;
> > >  	int rxfifo = q->devtype_data->rxfifo;
> > > +	int txfifo = q->devtype_data->txfifo;
> > >  	u32 lut_base;
> > > -	int i;
> > > +	u8 cmd_pad, addr_pad, data_pad, dummy_pad;
> > > +	enum spi_nor_protocol protocol = 0;
> > > +	u8 addrlen = 0;
> > > +	u8 read_dm, opcode;
> > > +	int stop_lut;
> > > +
> > > +	read_dm = opcode = cmd_pad = addr_pad = data_pad =
> > > dummy_pad =  
> > 0;  
> > > +
> > > +	switch (ops) {
> > > +	case FSL_QSPI_OPS_READ_REG:
> > > +	case FSL_QSPI_OPS_WRITE_REG:
> > > +	case FSL_QSPI_OPS_WRITE_BUF_REG:
> > > +		opcode = cmd;
> > > +		protocol = nor->reg_proto;
> > > +		break;
> > > +	case FSL_QSPI_OPS_READ:
> > > +		opcode = cmd;
> > > +		read_dm = nor->read_dummy;
> > > +		protocol = nor->read_proto;
> > > +		break;
> > > +	case FSL_QSPI_OPS_WRITE:
> > > +		opcode = cmd;
> > > +		protocol = nor->write_proto;
> > > +		break;
> > > +	case FSL_QSPI_OPS_ERASE:
> > > +		opcode = cmd;
> > > +		break;
> > > +	default:
> > > +		dev_err(q->dev, "Unsupported operation
> > > 0x%.2x\n", ops);
> > > +		return;
> > > +	}
> > > +
> > > +	if (protocol) {
> > > +		cmd_pad =
> > > spi_nor_get_protocol_inst_nbits(protocol);
> > > +		addr_pad =
> > > spi_nor_get_protocol_addr_nbits(protocol);
> > > +		data_pad =
> > > spi_nor_get_protocol_data_nbits(protocol);
> > > +	}
> > >
> > > -	struct spi_nor *nor = &q->nor[0];
> > > -	u8 addrlen = (nor->addr_width == 3) ? ADDR24BIT :
> > > ADDR32BIT;
> > > -	u8 read_op = nor->read_opcode;
> > > -	u8 read_dm = nor->read_dummy;
> > > +	dummy_pad = data_pad;
> > > +
> > > +	dev_dbg(q->dev, "ops:%x opcode:%x pad[cmd:%d, addr:%d,  
> > data:%d]\n",  
> > > +			ops, opcode, cmd_pad, addr_pad,
> > > data_pad);
> > >
> > >  	fsl_qspi_unlock_lut(q);
> > >
> > > -	/* Clear all the LUT table */
> > > -	for (i = 0; i < QUADSPI_LUT_NUM; i++)
> > > -		qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i *
> > > 4); -
> > > -	/* Read */
> > > -	lut_base = SEQID_READ * 4;
> > > -
> > > -	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR,
> > > PAD1, addrlen),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> > > -		    LUT1(FSL_READ, PAD4, rxfifo),
> > > -			base + QUADSPI_LUT(lut_base + 1));
> > > -
> > > -	/* Write enable */
> > > -	lut_base = SEQID_WREN * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WREN),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Page Program */
> > > -	lut_base = SEQID_PP * 4;
> > > -
> > > -	qspi_writel(q, LUT0(CMD, PAD1, nor->program_opcode) |
> > > -		    LUT1(ADDR, PAD1, addrlen),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 0),
> > > -			base + QUADSPI_LUT(lut_base + 1));
> > > -
> > > -	/* Read Status */
> > > -	lut_base = SEQID_RDSR * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDSR) |
> > > -			LUT1(FSL_READ, PAD1, 0x1),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Erase a sector */
> > > -	lut_base = SEQID_SE * 4;
> > > -
> > > -	qspi_writel(q, LUT0(CMD, PAD1, nor->erase_opcode) |
> > > -		    LUT1(ADDR, PAD1, addrlen),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Erase the whole chip */
> > > -	lut_base = SEQID_CHIP_ERASE * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* READ ID */
> > > -	lut_base = SEQID_RDID * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDID) |
> > > -			LUT1(FSL_READ, PAD1, 0x8),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Write Register */
> > > -	lut_base = SEQID_WRSR * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRSR) |
> > > -			LUT1(FSL_WRITE, PAD1, 0x2),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Read Configuration Register */
> > > -	lut_base = SEQID_RDCR * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDCR) |
> > > -			LUT1(FSL_READ, PAD1, 0x1),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Write disable */
> > > -	lut_base = SEQID_WRDI * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRDI),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Enter 4 Byte Mode (Micron) */
> > > -	lut_base = SEQID_EN4B * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_EN4B),
> > > -			base + QUADSPI_LUT(lut_base));
> > > -
> > > -	/* Enter 4 Byte Mode (Spansion) */
> > > -	lut_base = SEQID_BRWR * 4;
> > > -	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),
> > > -			base + QUADSPI_LUT(lut_base));
> > > +	/* Dynamic LUT */
> > > +	lut_base = SEQID_LUT1_RUNTIME * 4;
> > >
> > > -	fsl_qspi_lock_lut(q);
> > > -}
> > > +	/* default, STOP instruction to be programmed in
> > > (lut_base + 1) reg */
> > > +	stop_lut = 1;
> > > +	switch (ops) {
> > > +	case FSL_QSPI_OPS_READ_REG:
> > > +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad),
> > > opcode) |
> > > +			  LUT1(FSL_READ, pad_count(data_pad),
> > > rxfifo),
> > > +			  base + QUADSPI_LUT(lut_base));
> > > +		break;
> > > +	case FSL_QSPI_OPS_WRITE_REG:
> > > +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad),
> > > opcode),
> > > +			  base + QUADSPI_LUT(lut_base));
> > > +		break;
> > > +	case FSL_QSPI_OPS_WRITE_BUF_REG:
> > > +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad),
> > > opcode) |
> > > +			  LUT1(FSL_WRITE, pad_count(data_pad),
> > > txfifo),
> > > +			  base + QUADSPI_LUT(lut_base));
> > > +		break;
> > > +	case FSL_QSPI_OPS_READ:
> > > +	case FSL_QSPI_OPS_WRITE:
> > > +	case FSL_QSPI_OPS_ERASE:
> > > +		/* Common for Read, Write and Erase ops. */
> > >
> > > -/* Get the SEQID for the command */
> > > -static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd) -{
> > > -	switch (cmd) {
> > > -	case SPINOR_OP_READ_1_1_4:
> > > -		return SEQID_READ;
> > > -	case SPINOR_OP_WREN:
> > > -		return SEQID_WREN;
> > > -	case SPINOR_OP_WRDI:
> > > -		return SEQID_WRDI;
> > > -	case SPINOR_OP_RDSR:
> > > -		return SEQID_RDSR;
> > > -	case SPINOR_OP_SE:
> > > -		return SEQID_SE;
> > > -	case SPINOR_OP_CHIP_ERASE:
> > > -		return SEQID_CHIP_ERASE;
> > > -	case SPINOR_OP_PP:
> > > -		return SEQID_PP;
> > > -	case SPINOR_OP_RDID:
> > > -		return SEQID_RDID;
> > > -	case SPINOR_OP_WRSR:
> > > -		return SEQID_WRSR;
> > > -	case SPINOR_OP_RDCR:
> > > -		return SEQID_RDCR;
> > > -	case SPINOR_OP_EN4B:
> > > -		return SEQID_EN4B;
> > > -	case SPINOR_OP_BRWR:
> > > -		return SEQID_BRWR;
> > > +		addrlen = (nor->addr_width == 3) ? ADDR24BIT :
> > > ADDR32BIT; +
> > > +		qspi_writel(q, LUT0(CMD, pad_count(cmd_pad),
> > > opcode) |
> > > +				LUT1(ADDR, pad_count(addr_pad),
> > > addrlen),
> > > +				base + QUADSPI_LUT(lut_base));
> > > +		/*
> > > +		 * For Erase ops - Data and Dummy not required.
> > > +		 * For Write ops - Dummy not required.
> > > +		 */
> > > +
> > > +		if (ops == FSL_QSPI_OPS_READ) {
> > > +
> > > +			/*
> > > +			 * For cmds SPINOR_OP_READ and  
> > SPINOR_OP_READ_4B value  
> > > +			 * of dummy cycles are 0.
> > > +			 */
> > > +			if (read_dm)
> > > +				qspi_writel(q,
> > > +					    LUT0(DUMMY,  
> > pad_count(dummy_pad),  
> > > +					    read_dm) |
> > > +					    LUT1(FSL_READ,  
> > pad_count(data_pad),  
> > > +					    rxfifo),
> > > +					    base +
> > > QUADSPI_LUT(lut_base + 1));
> > > +			else
> > > +				qspi_writel(q,
> > > +					    LUT0(FSL_READ,  
> > pad_count(data_pad),  
> > > +					    rxfifo),
> > > +					    base +
> > > QUADSPI_LUT(lut_base + 1)); +
> > > +			stop_lut = 2;
> > > +
> > > +			/* TODO Add condition to check if READ
> > > is IP/AHB. */ +
> > > +			/* For AHB read, add seqid in BFGENCR
> > > register. */
> > > +			qspi_writel(q,
> > > +				    SEQID_LUT1_RUNTIME <<
> > > +				    QUADSPI_BFGENCR_SEQID_SHIFT,
> > > +				    q->iobase + QUADSPI_BFGENCR);
> > > +		}
> > > +
> > > +		if (ops == FSL_QSPI_OPS_WRITE) {
> > > +			qspi_writel(q, LUT0(FSL_WRITE,
> > > pad_count(data_pad),  
> > 0),  
> > > +					base +
> > > QUADSPI_LUT(lut_base + 1));
> > > +			stop_lut = 2;
> > > +		}
> > > +		break;
> > >  	default:
> > > -		if (cmd == q->nor[0].erase_opcode)
> > > -			return SEQID_SE;
> > > -		dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
> > > +		dev_err(q->dev, "Unsupported operation
> > > 0x%.2x\n", ops); break;
> > >  	}
> > > -	return -EINVAL;
> > > +
> > > +	/* prepare LUT for STOP instruction. */
> > > +	qspi_writel(q, 0, base +  QUADSPI_LUT(lut_base +
> > > stop_lut)); +
> > > +	fsl_qspi_lock_lut(q);
> > >  }  
> > 
> > If you express operations in a generic way (with opcode,
> > addr-cycles, dummy- cycles and data-in/out-cycles), this function
> > would not have to grow every time a new operation is added to the
> > SPI framework, and more importantly, you would be able to support
> > SPI NAND operations with almost no modifications. 
> I have analysis your suggestion and feel that current patch-set is
> more cleaner.
> 
> Let me try to explain:
> In current MTD spi-nor framework  for exposed function ptrs i.e.
> nor->read_reg, nor->write_reg, nor->read, nor->write and nor->erase,
> our's controller most of the work is common like preparing LUT
> command and for this fetching required info from struct spi_nor.
> These are pad info bits [cmd, addr, data and dummy] which are fetched
> from protocol, opcode, dummy cycles and rx/tx len.
> 
> One way is, as suggested by your, to parse all these info in
> respective function ptr definition and save them in common structure
> like spi_mem_op and then call prepare_lut only to prepare LUT command
> using spi_mem_op structure.

I clearly prefer this approach, but I guess you already know that :-).

> 
> Other approach, which I have used is, to parse all these required
> info from struct spi_nor based on the Switch/Case condition in one
> common function instead of parsing individually for all exposed func
> ptr. After this prepare LUT command from fetched information.
> 
> Please suggest what approach we can follow.

I already did, but I guess you're waiting for SPI NOR maintainers'
opinion here.

Regards,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
