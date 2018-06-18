Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUsSB-0005al-Ev
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 11:36:13 +0000
Date: Mon, 18 Jun 2018 13:35:56 +0200
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
Message-ID: <20180618133556.06e9a16a@xps13>
In-Reply-To: <7179eb382dbd3d49e2066178914636fd@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
 <20180526104629.74315561@xps13>
 <90ae248edf8a06a1d35e2da458f75af5@codeaurora.org>
 <20180528090352.254022ed@xps13>
 <53caff8799d30b6a81ac10f63a7c56c4@codeaurora.org>
 <20180607145326.339170fd@xps13>
 <7179eb382dbd3d49e2066178914636fd@codeaurora.org>
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

Boris, one question for you below :)

> >> >> >>   So for last CW, the 464 is BBM (i.e 2048th byte) in =20
> >> >>   full page. =20
> >> >> >> > >> >>  	clear_bam_transaction(nandc); =20
> >> >> >> -	ret =3D copy_last_cw(host, page);
> >> >> >> -	if (ret)
> >> >> >> +	clear_read_regs(nandc);
> >> >> >> +
> >> >> >> +	set_address(host, host->cw_size * (ecc->steps - 1), page);
> >> >> >> +	update_rw_regs(host, 1, true);
> >> >> >> +
> >> >> >> +	/*
> >> >> >> +	 * The last codeword data will be copied from NAND device to N=
AND
> >> >> >> +	 * controller internal HW buffer. Copy only required BBM size =
bytes
> >> >> >> +	 * from this HW buffer to bbm_bytes_buf which is present at
> >> >> >> +	 * bbpos offset.
> >> >> >> +	 */
> >> >> >> +	nandc_set_read_loc(nandc, 0, bbpos, host->bbm_size, 1);
> >> >> >> +	config_nand_single_cw_page_read(nandc);
> >> >> >> +	read_data_dma(nandc, FLASH_BUF_ACC + bbpos, bbm_bytes_buf,
> >> >> >> +		      host->bbm_size, 0);
> >> >> >> +
> >> >> >> +	ret =3D submit_descs(nandc);
> >> >> >> +	free_descs(nandc);
> >> >> >> +	if (ret) {
> >> >> >> +		dev_err(nandc->dev, "failed to copy bad block bytes\n");
> >> >> >>  		goto err;
> >> >> >> +	} =20
> >> >> >> >>  	flash_status =3D le32_to_cpu(nandc->reg_read_buf[0]);
> >> >> >> >> @@ -2141,12 +2127,10 @@ static int qcom_nandc_block_bad(struc=
t >> mtd_info *mtd, loff_t ofs) =20
> >> >> >>  		goto err;
> >> >> >>  	} =20
> >> >> >> >> -	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1)=
; =20
> >> >> >> -
> >> >> >> -	bad =3D nandc->data_buffer[bbpos] !=3D 0xff;
> >> >> >> +	bad =3D bbm_bytes_buf[0] !=3D 0xff;
> >> >> > > This is suspect as it still points to the beginning of the data=
 buffer. =20
> >> >> > Can you please check you did not meant bbm_bytes_buf[bbpos]?
> >> >> > =20
> >> >>   The main thing here is
> >> >>   nandc_set_read_loc(nandc, 0, bbpos, host->bbm_size, 1); =20
> >> >> >>   After reading one complete CW from NAND, the data will be stil=
l =20
> >> >>   in NAND HW buffer. =20
> >> >> >>   The above register tells that we need to read data from =20
> >> >>   bbpos of size host->bbm_size (which is 1 byte for 8 bus witdh
> >> >>   and 2 byte for 16 bus width) in bbm_bytes_buf.
> >> > > I see: idx 0 in bbm_bytes_buf is the data at offset bbpos. Then =20
> >> > it's ok. =20
> >> > >> >>   So bbm_bytes_buf[0] will contain the BBM first byte. =20
> >> >>   and bbm_bytes_buf[1] will contain the BBM second byte. =20
> >> >> >>   Regards, =20
> >> >>   Abhishek =20
> >> >> >> >> >>  	if (chip->options & NAND_BUSWIDTH_16) =20
> >> >> >> -		bad =3D bad || (nandc->data_buffer[bbpos + 1] !=3D 0xff);
> >> >> >> +		bad =3D bad || (bbm_bytes_buf[1] !=3D 0xff); =20
> >> > > Sorry, my mistake, I did not see the above line.
> >> > > However, technically, the BBM could be located in the first, secon=
d or =20
> >> > last page of the block. You should check the three of them are 0xFF
> >> > before declaring the block is not bad. =20
> >> > > The more I look at the function, the more I wonder if you actually=
 need =20
> >> > it. Why does the generic nand_block_bad() implementation in the core
> >> > do not fit? =20
> >> >>   The BBM bytes can be accessed in raw mode only for QCOM NAND =20
> >>   Contoller. We started with following patch for initial patches =20
> >> >>   http://patchwork.ozlabs.org/patch/508565/
> >> >>   I am also not very much sure, how can we go ahead now. =20
> >>   Ideally we need to use generic function only which
> >>   requires raw_read. =20
> >> > > I see, thanks for pointing this thread. =20
> > > Well for now then let's keep our driver-specific implementation.
> > > I will just ask you to do a consistent check as requested above (you =
=20
> > can copy code from the core) and add a comment above this function
> > explaining why it is needed (what you just told me).
> >  =20
>   Hi Miquel,
>=20
>   I explored more regarding making custom bad block functions in this
>   thread and it looks like, we can move to generic block_bad function
>   by small changes in QCOM NAND driver
>   only. The main problem was, in read page with ECC, the bad block
>   byte was skipped.
>=20
>   But controller is copying the bad block bytes in another register
>   with following status bytes.
>=20
>   BAD_BLOCK_STATUS : With every page read operation, when the controller
>   reads a page with a bad block, it writes the bad block status data into
>   this register.
>=20
>   We can update the BBM bytes at start of OOB data in read_oob function
>   with these status bytes. It will help in getting rid of driver-specific
>   implementation for chip->block_bad.

If think this is acceptable.

>=20
>   For chip->block_markbad, if we want to get rid of
>   driver-specific implementation then we can have
>   following logic
>=20
>   in write_oob function check for bad block bytes in oob
>   and do the raw write for updating BBM bytes alone in
>   flash if BBM bytes are non 0xff.

Ok but this will have to be properly explained in a descriptive comment!

Maybe Boris can give its point of view on the subject. Is it worth
adding the above 'hacks' in the qcom driver and get rid of the
driver-specific ->is_bad()/->mark_bad() impementations?

Thanks,
Miqu=C3=A8l
