Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtZ4W-0007PE-LG
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2013 08:35:12 +0000
Message-ID: <52B2B0A2.1020709@freescale.com>
Date: Thu, 19 Dec 2013 16:38:58 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: parse the Hynix nand which uses <26nm
 technology
References: <1385974906-29891-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1385974906-29891-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA12=D4=C202=C8=D5 17:01, Huang Shijie =D0=B4=B5=C0:
> The Hynix uses different ID parsing rules for <26nm technology.
> We should check the id_data[5] for Hynix nand now.
>
> This patch adds the parsing code for the Hynix nand which use <26nm tec=
hnology,
> and it also parses out the datasheet's minimum required ECC.
>
> Tested with H27UBG8T2CTR(8192 + 640).
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   65 ++++++++++++++++++++++++++++++++++=
+++++++-
>  1 files changed, 64 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index bd39f7b..4dab696 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3162,7 +3162,7 @@ static void nand_decode_ext_id(struct mtd_info *m=
td, struct nand_chip *chip,
>  			(((extid >> 1) & 0x04) | (extid & 0x03));
>  		*busw =3D 0;
>  	} else if (id_len =3D=3D 6 && id_data[0] =3D=3D NAND_MFR_HYNIX &&
> -			!nand_is_slc(chip)) {
> +			!nand_is_slc(chip) && (id_data[5] & 0x7) < 3) {
>  		unsigned int tmp;
> =20
>  		/* Calc pagesize */
> @@ -3202,6 +3202,69 @@ static void nand_decode_ext_id(struct mtd_info *=
mtd, struct nand_chip *chip,
>  		else
>  			mtd->erasesize =3D (64 * 1024) << tmp;
>  		*busw =3D 0;
> +	} else if (id_len =3D=3D 6 && id_data[0] =3D=3D NAND_MFR_HYNIX &&
> +			!nand_is_slc(chip) && (id_data[5] & 0x7) > 3) {
> +		unsigned int tmp;
> +
> +		/* Calc pagesize */
> +		mtd->writesize =3D 4096 << (extid & 0x03);
> +		extid >>=3D 2;
> +		/* Calc oobsize */
> +		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
> +		case 0:
> +			mtd->oobsize =3D 640;
> +			break;
> +		case 1:
> +			mtd->oobsize =3D 448;
> +			break;
> +		case 2:
> +			mtd->oobsize =3D 224;
> +			break;
> +		case 3:
> +			mtd->oobsize =3D 128;
> +			break;
> +		case 4:
> +			mtd->oobsize =3D 64;
> +			break;
> +		case 5:
> +			mtd->oobsize =3D 32;
> +			break;
> +		case 6:
> +			mtd->oobsize =3D 16;
> +			break;
> +		default:
> +			mtd->oobsize =3D 640;
> +			break;
> +		}
> +		extid >>=3D 2;
> +		/* Calc blocksize */
> +		tmp =3D ((extid >> 1) & 0x04) | (extid & 0x03);
> +		if (tmp < 0x03)
> +			mtd->erasesize =3D (128 * 1024) << tmp;
> +		else if (tmp =3D=3D 0x03)
> +			mtd->erasesize =3D 768 * 1024;
> +		else
> +			mtd->erasesize =3D (64 * 1024) << tmp;
> +
> +		/* ecc info */
> +		tmp =3D (id_data[4] >> 4) & 0x7;
> +
> +		if (tmp < 4) {
> +			chip->ecc_strength_ds =3D 1 << tmp;
> +			chip->ecc_step_ds =3D 512;
> +		} else {
> +			chip->ecc_step_ds =3D 1024;
> +			if (tmp =3D=3D 4)
> +				chip->ecc_strength_ds =3D 24;
> +			else if (tmp =3D=3D 5)
> +				chip->ecc_strength_ds =3D 32;
> +			else if (tmp =3D=3D 6)
> +				chip->ecc_strength_ds =3D 40;
> +			else /* (tmp =3D=3D 7) */
> +				chip->ecc_strength_ds =3D 100;
> +		}
> +
> +		*busw =3D 0;
>  	} else {
>  		/* Calc pagesize */
>  		mtd->writesize =3D 1024 << (extid & 0x03);
just a ping.

any comment about these two patches?


thanks
Huang Shijie
