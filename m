Received: from mail-he1eur01on0076.outbound.protection.outlook.com
 ([104.47.0.76] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anNbX-0003Tc-3I
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2016 09:49:01 +0000
From: Fugang Duan <fugang.duan@nxp.com>
To: "b38611@freescale.com" <b38611@freescale.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, Han Xu
 <han.xu@nxp.com>, "richard@nod.at" <richard@nod.at>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: gpmi: remove duplicate 'nand-on-flash-bbt'
 property parse
Date: Tue, 5 Apr 2016 09:48:34 +0000
Message-ID: <VI1PR0401MB18554DD0E04B75746A9D30AAFF9E0@VI1PR0401MB1855.eurprd04.prod.outlook.com>
References: <1459831722-2623-1-git-send-email-b38611@freescale.com>
In-Reply-To: <1459831722-2623-1-git-send-email-b38611@freescale.com>
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

Pls drop review below patch, I see Boris.brezillon had sent the patch.
Thanks.

From: Fugang Duan <b38611@freescale.com> Sent: Tuesday, April 05, 2016 12:4=
9 PM
> To: computersforpeace@gmail.com; Han Xu <han.xu@nxp.com>;
> richard@nod.at
> Cc: dwmw2@infradead.org; linux-mtd@lists.infradead.org; Fugang Duan
> <fugang.duan@nxp.com>
> Subject: [PATCH] mtd: nand: gpmi: remove duplicate 'nand-on-flash-bbt'
> property parse
>=20
> Remove duplicate 'nand-on-flash-bbt' property parse in driver. In fact, n=
and
> base driver has the common dts node parse in .nand_dt_init() like
> nand_scan_ident()->nand_dt_init()->of_get_nand_on_flash_bbt().
>=20
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-
> nand/gpmi-nand.c
> index 8122c69..0486bf2 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1914,16 +1914,6 @@ static int gpmi_nand_init(struct gpmi_nand_data
> *this)
>  	/* Set up swap_block_mark, must be set before the
> gpmi_set_geometry() */
>  	this->swap_block_mark =3D !GPMI_IS_MX23(this);
>=20
> -	if (of_get_nand_on_flash_bbt(this->dev->of_node)) {
> -		chip->bbt_options |=3D NAND_BBT_USE_FLASH |
> NAND_BBT_NO_OOB;
> -
> -		if (of_property_read_bool(this->dev->of_node,
> -						"fsl,no-blockmark-swap"))
> -			this->swap_block_mark =3D false;
> -	}
> -	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
> -		this->swap_block_mark ? "en" : "dis");
> -
>  	/*
>  	 * Allocate a temporary DMA buffer for reading ID in the
>  	 * nand_scan_ident().
> @@ -1938,6 +1928,16 @@ static int gpmi_nand_init(struct gpmi_nand_data
> *this)
>  	if (ret)
>  		goto err_out;
>=20
> +	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
> +		chip->bbt_options |=3D NAND_BBT_NO_OOB;
> +
> +		if (of_property_read_bool(this->dev->of_node,
> +						"fsl,no-blockmark-swap"))
> +			this->swap_block_mark =3D false;
> +	}
> +	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
> +		this->swap_block_mark ? "en" : "dis");
> +
>  	ret =3D gpmi_init_last(this);
>  	if (ret)
>  		goto err_out;
> --
> 1.9.1
