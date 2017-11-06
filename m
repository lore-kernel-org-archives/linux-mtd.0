Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eBi6O-0004sl-FS
 for linux-mtd@lists.infradead.org; Mon, 06 Nov 2017 14:10:21 +0000
Date: Mon, 6 Nov 2017 15:09:40 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>,
 Hanna Hawa <hannah@marvell.com>
Subject: Re: [RFC 04/12] mtd: nand: add ->exec_op() implementation
Message-ID: <20171106150940.13d0c3f8@xps13>
In-Reply-To: <20171018235710.2b489d8e@bbrezillon>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171018143629.29302-5-miquel.raynal@free-electrons.com>
 <20171018235710.2b489d8e@bbrezillon>
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

Hi Boris,

> > Introduce the new way to control the NAND controller drivers by
> > implementing the ->exec_op() core helpers and allowing new drivers
> > to use it instead of relying on ->cmd_ctrl(), ->cmdfunc() and =20
> > ->read/write_byte/word/buf(). =20
>=20
> "
> Introduce a new interface to instruct NAND controllers to send
> specific NAND operations. The new interface takes the form of a
> single method called ->exec_op(). This method is designed to replace
> ->cmd_ctrl(), ->cmdfunc() and ->read/write_byte/word/buf() hooks. =20
> "

Changed.

>=20
> >=20
> > The logic is now to send to the controller driver a list of
> > instructions. =20
>=20
> "
> ->exec_op() is passed a set of instructions describing the operation
> to execute. Each instruction has a type (ADDR, CMD, CYCLE, WAITRDY)
> and delay. The type is directly matching the description of NAND
> commands in various NAND datasheet and standards (ONFI, JEDEC), the
> delay is here to help simple controllers wait enough time between each
> instruction. Advanced controllers with integrated timings control can
> ignore these delays.=20
> "

Changed with s/CYCLE/DATA/.

>=20
> > The driver shall use the parser added by this commit to
> > get the matching hook if any. =20
>=20
> That's true only for advanced controllers. For those who are executing
> each instruction individually (like the gpio-nand driver, or any old
> style driver where each ADDR/CMD/DATA cycle is controlled
> independently) this is not needed, and who add extra complexity for no
> real gain.

Mention about advanced vs dump controllers added.

>=20
> > The instructions may be split by the
> > parser in order to comply with the controller constraints filled in
> > an array of supported patterns. =20
>=20
> Given only this description it's hard to tell what this parser is and
> why it's needed. I think a real example who be helpful to better
> understand what this is.

Added an example.

>=20
> >=20
> > Various helpers are also added to ease NAND controller drivers
> > writing.
> >=20
> > This new interface should really ease the support of new vendor
> > specific instructions. =20
>=20
> Actually, it's more than easing support for vendor specific
> operations, it allows the core to check whether the NAND controller
> will be able to execute a specific operation or not, which before
> that was impossible. It doesn't mean all controllers will magically
> support all kind of NAND operations, but at least we'll know when it
> doesn't.

Added a note about that.

