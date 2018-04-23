Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAVQt-0003l1-Fp
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 06:58:41 +0000
Date: Mon, 23 Apr 2018 08:58:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 8/9] mtd: nand: qcom: helper function for raw read
Message-ID: <20180423085817.74e56091@xps13>
In-Reply-To: <484485e160af41cf062549938c53d078@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-9-git-send-email-absahu@codeaurora.org>
 <20180410114428.68d59c8d@xps13>
 <c3e32eb24408a973d0c89984a466d9da@codeaurora.org>
 <20180422181929.65d42ca8@xps13>
 <484485e160af41cf062549938c53d078@codeaurora.org>
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

On Mon, 23 Apr 2018 11:58:42 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> On 2018-04-22 21:49, Miquel Raynal wrote:
> > Hi Abhishek, =20
> > > On Thu, 12 Apr 2018 12:36:42 +0530, Abhishek Sahu =20
> > <absahu@codeaurora.org> wrote: =20
> > >> On 2018-04-10 15:14, Miquel Raynal wrote:
> >> > Hi Abhishek, =20
> >> > > On Wed,  4 Apr 2018 18:12:24 +0530, Abhishek Sahu =20
> >> > <absahu@codeaurora.org> wrote: =20
> >> > >> This patch does minor code reorganization for raw reads. =20
> >> >> Currently the raw read is required for complete page but for
> >> >> subsequent patches related with erased codeword bit flips
> >> >> detection, only few CW should be read. So, this patch adds
> >> >> helper function and introduces the read CW bitmask which
> >> >> specifies which CW reads are required in complete page.
> >> > > I am not sure this is the right approach for subpage reads. If the=
 =20
