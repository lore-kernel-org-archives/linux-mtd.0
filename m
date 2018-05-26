Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMUqt-0001l9-Rd
 for linux-mtd@lists.infradead.org; Sat, 26 May 2018 08:47:05 +0000
Date: Sat, 26 May 2018 10:46:29 +0200
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
Message-ID: <20180526104629.74315561@xps13>
In-Reply-To: <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
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

On Fri, 25 May 2018 17:51:41 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> The QCOM NAND controller layout is such that, the bad block byte
> offset for last codeword will come to first byte in spare area.

"is the first spare byte"?


> Currently, the raw read for last codeword is being done with
> copy_last_cw function. It does following 2 things:

"It does the following:"

>=20
> 1. Read the last codeword bytes from NAND chip to NAND
>    controller internal HW buffer.
> 2. Copy all these bytes from HW buffer to actual buffer.
>=20
> For bad block check, maximum two bytes are required so instead of
> copying the complete bytes in step 2, only those bbm_size bytes
> can be copied.
>=20
> This patch does minor code reorganization for the same. After
> this, copy_last_cw function won=E2=80=99t be required.

"This patch does minor code reorganization to just retrieve these two
bytes when checking for bad blocks, allowing to remove
copy_last_cw() now useless."

>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v2:
>   1. Changed commit message and comments slightly
>=20
> * Changes from v1:
>   NEW CHANGE
>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 66 +++++++++++++++------------------=
------
>  1 file changed, 25 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index d693b5f..f72bc8a 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1769,41 +1769,6 @@ static int read_page_ecc(struct qcom_nand_host *ho=
st, u8 *data_buf,
>  	return parse_read_errors(host, data_buf_start, oob_buf_start);
>  }
> =20
> -/*
> - * a helper that copies the last step/codeword of a page (containing fre=
e oob)
> - * into our local buffer
> - */
> -static int copy_last_cw(struct qcom_nand_host *host, int page)
> -{
> -	struct nand_chip *chip =3D &host->chip;
> -	struct qcom_nand_controller *nandc =3D get_qcom_nand_controller(chip);
> -	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> -	int size;
> -	int ret;
> -
> -	clear_read_regs(nandc);
> -
> -	size =3D host->use_ecc ? host->cw_data : host->cw_size;
> -
> -	/* prepare a clean read buffer */
> -	memset(nandc->data_buffer, 0xff, size);
> -
> -	set_address(host, host->cw_size * (ecc->steps - 1), page);
> -	update_rw_regs(host, 1, true);
> -
> -	config_nand_single_cw_page_read(nandc);
> -
> -	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
> -
> -	ret =3D submit_descs(nandc);
> -	if (ret)
> -		dev_err(nandc->dev, "failed to copy last codeword\n");
> -
> -	free_descs(nandc);
> -
> -	return ret;
> -}
> -
>  /* implements ecc->read_page() */
>  static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *=
chip,
>  				uint8_t *buf, int oob_required, int page)
> @@ -2118,6 +2083,7 @@ static int qcom_nandc_block_bad(struct mtd_info *mt=
d, loff_t ofs)
>  	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
>  	int page, ret, bbpos, bad =3D 0;
>  	u32 flash_status;
> +	u8 *bbm_bytes_buf =3D chip->data_buf;
> =20
>  	page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
> =20
> @@ -2128,11 +2094,31 @@ static int qcom_nandc_block_bad(struct mtd_info *=
mtd, loff_t ofs)
>  	 * that contains the BBM
>  	 */
>  	host->use_ecc =3D false;
> +	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1);

Are we sure there is no layout with only 1 step?

> =20
>  	clear_bam_transaction(nandc);
> -	ret =3D copy_last_cw(host, page);
> -	if (ret)
> +	clear_read_regs(nandc);
> +
> +	set_address(host, host->cw_size * (ecc->steps - 1), page);
> +	update_rw_regs(host, 1, true);
> +
> +	/*
> +	 * The last codeword data will be copied from NAND device to NAND
> +	 * controller internal HW buffer. Copy only required BBM size bytes
> +	 * from this HW buffer to bbm_bytes_buf which is present at
> +	 * bbpos offset.
> +	 */
> +	nandc_set_read_loc(nandc, 0, bbpos, host->bbm_size, 1);
> +	config_nand_single_cw_page_read(nandc);
> +	read_data_dma(nandc, FLASH_BUF_ACC + bbpos, bbm_bytes_buf,
> +		      host->bbm_size, 0);
> +
> +	ret =3D submit_descs(nandc);
> +	free_descs(nandc);
> +	if (ret) {
> +		dev_err(nandc->dev, "failed to copy bad block bytes\n");
>  		goto err;
> +	}
> =20
>  	flash_status =3D le32_to_cpu(nandc->reg_read_buf[0]);
> =20
> @@ -2141,12 +2127,10 @@ static int qcom_nandc_block_bad(struct mtd_info *=
mtd, loff_t ofs)
>  		goto err;
>  	}
> =20
> -	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1);
> -
> -	bad =3D nandc->data_buffer[bbpos] !=3D 0xff;
> +	bad =3D bbm_bytes_buf[0] !=3D 0xff;

This is suspect as it still points to the beginning of the data buffer.
Can you please check you did not meant bbm_bytes_buf[bbpos]?

> =20
>  	if (chip->options & NAND_BUSWIDTH_16)
> -		bad =3D bad || (nandc->data_buffer[bbpos + 1] !=3D 0xff);
> +		bad =3D bad || (bbm_bytes_buf[1] !=3D 0xff);
>  err:
>  	return bad;
>  }


Thanks,
Miqu=C3=A8l
