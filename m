Received: from mail-eopbgr710045.outbound.protection.outlook.com
 ([40.107.71.45] helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDRND-0002Hc-Te
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 09:47:33 +0000
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
Date: Fri, 19 Oct 2018 09:47:01 +0000
Message-ID: <MWHPR02MB262333376A88320A52F06331AFF90@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1537878031-22253-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181003214633.54e93c00@bbrezillon>
In-Reply-To: <20181003214633.54e93c00@bbrezillon>
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

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Thursday, October 4, 2018 1:17 AM
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
> On Tue, 25 Sep 2018 17:50:31 +0530
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
>=20
> > +static int anfc_zero_len_page_write_type_exec(struct nand_chip *chip,
> > +					      const struct nand_subop *subop) {
> > +	const struct nand_op_instr *instr;
> > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > +	struct anfc_nand_controller *nfc =3D to_anfc(chip->controller);
> > +	unsigned int op_id;
> > +	struct anfc_op nfc_op =3D {};
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	u32 addrcycles;
> > +
> > +	anfc_parse_instructions(chip, subop, &nfc_op);
> > +	nfc->prog =3D PROG_PGRD;
> > +	instr =3D nfc_op.data_instr;
> > +	op_id =3D nfc_op.data_instr_idx;
> > +
> > +	addrcycles =3D achip->raddr_cycles + achip->caddr_cycles;
> > +
> > +	anfc_prepare_cmd(nfc, nfc_op.cmds[0], NAND_CMD_PAGEPROG, 1,
>=20
> Why are the second opcode and the number of address cycles hardcoded.
> That's simply not future-proof, and I don't want that. Also, I don't unde=
rstand why you do
> that, you have all the information you need in subop and you keep guessin=
g some parameters.
Ok, I will remove all these hard coding commands from the driver, instead I=
 will use nfc_op.cmds[0], nfc_op.cmds[1].

Thanks,
Naga Sureshkumar Relli
>=20
> > +			 mtd->writesize, addrcycles);
> > +	anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > +
> > +	return 0;
> > +}