> >> > controller supports it, you should just enable it in chip->options.
> >> > =20
> >>   Thanks Miquel. =20
> >> >>   It is internal to this file only. This patch makes one static hel=
per =20
> >>   function which provides the support to read subpages.
> > > Drivers should expose raw helpers, why keeping this helper static the=
n? =20
> > >> >> >> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org> =20
> >> >> ---
> >> >>  drivers/mtd/nand/qcom_nandc.c | 186 >> +++++++++++++++++++++++++--=
---------------
> >> >>  1 file changed, 110 insertions(+), 76 deletions(-) =20
> >> >> >> diff --git a/drivers/mtd/nand/qcom_nandc.c >> b/drivers/mtd/nand=
/qcom_nandc.c =20
> >> >> index 40c790e..f5d1fa4 100644
> >> >> --- a/drivers/mtd/nand/qcom_nandc.c
> >> >> +++ b/drivers/mtd/nand/qcom_nandc.c
> >> >> @@ -1590,6 +1590,114 @@ static int check_flash_errors(struct >> qco=
m_nand_host *host, int cw_cnt)
> >> >>  } =20
> >> >> >>  /* =20
> >> >> + * Helper to perform the page raw read operation. The read_cw_mask=
 >> will be
> >> >> + * used to specify the codewords for which the data should be read=
. >> The
> >> >> + * single page contains multiple CW. Sometime, only few CW data is=
 >> required
> >> >> + * in complete page. Also, start address will be determined with
> >> >> + * this CW mask to skip unnecessary data copy from NAND flash devi=
ce. >> Then,
> >> >> + * actual data copy from NAND controller to data buffer will be do=
ne >> only
> >> >> + * for the CWs which have the mask set.
> >> >> + */
> >> >> +static int
> >> >> +nandc_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> >> >> +		    u8 *data_buf, u8 *oob_buf,
> >> >> +		    int page, unsigned long read_cw_mask)
> >> >> +{
> >> >> +	struct qcom_nand_host *host =3D to_qcom_nand_host(chip);
> >> >> +	struct qcom_nand_controller *nandc =3D get_qcom_nand_controller(c=
hip);
> >> >> +	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> >> >> +	int i, ret;
> >> >> +	int read_loc, start_step, last_step;
> >> >> +
> >> >> +	nand_read_page_op(chip, page, 0, NULL, 0);
> >> >> +
> >> >> +	host->use_ecc =3D false;
> >> >> +	start_step =3D ffs(read_cw_mask) - 1;
> >> >> +	last_step =3D fls(read_cw_mask);
> >> >> +
> >> >> +	clear_bam_transaction(nandc);
> >> >> +	set_address(host, host->cw_size * start_step, page);
> >> >> +	update_rw_regs(host, last_step - start_step, true);
> >> >> +	config_nand_page_read(nandc);
> >> >> +
> >> >> +	for (i =3D start_step; i < last_step; i++) {
> >> >> +		int data_size1, data_size2, oob_size1, oob_size2;
> >> >> +		int reg_off =3D FLASH_BUF_ACC;
> >> >> +
> >> >> +		data_size1 =3D mtd->writesize - host->cw_size * (ecc->steps - 1);
> >> >> +		oob_size1 =3D host->bbm_size;
> >> >> +
> >> >> +		if (i =3D=3D (ecc->steps - 1)) {
> >> >> +			data_size2 =3D ecc->size - data_size1 -
> >> >> +				     ((ecc->steps - 1) << 2);
> >> >> +			oob_size2 =3D (ecc->steps << 2) + host->ecc_bytes_hw +
> >> >> +				    host->spare_bytes;
> >> >> +		} else {
> >> >> +			data_size2 =3D host->cw_data - data_size1;
> >> >> +			oob_size2 =3D host->ecc_bytes_hw + host->spare_bytes;
> >> >> +		}
> >> >> +
> >> >> +		/*
> >> >> +		 * Don't perform actual data copy from NAND controller to data
> >> >> +		 * buffer through DMA for this codeword
> >> >> +		 */
> >> >> +		if (!(read_cw_mask & BIT(i))) {
> >> >> +			if (nandc->props->is_bam)
> >> >> +				nandc_set_read_loc(nandc, 0, 0, 0, 1);
> >> >> +
> >> >> +			config_nand_cw_read(nandc, false);
> >> >> +
> >> >> +			data_buf +=3D data_size1 + data_size2;
> >> >> +			oob_buf +=3D oob_size1 + oob_size2;
> >> >> +
> >> >> +			continue;
> >> >> +		}
> >> >> +
> >> >> +		if (nandc->props->is_bam) {
> >> >> +			read_loc =3D 0;
> >> >> +			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> >> >> +			read_loc +=3D data_size1;
> >> >> +
> >> >> +			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
> >> >> +			read_loc +=3D oob_size1;
> >> >> +
> >> >> +			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
> >> >> +			read_loc +=3D data_size2;
> >> >> +
> >> >> +			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
> >> >> +		}
> >> >> +
> >> >> +		config_nand_cw_read(nandc, false);
> >> >> +
> >> >> +		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
> >> >> +		reg_off +=3D data_size1;
> >> >> +		data_buf +=3D data_size1;
> >> >> +
> >> >> +		read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
> >> >> +		reg_off +=3D oob_size1;
> >> >> +		oob_buf +=3D oob_size1;
> >> >> +
> >> >> +		read_data_dma(nandc, reg_off, data_buf, data_size2, 0);
> >> >> +		reg_off +=3D data_size2;
> >> >> +		data_buf +=3D data_size2;
> >> >> +
> >> >> +		read_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
> >> >> +		oob_buf +=3D oob_size2;
> >> >> +	}
> >> >> +
> >> >> +	ret =3D submit_descs(nandc);
> >> >> +	if (ret)
> >> >> +		dev_err(nandc->dev, "failure to read raw page\n");
> >> >> +
> >> >> +	free_descs(nandc);
> >> >> +
> >> >> +	if (!ret)
> >> >> +		ret =3D check_flash_errors(host, last_step - start_step);
> >> >> +
> >> >> +	return 0;
> >> >> +}
> >> >> +
> >> >> +/*
> >> >>   * reads back status registers set by the controller to notify pag=
e >> read
> >> >>   * errors. this is equivalent to what 'ecc->correct()' would do.
> >> >>   */
> >> >> @@ -1839,82 +1947,8 @@ static int qcom_nandc_read_page_raw(struct >=
> mtd_info *mtd,
> >> >>  				    struct nand_chip *chip, uint8_t *buf,
> >> >>  				    int oob_required, int page)
> >> >>  {
> >> >> -	struct qcom_nand_host *host =3D to_qcom_nand_host(chip);
> >> >> -	struct qcom_nand_controller *nandc =3D get_qcom_nand_controller(c=
hip);
> >> >> -	u8 *data_buf, *oob_buf;
> >> >> -	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> >> >> -	int i, ret;
> >> >> -	int read_loc;
> >> >> -
> >> >> -	nand_read_page_op(chip, page, 0, NULL, 0);
> >> >> -	data_buf =3D buf;
> >> >> -	oob_buf =3D chip->oob_poi;
> >> >> -
> >> >> -	host->use_ecc =3D false;
> >> >> -
> >> >> -	clear_bam_transaction(nandc);
> >> >> -	update_rw_regs(host, ecc->steps, true);
> >> >> -	config_nand_page_read(nandc);
> >> >> -
> >> >> -	for (i =3D 0; i < ecc->steps; i++) {
> >> >> -		int data_size1, data_size2, oob_size1, oob_size2;
> >> >> -		int reg_off =3D FLASH_BUF_ACC;
> >> >> -
> >> >> -		data_size1 =3D mtd->writesize - host->cw_size * (ecc->steps - 1);
> >> >> -		oob_size1 =3D host->bbm_size;
> >> >> -
> >> >> -		if (i =3D=3D (ecc->steps - 1)) {
> >> >> -			data_size2 =3D ecc->size - data_size1 -
> >> >> -				     ((ecc->steps - 1) << 2);
> >> >> -			oob_size2 =3D (ecc->steps << 2) + host->ecc_bytes_hw +
> >> >> -				    host->spare_bytes;
> >> >> -		} else {
> >> >> -			data_size2 =3D host->cw_data - data_size1;
> >> >> -			oob_size2 =3D host->ecc_bytes_hw + host->spare_bytes;
> >> >> -		}
> >> >> -
> >> >> -		if (nandc->props->is_bam) {
> >> >> -			read_loc =3D 0;
> >> >> -			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
> >> >> -			read_loc +=3D data_size1;
> >> >> -
> >> >> -			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
> >> >> -			read_loc +=3D oob_size1;
> >> >> -
> >> >> -			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
> >> >> -			read_loc +=3D data_size2;
> >> >> -
> >> >> -			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
> >> >> -		}
> >> >> -
> >> >> -		config_nand_cw_read(nandc, false);
> >> >> -
> >> >> -		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
> >> >> -		reg_off +=3D data_size1;
> >> >> -		data_buf +=3D data_size1;
> >> >> -
> >> >> -		read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
> >> >> -		reg_off +=3D oob_size1;
> >> >> -		oob_buf +=3D oob_size1;
> >> >> -
> >> >> -		read_data_dma(nandc, reg_off, data_buf, data_size2, 0);
> >> >> -		reg_off +=3D data_size2;
> >> >> -		data_buf +=3D data_size2;
> >> >> -
> >> >> -		read_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
> >> >> -		oob_buf +=3D oob_size2;
> >> >> -	}
> >> >> -
> >> >> -	ret =3D submit_descs(nandc);
> >> >> -	if (ret)
> >> >> -		dev_err(nandc->dev, "failure to read raw page\n");
> >> >> -
> >> >> -	free_descs(nandc);
> >> >> -
> >> >> -	if (!ret)
> >> >> -		ret =3D check_flash_errors(host, ecc->steps);
> >> >> -
> >> >> -	return 0;
> >> >> +	return nandc_read_page_raw(mtd, chip, buf, chip->oob_poi, page,
> >> >> +				   BIT(chip->ecc.steps) - 1);
> >> > > I don't understand this. chip->ecc.steps is constant, right? So yo=
u =20
> >> > always ask for the same subpage? =20
> >> >>   We need to do raw read for subpages in which we got uncorrectable=
 =20
> >>   error in next patch for erased page bitflip detection. This patch >>=
 does
> >>   reorganization of raw read and moves common code in helper function
> >>   nandc_read_page_raw. =20
> >> >>   For nomral raw read, all the subpages will be read so =20
> >>   BIT(chip->ecc.steps) - 1 is used for qcom_nandc_read_page_raw. =20
> >> >>   While for erased page raw read, only those sub pages will be =20
> >>   read for which the controller gives the uncorrectable error.
> > > Still not okay: the driver should expose a way to do raw reads no =20
> > matter the length and the start and you should use that in a generic
> > way.
> >  =20
>   Thanks Miquel.
>   I will explore regarding that.
>   Looks like, we can some helper like read_subpage.

Of course, when you implement raw accessors you can have static helpers
to clarify the code.

Regards,
Miqu=C3=A8l
