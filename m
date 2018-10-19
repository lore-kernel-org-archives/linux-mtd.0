Received: from mail-bl2nam02on0068.outbound.protection.outlook.com
 ([104.47.38.68] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDRL9-0000Z6-Li
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 09:45:09 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Michal Simek
 <michals@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>
Subject: RE: [LINUX PATCH v11 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Fri, 19 Oct 2018 09:44:41 +0000
Message-ID: <MWHPR02MB26235FB2ECB9073CFC38594DAFF90@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1537878031-22253-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181003213844.14d4095e@bbrezillon>
In-Reply-To: <20181003213844.14d4095e@bbrezillon>
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

Hi Boris,

Sorry for the late reply.
I am busy with some other work.

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Thursday, October 4, 2018 1:09 AM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com; Michal Simek
> <michals@xilinx.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.ke=
rnel.org;
> nagasuresh12@gmail.com
> Subject: Re: [LINUX PATCH v11 3/3] mtd: rawnand: arasan: Add support for =
Arasan
> NAND Flash Controller
>=20
> Hi Naga,
>=20
> On Tue, 25 Sep 2018 17:50:31 +0530
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
>=20
> > +static int anfc_read_param_get_feature_sp_read_type_exec(struct nand_c=
hip *chip,
> > +							 const struct nand_subop
> > +							 *subop)
> > +{
> > +	const struct nand_op_instr *instr;
> > +	struct anfc_nand_controller *nfc =3D to_anfc(chip->controller);
> > +	unsigned int op_id, len;
> > +	struct anfc_op nfc_op =3D {};
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > +	u32 dma_mode, addrcycles, write_size;
> > +
> > +	anfc_parse_instructions(chip, subop, &nfc_op);
> > +	instr =3D nfc_op.data_instr;
> > +	op_id =3D nfc_op.data_instr_idx;
> > +
> > +	if (nfc_op.cmds[0] =3D=3D NAND_CMD_PARAM) {
> > +		nfc->prog =3D PROG_RDPARAM;
> > +		dma_mode =3D 0;
> > +		addrcycles =3D 1;
> > +		write_size =3D 0;
> > +	}
> > +	if (nfc_op.cmds[0] =3D=3D NAND_CMD_GET_FEATURES) {
> > +		nfc->prog =3D PROG_GET_FEATURE;
> > +		dma_mode =3D 0;
> > +		addrcycles =3D 1;
> > +		write_size =3D 0;
> > +	}
> > +	if (nfc_op.cmds[0] =3D=3D NAND_CMD_READ0) {
> > +		nfc->prog =3D PROG_PGRD;
> > +		addrcycles =3D achip->raddr_cycles + achip->caddr_cycles;
> > +		write_size =3D mtd->writesize;
> > +		dma_mode =3D 1;
> > +	}
> > +
>=20
> Sorry, but I still don't understand why nfc->prog is different. Did you t=
ry using
> PROG_PGRD for all these ops? I mean, the sequence is the same, and you ke=
ep passing the
> opcode and the number of address cycles to the engine using other reg fie=
lds.
Yes, I tried it now with PROG_PGRD and I don't see any issues.
I will update the same in next version of patch.
Thanks for your suggestion.

>=20
> Also, you're not using the addrcycles info provided by the the address in=
struction and instead
> deduce it based on the opcode, which is wrong.
> To make it clearer, I'd like to avoid those nfc_op.cmds[0] =3D=3D NAND_OP=
CODE tests,
> because it's exactly the kind of things we were trying to get rid off by =
introducing the -
> >exec_op() interface.
Ok. I understand, I will remove hardcoding the commands in the driver.
And I will change the driver to read addrcycles info from address instructi=
on.

Thanks,
Naga Sureshkumar Relli
>=20
> > +	anfc_prepare_cmd(nfc, nfc_op.cmds[0], 0, dma_mode, write_size,
> > +			 addrcycles);
> > +	anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > +
> > +	if (!nfc_op.data_instr)
> > +		return 0;
> > +
> > +	len =3D nand_subop_get_data_len(subop, op_id);
> > +	anfc_rw_pio_op(mtd, nfc->buf, roundup(len, 4), 1, nfc->prog, 1, 0);
> > +	memcpy(instr->ctx.data.buf.in,  nfc->buf, len);
> > +
> > +	return 0;
> > +}