>=20
> >=20
> > Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > ---
> >  drivers/mtd/nand/denali.c      |  93 +++-
> >  drivers/mtd/nand/nand_base.c   | 949
> > +++++++++++++++++++++++++++++++++++++++--
> > drivers/mtd/nand/nand_hynix.c  |  91 +++-
> > drivers/mtd/nand/nand_micron.c |  32 +-
> > include/linux/mtd/rawnand.h    | 366 +++++++++++++++- 5 files
> > changed, 1448 insertions(+), 83 deletions(-)
> >=20
...
> > @@ -665,11 +663,22 @@ static void denali_oob_xfer(struct mtd_info
> > *mtd, struct nand_chip *chip, int i, pos, len;
> > =20
> >  	/* BBM at the beginning of the OOB area */
> > -	chip->cmdfunc(mtd, start_cmd, writesize, page);
> > -	if (write)
> > -		chip->write_buf(mtd, bufpoi, oob_skip);
> > -	else
> > -		chip->read_buf(mtd, bufpoi, oob_skip);
> > +	if (chip->exec_op) {
> > +		if (write)
> > +			nand_prog_page_begin_op(chip, page,
> > writesize, bufpoi,
> > +						oob_skip);
> > +		else
> > +			nand_read_page_op(chip, page, writesize,
> > bufpoi,
> > +					  oob_skip);
> > +	} else {
> > +		if (write) {
> > +			chip->cmdfunc(mtd, NAND_CMD_SEQIN,
> > writesize, page);
> > +			chip->write_buf(mtd, bufpoi, oob_skip);
> > +		} else {
> > +			chip->cmdfunc(mtd, NAND_CMD_READ0,
> > writesize, page);
> > +			chip->read_buf(mtd, bufpoi, oob_skip);
> > +		}
> > +	} =20
>=20
> Why do we have to keep the ->cmdfunc() logic? nand_prog_page_xxx()
> already abstracts this for us, right?

Right! Changed here and after.

>=20
> >  	bufpoi +=3D oob_skip;
> > =20
> >  	/* OOB ECC */
> > @@ -682,30 +691,67 @@ static void denali_oob_xfer(struct mtd_info
> > *mtd, struct nand_chip *chip, else if (pos + len > writesize)
> >  			len =3D writesize - pos;
> > =20
> > -		chip->cmdfunc(mtd, rnd_cmd, pos, -1);
> > -		if (write)
> > -			chip->write_buf(mtd, bufpoi, len);
> > -		else
> > -			chip->read_buf(mtd, bufpoi, len);
> > -		bufpoi +=3D len;
> > -		if (len < ecc_bytes) {
> > -			len =3D ecc_bytes - len;
> > -			chip->cmdfunc(mtd, rnd_cmd, writesize +
> > oob_skip, -1);
> > +		if (chip->exec_op) {
> >  			if (write)
> > -				chip->write_buf(mtd, bufpoi, len);
> > +				nand_change_write_column_op(
> > +					chip, pos, bufpoi, len,
> > false); =20
>=20
> Nitpick, but can you try to align things like that:
>=20
> 				nand_change_write_column_op(chip, pos,
> 							    bufpoi,
> len, false);

Changed here and after.

>=20
> >  			else
> > +				nand_change_read_column_op(
> > +					chip, pos, bufpoi, len,
> > false); =20
>=20
> Ditto.
>=20
> > +		} else {
> > +			if (write) {
> > +				chip->cmdfunc(mtd, NAND_CMD_RNDIN,
> > pos, -1);
> > +				chip->write_buf(mtd, bufpoi, len);
> > +			} else {
> > +				chip->cmdfunc(mtd,
> > NAND_CMD_RNDOUT, pos, -1); chip->read_buf(mtd, bufpoi, len);
> > +			}
> > +		} =20
>=20
> Smae here: I don't think we need to support both ->cmdfunc() and
> nand_change_read/write_column().
>=20
> > +		bufpoi +=3D len;
> > +		if (len < ecc_bytes) {
> > +			len =3D ecc_bytes - len;
> > +			if (chip->exec_op) {
> > +				if (write)
> > +
> > nand_change_write_column_op(
> > +						chip, writesize +
> > oob_skip,
> > +						bufpoi, len,
> > false);
> > +				else
> > +					nand_change_read_column_op(
> > +						chip, writesize +
> > oob_skip,
> > +						bufpoi, len,
> > false);
> > +			} else {
> > +				if (write) {
> > +					chip->cmdfunc(mtd,
> > NAND_CMD_RNDIN,
> > +						      writesize +
> > oob_skip, -1);
> > +					chip->write_buf(mtd,
> > bufpoi, len);
> > +				} else {
> > +					chip->cmdfunc(mtd,
> > NAND_CMD_RNDOUT,
> > +						      writesize +
> > oob_skip, -1);
> > +					chip->read_buf(mtd,
> > bufpoi, len);
> > +				}
> > +			. =20
>=20
> Ditto.
>=20
> >  			bufpoi +=3D len;
> >  		}
> >  	}
> > =20
> >  	/* OOB free */
> >  	len =3D oobsize - (bufpoi - chip->oob_poi);
> > -	chip->cmdfunc(mtd, rnd_cmd, size - len, -1);
> > -	if (write)
> > -		chip->write_buf(mtd, bufpoi, len);
> > -	else
> > -		chip->read_buf(mtd, bufpoi, len);
> > +	if (chip->exec_op) {
> > +		if (write)
> > +			nand_change_write_column_op(chip, size -
> > len, bufpoi,
> > +						    len, false);
> > +		else
> > +			nand_change_read_column_op(chip, size -
> > len, bufpoi,
> > +						   len, false);
> > +	} else {
> > +		if (write) {
> > +			chip->cmdfunc(mtd, NAND_CMD_RNDIN, size -
> > len, -1);
> > +			chip->write_buf(mtd, bufpoi, len);
> > +		} else {
> > +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, size -
> > len, -1);
> > +			chip->read_buf(mtd, bufpoi, len);
> > +		}
> > +	}
> >  }
> > =20
> >  static int denali_read_page_raw(struct mtd_info *mtd, struct
> > nand_chip *chip, @@ -803,6 +849,9 @@ static int
> > denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,=20
> >  	denali_oob_xfer(mtd, chip, page, 1);
> > =20
> > +	if (chip->exec_op)
> > +		return nand_prog_page_end_op(chip);
> > +
> >  	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> >  	status =3D chip->waitfunc(mtd, chip); =20
>=20
> All denali changes in this patch should actually be moved to patch 1.

Ok.

>=20
> > =20
> > diff --git a/drivers/mtd/nand/nand_base.c
> > b/drivers/mtd/nand/nand_base.c index bef20e06f0db..737f19bd2f83
> > 100644 --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -814,7 +814,7 @@ static void nand_ccs_delay(struct nand_chip
> > *chip)
> >  	 * Wait tCCS_min if it is correctly defined, otherwise
> > wait 500ns
> >  	 * (which should be safe for all NANDs).
> >  	 */
> > -	if (chip->data_interface.timings.sdr.tCCS_min)
> > +	if (&chip->data_interface.timings.sdr.tCCS_min) =20
>=20
> This condition is always true. I think this should be replaced by:
>=20
> 	if (chip->setup_data_interface)

Yes.

>=20
> And BTW, it should go in patch 3.

Ok.

>=20
> >  		ndelay(chip->data_interface.timings.sdr.tCCS_min /
> > 1000); else
> >  		ndelay(500);
> > @@ -1233,6 +1233,118 @@ static int nand_init_data_interface(struct
> > nand_chip *chip) }
> > =20
> >  /**
> > + * nand_fill_column_cycles - fill the column fields on an address
> > array
> > + * @chip: The NAND chip
> > + * @addrs: Array of address cycles to fill
> > + * @offset_in_page: The offset in the page
> > + *
> > + * Fills the first or the two first bytes of the @addrs field
> > depending
> > + * on the NAND bus width and the page size.
> > + */
> > +int nand_fill_column_cycles(struct nand_chip *chip, u8 *addrs,
> > +			    unsigned int offset_in_page)
> > +{
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +
> > +	/*
> > +	 * The offset in page is expressed in bytes, if the NAND
> > bus is 16-bit
> > +	 * wide, then it must be divided by 2.
> > +	 */
> > +	if (chip->options & NAND_BUSWIDTH_16) {
> > +		if (offset_in_page % 2) {
> > +			WARN_ON(true);
> > +			return -EINVAL;
> > +		}
> > +
> > +		offset_in_page /=3D 2;
> > +	}
> > +
> > +	addrs[0] =3D offset_in_page;
> > +
> > +	/* Small pages use 1 cycle for the columns, while large
> > page need 2 */
> > +	if (mtd->writesize <=3D 512)
> > +		return 1;
> > +
> > +	addrs[1] =3D offset_in_page >> 8;
> > +
> > +	return 2;
> > +}
> > +EXPORT_SYMBOL_GPL(nand_fill_column_cycles);
> > +
> > +static int nand_sp_exec_read_page_op(struct nand_chip *chip,
> > unsigned int page,
> > +				     unsigned int offset_in_page,
> > void *buf,
> > +				     unsigned int len)
> > +{
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	const struct nand_sdr_timings *sdr =3D
> > +		nand_get_sdr_timings(&chip->data_interface);
> > +	u8 addrs[4];
> > +	struct nand_op_instr instrs[] =3D {
> > +		NAND_OP_CMD(NAND_CMD_READ0, 0),
> > +		NAND_OP_ADDR(3, addrs, sdr->tWB_max),
> > +		NAND_OP_WAIT_RDY(sdr->tR_max, sdr->tRR_min),
> > +		NAND_OP_DATA_IN(len, buf, 0),
> > +	};
> > +	struct nand_operation op =3D NAND_OPERATION(instrs);
> > +
> > +	/* Drop the DATA_OUT instruction if len is set to 0. */
> > +	if (!len)
> > +		op.ninstrs--;
> > +
> > +	if (offset_in_page >=3D mtd->writesize)
> > +		instrs[0].cmd.opcode =3D NAND_CMD_READOOB;
> > +	else if (offset_in_page >=3D 256)
> > +		instrs[0].cmd.opcode =3D NAND_CMD_READ1;
> > +
> > +	if (nand_fill_column_cycles(chip, addrs, offset_in_page) <
> > 0) =20
>=20
> Why not returning the retcode of nand_fill_column_cycles() directly?
>=20
> 	ret =3D nand_fill_column_cycles(chip, addrs, offset_in_page)
> 	if (ret < 0)
> 		return ret;

Changed.

>=20
> > +		return -EINVAL;
> > +
> > +	addrs[1] =3D page;
> > +	addrs[2] =3D page >> 8;
> > +
> > +	if (chip->options & NAND_ROW_ADDR_3) {
> > +		addrs[3] =3D page >> 16;
> > +		instrs[1].addr.naddrs++;
> > +	}
> > +
> > +	return nand_exec_op(chip, &op);
> > +}
> > +
> > +static int nand_lp_exec_read_page_op(struct nand_chip *chip,
> > unsigned int page,
> > +				     unsigned int offset_in_page,
> > void *buf,
> > +				     unsigned int len)
> > +{
> > +	const struct nand_sdr_timings *sdr =3D
> > +		nand_get_sdr_timings(&chip->data_interface);
> > +	u8 addrs[5];
> > +	struct nand_op_instr instrs[] =3D {
> > +		NAND_OP_CMD(NAND_CMD_READ0, 0),
> > +		NAND_OP_ADDR(4, addrs, 0),
> > +		NAND_OP_CMD(NAND_CMD_READSTART, sdr->tWB_max),
> > +		NAND_OP_WAIT_RDY(sdr->tR_max, sdr->tRR_min),
> > +		NAND_OP_DATA_IN(len, buf, 0),
> > +	};
> > +	struct nand_operation op =3D NAND_OPERATION(instrs);
> > +
> > +	/* Drop the DATA_IN instruction if len is set to 0. */
> > +	if (!len)
> > +		op.ninstrs--;
> > +
> > +	if (nand_fill_column_cycles(chip, addrs, offset_in_page)) =20
>=20
> Should be
>=20
> 	if (nand_fill_column_cycles(chip, addrs, offset_in_page) < 0)

+ use of ret =3D, if (ret < 0)...

>=20
> > +		return -EINVAL;
> > +
> > +	addrs[2] =3D page;
> > +	addrs[3] =3D page >> 8;
> > +
> > +	if (chip->options & NAND_ROW_ADDR_3) {
> > +		addrs[4] =3D page >> 16;
> > +		instrs[1].addr.naddrs++;
> > +	}
> > +
> > +	return nand_exec_op(chip, &op);
> > +}
> > +
> > +/**
> >   * nand_read_page_op - Do a READ PAGE operation
> >   * @chip: The NAND chip
> >   * @page: page to read
> > @@ -1246,17 +1358,26 @@ static int nand_init_data_interface(struct
> > nand_chip *chip)
> >   * Returns 0 for success or negative error code otherwise
> >   */
> >  int nand_read_page_op(struct nand_chip *chip, unsigned int page,
> > -		      unsigned int column, void *buf, unsigned int
> > len)
> > +		      unsigned int offset_in_page, void *buf,
> > unsigned int len) =20
>=20
> You should change the parameter name in patch 1 since this function is
> introduced there.

Ok, done in other places as well.

