Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQuQ6-0001s0-Ot
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 12:53:56 +0000
Date: Thu, 7 Jun 2018 14:53:26 +0200
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
Message-ID: <20180607145326.339170fd@xps13>
In-Reply-To: <53caff8799d30b6a81ac10f63a7c56c4@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
 <20180526104629.74315561@xps13>
 <90ae248edf8a06a1d35e2da458f75af5@codeaurora.org>
 <20180528090352.254022ed@xps13>
 <53caff8799d30b6a81ac10f63a7c56c4@codeaurora.org>
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

On Mon, 28 May 2018 15:40:52 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-05-28 12:33, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > >> >>  /* implements ecc->read_page() */ =20
> >> >>  static int qcom_nandc_read_page(struct mtd_info *mtd, struct >> na=
nd_chip *chip,
> >> >>  				uint8_t *buf, int oob_required, int page)
> >> >> @@ -2118,6 +2083,7 @@ static int qcom_nandc_block_bad(struct mtd_in=
fo >> *mtd, loff_t ofs)
> >> >>  	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> >> >>  	int page, ret, bbpos, bad =3D 0;
> >> >>  	u32 flash_status;
> >> >> +	u8 *bbm_bytes_buf =3D chip->data_buf; =20
> >> >> >>  	page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
> >> >> >> @@ -2128,11 +2094,31 @@ static int qcom_nandc_block_bad(struct >=
> mtd_info *mtd, loff_t ofs) =20
> >> >>  	 * that contains the BBM
> >> >>  	 */
> >> >>  	host->use_ecc =3D false;
> >> >> +	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1);
> >> > > Are we sure there is no layout with only 1 step?
> >> >>   All the layouts are such that, the BBM will come in =20
> >>   first byte of spare area. =20
> >> >>   For 4 bit ECC, the cw_size is 528 so for 2K page
> >> >>    2048 - 528 * 3 =3D 464 =20
> > > My question was more about small page NANDs. But I suppose it works =
=20
> > too if ecc->steps =3D=3D 1.
> >  =20
>   Correct Miquel.
>=20
> >> >>   So for last CW, the 464 is BBM (i.e 2048th byte) in =20
> >>   full page. =20
> >> >> > >> >>  	clear_bam_transaction(nandc); =20
> >> >> -	ret =3D copy_last_cw(host, page);
> >> >> -	if (ret)
> >> >> +	clear_read_regs(nandc);
> >> >> +
> >> >> +	set_address(host, host->cw_size * (ecc->steps - 1), page);
> >> >> +	update_rw_regs(host, 1, true);
> >> >> +
> >> >> +	/*
> >> >> +	 * The last codeword data will be copied from NAND device to NAND
> >> >> +	 * controller internal HW buffer. Copy only required BBM size byt=
es
> >> >> +	 * from this HW buffer to bbm_bytes_buf which is present at
> >> >> +	 * bbpos offset.
> >> >> +	 */
> >> >> +	nandc_set_read_loc(nandc, 0, bbpos, host->bbm_size, 1);
> >> >> +	config_nand_single_cw_page_read(nandc);
> >> >> +	read_data_dma(nandc, FLASH_BUF_ACC + bbpos, bbm_bytes_buf,
> >> >> +		      host->bbm_size, 0);
> >> >> +
> >> >> +	ret =3D submit_descs(nandc);
> >> >> +	free_descs(nandc);
> >> >> +	if (ret) {
> >> >> +		dev_err(nandc->dev, "failed to copy bad block bytes\n");
> >> >>  		goto err;
> >> >> +	} =20
> >> >> >>  	flash_status =3D le32_to_cpu(nandc->reg_read_buf[0]);
> >> >> >> @@ -2141,12 +2127,10 @@ static int qcom_nandc_block_bad(struct >=
> mtd_info *mtd, loff_t ofs) =20
> >> >>  		goto err;
> >> >>  	} =20
> >> >> >> -	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1); =
=20
> >> >> -
> >> >> -	bad =3D nandc->data_buffer[bbpos] !=3D 0xff;
> >> >> +	bad =3D bbm_bytes_buf[0] !=3D 0xff;
> >> > > This is suspect as it still points to the beginning of the data bu=
ffer. =20
> >> > Can you please check you did not meant bbm_bytes_buf[bbpos]?
> >> > =20
> >>   The main thing here is
> >>   nandc_set_read_loc(nandc, 0, bbpos, host->bbm_size, 1); =20
> >> >>   After reading one complete CW from NAND, the data will be still =
=20
> >>   in NAND HW buffer. =20
> >> >>   The above register tells that we need to read data from =20
> >>   bbpos of size host->bbm_size (which is 1 byte for 8 bus witdh
> >>   and 2 byte for 16 bus width) in bbm_bytes_buf.
> > > I see: idx 0 in bbm_bytes_buf is the data at offset bbpos. Then =20
> > it's ok. =20
> > >> >>   So bbm_bytes_buf[0] will contain the BBM first byte. =20
> >>   and bbm_bytes_buf[1] will contain the BBM second byte. =20
> >> >>   Regards, =20
> >>   Abhishek =20
> >> >> >> >>  	if (chip->options & NAND_BUSWIDTH_16) =20
> >> >> -		bad =3D bad || (nandc->data_buffer[bbpos + 1] !=3D 0xff);
> >> >> +		bad =3D bad || (bbm_bytes_buf[1] !=3D 0xff); =20
> > > Sorry, my mistake, I did not see the above line.
> > > However, technically, the BBM could be located in the first, second o=
r =20
> > last page of the block. You should check the three of them are 0xFF
> > before declaring the block is not bad. =20
> > > The more I look at the function, the more I wonder if you actually ne=
ed =20
> > it. Why does the generic nand_block_bad() implementation in the core
> > do not fit? =20
>=20
>   The BBM bytes can be accessed in raw mode only for QCOM NAND
>   Contoller. We started with following patch for initial patches
>=20
>   http://patchwork.ozlabs.org/patch/508565/
>=20
>   I am also not very much sure, how can we go ahead now.
>   Ideally we need to use generic function only which
>   requires raw_read.
>=20

I see, thanks for pointing this thread.

Well for now then let's keep our driver-specific implementation.

I will just ask you to do a consistent check as requested above (you
can copy code from the core) and add a comment above this function
explaining why it is needed (what you just told me).

Thanks,
Miqu=C3=A8l
