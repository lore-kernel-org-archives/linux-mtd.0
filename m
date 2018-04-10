Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5qGi-0006hX-Sf
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 10:12:54 +0000
Date: Tue, 10 Apr 2018 12:12:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja
 <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 7/9] mtd: nand: qcom: check for operation errors in case
 of raw read
Message-ID: <20180410121230.1ffdd473@xps13>
In-Reply-To: <1522845745-6624-8-git-send-email-absahu@codeaurora.org>
References: <1522845745-6624-1-git-send-email-absahu@codeaurora.org>
 <1522845745-6624-8-git-send-email-absahu@codeaurora.org>
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

On Wed,  4 Apr 2018 18:12:23 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Currently there is no error checking for raw read. For raw
> reads, there won=E2=80=99t be any ECC failure but the operational
> failures are possible so schedule the NAND_FLASH_STATUS read
> after each codeword.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 56 +++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 46 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index dce97e8..40c790e 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1099,7 +1099,8 @@ static void config_nand_page_read(struct qcom_nand_=
controller *nandc)
>   * Helper to prepare DMA descriptors for configuring registers
>   * before reading each codeword in NAND page.
>   */
> -static void config_nand_cw_read(struct qcom_nand_controller *nandc)
> +static void
> +config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
>  {
>  	if (nandc->props->is_bam)
>  		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
> @@ -1108,19 +1109,25 @@ static void config_nand_cw_read(struct qcom_nand_=
controller *nandc)
>  	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
> =20
> -	read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
> -	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> -		     NAND_BAM_NEXT_SGL);
> +	if (use_ecc) {
> +		read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
> +		read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> +			     NAND_BAM_NEXT_SGL);
> +	} else {
> +		read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
> +	}
>  }
> =20
>  /*
>   * Helper to prepare dma descriptors to configure registers needed for r=
eading a
>   * single codeword in page
>   */
> -static void config_nand_single_cw_page_read(struct qcom_nand_controller =
*nandc)
> +static void
> +config_nand_single_cw_page_read(struct qcom_nand_controller *nandc,
> +				bool use_ecc)
>  {
>  	config_nand_page_read(nandc);
> -	config_nand_cw_read(nandc);
> +	config_nand_cw_read(nandc, use_ecc);
>  }
> =20
>  /*
> @@ -1201,7 +1208,7 @@ static int nandc_param(struct qcom_nand_host *host)
>  	nandc->buf_count =3D 512;
>  	memset(nandc->data_buffer, 0xff, nandc->buf_count);
> =20
> -	config_nand_single_cw_page_read(nandc);
> +	config_nand_single_cw_page_read(nandc, false);
> =20
>  	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
>  		      nandc->buf_count, 0);
> @@ -1565,6 +1572,23 @@ struct read_stats {
>  	__le32 erased_cw;
>  };
> =20
> +/* reads back FLASH_STATUS register set by the controller */
> +static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
> +{
> +	struct nand_chip *chip =3D &host->chip;
> +	struct qcom_nand_controller *nandc =3D get_qcom_nand_controller(chip);
> +	int i;
> +
> +	for (i =3D 0; i < cw_cnt; i++) {
> +		u32 flash =3D le32_to_cpu(nandc->reg_read_buf[i]);
> +
> +		if (flash & (FS_OP_ERR | FS_MPU_ERR))
> +			return -EIO;

This is already checked in parse_read_error(), maybe it would be
preferable to have different path inside this function depending on the
'raw' nature of the operation?

> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * reads back status registers set by the controller to notify page read
>   * errors. this is equivalent to what 'ecc->correct()' would do.
> @@ -1707,7 +1731,7 @@ static int read_page_ecc(struct qcom_nand_host *hos=
t, u8 *data_buf,
>  			}
>  		}
> =20
> -		config_nand_cw_read(nandc);
> +		config_nand_cw_read(nandc, true);
> =20
>  		if (data_buf)
>  			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
> @@ -1771,7 +1795,7 @@ static int copy_last_cw(struct qcom_nand_host *host=
, int page)
>  	set_address(host, host->cw_size * (ecc->steps - 1), page);
>  	update_rw_regs(host, 1, true);
> =20
> -	config_nand_single_cw_page_read(nandc);
> +	config_nand_single_cw_page_read(nandc, host->use_ecc);
> =20
>  	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
> =20
> @@ -1781,6 +1805,15 @@ static int copy_last_cw(struct qcom_nand_host *hos=
t, int page)
> =20
>  	free_descs(nandc);
> =20
> +	if (!ret) {
> +		if (host->use_ecc)
> +			ret =3D parse_read_errors(host, nandc->data_buffer,
> +						nandc->data_buffer + size,
> +						true);
> +		else
> +			ret =3D check_flash_errors(host, 1);

This way you would avoid this ^

> +	}
> +

As a general way, I don't like very much this kind of error checking
structure:

if (!ret)
        ret =3D something();
...
return ret;

I would rather prefer:

if (ret)
        return ret;

return something();

>  	return ret;
>  }
> =20
> @@ -1854,7 +1887,7 @@ static int qcom_nandc_read_page_raw(struct mtd_info=
 *mtd,
>  			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
>  		}
> =20
> -		config_nand_cw_read(nandc);
> +		config_nand_cw_read(nandc, false);
> =20
>  		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>  		reg_off +=3D data_size1;
> @@ -1878,6 +1911,9 @@ static int qcom_nandc_read_page_raw(struct mtd_info=
 *mtd,
> =20
>  	free_descs(nandc);
> =20
> +	if (!ret)
> +		ret =3D check_flash_errors(host, ecc->steps);
> +

There is not point in doing ret =3D ... if you return 0 right after.
Please check what would be the most appropriate.

>  	return 0;
>  }
> =20

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
