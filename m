Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feyzz-00058M-4V
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 08:36:53 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bean Huo
 (beanhuo)" <beanhuo@micron.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: micron: Fix on-die ECC detection logic
Date: Mon, 16 Jul 2018 08:36:32 +0000
Message-ID: <382cb6c1495441e3b2d76e2928179d85@svr-chch-ex1.atlnz.lc>
References: <20180709210937.30150-1-boris.brezillon@bootlin.com>
 <20180709210937.30150-3-boris.brezillon@bootlin.com>
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

Hi Boris,=0A=
=0A=
On 10/07/18 09:09, Boris Brezillon wrote:=0A=
> Basing the "mandatory on-die" detection on ID byte 2 does not work,=0A=
> because Micron has plenty of NANDs using the same device ID code, and=0A=
> not all of them have forcibly enabled on-die ECC.=0A=
> =0A=
> Since the "Array Operation" feature does not provide the "ECC=0A=
> enabled/disabled" bit when the ECC can't be disabled, let's try to use=0A=
> the "ECC enabled/disabled" bit in the READ_ID bytes.=0A=
> =0A=
> It seems that this bit is dynamically updated on NANDs where on-die ECC=
=0A=
> can freely be enabled/disabled, so let's hope it stays at one when we=0A=
> have a NAND with on-die ECC forcibly enabled.=0A=
> =0A=
> Fixes: 51f3b3970a8c ("mtd: rawnand: micron: detect forced on-die ECC")=0A=
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>=0A=
=0A=
With d73e5d29 reverted,=0A=
=0A=
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
One compiler warning below.=0A=
=0A=
> ---=0A=
>   drivers/mtd/nand/raw/nand_micron.c | 51 +++++++++++++++++++------------=
-------=0A=
>   1 file changed, 25 insertions(+), 26 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/na=
nd_micron.c=0A=
> index 00a965ad7ab2..6ae708fbbd3a 100644=0A=
> --- a/drivers/mtd/nand/raw/nand_micron.c=0A=
> +++ b/drivers/mtd/nand/raw/nand_micron.c=0A=
> @@ -345,13 +345,8 @@ enum {=0A=
>   	MICRON_ON_DIE_MANDATORY,=0A=
>   };=0A=
>   =0A=
> -/*=0A=
> - * These parts are known to have on-die ECC forceably enabled=0A=
> - */=0A=
> -static u8 micron_on_die_ecc[] =3D {=0A=
> -	0xd1, /* MT29F1G08ABAFA */=0A=
> -	0xa1, /* MT29F1G08ABBFA */=0A=
> -};=0A=
> +#define MICRON_ID_INTERNAL_ECC_MASK	GENMASK(1, 0)=0A=
> +#define MICRON_ID_ECC_ENABLED		BIT(7)=0A=
>   =0A=
>   /*=0A=
>    * Try to detect if the NAND support on-die ECC. To do this, we enable=
=0A=
> @@ -366,12 +361,8 @@ static u8 micron_on_die_ecc[] =3D {=0A=
>   static int micron_supports_on_die_ecc(struct nand_chip *chip)=0A=
>   {=0A=
>   	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0, };=0A=
=0A=
feature is now unused so this causes a compiler warning.=0A=
=0A=
> +	u8 id[5];=0A=
>   	int ret;=0A=
> -	int i;=0A=
> -=0A=
> -	for (i =3D 0; i < ARRAY_SIZE(micron_on_die_ecc); i++)=0A=
> -		if (chip->id.data[1] =3D=3D micron_on_die_ecc[i])=0A=
> -			return MICRON_ON_DIE_MANDATORY;=0A=
>   =0A=
>   	if (!chip->parameters.onfi.version)=0A=
>   		return MICRON_ON_DIE_UNSUPPORTED;=0A=
> @@ -379,34 +370,42 @@ static int micron_supports_on_die_ecc(struct nand_c=
hip *chip)=0A=
>   	if (chip->bits_per_cell !=3D 1)=0A=
>   		return MICRON_ON_DIE_UNSUPPORTED;=0A=
>   =0A=
> +	/*=0A=
> +	 * We only support on-die ECC of 4/512 or 8/512=0A=
> +	 */=0A=
> +	if  (chip->ecc_strength_ds !=3D 4 && chip->ecc_strength_ds !=3D 8)=0A=
> +		return MICRON_ON_DIE_UNSUPPORTED;=0A=
> +=0A=
> +	/*=0A=
> +	 * We don't know what INTERNAL_ECC means, but it seems that 0x2 matches=
=0A=
> +	 * all NANDs with on-die ECC.=0A=
> +	 */=0A=
> +	if (chip->id.len !=3D 5 ||=0A=
> +	    (chip->id.data[4] & MICRON_ID_INTERNAL_ECC_MASK) !=3D 0x2)=0A=
> +		return MICRON_ON_DIE_UNSUPPORTED;=0A=
> +=0A=
>   	ret =3D micron_nand_on_die_ecc_setup(chip, true);=0A=
>   	if (ret)=0A=
>   		return MICRON_ON_DIE_UNSUPPORTED;=0A=
>   =0A=
> -	ret =3D nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);=0A=
> -	if (ret < 0)=0A=
> -		return ret;=0A=
> +	ret =3D nand_readid_op(chip, 0, id, sizeof(id));=0A=
> +	if (ret)=0A=
> +		return MICRON_ON_DIE_UNSUPPORTED;=0A=
>   =0A=
> -	if ((feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN) =3D=3D 0)=0A=
> +	if (!(id[4] & MICRON_ID_ECC_ENABLED))=0A=
>   		return MICRON_ON_DIE_UNSUPPORTED;=0A=
>   =0A=
>   	ret =3D micron_nand_on_die_ecc_setup(chip, false);=0A=
>   	if (ret)=0A=
>   		return MICRON_ON_DIE_UNSUPPORTED;=0A=
>   =0A=
> -	ret =3D nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);=0A=
> -	if (ret < 0)=0A=
> -		return ret;=0A=
> +	ret =3D nand_readid_op(chip, 0, id, sizeof(id));=0A=
> +	if (ret)=0A=
> +		return MICRON_ON_DIE_UNSUPPORTED;=0A=
>   =0A=
> -	if (feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN)=0A=
> +	if (id[4] & MICRON_ID_ECC_ENABLED)=0A=
>   		return MICRON_ON_DIE_MANDATORY;=0A=
>   =0A=
> -	/*=0A=
> -	 * We only support on-die ECC of 4/512 or 8/512=0A=
> -	 */=0A=
> -	if  (chip->ecc_strength_ds !=3D 4 && chip->ecc_strength_ds !=3D 8)=0A=
> -		return MICRON_ON_DIE_UNSUPPORTED;=0A=
> -=0A=
>   	return MICRON_ON_DIE_SUPPORTED;=0A=
>   }=0A=
>   =0A=
> =0A=
=0A=
