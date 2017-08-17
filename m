Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1diT5B-0001QR-7b
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 22:16:07 +0000
Date: Fri, 18 Aug 2017 00:15:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: Re: [PATCH v3] MTD: NAND: add OOB layout without ECC bytes
Message-ID: <20170818001542.01d5aa95@bbrezillon>
In-Reply-To: <20170816073906.5819-1-miquel.raynal@free-electrons.com>
References: <20170816073906.5819-1-miquel.raynal@free-electrons.com>
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

+Yoshi

Hi Miquel,

Subject prefix should be "mtd: nand: " in lowercase.

Le Wed, 16 Aug 2017 09:39:06 +0200,
Miquel Raynal <miquel.raynal@free-electrons.com> a =C3=A9crit :

> Add layout functions for small and large pages with mainly free bytes
> plus reserved space for Bad Block Markers. This may be useful for
> specific chip that use on-die ECC feature, ie. the TOSHIBA BENAND
> (Built-in ECC NAND). The ECC bytes are stored in an isolated area
> inaccessible by the driver and thus the OOB layout must only reserve
> space for Bad Block Markers.

Yes, that's true, but as said below, I expect the toshiba driver to
explicitly set this layout.

>=20
> Bad Block Markers position was extracted from the existing OOB layouts
> by assigning as free all the bytes marked as ECC.
>=20
> The layout functions added by this patch were supposed to be used with
> ECC_NONE mode but it would break existing drivers that do not rely on
> an implementation of this layout by the core, so set it as a fallthrough
> when no other layout matches.

Well, it's still supposed to be used when ECC_NONE is set, except we can
only use it for cases that were not already falling in the supported
large/small page with ECC cases.

>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 65 ++++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 60 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c5221795a1e8..7c0ae674e50a 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -53,7 +53,38 @@ static int nand_get_device(struct mtd_info *mtd, int n=
ew_state);
>  static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
>  			     struct mtd_oob_ops *ops);
> =20
> -/* Define default oob placement schemes for large and small page devices=
 */
> +/*
> + * Define default OOB placement schemes for:
> + *   - no ECC or software ECC
> + *   - small or large page devices
> + */
> +static int nand_ooblayout_free_sp_no_ecc(struct mtd_info *mtd, int secti=
on,
> +					   struct mtd_oob_region *oobregion)
> +{
> +	if (section > 1)
> +		return -ERANGE;
> +
> +	if (!section) {
> +		if (mtd->oobsize =3D=3D 16) {
> +			oobregion->offset =3D 0;
> +			oobregion->length =3D 4;
> +		} else {
> +			oobregion->offset =3D 0;
> +			oobregion->length =3D 5;
> +		}
> +	} else {
> +		oobregion->offset =3D 6;
> +		oobregion->length =3D mtd->oobsize - oobregion->offset;
> +	}
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops nand_ooblayout_sp_no_ecc_ops =3D {
> +	.free =3D nand_ooblayout_free_sp_no_ecc,
> +};
> +EXPORT_SYMBOL_GPL(nand_ooblayout_sp_no_ecc_ops);
> +
>  static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
>  				 struct mtd_oob_region *oobregion)
>  {
> @@ -109,6 +140,23 @@ const struct mtd_ooblayout_ops nand_ooblayout_sp_ops=
 =3D {
>  };
>  EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
> =20
> +static int nand_ooblayout_free_lp_no_ecc(struct mtd_info *mtd, int secti=
on,
> +					   struct mtd_oob_region *oobregion)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D 2;
> +	oobregion->length =3D mtd->oobsize - oobregion->offset;
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops nand_ooblayout_lp_no_ecc_ops =3D {
> +	.free =3D nand_ooblayout_free_lp_no_ecc,
> +};
> +EXPORT_SYMBOL_GPL(nand_ooblayout_lp_no_ecc_ops);

No need to export those symbols until someone really needs them.
BTW, they are exported but not declared in nand.h, so right now nobody can
use them.

> +
>  static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
>  				 struct mtd_oob_region *oobregion)
>  {
> @@ -4649,10 +4697,17 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
>  			break;
>  		default:
> -			WARN(1, "No oob scheme defined for oobsize %d\n",
> -				mtd->oobsize);
> -			ret =3D -EINVAL;
> -			goto err_free;
> +			/*
> +			 * In the case of on-die ECC (when ECC are stored in an
> +			 * isolated area inaccessible by the driver), the OOB
> +			 * layout must only reserve space for Bad Block Markers.
> +			 */

This kind of on-die ECC is not yet supported and I'd expect NAND
manufacturer drivers to set the appropriate layout before reaching this
point, so that's not really relevant here.

> +			if (mtd->writesize <=3D 512)
> +				mtd_set_ooblayout(mtd,
> +						&nand_ooblayout_sp_no_ecc_ops);
> +			else
> +				mtd_set_ooblayout(mtd,
> +						&nand_ooblayout_lp_no_ecc_ops);

That's not exactly what I was suggesting. What I had in mind was:

			if (ecc->mode =3D=3D NAND_ECC_NONE) {
				/*
				 * Expose the whole OOB area to users if ECC_NONE
				 * is passed. We could do that for all kind of
				 * ->oobsize, but we must keep the old
				 * large/small page with ECC layout for
				 * compatibility reasons.
				 */
				if (mtd->writesize <=3D 512)
					mtd_set_ooblayout(mtd,
							  &nand_ooblayout_sp_no_ecc_ops);
				else
					mtd_set_ooblayout(mtd,
							  &nand_ooblayout_lp_no_ecc_ops);

				break;
			}

			WARN(1, "No oob scheme defined for oobsize %d\n",
			     mtd->oobsize);
			ret =3D -EINVAL;
			goto err_free;
>  		}
>  	}
> =20
