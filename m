Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffuEz-0001Ju-IB
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 21:44:11 +0000
Date: Wed, 18 Jul 2018 23:43:58 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Abhishek Sahu <absahu@codeaurora.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: remove driver specific
 block_markbad function
Message-ID: <20180718234358.6bb5e8a0@bbrezillon>
In-Reply-To: <20180718232350.3eaade9a@xps13>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
 <1530863519-5564-3-git-send-email-absahu@codeaurora.org>
 <20180718232350.3eaade9a@xps13>
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

On Wed, 18 Jul 2018 23:23:50 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Boris,
>=20
> Can you please check the change in qcom_nandc_write_oob() is
> valid? I think it is but as this is a bit of a hack I prefer double check=
ing.

Indeed, it's hack-ish.

>=20
> Thanks,
> Miqu=C3=A8l
>=20
>=20
> Abhishek Sahu <absahu@codeaurora.org> wrote on Fri,  6 Jul 2018
> 13:21:56 +0530:
>=20
> > The NAND base layer calls write_oob() by setting bytes at
> > chip->badblockpos with value non 0xFF for updating bad block status.
> > The QCOM NAND controller skips the bad block bytes while doing normal
> > write with ECC enabled. When initial support for this driver was
> > added, the driver specific function was added temporarily for
> > block_markbad() with assumption to change for raw read in NAND base
> > layer. Moving to raw read for block_markbad() seems to take more time
> > so this patch removes driver specific block_markbad() function by
> > using following HACK in write_oob() function.
> >=20
> > Check for BBM bytes in OOB and accordingly do raw write for updating
> > BBM bytes in NAND flash or normal write for updating available OOB
> > bytes.

Why don't we change that instead of patching the qcom driver to guess
when the core tries to mark a block bad? If you're afraid of breaking
existing drivers that might rely on the "write/read BBM in non-raw
mode" solution (I'm sure some drivers are), you can always add a new
flag in chip->options (NAND_ACCESS_BBM_IN_RAW_MODE) and only use raw
accessors when this flag is set.

