Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dXCd2-0004Qt-DY
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 20:28:29 +0000
Date: Mon, 17 Jul 2017 22:27:32 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc: linux-mtd@lists.infradead.org, Tomas Hlavacek <tomas.hlavacek@nic.cz>
Subject: Re: [PATCH] mtd: fsl_elbc_nand: Add SOFT_BCH ECC mode selection via DT
Message-ID: <20170717222732.41fe795d@bbrezillon>
In-Reply-To: <20170714162812.2348-1-marek.behun@nic.cz>
References: <20170714162812.2348-1-marek.behun@nic.cz>
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

Hi Marek,

Subject prefix should be "mtd: nand: fsl_elbc: "

Le Fri, 14 Jul 2017 18:28:12 +0200,
Marek Beh=C3=BAn <marek.behun@nic.cz> a =C3=A9crit :

> Add RNDOUT operation which is required for SOFT and SOFT_BCH modes.
>=20
> Restructure the code so that nand_scan_tail can correctly set
> parameters for SOFT_BCH ECC mode.
>=20
> Do not set read/write page operations from the driver when in SOFT
> or SOFT_BCH modes.
>=20
> This code is based on the patch by Tomas Hlavacek, which can be
> found at
> http://lists.infradead.org/pipermail/linux-mtd/2015-May/059365.html
>=20
> Signed-off-by: Marek Behun <marek.behun@nic.cz>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c | 132 ++++++++++++++++++++++++---------=
------
>  1 file changed, 82 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc=
_nand.c
> index b9ac16f05057..1df4a3b45642 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -355,6 +355,14 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, u=
nsigned int command,
>  		fsl_elbc_run_command(mtd);
>  		return;
> =20
> +	case NAND_CMD_RNDOUT:
> +		dev_vdbg(priv->dev,
> +			  "fsl_elbc_cmdfunc: NAND_CMD_RNDOUT, column: 0x%x.\n",
> +			  column);
> +
> +		elbc_fcm_ctrl->index =3D column;
> +		return;

I'd prefer to have it split in 2 patches: one adding support for RNDOUT
and the other one adding support for soft ECC.

> +
>  	/* READOOB reads only the OOB because no ECC is performed. */
>  	case NAND_CMD_READOOB:
>  		dev_vdbg(priv->dev,
> @@ -637,22 +645,10 @@ static int fsl_elbc_wait(struct mtd_info *mtd, stru=
ct nand_chip *chip)
>  	return (elbc_fcm_ctrl->mdr & 0xff) | NAND_STATUS_WP;
>  }
> =20
> -static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
> +static inline void fsl_elbc_chip_init_dbg(struct mtd_info *mtd)

Drop the inline specifier here, the compiler should be smart enough to
know when to inline things.

