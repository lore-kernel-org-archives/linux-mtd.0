Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAGkn-00020E-Hr
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 15:18:16 +0000
Date: Sun, 22 Apr 2018 17:17:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>, "harisokn@gmail.com"
 <harisokn@gmail.com>, linux-mtd@lists.infradead.org, Boris Brezillon
 <Boris.Brezillon@bootlin.com>
Subject: Re: [LINUX PATCH v8 2/2] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Message-ID: <20180422171757.288a69fd@xps13>
In-Reply-To: <a84185e1-2f67-7d15-209d-bd70d31f0ea4@ni.com>
References: <1521024505-30677-1-git-send-email-nagasureshkumarrelli@gmail.com>
 <20180319233748.65b5a7b9@xps13>
 <BY2PR02MB14114DD144070E22CEB8FC07AFA80@BY2PR02MB1411.namprd02.prod.outlook.com>
 <a84185e1-2f67-7d15-209d-bd70d31f0ea4@ni.com>
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

Hi Haris, Naga,

-linux-kernel@
+linux-mtd@
+Boris

> >>> +/**
> >>> + * pl353_nand_cmd_function - Send command to NAND device
> >>> + * @chip:	Pointer to the NAND chip info structure
> >>> + * @subop:	Pointer to array of instructions
> >>> + * Return:	Always return zero
> >>> + */
> >>> +static int pl353_nand_cmd_function(struct nand_chip *chip,
> >>> +					      const struct nand_subop *subop) {
> >>> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> >>> +	const struct nand_op_instr *instr;
> >>> +	struct pl353_nfc_op nfc_op; =20
> >>
> >> nfc_op =3D {}; to initialize to 0. =20
> > Ok, I will update it. =20
> >> =20
> >>> +	struct pl353_nand_info *xnand =3D
> >>> +		container_of(chip, struct pl353_nand_info, chip);
> >>> +	void __iomem *cmd_addr;
> >>> +	unsigned long cmd_data =3D 0, end_cmd_valid =3D 0;
> >>> +	unsigned long cmd_phase_addr, data_phase_addr, end_cmd;
> >>> +	unsigned long timeout =3D jiffies + PL353_NAND_DEV_BUSY_TIMEOUT;
> >>> +	u32 addrcycles =3D 0;
> >>> +	unsigned int op_id, len, offset;
> >>> +
> >>> +	pl353_nfc_parse_instructions(chip, subop, &nfc_op);
> >>> +	instr =3D nfc_op.data_instr;
> >>> +	op_id =3D nfc_op.data_instr_idx;
> >>> +	len =3D nand_subop_get_data_len(subop, op_id);
> >>> +	offset =3D nand_subop_get_data_start_off(subop, op_id);
> >>> +
> >>> +	if (nfc_op.cmnds[0] !=3D -1) {
> >>> +		if (xnand->end_cmd_pending) {
> >>> +			/*
> >>> +			 * Check for end command if this command request is
> >>> +			 * same as the pending command then return
> >>> +			 */
> >>> +			if (xnand->end_cmd =3D=3D nfc_op.cmnds[0]) {
> >>> +				xnand->end_cmd =3D 0;
> >>> +				xnand->end_cmd_pending =3D 0;
> >>> +				return 0;
> >>> +			}
> >>> +		}
> >>> +
> >>> +		/* Clear interrupt */
> >>> +		pl353_smc_clr_nand_int();
> >>> +		end_cmd_valid =3D 0; =20
> >>
> >> Space =20
> > Ok, I will correct it. =20
> >> =20
> >>> +		/* Get the command phase address */
> >>> +		if (nfc_op.cmnds[1] !=3D -1) {
> >>> +			end_cmd_valid =3D 1;
> >>> +		} else {
> >>> +			if (nfc_op.cmnds[0] =3D=3D NAND_CMD_READ0)
> >>> +				return 0;
> >>> +		}
> >>> +		if (nfc_op.end_cmd =3D=3D NAND_CMD_NONE)
> >>> +			end_cmd =3D 0x0;
> >>> +		else
> >>> +			end_cmd =3D nfc_op.cmnds[1];
> >>> +
> >>> +		addrcycles =3D nfc_op.naddrs;
> >>> +		if (nfc_op.cmnds[0] =3D=3D NAND_CMD_READ0 ||
> >>> +			nfc_op.cmnds[0] =3D=3D NAND_CMD_SEQIN)
> >>> +			addrcycles =3D xnand->row_addr_cycles +
> >>> +					xnand->col_addr_cycles;
> >>> +		else if ((nfc_op.cmnds[0] =3D=3D NAND_CMD_ERASE1) ||
> >>> +			(nfc_op.cmnds[0] =3D=3D NAND_CMD_ERASE2))
> >>> +			addrcycles =3D xnand->row_addr_cycles;
> >>> +		else
> >>> +			addrcycles =3D nfc_op.naddrs; =20
> >>
> >> A switch block would probably be appropriate. =20
> > Yes we can use. =20
> >> =20
> >>> +		cmd_phase_addr =3D (unsigned long __force)xnand->nand_base + =20
> >> ( =20
> >>> +				 (addrcycles << ADDR_CYCLES_SHIFT)	|
> >>> +				 (end_cmd_valid << END_CMD_VALID_SHIFT) =20
> >> 	| =20
> >>> +				 (COMMAND_PHASE)			|
> >>> +				 (end_cmd << END_CMD_SHIFT)		|
> >>> +				 (nfc_op.cmnds[0] << START_CMD_SHIFT));
> >>> +
> >>> +		cmd_addr =3D (void __iomem * __force)cmd_phase_addr; =20
> >>
> >> Space =20
> > Ok, I will correc it. =20
> >> =20
> >>> +		/* Get the data phase address */
> >>> +		end_cmd_valid =3D 0;
> >>> +
> >>> +		data_phase_addr =3D (unsigned long __force)xnand->nand_base + =20
> >> ( =20
> >>> +				  (0x0 << CLEAR_CS_SHIFT)		|
> >>> +				  (end_cmd_valid << END_CMD_VALID_SHIFT)|
> >>> +				  (DATA_PHASE)				|
> >>> +				  (end_cmd << END_CMD_SHIFT)		|
> >>> +				  (0x0 << ECC_LAST_SHIFT));
> >>> +		chip->IO_ADDR_R =3D (void __iomem * =20
> >> __force)data_phase_addr;
> >>
> >> Do you really need this "__force" ? =20
> > Let me check and get back to you on this. =20
> >> =20
> >>> +		chip->IO_ADDR_W =3D chip->IO_ADDR_R;
> >>> +		/* Command phase AXI write */
> >>> +		/* Read & Write */
> >>> +		if (nfc_op.thirdrow) {
> >>> +			nfc_op.thirdrow =3D 0;
> >>> +			if (mtd->writesize > PL353_NAND_ECC_SIZE) {
> >>> +				cmd_data |=3D nfc_op.addrs << 16;
> >>> +				/* Another address cycle for devices > 128MiB =20
> >> */ =20
> >>> +				if (chip->chipsize > (128 << 20)) {
> >>> +					pl353_nand_write32(cmd_addr, =20
> >> cmd_data); =20
> >>> +					cmd_data =3D (nfc_op.addrs >> 16);
> >>> +				}
> >>> +			}
> >>> +		}  else {
> >>> +			if (nfc_op.addrs !=3D -1) {
> >>> +				int column =3D nfc_op.addrs;
> >>> +				/*
> >>> +				 * Change read/write column, read id etc
> >>> +				 * Adjust columns for 16 bit bus width
> >>> +				 */
> >>> +				if ((chip->options & NAND_BUSWIDTH_16) &&
> >>> +				((nfc_op.cmnds[0] =3D=3D NAND_CMD_READ0) ||
> >>> +				(nfc_op.cmnds[0] =3D=3D NAND_CMD_SEQIN) ||
> >>> +				(nfc_op.cmnds[0] =3D=3D NAND_CMD_RNDOUT) ||
> >>> +				(nfc_op.cmnds[0] =3D=3D NAND_CMD_RNDIN))) { =20
> >>
> >> Alignment. =20
> > Ok, I will update it. =20
> >> =20
>  [...] =20
> >>
> >> Why? =20
> > I found some errors during on_die testing, hence I added this delay.
> > Let me check once =20
>=20
> Either the controller or nand itself requires a settle period after comma=
nds are delivered, before data may be read/written. As I understand, this n=
delay() is intended to facilitate that.

NAND chips expect a tCCS time (~500ns) after a RNDIN/RNDOUT. Does this
controller cannot take care of it directly? If yes you might want to
implement the ->setup_data_interface() hook.

Otherwise if you are sure this is an hardware bug, it would probably
be preferable to use Haris' barrier together with a comment explaining
the situation.

Thanks,
Miqu=C3=A8l

>=20
> I discovered a small bug in this workflow a few years ago and submitted t=
he following patch to linux-xlnx: https://github.com/Xilinx/linux-xlnx/pull=
/106
>=20
> The first byte of a sub-page read is sometimes corrupted (I.e. READ0 foll=
owed by RNDOUT command sequence) because (I suspect) RNDOUT commands can li=
nger somewhere on the interconnect between the cpu and pl353 during the 100=
ns delay period, whereas other commands are synchronized via status change =
or interrupt to indicate completion. A data store barrier prior to ndelay()=
 seems to address this issue. It hasn't reproduced in about 6 months of rea=
d-stress testing on a Zynq-7020 SoC with this change.
>=20
> Have you considered pulling this change?
> If not, I'm curious how (if at all) you'd recommend implementing partial =
page reads with the pl353?
>=20
> Thanks,
> Haris
>=20
> >> =20
> >>> +		if (nfc_op.cmnds[0] =3D=3D 0xef)
> >>> +			nfc_op.wait =3D false;
> >>> +		if (nfc_op.wait) {
> >>> +			nfc_op.wait =3D false; =20
> >>
> >> You can remove this line. =20
> > Yes, it is initializing to zero in cmd_function. =20
> >> =20
> >>> +			do {
> >>> +				if (chip->dev_ready(mtd))
> >>> +					break;
> >>> +				cpu_relax();
> >>> +			} while (!time_after_eq(jiffies, timeout));
> >>> +			if (time_after_eq(jiffies, timeout)) {
> >>> +				pr_err("%s timed out\n", __func__);
> >>> +				return -ETIMEDOUT;
> >>> +			} =20
> >>
> >> Same comment about the wait. =20
> > Ok, I will update it. =20
> >> =20
> >>> +			return 0;
> >>> +		}
> >>> +	}
> >>> +
> >>> +	if (instr =3D=3D NULL) =20
> >>
> >> if (!instr) =20
> > I will modify it. =20
> >> =20
> >>> +		return 0;
> >>> +	if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR)
> >>> +		return pl353_nand_read_buf(chip, instr->ctx.data.buf.in, len);
> >>> +
> >>> +	if (instr->type =3D=3D NAND_OP_DATA_OUT_INSTR) {
> >>> +		if ((nfc_op.cmnds[0] =3D=3D NAND_CMD_PAGEPROG) ||
> >>> +			(nfc_op.cmnds[0] =3D=3D NAND_CMD_SEQIN))
> >>> +			pl353_nand_write_page_raw(mtd, chip,
> >>> +			instr->ctx.data.buf.out, 0, nfc_op.addrs);
> >>> +		else
> >>> +			pl353_nand_write_buf_l(chip, instr->ctx.data.buf.out,
> >>> +				len);
> >>> +		return 0;
> >>> +	}
> >>> +	return 0;
> >>> +}
> >>> +
--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