> >=20
> > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> > ---
> >  drivers/mtd/nand/raw/qcom_nandc.c | 103 +++++++++++++++---------------=
--------
> >  1 file changed, 40 insertions(+), 63 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/q=
com_nandc.c
> > index ea253ac..df12cf3 100644
> > --- a/drivers/mtd/nand/raw/qcom_nandc.c
> > +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> > @@ -2138,28 +2138,57 @@ static int qcom_nandc_write_oob(struct mtd_info=
 *mtd, struct nand_chip *chip,
> >  	struct qcom_nand_host *host =3D to_qcom_nand_host(chip);
> >  	struct qcom_nand_controller *nandc =3D get_qcom_nand_controller(chip);
> >  	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> > -	u8 *oob =3D chip->oob_poi;
> > -	int data_size, oob_size;
> > +	u8 *oob =3D chip->oob_poi, bbm_byte;
> > +	int data_size, oob_size, bbm_offset, write_size;
> >  	int ret;
> > =20
> > -	host->use_ecc =3D true;
> >  	clear_bam_transaction(nandc);
> > =20
> > -	/* calculate the data and oob size for the last codeword/step */
> > -	data_size =3D ecc->size - ((ecc->steps - 1) << 2);
> > -	oob_size =3D mtd->oobavail;
> > +	/*
> > +	 * The NAND base layer calls ecc->write_oob() by setting bytes at
> > +	 * chip->badblockpos (chip->badblockpos will be 0 for QCOM NAND
> > +	 * controller layout) in OOB buffer with value other that 0xFF
> > +	 * for updating bad block status. QCOM NAND controller skips
> > +	 * BBM bytes while writing with ECC, so following HACK has been
> > +	 * added in this function for using generic block_markbad() function.
> > +	 *
> > +	 * Check for BBM bytes in OOB and accordingly do raw write for
> > +	 * updating BBM bytes in NAND flash or normal write with ECC for
> > +	 * updating available OOB bytes.
> > +	 */
> > +	bbm_byte =3D oob[0];
> > +	if (chip->options & NAND_BUSWIDTH_16)
> > +		bbm_byte &=3D oob[1];
> > =20
> > -	memset(nandc->data_buffer, 0xff, host->cw_data);
> > -	/* override new oob content to last codeword */
> > -	mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size, oob,
> > -				    0, mtd->oobavail);
> > +	/* Write BBM bytes by doing raw write. */
> > +	if (bbm_byte !=3D 0xff) {
> > +		host->use_ecc =3D false;
> > +		memset(nandc->data_buffer, 0xff, host->cw_size);
> > +		/* Determine the BBM bytes position and update the same */
> > +		bbm_offset =3D mtd->writesize - host->cw_size * (ecc->steps - 1);
> > +		memcpy(nandc->data_buffer + bbm_offset, oob, host->bbm_size);
> > +		write_size =3D host->cw_size;
> > +	/* Write OOB bytes by doing normal write with ECC */
> > +	} else {
> > +		host->use_ecc =3D true;
> > +		/* calculate the data and oob size for the last codeword/step */
> > +		data_size =3D ecc->size - ((ecc->steps - 1) << 2);
> > +		oob_size =3D mtd->oobavail;
> > +
> > +		memset(nandc->data_buffer, 0xff, host->cw_data);
> > +		/* override new oob content to last codeword */
> > +		mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size,
> > +					    oob, 0, mtd->oobavail);
> > +
> > +		write_size =3D data_size + oob_size;
> > +	}
> > =20
> >  	set_address(host, host->cw_size * (ecc->steps - 1), page);
> >  	update_rw_regs(host, 1, false);
> > =20
> >  	config_nand_page_write(nandc);
> >  	write_data_dma(nandc, FLASH_BUF_ACC,
> > -		       nandc->data_buffer, data_size + oob_size, 0);
> > +		       nandc->data_buffer, write_size, 0);
> >  	config_nand_cw_write(nandc);
> > =20
> >  	ret =3D submit_descs(nandc);
> > @@ -2174,48 +2203,6 @@ static int qcom_nandc_write_oob(struct mtd_info =
*mtd, struct nand_chip *chip,
> >  	return nand_prog_page_end_op(chip);
> >  }
> > =20
> > -static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
> > -{
> > -	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > -	struct qcom_nand_host *host =3D to_qcom_nand_host(chip);
> > -	struct qcom_nand_controller *nandc =3D get_qcom_nand_controller(chip);
> > -	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> > -	int page, ret;
> > -
> > -	clear_read_regs(nandc);
> > -	clear_bam_transaction(nandc);
> > -
> > -	/*
> > -	 * to mark the BBM as bad, we flash the entire last codeword with 0s.
> > -	 * we don't care about the rest of the content in the codeword since
> > -	 * we aren't going to use this block again
> > -	 */
> > -	memset(nandc->data_buffer, 0x00, host->cw_size);
> > -
> > -	page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
> > -
> > -	/* prepare write */
> > -	host->use_ecc =3D false;
> > -	set_address(host, host->cw_size * (ecc->steps - 1), page);
> > -	update_rw_regs(host, 1, false);
> > -
> > -	config_nand_page_write(nandc);
> > -	write_data_dma(nandc, FLASH_BUF_ACC,
> > -		       nandc->data_buffer, host->cw_size, 0);
> > -	config_nand_cw_write(nandc);
> > -
> > -	ret =3D submit_descs(nandc);
> > -
> > -	free_descs(nandc);
> > -
> > -	if (ret) {
> > -		dev_err(nandc->dev, "failure to update BBM\n");
> > -		return -EIO;
> > -	}
> > -
> > -	return nand_prog_page_end_op(chip);
> > -}
> > -
> >  /*
> >   * the three functions below implement chip->read_byte(), chip->read_b=
uf()
> >   * and chip->write_buf() respectively. these aren't used for
> > @@ -2757,16 +2744,6 @@ static int qcom_nand_host_init(struct qcom_nand_=
controller *nandc,
> >  	chip->set_features	=3D nand_get_set_features_notsupp;
> >  	chip->get_features	=3D nand_get_set_features_notsupp;
> > =20
> > -	/*
> > -	 * the bad block marker is writable only when we write the last codew=
ord
> > -	 * of a page with ECC disabled. currently, the nand_base and nand_bbt
> > -	 * helpers don't allow us to write BB from a nand chip with ECC
> > -	 * disabled (MTD_OPS_PLACE_OOB is set by default). use the block_mark=
bad
> > -	 * helpers until we permanently switch to using
> > -	 * MTD_OPS_RAW for all drivers (with the help of badblockbits)
> > -	 */
> > -	chip->block_markbad	=3D qcom_nandc_block_markbad;
> > -
> >  	chip->controller =3D &nandc->controller;
> >  	chip->options |=3D NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER |
> >  			 NAND_SKIP_BBTSCAN; =20
>=20
>=20
>=20