>  {
>  	struct nand_chip *chip =3D mtd_to_nand(mtd);
>  	struct fsl_elbc_mtd *priv =3D nand_get_controller_data(chip);
> -	struct fsl_lbc_ctrl *ctrl =3D priv->ctrl;
> -	struct fsl_lbc_regs __iomem *lbc =3D ctrl->regs;
> -	unsigned int al;
> -
> -	/* calculate FMR Address Length field */
> -	al =3D 0;
> -	if (chip->pagemask & 0xffff0000)
> -		al++;
> -	if (chip->pagemask & 0xff000000)
> -		al++;
> -
> -	priv->fmr |=3D al << FMR_AL_SHIFT;
> =20
>  	dev_dbg(priv->dev, "fsl_elbc_init: nand->numchips =3D %d\n",
>  	        chip->numchips);
> @@ -688,22 +684,6 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *=
mtd)
>  	        mtd->writesize);
>  	dev_dbg(priv->dev, "fsl_elbc_init: mtd->oobsize =3D %d\n",
>  	        mtd->oobsize);
> -
> -	/* adjust Option Register and ECC to match Flash page size */
> -	if (mtd->writesize =3D=3D 512) {
> -		priv->page_size =3D 0;
> -		clrbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
> -	} else if (mtd->writesize =3D=3D 2048) {
> -		priv->page_size =3D 1;
> -		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
> -	} else {
> -		dev_err(priv->dev,
> -		        "fsl_elbc_init: page size %d is not supported\n",
> -		        mtd->writesize);
> -		return -1;
> -	}
> -
> -	return 0;
>  }
> =20
>  static int fsl_elbc_read_page(struct mtd_info *mtd, struct nand_chip *ch=
ip,
> @@ -748,6 +728,34 @@ static int fsl_elbc_write_subpage(struct mtd_info *m=
td, struct nand_chip *chip,
>  	return 0;
>  }
> =20
> +static int fsl_elbc_ecc_init(struct fsl_elbc_mtd *priv)
> +{
> +	struct nand_chip *chip =3D &priv->chip;
> +
> +	switch (chip->ecc.mode) {
> +	case NAND_ECC_SOFT_BCH:

I don't know which branch you're basing your work on but
NAND_ECC_SOFT_BCH has been dropped in 4.7. Please rebase your work on
top of nand/next [1].

> +		break;
> +	case NAND_ECC_SOFT:
> +		chip->ecc.algo =3D NAND_ECC_HAMMING;

Why not let the user decides which algorithm to use, and fall back to
hamming if nothing is specified (algo =3D=3D UNKNOWN)?

> +		break;
> +	case NAND_ECC_HW:
> +		chip->ecc.read_page =3D fsl_elbc_read_page;
> +		chip->ecc.write_page =3D fsl_elbc_write_page;
> +		chip->ecc.write_subpage =3D fsl_elbc_write_subpage;
> +
> +		/* put in small page settings and adjust later if needed */
> +		mtd_set_ooblayout(mtd, &fsl_elbc_ooblayout_ops);
> +		chip->ecc.size =3D 512;
> +		chip->ecc.bytes =3D 3;
> +		chip->ecc.strength =3D 1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  {
>  	struct fsl_lbc_ctrl *ctrl =3D priv->ctrl;
> @@ -755,6 +763,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *pr=
iv)
>  	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl =3D ctrl->nand;
>  	struct nand_chip *chip =3D &priv->chip;
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int ret;
> +	unsigned int al;
> =20
>  	dev_dbg(priv->dev, "eLBC Set Information for bank %d\n", priv->bank);
> =20
> @@ -787,24 +797,58 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *=
priv)
>  	chip->controller =3D &elbc_fcm_ctrl->controller;
>  	nand_set_controller_data(chip, priv);
> =20
> -	chip->ecc.read_page =3D fsl_elbc_read_page;
> -	chip->ecc.write_page =3D fsl_elbc_write_page;
> -	chip->ecc.write_subpage =3D fsl_elbc_write_subpage;
> -
>  	/* If CS Base Register selects full hardware ECC then use it */
>  	if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) =3D=3D
>  	    BR_DECC_CHK_GEN) {
>  		chip->ecc.mode =3D NAND_ECC_HW;
> -		mtd_set_ooblayout(mtd, &fsl_elbc_ooblayout_ops);
> -		chip->ecc.size =3D 512;
> -		chip->ecc.bytes =3D 3;
> -		chip->ecc.strength =3D 1;
>  	} else {
>  		/* otherwise fall back to default software ECC */
>  		chip->ecc.mode =3D NAND_ECC_SOFT;
> -		chip->ecc.algo =3D NAND_ECC_HAMMING;

Probably more explicit to set algo to NAND_ECC_UNNKOWN.

>  	}
> =20
> +	ret =3D nand_scan_ident(mtd, 1, NULL);
> +	if (ret) {
> +		dev_err(priv->dev, "nand_scan_ident failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D fsl_elbc_ecc_init(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "ECC init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* calculate FMR Address Length field */
> +	al =3D 0;
> +	if (chip->pagemask & 0xffff0000)
> +		al++;
> +	if (chip->pagemask & 0xff000000)
> +		al++;
> +
> +	priv->fmr |=3D al << FMR_AL_SHIFT;
> +
> +	/* adjust Option Register and ECC to match Flash page size */
> +	if (mtd->writesize =3D=3D 512) {
> +		priv->page_size =3D 0;
> +		clrbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
> +	} else if (mtd->writesize =3D=3D 2048) {
> +		priv->page_size =3D 1;
> +		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
> +	} else {
> +		dev_err(priv->dev,
> +		        "fsl_elbc_init: page size %d is not supported\n",
> +		        mtd->writesize);
> +		return -1;
> +	}
> +
> +	ret =3D nand_scan_tail(mtd);
> +	if (ret) {
> +		dev_err(priv->dev, "nand_scan_tail failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	fsl_elbc_chip_init_dbg(mtd);
> +
>  	return 0;
>  }
> =20
> @@ -912,18 +956,6 @@ static int fsl_elbc_nand_probe(struct platform_devic=
e *pdev)
>  	if (ret)
>  		goto err;
> =20
> -	ret =3D nand_scan_ident(mtd, 1, NULL);
> -	if (ret)
> -		goto err;
> -
> -	ret =3D fsl_elbc_chip_init_tail(mtd);
> -	if (ret)
> -		goto err;
> -
> -	ret =3D nand_scan_tail(mtd);
> -	if (ret)
> -		goto err;
> -
>  	/* First look for RedBoot table or partitions on the command
>  	 * line, these take precedence over device tree information */
>  	mtd_device_parse_register(mtd, part_probe_types, NULL,

I suggested to split the patch in 2, but it could be even clearer if
you split it in 3:
- RNDOUT support
- init code re-organization
- soft BCH support

Regards,

Boris

[1]http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next
