Date: Wed, 31 May 2017 08:12:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <computersforpeace@gmail.com>, <matthias.bgg@gmail.com>,
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <robh+dt@kernel.org>,
 <rogercc.lin@mediatek.com>, <yt.shen@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v4 3/4] mtd: nand: mediatek: add support for different
 MTK NAND FLASH Controller IP
Message-ID: <20170531081241.2137fe38@bbrezillon>
In-Reply-To: <1496201877-34373-4-git-send-email-xiaolei.li@mediatek.com>
References: <1496201877-34373-1-git-send-email-xiaolei.li@mediatek.com>
 <1496201877-34373-4-git-send-email-xiaolei.li@mediatek.com>
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

Le Wed, 31 May 2017 11:37:56 +0800,
Xiaolei Li <xiaolei.li@mediatek.com> a =C3=A9crit :

> =20
> -static void mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
> +static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)

Why do you change the prototype here? You seem to always return 0
anyway.

>  {
>  	struct nand_chip *nand =3D mtd_to_nand(mtd);
> -	u32 spare[] =3D {16, 26, 27, 28, 32, 36, 40, 44,
> -			48, 49, 50, 51, 52, 62, 63, 64};
> -	u32 eccsteps, i;
> +	struct mtk_nfc *nfc =3D nand_get_controller_data(nand);
> +	const u8 *spare =3D nfc->caps->spare_size;
> +	u32 eccsteps, i, j =3D 0;

Can we rename 'j' into 'closest_spare'?

> =20
>  	eccsteps =3D mtd->writesize / nand->ecc.size;
>  	*sps =3D mtd->oobsize / eccsteps;
> @@ -1144,28 +1102,28 @@ static void mtk_nfc_set_spare_per_sector(u32 *sps=
, struct mtd_info *mtd)
>  	if (nand->ecc.size =3D=3D 1024)
>  		*sps >>=3D 1;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(spare); i++) {
> -		if (*sps <=3D spare[i]) {
> -			if (!i)
> -				*sps =3D spare[i];
> -			else if (*sps !=3D spare[i])
> -				*sps =3D spare[i - 1];
> -			break;
> +	for (i =3D 0; i < nfc->caps->num_spare_size; i++) {
> +		if ((*sps >=3D spare[i]) && (spare[i] >=3D spare[j])) {

Parenthesis around the 'a >=3D b' tests are unneeded:

		if (*sps >=3D spare[i] && spare[i] >=3D spare[j]) {

> +			j =3D i;
> +			if (*sps =3D=3D spare[i])
> +				break;
>  		}
>  	}
> =20
> -	if (i >=3D ARRAY_SIZE(spare))
> -		*sps =3D spare[ARRAY_SIZE(spare) - 1];

Maybe you could return an error if you didn't find any entry that is
less that *sps in the table, but I'm not sure this can really happen,
and the minimum spare size seems to be the same for all IPs, this is
something you can check before iterating over the array:

	if (*sps < MTK_NFC_MIN_SPARE)
		return -EINVAL;

> +	*sps =3D spare[j];
> =20
>  	if (nand->ecc.size =3D=3D 1024)
>  		*sps <<=3D 1;
> +
> +	return 0;
>  }
