Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fez0U-0005PA-DY
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 08:37:26 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bean Huo
 (beanhuo)" <beanhuo@micron.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: micron: Define the proper layout for
 8bit/512bytes on-die ECC
Date: Mon, 16 Jul 2018 08:37:10 +0000
Message-ID: <1ca0af3f31814a7fabb3007c95f50f37@svr-chch-ex1.atlnz.lc>
References: <20180709210937.30150-1-boris.brezillon@bootlin.com>
 <20180709210937.30150-2-boris.brezillon@bootlin.com>
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

On 10/07/18 09:09, Boris Brezillon wrote:=0A=
> The MT29F1G08ABAFAWP datasheet says that all ECC bytes are placed at the=
=0A=
> end of the OOB area.=0A=
> =0A=
> Fixes: 386fc2609d15 ("mtd: rawnand: micron: support 8/512 on-die ECC")=0A=
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>=0A=
=0A=
With d73e5d29 reverted,=0A=
=0A=
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
> ---=0A=
>   drivers/mtd/nand/raw/nand_micron.c | 59 +++++++++++++++++++++++++++++++=
+------=0A=
>   1 file changed, 50 insertions(+), 9 deletions(-)=0A=
> =0A=
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/na=
nd_micron.c=0A=
> index 754e9cdd44ac..00a965ad7ab2 100644=0A=
> --- a/drivers/mtd/nand/raw/nand_micron.c=0A=
> +++ b/drivers/mtd/nand/raw/nand_micron.c=0A=
> @@ -103,8 +103,9 @@ static int micron_nand_onfi_init(struct nand_chip *ch=
ip)=0A=
>   	return 0;=0A=
>   }=0A=
>   =0A=
> -static int micron_nand_on_die_ooblayout_ecc(struct mtd_info *mtd, int se=
ction,=0A=
> -					    struct mtd_oob_region *oobregion)=0A=
> +static int micron_nand_on_die_4_ooblayout_ecc(struct mtd_info *mtd,=0A=
> +					      int section,=0A=
> +					      struct mtd_oob_region *oobregion)=0A=
>   {=0A=
>   	if (section >=3D 4)=0A=
>   		return -ERANGE;=0A=
> @@ -115,8 +116,9 @@ static int micron_nand_on_die_ooblayout_ecc(struct mt=
d_info *mtd, int section,=0A=
>   	return 0;=0A=
>   }=0A=
>   =0A=
> -static int micron_nand_on_die_ooblayout_free(struct mtd_info *mtd, int s=
ection,=0A=
> -					     struct mtd_oob_region *oobregion)=0A=
> +static int micron_nand_on_die_4_ooblayout_free(struct mtd_info *mtd,=0A=
> +					       int section,=0A=
> +					       struct mtd_oob_region *oobregion)=0A=
>   {=0A=
>   	if (section >=3D 4)=0A=
>   		return -ERANGE;=0A=
> @@ -127,9 +129,44 @@ static int micron_nand_on_die_ooblayout_free(struct =
mtd_info *mtd, int section,=0A=
>   	return 0;=0A=
>   }=0A=
>   =0A=
> -static const struct mtd_ooblayout_ops micron_nand_on_die_ooblayout_ops =
=3D {=0A=
> -	.ecc =3D micron_nand_on_die_ooblayout_ecc,=0A=
> -	.free =3D micron_nand_on_die_ooblayout_free,=0A=
> +static const struct mtd_ooblayout_ops micron_nand_on_die_4_ooblayout_ops=
 =3D {=0A=
> +	.ecc =3D micron_nand_on_die_4_ooblayout_ecc,=0A=
> +	.free =3D micron_nand_on_die_4_ooblayout_free,=0A=
> +};=0A=
> +=0A=
> +static int micron_nand_on_die_8_ooblayout_ecc(struct mtd_info *mtd,=0A=
> +					      int section,=0A=
> +					      struct mtd_oob_region *oobregion)=0A=
> +{=0A=
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);=0A=
> +=0A=
> +	if (section)=0A=
> +		return -ERANGE;=0A=
> +=0A=
> +	oobregion->offset =3D mtd->oobsize - chip->ecc.total;=0A=
> +	oobregion->length =3D chip->ecc.total;=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static int micron_nand_on_die_8_ooblayout_free(struct mtd_info *mtd,=0A=
> +					       int section,=0A=
> +					       struct mtd_oob_region *oobregion)=0A=
> +{=0A=
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);=0A=
> +=0A=
> +	if (section)=0A=
> +		return -ERANGE;=0A=
> +=0A=
> +	oobregion->offset =3D 2;=0A=
> +	oobregion->length =3D mtd->oobsize - chip->ecc.total - 2;=0A=
> +=0A=
> +	return 0;=0A=
> +}=0A=
> +=0A=
> +static const struct mtd_ooblayout_ops micron_nand_on_die_8_ooblayout_ops=
 =3D {=0A=
> +	.ecc =3D micron_nand_on_die_8_ooblayout_ecc,=0A=
> +	.free =3D micron_nand_on_die_8_ooblayout_free,=0A=
>   };=0A=
>   =0A=
>   static int micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool en=
able)=0A=
> @@ -425,6 +462,12 @@ static int micron_nand_init(struct nand_chip *chip)=
=0A=
>   				ret =3D -ENOMEM;=0A=
>   				goto err_free_manuf_data;=0A=
>   			}=0A=
> +=0A=
> +			mtd_set_ooblayout(mtd,=0A=
> +					  &micron_nand_on_die_4_ooblayout_ops);=0A=
> +		} else {=0A=
> +			mtd_set_ooblayout(mtd,=0A=
> +					  &micron_nand_on_die_8_ooblayout_ops);=0A=
>   		}=0A=
>   =0A=
>   		chip->ecc.bytes =3D chip->ecc_strength_ds * 2;=0A=
> @@ -435,8 +478,6 @@ static int micron_nand_init(struct nand_chip *chip)=
=0A=
>   		chip->ecc.write_page =3D micron_nand_write_page_on_die_ecc;=0A=
>   		chip->ecc.read_page_raw =3D nand_read_page_raw;=0A=
>   		chip->ecc.write_page_raw =3D nand_write_page_raw;=0A=
> -=0A=
> -		mtd_set_ooblayout(mtd, &micron_nand_on_die_ooblayout_ops);=0A=
>   	}=0A=
>   =0A=
>   	return 0;=0A=
> =0A=
=0A=
