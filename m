Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dfjzs-0001PJ-AM
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 09:43:22 +0000
Date: Thu, 10 Aug 2017 11:42:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 robh+dt@kernel.org, mark.rutland@arm.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 01/20] mtd: nand: qcom: program NAND_DEV_CMD_VLD
 register
Message-ID: <20170810114250.6663a6b0@bbrezillon>
In-Reply-To: <1501949998-29859-2-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
 <1501949998-29859-2-git-send-email-absahu@codeaurora.org>
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

Le Sat,  5 Aug 2017 21:49:39 +0530,
Abhishek Sahu <absahu@codeaurora.org> a =C3=A9crit :

> The NAND page read fails without complete boot chain since
> NAND_DEV_CMD_VLD value is not proper. The default power on reset
> value for this register is
>=20
>     0xe - ERASE_START_VALID | WRITE_START_VALID | READ_STOP_VALID
>=20
> The READ_START_VALID should be enabled for sending PAGE_READ
> command. READ_STOP_VALID should be cleared since normal NAND
> page read does not require READ_STOP command.
>=20
> Fixes: c76b78d8ec05a ("mtd: nand: Qualcomm NAND controller driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Archit Taneja <architt@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 0289f09..7406019 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -110,6 +110,10 @@
> =20
>  /* NAND_DEV_CMD_VLD bits */
>  #define	READ_START_VLD			0
> +#define	READ_STOP_VALID			1
> +#define	WRITE_START_VALID		2
> +#define	ERASE_START_VALID		3
> +#define	SEQ_READ_START_VLD		4

Why not

#define	READ_START_VLD				BIT(0)
#define	READ_STOP_VALID				BIT(1)
#define	WRITE_START_VALID			BIT(2)
#define	ERASE_START_VALID			BIT(3)
#define	SEQ_READ_START_VLD			BIT(4)

> =20
>  /* NAND_EBI2_ECC_BUF_CFG bits */
>  #define	NUM_STEPS			0
> @@ -148,6 +152,12 @@
>  #define	FETCH_ID			0xb
>  #define	RESET_DEVICE			0xd
> =20
> +/* Default Value for NAND_DEV_CMD_VLD */
> +#define NAND_DEV_CMD_VLD_VAL		(BIT(READ_START_VLD)	| \
> +					 BIT(WRITE_START_VALID)	| \
> +					 BIT(ERASE_START_VALID)	| \
> +					 BIT(SEQ_READ_START_VLD))
> +

and then:

#define NAND_DEV_CMD_VLD_VAL	(READ_START_VLD	| \
				 WRITE_START_VALID | \
				 ERASE_START_VALID | \
				 SEQ_READ_START_VLD)

BTW, can you use consistent suffixes? Sometime definitions are suffixed
with _VLD and others are suffixed with _VALID.

>  /*
>   * the NAND controller performs reads/writes with ECC in 516 byte chunks.
>   * the driver calls the chunks 'step' or 'codeword' interchangeably
> @@ -1995,13 +2005,14 @@ static int qcom_nandc_setup(struct qcom_nand_cont=
roller *nandc)
>  {
>  	/* kill onenand */
>  	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
> +	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
> =20
>  	/* enable ADM DMA */
>  	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
> =20
>  	/* save the original values of these registers */
>  	nandc->cmd1 =3D nandc_read(nandc, NAND_DEV_CMD1);
> -	nandc->vld =3D nandc_read(nandc, NAND_DEV_CMD_VLD);
> +	nandc->vld =3D NAND_DEV_CMD_VLD_VAL;
> =20
>  	return 0;
>  }
