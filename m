Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNCCL-0003Ss-C9
 for linux-mtd@lists.infradead.org; Mon, 28 May 2018 07:04:11 +0000
Date: Mon, 28 May 2018 09:03:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 13/16] mtd: rawnand: qcom: minor code reorganization
 for bad block check
Message-ID: <20180528090352.254022ed@xps13>
In-Reply-To: <90ae248edf8a06a1d35e2da458f75af5@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
 <20180526104629.74315561@xps13>
 <90ae248edf8a06a1d35e2da458f75af5@codeaurora.org>
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

Hi Abhishek,

> >>  /* implements ecc->read_page() */
> >>  static int qcom_nandc_read_page(struct mtd_info *mtd, struct >> nand_=
chip *chip,
> >>  				uint8_t *buf, int oob_required, int page)
> >> @@ -2118,6 +2083,7 @@ static int qcom_nandc_block_bad(struct mtd_info =
>> *mtd, loff_t ofs)
> >>  	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> >>  	int page, ret, bbpos, bad =3D 0;
> >>  	u32 flash_status;
> >> +	u8 *bbm_bytes_buf =3D chip->data_buf; =20
> >> >>  	page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
> >> >> @@ -2128,11 +2094,31 @@ static int qcom_nandc_block_bad(struct >> m=
td_info *mtd, loff_t ofs) =20
> >>  	 * that contains the BBM
> >>  	 */
> >>  	host->use_ecc =3D false;
> >> +	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1);
> > > Are we sure there is no layout with only 1 step? =20
>=20
>   All the layouts are such that, the BBM will come in
>   first byte of spare area.
>=20
>   For 4 bit ECC, the cw_size is 528 so for 2K page
>=20
>    2048 - 528 * 3 =3D 464

My question was more about small page NANDs. But I suppose it works
too if ecc->steps =3D=3D 1.

>=20
>   So for last CW, the 464 is BBM (i.e 2048th byte) in
>   full page.
>=20
> > >> >>  	clear_bam_transaction(nandc); =20
> >> -	ret =3D copy_last_cw(host, page);
> >> -	if (ret)
> >> +	clear_read_regs(nandc);
> >> +
> >> +	set_address(host, host->cw_size * (ecc->steps - 1), page);
> >> +	update_rw_regs(host, 1, true);
> >> +
> >> +	/*
> >> +	 * The last codeword data will be copied from NAND device to NAND
> >> +	 * controller internal HW buffer. Copy only required BBM size bytes
> >> +	 * from this HW buffer to bbm_bytes_buf which is present at
> >> +	 * bbpos offset.
> >> +	 */
> >> +	nandc_set_read_loc(nandc, 0, bbpos, host->bbm_size, 1);
> >> +	config_nand_single_cw_page_read(nandc);
> >> +	read_data_dma(nandc, FLASH_BUF_ACC + bbpos, bbm_bytes_buf,
> >> +		      host->bbm_size, 0);
> >> +
> >> +	ret =3D submit_descs(nandc);
> >> +	free_descs(nandc);
> >> +	if (ret) {
> >> +		dev_err(nandc->dev, "failed to copy bad block bytes\n");
> >>  		goto err;
> >> +	} =20
> >> >>  	flash_status =3D le32_to_cpu(nandc->reg_read_buf[0]);
> >> >> @@ -2141,12 +2127,10 @@ static int qcom_nandc_block_bad(struct >> m=
td_info *mtd, loff_t ofs) =20
> >>  		goto err;
> >>  	} =20
> >> >> -	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1); =20
> >> -
> >> -	bad =3D nandc->data_buffer[bbpos] !=3D 0xff;
> >> +	bad =3D bbm_bytes_buf[0] !=3D 0xff;
> > > This is suspect as it still points to the beginning of the data buffe=
r. =20
> > Can you please check you did not meant bbm_bytes_buf[bbpos]?
> >  =20
>   The main thing here is
>   nandc_set_read_loc(nandc, 0, bbpos, host->bbm_size, 1);
>=20
>   After reading one complete CW from NAND, the data will be still
>   in NAND HW buffer.
>=20
>   The above register tells that we need to read data from
>   bbpos of size host->bbm_size (which is 1 byte for 8 bus witdh
>   and 2 byte for 16 bus width) in bbm_bytes_buf.

I see: idx 0 in bbm_bytes_buf is the data at offset bbpos. Then
it's ok.

>=20
>   So bbm_bytes_buf[0] will contain the BBM first byte.
>   and bbm_bytes_buf[1] will contain the BBM second byte.
>=20
>   Regards,
>   Abhishek
>=20
> >> >>  	if (chip->options & NAND_BUSWIDTH_16) =20
> >> -		bad =3D bad || (nandc->data_buffer[bbpos + 1] !=3D 0xff);
> >> +		bad =3D bad || (bbm_bytes_buf[1] !=3D 0xff);

Sorry, my mistake, I did not see the above line.

However, technically, the BBM could be located in the first, second or
last page of the block. You should check the three of them are 0xFF
before declaring the block is not bad.

The more I look at the function, the more I wonder if you actually need
it. Why does the generic nand_block_bad() implementation in the core
do not fit?

> >>  err:
> >>  	return bad;
> >>  } =20
> > > > Thanks, =20
> > Miqu=C3=A8l =20