>=20
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > =20
> >  	if (len && !buf)
> >  		return -EINVAL;
> > =20
> > -	if (column + len > mtd->writesize + mtd->oobsize)
> > +	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
> >  		return -EINVAL;
> > =20
> > -	chip->cmdfunc(mtd, NAND_CMD_READ0, column, page);
> > +	if (chip->exec_op) {
> > +		if (mtd->writesize > 512)
> > +			return nand_lp_exec_read_page_op(
> > +				chip, page, offset_in_page, buf,
> > len); +
> > +		return nand_sp_exec_read_page_op(chip, page,
> > offset_in_page,
> > +						 buf, len);
> > +	}
> > +
> > +	chip->cmdfunc(mtd, NAND_CMD_READ0, offset_in_page, page);
> >  	if (len)
> >  		chip->read_buf(mtd, buf, len);
> > =20
> > @@ -1286,6 +1407,25 @@ static int nand_read_param_page_op(struct
> > nand_chip *chip, u8 page, void *buf, if (len && !buf)
> >  		return -EINVAL;
> > =20
> > +	if (chip->exec_op) {
> > +		const struct nand_sdr_timings *sdr =3D
> > +
> > nand_get_sdr_timings(&chip->data_interface);
> > +		struct nand_op_instr instrs[] =3D {
> > +			NAND_OP_CMD(NAND_CMD_PARAM, 0),
> > +			NAND_OP_ADDR(1, &page, sdr->tWB_max),
> > +			NAND_OP_WAIT_RDY(sdr->tR_max,
> > sdr->tRR_min),
> > +			NAND_OP_8BIT_DATA_IN(len, buf, 0),
> > +		};
> > +		struct nand_operation op =3D
> > +			NAND_OPERATION(instrs);
> > +
> > +		/* Drop the DATA_IN instruction if len is set to
> > 0. */
> > +		if (!len)
> > +			op.ninstrs--;
> > +
> > +		return nand_exec_op(chip, &op);
> > +	}
> > +
> >  	chip->cmdfunc(mtd, NAND_CMD_PARAM, page, -1);
> >  	for (i =3D 0; i < len; i++)
> >  		p[i] =3D chip->read_byte(mtd); =20
>=20
> [...]
>=20
> > +
> >  /**
> >   * nand_prog_page_begin_op - starts a PROG PAGE operation
> >   * @chip: The NAND chip
> > @@ -1371,7 +1608,7 @@ EXPORT_SYMBOL_GPL(nand_read_oob_op);
> >   * Returns 0 for success or negative error code otherwise
> >   */
> >  int nand_prog_page_begin_op(struct nand_chip *chip, unsigned int
> > page,
> > -			    unsigned int column, const void *buf,
> > +			    unsigned int offset_in_page, const
> > void *buf, unsigned int len)
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > @@ -1379,10 +1616,14 @@ int nand_prog_page_begin_op(struct
> > nand_chip *chip, unsigned int page, if (len && !buf)
> >  		return -EINVAL;
> > =20
> > -	if (column + len > mtd->writesize + mtd->oobsize)
> > +	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
> >  		return -EINVAL;
> > =20
> > -	chip->cmdfunc(mtd, NAND_CMD_SEQIN, column, page);
> > +	if (chip->exec_op)
> > +		return nand_exec_prog_page_op(
> > +			chip, page, offset_in_page, buf, len,
> > false); =20
>=20
> Param alignment please.

Done

>=20
> > +
> > +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, offset_in_page, page);
> > =20
> >  	if (buf)
> >  		chip->write_buf(mtd, buf, len);
> > @@ -1405,6 +1646,19 @@ int nand_prog_page_end_op(struct nand_chip
> > *chip) struct mtd_info *mtd =3D nand_to_mtd(chip);
> >  	int status;
> > =20
> > +	if (chip->exec_op) {
> > +		const struct nand_sdr_timings *sdr =3D
> > +
> > nand_get_sdr_timings(&chip->data_interface);
> > +		struct nand_op_instr instrs[] =3D {
> > +			NAND_OP_CMD(NAND_CMD_PAGEPROG,
> > sdr->tWB_max),
> > +			NAND_OP_WAIT_RDY(sdr->tPROG_max, 0),
> > +		};
> > +		struct nand_operation op =3D
> > +			NAND_OPERATION(instrs);
> > +
> > +		return nand_exec_op(chip, &op);
> > +	}
> > +
> >  	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> > =20
> >  	status =3D chip->waitfunc(mtd, chip);

[...]

> > +/**
> > + * nand_op_parser_must_split_instr - Checks if an instruction must
> > be split
> > + * @pat: the parser pattern that match
> > + * @instr: the instruction array to check
> > + * @start_offset: the offset from which to start in the first
> > instruction of the
> > + *		  @instr array
> > + *
> > + * Some NAND controllers are limited and cannot send X address
> > cycles with a
> > + * unique operation, or cannot read/write more than Y bytes at the
> > same time.
> > + * In this case, reduce the scope of this set of operation, and
> > trigger another
> > + * instruction with the rest. =20
>=20
> "
> In this case, split the instruction that does not fit in a single
> controller-operation into two or more chunks.
> "

Ok.

>=20
> > + *
> > + * Returns true if the array of instruction must be split, false
> > otherwise. =20
>=20
> s/array of//

Right.

>=20
> > + * The @start_offset parameter is also updated to the offset at
> > which the first
> > + * instruction of the next bundle of instruction must start (if an
> > address or a =20
>=20
> "
> The @start_offset parameter is also updated to the offset at which the
> the next bundle of instructions must start ...
> "

Ok.

>=20
> > + * data instruction).
> > + */
> > +static bool
> > +nand_op_parser_must_split_instr(const struct
> > nand_op_parser_pattern_elem *pat,
> > +				const struct nand_op_instr *instr,
> > +				unsigned int *start_offset)
> > +{

[...]

> > +#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG) || defined(DEBUG)
> > +static void nand_op_parser_trace(const struct nand_op_parser_ctx
> > *ctx,
> > +				 bool success)
> > +{
> > +	const struct nand_op_instr *instr;
> > +	bool in_subop =3D false;
> > +	char *is_in =3D  "    ->", *is_out =3D "      ", *prefix;
> > +	char *buf;
> > +	unsigned int len, off =3D 0;
> > +	int i, j;
> > +
> > +	if (success)
> > +		pr_debug("executing subop:\n");
> > +	else
> > +		pr_debug("pattern not found:\n");
> > +
> > +	for (i =3D 0; i < ctx->ninstrs; i++) {
> > +		instr =3D &ctx->instrs[i];
> > +
> > +		/*
> > +		 * ctx->instr_idx is not reliable because it may
> > already had =20
>=20
> 									 have

Corrected.

>=20
> > +		 * been updated by the parser. Use pointers
> > comparison instead.
> > +		 */
> > +		if (instr =3D=3D &ctx->subop.instrs[0])
> > +			in_subop =3D true; =20
>=20
> It seems in_subop is only used to select the prefix, so you can just
> get rid of it and do
>=20
> 		if (instr =3D=3D &ctx->subop.instrs[0])
> 			prefix =3D "    ->";

Ok, changed.

>=20
> BTW, if success is false, you should not even try to change the
> prefix, right?

I do not agree, there is no point in not showing what bundle of
instructions failed!

>=20
> > +
> > +		if (in_subop)
> > +			prefix =3D is_in;
> > +		else
> > +			prefix =3D is_out;
> > +
> > +		switch (instr->type) {
> > +		case NAND_OP_CMD_INSTR:
> > +			pr_debug("%sCMD      [0x%02x]\n", prefix,
> > +				 instr->cmd.opcode);
> > +			break;
> > +		case NAND_OP_ADDR_INSTR:
> > +			/*
> > +			 * A log line is much less than 50 bytes,
> > plus 5 bytes
> > +			 * per address cycle to display.
> > +			 */
> > +			len =3D 50 + 5 * instr->addr.naddrs;
> > +			buf =3D kmalloc(len, GFP_KERNEL);
> > +			if (!buf)
> > +				return;
> > +			memset(buf, 0, len);
> > +			off +=3D snprintf(buf, len, "ADDR     [%d
> > cyc:",
> > +					instr->addr.naddrs);
> > +			for (j =3D 0; j < instr->addr.naddrs; j++)
> > +				off +=3D snprintf(&buf[off], len -
> > off, " 0x%02x",
> > +
> > instr->addr.addrs[j]);
> > +			pr_debug("%s%s]\n", prefix, buf);
> > +			break;
> > +		case NAND_OP_DATA_IN_INSTR:
> > +			pr_debug("%sDATA_IN  [%d B%s]\n", prefix,
> > +				 instr->data.len,
> > +				 instr->data.force_8bit ? ", force
> > 8-bit" : "");
> > +			break;
> > +		case NAND_OP_DATA_OUT_INSTR:
> > +			pr_debug("%sDATA_OUT [%d B%s]\n", prefix,
> > +				 instr->data.len,
> > +				 instr->data.force_8bit ? ", force
> > 8-bit" : "");
> > +			break;
> > +		case NAND_OP_WAITRDY_INSTR:
> > +			pr_debug("%sWAITRDY  [max %d ms]\n",
> > prefix,
> > +				 instr->waitrdy.timeout_ms);
> > +			break;
> > +		}
> > +
> > +		if (instr =3D=3D &ctx->subop.instrs[ctx->subop.ninstrs
> > - 1])
> > +			in_subop =3D false; =20
>=20
> 		if (instr =3D=3D &ctx->subop.instrs[ctx->subop.ninstrs -
> 1]) prefix =3D "      ";
>=20
> and initialize prefix to "      " at the beginning of the function.
>=20
> > +	}
> > +}
> > +#else
> > +static void nand_op_parser_trace(const struct nand_op_parser_ctx
> > *ctx,
> > +				 bool success)
> > +{
> > +	/* NOP */
> > +}
> > +#endif
> > +
> > +/**
> > + * nand_op_parser_exec_op - exec_op parser
> > + * @chip: the NAND chip
> > + * @parser: the parser to use given by the controller driver
> > + * @op: the NAND operation to address
> > + * @check_only: flag asking if the entire operation could be
> > handled
> > + *
> > + * Function that must be called by each driver that implement the
> > "exec_op API"
> > + * in their own ->exec_op() implementation.
> > + *
> > + * The function iterates on all the instructions asked and make
> > use of internal
> > + * parsers to find matches between the instruction list and the
> > handled patterns
> > + * filled by the controller drivers inside the @parser structure.
> > If needed, the
> > + * instructions could be split into sub-operations and be executed
> > sequentially.
> > + */
> > +int nand_op_parser_exec_op(struct nand_chip *chip,
> > +			   const struct nand_op_parser *parser,
> > +			   const struct nand_operation *op, bool
> > check_only) +{
> > +	struct nand_op_parser_ctx ctx =3D {
> > +		.instrs =3D op->instrs,
> > +		.ninstrs =3D op->ninstrs,
> > +	};
> > +	unsigned int i;
> > +
> > +	while (ctx.instr_idx < op->ninstrs) {
> > +		bool pattern_found =3D false;
> > +		int ret;
> > +
> > +		for (i =3D 0; i < parser->npatterns; i++) {
> > +			const struct nand_op_parser_pattern
> > *pattern; +
> > +			pattern =3D &parser->patterns[i];
> > +			if (!nand_op_parser_match_pat(pattern,
> > &ctx))
> > +				continue;
> > +
> > +			nand_op_parser_trace(&ctx, true);
> > + =20
>=20
> pattern_found should be set to true here. But I'm not even sure you
> really need this variable.
>=20
> > +			if (check_only)
> > +				break;
> > +
> > +			ret =3D pattern->exec(chip, &ctx.subop);
> > +			if (ret)
> > +				return ret;
> > +
> > +			pattern_found =3D true;
> > +		}
> > +
> > +		if (!pattern_found) { =20
>=20
> Just test
>=20
> 		if (i =3D=3D parser->npatterns) {
>=20
> and you should be good.

Indeed it works.

>=20
> > +			nand_op_parser_trace(&ctx, false);
> > +			return -ENOTSUPP;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(nand_op_parser_exec_op);
> > +
> > +static bool nand_instr_is_data(const struct nand_op_instr *instr)
> > +{
> > +	return instr && (instr->type =3D=3D NAND_OP_DATA_IN_INSTR ||
> > +			 instr->type =3D=3D NAND_OP_DATA_OUT_INSTR);
> > +}
> > +
> > +static bool nand_subop_instr_is_valid(const struct nand_subop
> > *subop,
> > +				      unsigned int op_id) =20
>=20
> s/op_id/instr_idx/

Changed everywhere.

>=20
> > +{
> > +	return subop && op_id < subop->ninstrs;
> > +}
> > +
> > +static int nand_subop_get_start_off(const struct nand_subop *subop,
> > +				    unsigned int op_id) =20
>=20
> Ditto.
>=20
> > +{
> > +	if (op_id)
> > +		return 0;
> > +
> > +	return subop->first_instr_start_off;
> > +}
> > +
> > +/**
> > + * nand_subop_get_addr_start_off - Get the start offset in an
> > address array
> > + * @subop: The entire sub-operation
> > + * @op_id: Index of the instruction inside the sub-operation =20
>=20
> instr_idx.
>=20
> > + *
> > + * Instructions arrays may be split by the parser between
> > instructions,
> > + * and also in the middle of an address instruction if the number
> > of cycles
> > + * to assert in one operation is not supported by the controller.
> > + *
> > + * For this, instead of using the first index of the ->addr.addrs
> > field from the
> > + * address instruction, the NAND controller driver must use this
> > helper that
> > + * will either return 0 if the index does not point to the first
> > instruction of
> > + * the sub-operation, or the offset of the next starting offset
> > inside the
> > + * address cycles. =20
>=20
> I think you can drop this paragraph which IMO brings more confusion to
> what this function does.
>=20
> > + *
> > + * Returns the offset of the first address cycle to assert from
> > the pointed
> > + * address instruction. =20
>=20
> This part is definitely clearer.

Ok.

>=20
> > + */
> > +int nand_subop_get_addr_start_off(const struct nand_subop *subop,
> > +				  unsigned int op_id)
> > +{
> > +	if (!nand_subop_instr_is_valid(subop, op_id) ||
> > +	    subop->instrs[op_id].type !=3D NAND_OP_ADDR_INSTR)
> > +		return -EINVAL;
> > +
> > +	return nand_subop_get_start_off(subop, op_id);
> > +}
> > +EXPORT_SYMBOL_GPL(nand_subop_get_addr_start_off);
> > +
> > +/**
> > + * nand_subop_get_num_addr_cyc - Get the remaining address cycles
> > to assert
> > + * @subop: The entire sub-operation
> > + * @op_id: Index of the instruction inside the sub-operation =20
>=20
> instr_idx
>=20
> > + *
> > + * Instructions arrays may be split by the parser between
> > instructions,
> > + * and also in the middle of an address instruction if the number
> > of cycles
> > + * to assert in one operation is not supported by the controller.
> > + *
> > + * For this, instead of using the ->addr.naddrs fields of the
> > address
> > + * instruction, the NAND controller driver must use this helper
> > that will
> > + * return the actual number of cycles to assert between the first
> > and last
> > + * offset asked for this particular instruction.
> > + *
> > + * Returns the number of address cycles to assert from the pointed
> > address
> > + * instruction.
> > + */
> > +int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
> > +				unsigned int op_id)
> > +{
> > +	int start_off, end_off;
> > +
> > +	if (!nand_subop_instr_is_valid(subop, op_id) ||
> > +	    subop->instrs[op_id].type !=3D NAND_OP_ADDR_INSTR)
> > +		return -EINVAL;
> > +
> > +	start_off =3D nand_subop_get_addr_start_off(subop, op_id);
> > +
> > +	if (op_id =3D=3D subop->ninstrs - 1 &&
> > +	    subop->last_instr_end_off)
> > +		end_off =3D subop->last_instr_end_off;
> > +	else
> > +		end_off =3D subop->instrs[op_id].addr.naddrs;
> > +
> > +	return end_off - start_off;
> > +}
> > +EXPORT_SYMBOL_GPL(nand_subop_get_num_addr_cyc);
> > +
> > +/**
> > + * nand_subop_get_data_start_off - Get the start offset in a data
> > array
> > + * @subop: The entire sub-operation
> > + * @op_id: Index of the instruction inside the sub-operation
> > + *
> > + * Instructions arrays may be split by the parser between
> > instructions,
> > + * and also in the middle of a data instruction if the number of
> > bytes to access
> > + * in one operation is greater that the controller limit.
> > + *
> > + * For this, instead of using the first index of the ->data.buf
> > field from the
> > + * data instruction, the NAND controller driver must use this
> > helper that
> > + * will either return 0 if the index does not point to the first
> > instruction of
> > + * the sub-operation, or the offset of the next starting offset
> > inside the
> > + * data buffer. =20
>=20
> Same as for nand_subop_get_addr_start_off(), the explanation is
> confusing. I think we can drop it.

Dropped then.

>=20
> > + *
> > + * Returns the data offset inside the pointed data instruction
> > buffer from which
> > + * to start.
> > + */
> > +int nand_subop_get_data_start_off(const struct nand_subop *subop,
> > +				  unsigned int op_id)
> > +{
> > +	if (!nand_subop_instr_is_valid(subop, op_id) ||
> > +	    !nand_instr_is_data(&subop->instrs[op_id]))
> > +		return -EINVAL;
> > +
> > +	return nand_subop_get_start_off(subop, op_id);
> > +}
> > +EXPORT_SYMBOL_GPL(nand_subop_get_data_start_off);
> > +
> > +/**
> > + * nand_subop_get_data_len - Get the number of bytes to retrieve
> > + * @subop: The entire sub-operation
> > + * @op_id: Index of the instruction inside the sub-operation
> > + *
> > + * Instructions arrays may be split by the parser between
> > instructions,
> > + * and also in the middle of a data instruction if the number of
> > bytes to access
> > + * in one operation is greater that the controller limit.
> > + *
> > + * For this, instead of using the ->data.len field from the data
> > instruction,
> > + * the NAND controller driver must use this helper that will
> > return the actual
> > + * length of data to move between the first and last offset asked
> > for this
> > + * particular instruction.
> > + *
> > + * Returns the length of the data to move from the pointed data
> > instruction.
> > + */
> > +int nand_subop_get_data_len(const struct nand_subop *subop,
> > +			    unsigned int op_id)
> > +{
> > +	int start_off =3D 0, end_off;
> > +
> > +	if (!nand_subop_instr_is_valid(subop, op_id) ||
> > +	    !nand_instr_is_data(&subop->instrs[op_id]))
> > +		return -EINVAL;
> > +
> > +	start_off =3D nand_subop_get_data_start_off(subop, op_id);
> > +
> > +	if (op_id =3D=3D subop->ninstrs - 1 &&
> > +	    subop->last_instr_end_off)
> > +		end_off =3D subop->last_instr_end_off;
> > +	else
> > +		end_off =3D subop->instrs[op_id].data.len;
> > +
> > +	return end_off - start_off;
> > +}
> > +EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
> > +
> > +/**
> >   * nand_reset - Reset and initialize a NAND device
> >   * @chip: The NAND chip
> >   * @chipnr: Internal die id
> > @@ -3940,7 +4815,7 @@ static void nand_set_defaults(struct
> > nand_chip *chip) chip->chip_delay =3D 20;
> > =20
> >  	/* check, if a user supplied command function given */
> > -	if (chip->cmdfunc =3D=3D NULL)
> > +	if (chip->cmdfunc =3D=3D NULL && !chip->exec_op)
> >  		chip->cmdfunc =3D nand_command;
> > =20
> >  	/* check, if a user supplied wait function given */
> > @@ -4823,15 +5698,35 @@ int nand_scan_ident(struct mtd_info *mtd,
> > int maxchips, if (!mtd->name && mtd->dev.parent)
> >  		mtd->name =3D dev_name(mtd->dev.parent);
> > =20
> > -	if ((!chip->cmdfunc || !chip->select_chip)
> > && !chip->cmd_ctrl) {
> > +	/*
> > +	 * ->cmdfunc() is legacy and will only be used if
> > ->exec_op() is not
> > +	 * populated.
> > +	 */
> > +	if (chip->exec_op) {
> >  		/*
> > -		 * Default functions assigned for chip_select() and
> > -		 * cmdfunc() both expect cmd_ctrl() to be
> > populated,
> > -		 * so we need to check that that's the case
> > +		 * The implementation of ->exec_op() heavily
> > relies on timings
> > +		 * to be accessible through the
> > nand_data_interface structure.
> > +		 * Thus, the ->setup_data_interface() hook must be
> > provided. The
> > +		 * controller driver will be noticed of delays it
> > must apply
> > +		 * after each ->exec_op() instruction (if any)
> > through the
> > +		 * .delay_ns field. The driver will then choose to
> > handle the
> > +		 * delays manually if the controller cannot do it
> > natively. */
> > -		pr_err("chip.cmd_ctrl() callback is not provided");
> > -		return -EINVAL;
> > +		if (!chip->setup_data_interface) {
> > +			pr_err("->setup_data_interface() should be
> > provided\n");
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		/*
> > +		 * Default functions assigned for ->cmdfunc() and
> > +		 * ->select_chip() both expect ->cmd_ctrl() to be
> > populated.
> > +		 */
> > +		if ((!chip->cmdfunc || !chip->select_chip)
> > && !chip->cmd_ctrl) {
> > +			pr_err("->cmd_ctrl() should be
> > provided\n");
> > +			return -EINVAL;
> > +		}
> >  	}
> > +
> >  	/* Set the default functions */
> >  	nand_set_defaults(chip);
> > =20
> > diff --git a/drivers/mtd/nand/nand_hynix.c
> > b/drivers/mtd/nand/nand_hynix.c index 04e3ab7a476c..81c382f24513
> > 100644 --- a/drivers/mtd/nand/nand_hynix.c
> > +++ b/drivers/mtd/nand/nand_hynix.c
> > @@ -74,19 +74,36 @@ static bool hynix_nand_has_valid_jedecid(struct
> > nand_chip *chip) return !strncmp("JEDEC", jedecid, sizeof(jedecid));
> >  }
> > =20
> > +static int hynix_nand_cmd_op(struct nand_chip *chip, u8 cmd) =20
>=20
> Maybe you can introduce the helper in patch 1

Done.

>=20
> > +{
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +
> > +	if (chip->exec_op) {
> > +		struct nand_op_instr instrs[] =3D {
> > +			NAND_OP_CMD(cmd, 0),
> > +		};
> > +		struct nand_operation op =3D NAND_OPERATION(instrs);
> > +
> > +		return nand_exec_op(chip, &op); =20
>=20
> And then ass this block of code in this patch.

Sure.

>=20
> > +	}
> > +
> > +	chip->cmdfunc(mtd, cmd, -1, -1);
> > +
> > +	return 0;
> > +}
> > +
> >  static int hynix_nand_setup_read_retry(struct mtd_info *mtd, int
> > retry_mode) {
> >  	struct nand_chip *chip =3D mtd_to_nand(mtd);
> >  	struct hynix_nand *hynix =3D
> > nand_get_manufacturer_data(chip); const u8 *values;
> > -	int status;
> >  	int i;
> > =20
> >  	values =3D hynix->read_retry->values +
> >  		 (retry_mode * hynix->read_retry->nregs);
> > =20
> >  	/* Enter 'Set Hynix Parameters' mode */
> > -	chip->cmdfunc(mtd, NAND_HYNIX_CMD_SET_PARAMS, -1, -1);
> > +	hynix_nand_cmd_op(chip, NAND_HYNIX_CMD_SET_PARAMS);
> > =20
> >  	/*
> >  	 * Configure the NAND in the requested read-retry mode.
> > @@ -101,16 +118,17 @@ static int hynix_nand_setup_read_retry(struct
> > mtd_info *mtd, int retry_mode) int column =3D
> > hynix->read_retry->regs[i];=20
> >  		column |=3D column << 8;
> > -		chip->cmdfunc(mtd, NAND_CMD_NONE, column, -1);
> > -		chip->write_byte(mtd, values[i]);
> > +		if (chip->exec_op) {
> > +			nand_change_write_column_op(chip, column,
> > +						    &values[i], 1,
> > true); =20
>=20
> This is not a nand_change_write_column_op() op, here the cmd cycle is
> set to NAND_CMD_NONE. You should have your own operation defined to
> handle this sequence.

That is right.
However, this is not handled correctly in nand_command_lp(), I will
send a patch very soon to fix it.

>=20
> > +		} else {
> > +			chip->cmdfunc(mtd, NAND_CMD_NONE, column,
> > -1);
> > +			chip->write_byte(mtd, values[i]);
> > +		}
> >  	}
> > =20
> >  	/* Apply the new settings. */
> > -	chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS, -1, -1);
> > -
> > -	status =3D chip->waitfunc(mtd, chip);
> > -	if (status & NAND_STATUS_FAIL)
> > -		return -EIO;
> > +	hynix_nand_cmd_op(chip, NAND_HYNIX_CMD_APPLY_PARAMS); =20
>=20
> No, it's wrong, you miss the WAITRDY instruction to be compatible
> with what was done before.

Re-added.

>=20
> > =20
> >  	return 0;
> >  }
> > @@ -173,32 +191,65 @@ static int hynix_read_rr_otp(struct nand_chip
> > *chip,=20
> >  	nand_reset_op(chip);
> > =20
> > -	chip->cmdfunc(mtd, NAND_HYNIX_CMD_SET_PARAMS, -1, -1);
> > +	hynix_nand_cmd_op(chip, NAND_HYNIX_CMD_SET_PARAMS);
> > =20
> >  	for (i =3D 0; i < info->nregs; i++) {
> >  		int column =3D info->regs[i];
> > =20
> >  		column |=3D column << 8;
> > -		chip->cmdfunc(mtd, NAND_CMD_NONE, column, -1);
> > -		chip->write_byte(mtd, info->values[i]);
> > +		if (chip->exec_op) {
> > +			nand_change_write_column_op(chip, column,
> > +
> > &info->values[i], 1, true);
> > +		} else {
> > +			chip->cmdfunc(mtd, NAND_CMD_NONE, column,
> > -1);
> > +			chip->write_byte(mtd, info->values[i]);
> > +		} =20
>=20
> Same comments apply here.
>=20
> >  	}
> > =20
> > -	chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS, -1, -1);
> > +	hynix_nand_cmd_op(chip, NAND_HYNIX_CMD_APPLY_PARAMS);
> > =20
> >  	/* Sequence to enter OTP mode? */
> > -	chip->cmdfunc(mtd, 0x17, -1, -1);
> > -	chip->cmdfunc(mtd, 0x04, -1, -1);
> > -	chip->cmdfunc(mtd, 0x19, -1, -1);
> > +	if (chip->exec_op) {
> > +		struct nand_op_instr instrs[] =3D {
> > +			NAND_OP_CMD(0x17, 0),
> > +			NAND_OP_CMD(0x04, 0),
> > +			NAND_OP_CMD(0x19, 0),
> > +		};
> > +		struct nand_operation op =3D NAND_OPERATION(instrs);
> > +
> > +		nand_exec_op(chip, &op);
> > +	} else {
> > +		chip->cmdfunc(mtd, 0x17, -1, -1);
> > +		chip->cmdfunc(mtd, 0x04, -1, -1);
> > +		chip->cmdfunc(mtd, 0x19, -1, -1);
> > +	} =20
>=20
> Why not creating a hynix_nand_enter_otp_mode_op() for that?

I think this file needs some kind of rework and may really benefit
from ->exec_op() new API, but this series is maybe not the best place to
do it. Let's keep it this way for now.

>=20
> > =20
> >  	/* Now read the page */
> >  	nand_read_page_op(chip, info->page, 0, buf, info->size);
> > =20
> >  	/* Put everything back to normal */
> >  	nand_reset_op(chip);
> > -	chip->cmdfunc(mtd, NAND_HYNIX_CMD_SET_PARAMS, 0x38, -1);
> > -	chip->write_byte(mtd, 0x0);
> > -	chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS, -1, -1);
> > -	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x0, -1);
> > +	if (chip->exec_op) {
> > +		const struct nand_sdr_timings *sdr =3D
> > +
> > nand_get_sdr_timings(&chip->data_interface);
> > +		u8 byte =3D 0;
> > +		u8 addr =3D 0x38;
> > +		struct nand_op_instr instrs[] =3D {
> > +			NAND_OP_CMD(NAND_HYNIX_CMD_SET_PARAMS, 0),
> > +			NAND_OP_ADDR(1, &addr, sdr->tCCS_min),
> > +			NAND_OP_8BIT_DATA_OUT(1, &byte, 0),
> > +			NAND_OP_CMD(NAND_HYNIX_CMD_APPLY_PARAMS,
> > 0),
> > +			NAND_OP_CMD(NAND_CMD_READ0, 0),
> > +		};
> > +		struct nand_operation op =3D NAND_OPERATION(instrs);
> > +
> > +		nand_exec_op(chip, &op);
> > +	} else {
> > +		chip->cmdfunc(mtd, NAND_HYNIX_CMD_SET_PARAMS,
> > 0x38, -1);
> > +		chip->write_byte(mtd, 0x0);
> > +		chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS,
> > -1, -1);
> > +		chip->cmdfunc(mtd, NAND_CMD_READ0, 0x0, -1);
> > +	} =20
>=20
> Same here.
>=20
> > =20
> >  	return 0;
> >  }
> > diff --git a/drivers/mtd/nand/nand_micron.c
> > b/drivers/mtd/nand/nand_micron.c index 543352380ffa..109d8003e33d
> > 100644 --- a/drivers/mtd/nand/nand_micron.c
> > +++ b/drivers/mtd/nand/nand_micron.c
> > @@ -117,14 +117,38 @@ micron_nand_read_page_on_die_ecc(struct
> > mtd_info *mtd, struct nand_chip *chip, uint8_t *buf, int
> > oob_required, int page)
> >  {
> > -	int status;
> > +	u8 status;
> >  	int max_bitflips =3D 0;
> > =20
> >  	micron_nand_on_die_ecc_setup(chip, true);
> > =20
> > -	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> > -	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> > -	status =3D chip->read_byte(mtd);
> > +	if (chip->exec_op) {
> > +		u8 addrs[5] =3D {};
> > +		struct nand_op_instr instrs[] =3D {
> > +			NAND_OP_CMD(NAND_CMD_READ0, 0),
> > +			NAND_OP_ADDR(4, addrs, 0),
> > +			NAND_OP_CMD(NAND_CMD_STATUS, 0),
> > +			NAND_OP_8BIT_DATA_IN(1, &status, 0),
> > +		};
> > +		struct nand_operation op =3D NAND_OPERATION(instrs);
> > +
> > +		if (nand_fill_column_cycles(chip, addrs, 0)) =20
>=20
> 		if (nand_fill_column_cycles(chip, addrs, 0) < 0)

Yes.

>=20
> > +			return -EINVAL;
> > +
> > +		addrs[2] =3D page;
> > +		addrs[3] =3D page >> 8;
> > +		if (chip->options & NAND_ROW_ADDR_3) {
> > +			addrs[4] =3D page >> 16;
> > +			instrs[1].addr.naddrs++;
> > +		}
> > +
> > +		nand_exec_op(chip, &op);
> > +	} else {
> > +		chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> > +		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> > +		status =3D chip->read_byte(mtd);
> > +	}
> > +
> >  	if (status & NAND_STATUS_FAIL)
> >  		mtd->ecc_stats.failed++;
> >  	/*
> > diff --git a/include/linux/mtd/rawnand.h
> > b/include/linux/mtd/rawnand.h index 1acc26ed0e91..302f231df65e
> > 100644 --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -751,6 +751,337 @@ struct nand_manufacturer_ops {
> >  };
> > =20
> >  /**
> > + * struct nand_op_cmd_instr - Definition of a command instruction
> > + * @opcode: the command to assert in one cycle
> > + */
> > +struct nand_op_cmd_instr {
> > +	u8 opcode;
> > +};
> > +
> > +/**
> > + * struct nand_op_addr_instr - Definition of an address instruction
> > + * @naddrs: length of the @addrs array
> > + * @addrs: array containing the address cycles to assert
> > + */
> > +struct nand_op_addr_instr {
> > +	unsigned int naddrs;
> > +	const u8 *addrs;
> > +};
> > +
> > +/**
> > + * struct nand_op_data_instr - Definition of a data instruction
> > + * @len: number of data bytes to move
> > + * @in: buffer to fill when reading from the NAND chip
> > + * @out: buffer to read from when writing to the NAND chip
> > + * @force_8bit: force 8-bit access
> > + *
> > + * Please note that "in" and "out" are inverted from the ONFI
> > specification
> > + * and are from the controller perspective, so a "in" is a read
> > from the NAND
> > + * chip while a "out" is a write to the NAND chip.
> > + */
> > +struct nand_op_data_instr {
> > +	unsigned int len;
> > +	union {
> > +		void *in;
> > +		const void *out;
> > +	};
> > +	bool force_8bit;
> > +};
> > +
> > +/**
> > + * struct nand_op_waitrdy_instr - Definition of a wait ready
> > instruction
> > + * @timeout_ms: maximum delay while waiting for the ready/busy pin
> > in ms
> > + */
> > +struct nand_op_waitrdy_instr {
> > +	unsigned int timeout_ms;
> > +};
> > +
> > +/**
> > + * enum nand_op_instr_type - Enumeration of all the instructions =20
>=20
> *of all instruction types

Changed.

>=20
> > + *
> > + * Please note that data instructions are separated into DATA_IN
> > and DATA_OUT
> > + * instructions.
> > + */
> > +enum nand_op_instr_type {
> > +	NAND_OP_CMD_INSTR,
> > +	NAND_OP_ADDR_INSTR,
> > +	NAND_OP_DATA_IN_INSTR,
> > +	NAND_OP_DATA_OUT_INSTR,
> > +	NAND_OP_WAITRDY_INSTR,
> > +};
> > +
> > +/**
> > + * struct nand_op_instr - Generic definition of and instruction =20
>=20
> s/and/an/

Corrected.

>=20
> > + * @type: an enumeration of the instruction type
> > + * @cmd/@addr/@data/@waitrdy: the actual instruction to refer
> > depending on the
> > + *			      value of @type =20
>=20
> "
> extra data associated to the instruction. You'll have to use
> the appropriate element depending on @type"

Changed.

>=20
> > + * @delay_ns: delay to apply by the controller after the
> > instruction has been
> > + *	      actually executed (most of them are directly
> > handled by the
> > + *	      controllers once the timings negociation has been
> > done)
> > + */
> > +struct nand_op_instr {
> > +	enum nand_op_instr_type type;
> > +	union {
> > +		struct nand_op_cmd_instr cmd;
> > +		struct nand_op_addr_instr addr;
> > +		struct nand_op_data_instr data;
> > +		struct nand_op_waitrdy_instr waitrdy;
> > +	};
> > +	unsigned int delay_ns;
> > +};
> > +
> > +/*
> > + * Special handling must be done for the WAITRDY timeout parameter
> > as it usually
> > + * is either tPROG (after a prog), tR (before a read), tRST
> > (during a reset) or
> > + * tBERS (during an erase) which all of them are u64 values that
> > cannot be
> > + * divided by usual kernel macros and must be handled with the
> > special
> > + * DIV_ROUND_UP_ULL() macro.
> > + */
> > +#define PSEC_TO_NSEC(x) DIV_ROUND_UP(x, 10^3)
> > +#define PSEC_TO_MSEC(x) DIV_ROUND_UP_ULL(x, 10^9) =20
>=20
> Hm, that's a bit of a mess to let each macro decide which converter
> they should use, because we don't know at this level whether the
> timing is stored in an u64 or u32. How about doing the conversion in
> the call-sites instead, because there you should know what you
> manipulate.
>=20
> Something like
>=20
> 	NAND_OP_CMD(FOO, PSEC_TO_NSEC_UL(sdr->tXX))
> 	NAND_OP_WAITRDY(PSEC_TO_MSEC_ULL(sdr->tXX),
> 			PSEC_TO_NSEC_UL(sdr->tYY))

That is a bit messy but okay. I have added to the core a "__DIVIDE"
macro that uses the size of the dividend to decide if the *_ULL version
must be used, so the drivers can safely use PSEC_TO_NSEC and
PSEC_TO_MSEC without knowing it the timings are stored in a u32 or a
u64.

>=20
>=20
>=20
> > +
> > +#define NAND_OP_CMD(id,
> > delay_ps)					\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_CMD_INSTR,				\
> > +		.cmd.opcode =3D
> > id,					\
> > +		.delay_ns =3D
> > PSEC_TO_NSEC(delay_ps),			\
> > +	}
> > +
> > +#define NAND_OP_ADDR(ncycles, cycles,
> > delay_ps)				\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_ADDR_INSTR,				\
> > +		.addr =3D
> > {						\
> > +			.naddrs =3D
> > ncycles,				\
> > +			.addrs =3D
> > cycles,				\
> > +		},
> > \
> > +		.delay_ns =3D
> > PSEC_TO_NSEC(delay_ps),			\
> > +	}
> > +
> > +#define NAND_OP_DATA_IN(l, buf,
> > delay_ps)				\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_DATA_IN_INSTR,				\
> > +		.data =3D
> > {						\
> > +			.len =3D
> > l,					\
> > +			.in =3D
> > buf,					\
> > +			.force_8bit =3D
> > false,				\
> > +		},
> > \
> > +		.delay_ns =3D
> > PSEC_TO_NSEC(delay_ps),			\
> > +	}
> > +
> > +#define NAND_OP_DATA_OUT(l, buf,
> > delay_ps)				\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_DATA_OUT_INSTR,				\
> > +		.data =3D
> > {						\
> > +			.len =3D
> > l,					\
> > +			.out =3D
> > buf,					\
> > +			.force_8bit =3D
> > false,				\
> > +		},
> > \
> > +		.delay_ns =3D
> > PSEC_TO_NSEC(delay_ps),			\
> > +	}
> > +
> > +#define NAND_OP_8BIT_DATA_IN(l, buf,
> > delay_ps)				\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_DATA_IN_INSTR,				\
> > +		.data =3D
> > {						\
> > +			.len =3D
> > l,					\
> > +			.in =3D
> > buf,					\
> > +			.force_8bit =3D
> > true,				\
> > +		},
> > \
> > +		.delay_ns =3D
> > PSEC_TO_NSEC(delay_ps),			\
> > +	}
> > +
> > +#define NAND_OP_8BIT_DATA_OUT(l, buf,
> > delay_ps)				\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_DATA_OUT_INSTR,				\
> > +		.data =3D
> > {						\
> > +			.len =3D
> > l,					\
> > +			.out =3D
> > buf,					\
> > +			.force_8bit =3D
> > true,				\
> > +		},
> > \
> > +		.delay_ns =3D
> > PSEC_TO_NSEC(delay_ps),			\
> > +	}
> > +
> > +#define NAND_OP_WAIT_RDY(tout_ps,
> > delay_ps)				\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_WAITRDY_INSTR,				\
> > +		.waitrdy.timeout_ms =3D
> > PSEC_TO_MSEC(tout_ps),		\
> > +		.delay_ns =3D
> > PSEC_TO_NSEC(delay_ps),			\
> > +	}
> > +
> > +/**
> > + * struct nand_subop - a sub operation
> > + * @instrs: array of instructions
> > + * @ninstrs: length of the @instrs array
> > + * @first_instr_start_off: offset to start from for the first
> > instruction
> > + *			   of the sub-operation
> > + * @last_instr_end_off: offset to end at (excluded) for the last
> > instruction
> > + *			of the sub-operation
> > + *
> > + * When an operation cannot be handled as is by the NAND
> > controller, it will
> > + * be split by the parser and the remaining pieces will be handled
> > as
> > + * sub-operations.
> > + */
> > +struct nand_subop {
> > +	const struct nand_op_instr *instrs;
> > +	unsigned int ninstrs;
> > +	/*
> > +	 * Specific offset for the first and the last instructions
> > of the subop.
> > +	 * Applies for the address cycles in the case of address,
> > or for data
> > +	 * offset in the case of data transfers. Otherwise, it is
> > irrelevant.
> > +	 */ =20
>=20
> Can you move that in the kernel header doc?

Sure.

>=20
> > +	unsigned int first_instr_start_off;
> > +	unsigned int last_instr_end_off;
> > +};
> > +
> > +int nand_subop_get_addr_start_off(const struct nand_subop *subop,
> > +				  unsigned int op_id);
> > +int nand_subop_get_num_addr_cyc(const struct nand_subop *subop,
> > +				unsigned int op_id);
> > +int nand_subop_get_data_start_off(const struct nand_subop *subop,
> > +				  unsigned int op_id);
> > +int nand_subop_get_data_len(const struct nand_subop *subop,
> > +			    unsigned int op_id);
> > +
> > +/**
> > + * struct nand_op_parser_addr_constraints - Constraints for
> > address instructions
> > + * @maxcycles: maximum number of cycles that the controller can
> > assert by
> > + *	       instruction
> > + */
> > +struct nand_op_parser_addr_constraints {
> > +	unsigned int maxcycles;
> > +};
> > +
> > +/**
> > + * struct nand_op_parser_data_constraints - Constraints for data
> > instructions
> > + * @maxlen: maximum data length that the controller can handle
> > with one
> > + *	    instruction
> > + */
> > +struct nand_op_parser_data_constraints {
> > +	unsigned int maxlen; =20
>=20
> At some point we should probably add minlen and alignment fields, but
> let's keep that for later.
>=20
> > +};
> > +
> > +/**
> > + * struct nand_op_parser_pattern_elem - One element of a pattern
> > + * @type: the instructuction type
> > + * @optional: if this element of the pattern is optional or
> > mandatory
> > + * @addr/@data: address or data constraint (number of cycles or
> > data length)
> > + */
> > +struct nand_op_parser_pattern_elem {
> > +	enum nand_op_instr_type type;
> > +	bool optional;
> > +	union {
> > +		struct nand_op_parser_addr_constraints addr;
> > +		struct nand_op_parser_data_constraints data;
> > +	};
> > +};
> > +
> > +#define NAND_OP_PARSER_PAT_CMD_ELEM(_opt)			\
> > +	{							\
> > +		.type =3D NAND_OP_CMD_INSTR,			\
> > +		.optional =3D _opt,				\
> > +	}
> > +
> > +#define NAND_OP_PARSER_PAT_ADDR_ELEM(_opt,
> > _maxcycles)		\
> > +	{							\
> > +		.type =3D NAND_OP_ADDR_INSTR,
> > \
> > +		.optional =3D _opt,				\
> > +		.addr.maxcycles =3D
> > _maxcycles,			\
> > +	}
> > +
> > +#define NAND_OP_PARSER_PAT_DATA_IN_ELEM(_opt,
> > _maxlen)		\
> > +	{							\
> > +		.type =3D
> > NAND_OP_DATA_IN_INSTR,			\
> > +		.optional =3D _opt,				\
> > +		.data.maxlen =3D
> > _maxlen,				\
> > +	}
> > +
> > +#define NAND_OP_PARSER_PAT_DATA_OUT_ELEM(_opt,
> > _maxlen)		\
> > +	{							\
> > +		.type =3D
> > NAND_OP_DATA_OUT_INSTR,			\
> > +		.optional =3D _opt,				\
> > +		.data.maxlen =3D
> > _maxlen,				\
> > +	}
> > +
> > +#define
> > NAND_OP_PARSER_PAT_WAITRDY_ELEM(_opt)			\
> > +	{							\
> > +		.type =3D
> > NAND_OP_WAITRDY_INSTR,			\
> > +		.optional =3D _opt,				\
> > +	}
> > +
> > +/**
> > + * struct nand_op_parser_pattern - A complete pattern
> > + * @elems: array of pattern elements
> > + * @nelems: number of pattern elements in @elems array
> > + * @exec: the function that will actually execute this pattern,
> > written in the
> > + *	  controller driver
> > + *
> > + * This is a complete pattern that is a list of elements, each one
> > reprensenting
> > + * one instruction with its constraints. Controller drivers must
> > declare as much
> > + * patterns as they support and give the list of the supported
> > patterns (created
> > + * with the help of the following macro) at the call to
> > nand_op_parser_exec_op =20
>=20
> s/at the call to nand_op_parser_exec_op/when calling
> nand_op_parser_exec_op()/

Ok.

>=20
> > + * which shall be the main thing to do in the driver
> > implementation of
> > + * ->exec_op(). =20
>=20
> I'd be more lax than that. Yes the parser is the preferred approach
> when you deal with a complex controller. But for simple controllers
> it's not.
>=20
> > Once there is a match between the pattern and an operation, the
> > + * core calls the @exec function to actually do the operation. =20
>=20
> Not necessarily. The plan is still to ask the controller which
> operation it supports before actually executing them. So, in this case
> (when check_only param is true), nand_op_parser_exec_op() will never
> call ->exec(), it will just make sure the operation can be handled
> with the provided patterns.

I changed that =C2=A7, see next version.

>=20
> > + */
> > +struct nand_op_parser_pattern {
> > +	const struct nand_op_parser_pattern_elem *elems;
> > +	unsigned int nelems;
> > +	int (*exec)(struct nand_chip *chip, const struct
> > nand_subop *subop); +};
> > +
> > +#define
> > NAND_OP_PARSER_PATTERN(_exec, ...)
> > \
> > +
> > {
> > \
> > +		.exec =3D
> > _exec,
> > \
> > +		.elems =3D (struct nand_op_parser_pattern_elem[])
> > { __VA_ARGS__ },		\
> > +		.nelems =3D sizeof((struct
> > nand_op_parser_pattern_elem[]) { __VA_ARGS__ }) /	\
> > +			  sizeof(struct
> > nand_op_parser_pattern_elem),				\
> > +	}
> > +
> > +/**
> > + * struct nand_op_parser - The actual parser
> > + * @patterns: array of patterns
> > + * @npatterns: length of the @patterns array
> > + *
> > + * The actual parser structure wich is an array of supported
> > patterns. =20
>=20
> It's worth mentioning that patterns will be tested in their
> declaration order, and the first match will be taken, so it's
> important to oder patterns appropriately so that simple/inefficient
> patterns are placed at the end of the list. Usually, this is where
> you put single instruction patterns.

Nice explanation, added.

>=20
> > + */
> > +struct nand_op_parser {
> > +	const struct nand_op_parser_pattern *patterns;
> > +	unsigned int npatterns;
> > +};
> > +
> > +#define
> > NAND_OP_PARSER(...)
> > \
> > +
> > {
> > \
> > +		.patterns =3D (struct nand_op_parser_pattern[])
> > { __VA_ARGS__ },			\
> > +		.npatterns =3D sizeof((struct
> > nand_op_parser_pattern[]) { __VA_ARGS__ }) /	\
> > +			     sizeof(struct
> > nand_op_parser_pattern),				\
> > +	}
> > +
> > +/**
> > + * struct nand_operation - The actual operation
> > + * @instrs: array of instructions to execute
> > + * @ninstrs: length of the @instrs array
> > + *
> > + * The actual operation structure that will be given to the
> > parser. =20
>=20
> Not only the parser, it will be passed to chip->exep_op() as well.

Yes.

>=20
> > + */
> > +struct nand_operation {
> > +	const struct nand_op_instr *instrs;
> > +	unsigned int ninstrs;
> > +};
> > +
> > +#define
> > NAND_OPERATION(_instrs)					\
> > +	{							\
> > +		.instrs =3D _instrs,				\
> > +		.ninstrs =3D
> > ARRAY_SIZE(_instrs),			\
> > +	}
> > +
> > +int nand_fill_column_cycles(struct nand_chip *chip, u8 *addrs,
> > +			    unsigned int offset_in_page);
> > +
> > +int nand_op_parser_exec_op(struct nand_chip *chip,
> > +			   const struct nand_op_parser *parser,
> > +			   const struct nand_operation *op, bool
> > check_only); +
> > +/**
> >   * struct nand_chip - NAND Private Flash Chip Data
> >   * @mtd:		MTD device registered to the MTD framework
> >   * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the
> > 8 I/O lines of the @@ -885,6 +1216,9 @@ struct nand_chip {
> >  	int (*setup_data_interface)(struct mtd_info *mtd, int
> > chipnr, const struct nand_data_interface *conf);
> > =20
> > +	int (*exec_op)(struct nand_chip *chip,
> > +		       const struct nand_operation *op,
> > +		       bool check_only);
> > =20
> >  	int chip_delay;
> >  	unsigned int options;
> > @@ -945,6 +1279,15 @@ struct nand_chip {
> >  	} manufacturer;
> >  };
> > =20
> > +static inline int nand_exec_op(struct nand_chip *chip,
> > +			       const struct nand_operation *op)
> > +{
> > +	if (!chip->exec_op)
> > +		return -ENOTSUPP;
> > +
> > +	return chip->exec_op(chip, op, false);
> > +}
> > +
> >  extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
> >  extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
> > =20
> > @@ -1307,23 +1650,26 @@ int nand_readid_op(struct nand_chip *chip,
> > u8 addr, void *buf, int nand_status_op(struct nand_chip *chip, u8
> > *status); int nand_erase_op(struct nand_chip *chip, unsigned int
> > eraseblock); int nand_read_page_op(struct nand_chip *chip, unsigned
> > int page,
> > -		      unsigned int column, void *buf, unsigned int
> > len); -int nand_change_read_column_op(struct nand_chip *chip,
> > unsigned int column,
> > -			       void *buf, unsigned int len, bool
> > force_8bit);
> > +		      unsigned int offset_in_page, void *buf,
> > unsigned int len); +int nand_change_read_column_op(struct nand_chip
> > *chip,
> > +			       unsigned int offset_in_page, void
> > *buf,
> > +			       unsigned int len, bool force_8bit);
> >  int nand_read_oob_op(struct nand_chip *chip, unsigned int page,
> > -		     unsigned int column, void *buf, unsigned int
> > len);
> > +		     unsigned int offset_in_page, void *buf,
> > unsigned int len); int nand_prog_page_begin_op(struct nand_chip
> > *chip, unsigned int page,
> > -			    unsigned int column, const void *buf,
> > +			    unsigned int offset_in_page, const
> > void *buf, unsigned int len);
> >  int nand_prog_page_end_op(struct nand_chip *chip);
> >  int nand_prog_page_op(struct nand_chip *chip, unsigned int page,
> > -		      unsigned int column, const void *buf,
> > unsigned int len); -int nand_change_write_column_op(struct
> > nand_chip *chip, unsigned int column,
> > -				const void *buf, unsigned int len,
> > bool force_8bit);
> > +		      unsigned int offset_in_page, const void *buf,
> > +		      unsigned int len);
> > +int nand_change_write_column_op(struct nand_chip *chip,
> > +				unsigned int offset_in_page, const
> > void *buf,
> > +				unsigned int len, bool force_8bit);
> >  int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned
> > int len,
> > -		      bool force_8bits);
> > +		      bool force_8bit);
> >  int nand_write_data_op(struct nand_chip *chip, const void *buf,
> > -		       unsigned int len, bool force_8bits);
> > +		       unsigned int len, bool force_8bit);
> > =20
> >  /* Free resources held by the NAND device */
> >  void nand_cleanup(struct nand_chip *chip); =20
>=20


Thanks for the detailed review,
Miqu=C3=A8l
