Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frfx3-0008Kc-Sn
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 08:54:20 +0000
Date: Mon, 20 Aug 2018 10:53:55 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "richard@nod.at" <richard@nod.at>, "absahu@codeaurora.org"
 <absahu@codeaurora.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "kyungmin.park@samsung.com"
 <kyungmin.park@samsung.com>, "frieder.schrempf@exceet.de"
 <frieder.schrempf@exceet.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>, Michal Simek <michals@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "peterpandong@micron.com"
 <peterpandong@micron.com>
Subject: Re: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20180820105355.11bd50a8@bbrezillon>
In-Reply-To: <MWHPR02MB2623D48B5DBAFCE2B5D03747AF3C0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180817195903.49963b25@bbrezillon>
 <MWHPR02MB2623D48B5DBAFCE2B5D03747AF3C0@MWHPR02MB2623.namprd02.prod.outlook.com>
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

On Sat, 18 Aug 2018 05:49:32 +0000
Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:

> Hi Boris,
> 
> Thanks for the review.
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > Sent: Friday, August 17, 2018 11:29 PM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> > computersforpeace@gmail.com; marek.vasut@gmail.com; kyungmin.park@samsung.com;
> > absahu@codeaurora.org; peterpandong@micron.com; frieder.schrempf@exceet.de; linux-
> > mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> > nagasureshkumarrelli@gmail.com
> > Subject: Re: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for Arasan
> > NAND Flash Controller
> > 
> > Hi Naga,
> > 
> > On Fri, 17 Aug 2018 18:49:24 +0530
> > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> >   
> > > +static int anfc_exec_op_cmd(struct nand_chip *chip,
> > > +				   const struct nand_subop *subop) {
> > > +	const struct nand_op_instr *instr;
> > > +	struct anfc_op nfc_op = {};
> > > +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> > > +	struct anfc_nand_controller *nfc = to_anfc(chip->controller);
> > > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > > +	u32 addrcycles;
> > > +	unsigned int op_id, len = 0;
> > > +	bool reading;
> > > +
> > > +	anfc_parse_instructions(chip, subop, &nfc_op);
> > > +	instr = nfc_op.data_instr;
> > > +	op_id = nfc_op.data_instr_idx;
> > > +	if (nfc_op.data_instr)
> > > +		len = nand_subop_get_data_len(subop, op_id);
> > > +
> > > +	/*
> > > +	 * The switch case is to prepare a command and to set page/column
> > > +	 * address. Arasan NAND controller has program register(Off: 0x10)),
> > > +	 * which needs to be set for every command.
> > > +	 * Ex: When NAND_CMD_RESET is issued, then we need to set reset bit
> > > +	 * in program_register. etc..
> > > +	 */
> > > +	switch (nfc_op.cmnds[0]) {
> > > +	case NAND_CMD_SEQIN:
> > > +		addrcycles = achip->raddr_cycles + achip->caddr_cycles;
> > > +
> > > +		anfc_prepare_cmd(nfc, nfc_op.cmnds[0], NAND_CMD_PAGEPROG, 1,
> > > +				 mtd->writesize, addrcycles);
> > > +		anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > > +		break;
> > > +	case NAND_CMD_READOOB:
> > > +		nfc_op.col += mtd->writesize;
> > > +	case NAND_CMD_READ0:
> > > +	case NAND_CMD_READ1:
> > > +		addrcycles = achip->raddr_cycles + achip->caddr_cycles;
> > > +		anfc_prepare_cmd(nfc, NAND_CMD_READ0, NAND_CMD_READSTART,  
> > 1,  
> > > +				 mtd->writesize, addrcycles);
> > > +		anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > > +		if (!nfc_op.data_instr)
> > > +			return 0;
> > > +
> > > +		anfc_read_data_op(mtd, instr->ctx.data.buf.in, len);
> > > +		break;
> > > +	case NAND_CMD_RNDOUT:
> > > +		anfc_prepare_cmd(nfc, nfc_op.cmnds[0], NAND_CMD_RNDOUTSTART, 1,
> > > +				 mtd->writesize, 2);
> > > +		anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > > +		nfc->prog = PROG_PGRD;
> > > +		break;
> > > +	case NAND_CMD_PARAM:
> > > +		anfc_prepare_cmd(nfc, nfc_op.cmnds[0], 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > > +		nfc->prog = PROG_RDPARAM;
> > > +		break;
> > > +	case NAND_CMD_READID:
> > > +		anfc_prepare_cmd(nfc, nfc_op.cmnds[0], 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > > +		nfc->prog = PROG_RDID;
> > > +		break;
> > > +	case NAND_CMD_GET_FEATURES:
> > > +		anfc_prepare_cmd(nfc, nfc_op.cmnds[0], 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > > +		nfc->prog = PROG_GET_FEATURE;
> > > +		break;
> > > +	case NAND_CMD_SET_FEATURES:
> > > +		anfc_prepare_cmd(nfc, nfc_op.cmnds[0], 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > > +		nfc->prog = PROG_SET_FEATURE;
> > > +		break;
> > > +	case NAND_CMD_ERASE1:
> > > +		anfc_erase_function(chip, nfc_op);
> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}  
> > 
> > Looks like you have one of these smart controllers where everything is hardcoded and new
> > commands (like vendor specific commands) can't be supported, and we're back to abusing -  
> > >exec_op(), just like ->cmdfunc() was abused.  
> Actually hardcoding commands with ->exec_op() interface in the driver is really looking weird.
> I agree with that.
> But as per the spec, for every command, we need to set respective bit in PROG_REG and because
> Of this, we need to track the commands for each exec_op() call.
> > 
> > Don't you have a way to send raw CMD/ADDR/DATA cycles? If not, then we'll have to
> > consider other options, because I don't want to go back to the situation we are in with -  
> > >cmdfunc().  
> As I said above, for each command we need to set a bit in PROG_REG, to initiate the operation.
> The only conflicting thing is that, setting a respective bit in PROG_REG based on the command
> Needs command tracking. 
> > 
> > Maybe I already asked, but is there a public spec for this IP?  
> I didn't find any public spec for this IP, but you can find the register data base at below link
> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> and click on NAND.
> There we have Command Reg(Off: 0x0C) and Program Reg(Off: 0x10), which describes the usage.
> 
> Also not in depth but at least something is documented in TRM
> https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> we can find the programming model in chapter 25.
> Please let me know if I missed anything.

I had a closer look at those documents (which I remember reading a
while back BTW), and the PROG bits are indeed not described in detail.

Still, I think it's close to what we have on Marvell SoC, where those
'modes' actually encode a specific sequence of timing that is used for
well-known commands (like ERASE, RESET, READID) but could be used the
same way with other opcodes assuming the sequence is the same.

So, you should use the pattern approach, but not like you do: you
should have a dedicated hook for each pattern which would set PROG bit,
and then a generic helper to fill all other information (opcode,
address cycles, ...).
