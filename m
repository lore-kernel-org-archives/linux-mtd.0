Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dj0Gu-0007v5-3a
 for linux-mtd@lists.infradead.org; Sat, 19 Aug 2017 09:42:26 +0000
Date: Sat, 19 Aug 2017 11:41:59 +0200
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, KOBAYASHI Yoshitake
 <yoshitake.kobayashi@toshiba.co.jp>, linux-kernel@vger.kernel.org, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3] MTD: NAND: add OOB layout without ECC bytes
Message-ID: <20170819114159.77076761@xps13>
In-Reply-To: <20170818001542.01d5aa95@bbrezillon>
References: <20170816073906.5819-1-miquel.raynal@free-electrons.com>
 <20170818001542.01d5aa95@bbrezillon>
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

Hello Boris,

On Fri, 18 Aug 2017 00:15:42 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> +Yoshi
>=20
> Hi Miquel,
>=20
> Subject prefix should be "mtd: nand: " in lowercase.

I was not aware of that kind of rule, next time I'll be careful.

>=20
> Le Wed, 16 Aug 2017 09:39:06 +0200,
> Miquel Raynal <miquel.raynal@free-electrons.com> a =C3=A9crit :
>=20
> > Add layout functions for small and large pages with mainly free
> > bytes plus reserved space for Bad Block Markers. This may be useful
> > for specific chip that use on-die ECC feature, ie. the TOSHIBA
> > BENAND (Built-in ECC NAND). The ECC bytes are stored in an isolated
> > area inaccessible by the driver and thus the OOB layout must only
> > reserve space for Bad Block Markers. =20
>=20
> Yes, that's true, but as said below, I expect the toshiba driver to
> explicitly set this layout.

I will change:
-for specific chips that use on-die ECC feature, ie. the [...].
+for configurations that does set ECC_NONE. Specific chips that use
on-die ECC feature, ie. the [...], might also take advantage of it.

>=20
> >=20
> > Bad Block Markers position was extracted from the existing OOB
> > layouts by assigning as free all the bytes marked as ECC.
> >=20
> > The layout functions added by this patch were supposed to be used
> > with ECC_NONE mode but it would break existing drivers that do not
> > rely on an implementation of this layout by the core, so set it as
> > a fallthrough when no other layout matches. =20
>=20
> Well, it's still supposed to be used when ECC_NONE is set, except we
> can only use it for cases that were not already falling in the
> supported large/small page with ECC cases.

I'll edit the commit message, what about:

The layout functions added by this patch intend to be used when ECC_NONE
is set, except it is only usable for cases that were not already falling
in the supported large/small page with ECC cases. Not breaking
existing drivers needs these functions to be set as a fallthrough when
no other layout matches and ECC_NONE is actually set.

>=20
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 65
> > ++++++++++++++++++++++++++++++++++++++++---- 1 file changed, 60
> > insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/nand_base.c
> > b/drivers/mtd/nand/nand_base.c index c5221795a1e8..7c0ae674e50a
> > 100644 --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -53,7 +53,38 @@ static int nand_get_device(struct mtd_info *mtd,
> > int new_state); static int nand_do_write_oob(struct mtd_info *mtd,
> > loff_t to, struct mtd_oob_ops *ops);
> > =20
> > -/* Define default oob placement schemes for large and small page
> > devices */ +/*
> > + * Define default OOB placement schemes for:
> > + *   - no ECC or software ECC
> > + *   - small or large page devices
> > + */
> > +static int nand_ooblayout_free_sp_no_ecc(struct mtd_info *mtd, int
> > section,
> > +					   struct mtd_oob_region
> > *oobregion) +{
> > +	if (section > 1)
> > +		return -ERANGE;
> > +
> > +	if (!section) {
> > +		if (mtd->oobsize =3D=3D 16) {
> > +			oobregion->offset =3D 0;
> > +			oobregion->length =3D 4;
> > +		} else {
> > +			oobregion->offset =3D 0;
> > +			oobregion->length =3D 5;
> > +		}
> > +	} else {
> > +		oobregion->offset =3D 6;
> > +		oobregion->length =3D mtd->oobsize -
> > oobregion->offset;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +const struct mtd_ooblayout_ops nand_ooblayout_sp_no_ecc_ops =3D {
> > +	.free =3D nand_ooblayout_free_sp_no_ecc,
> > +};
> > +EXPORT_SYMBOL_GPL(nand_ooblayout_sp_no_ecc_ops);
> > +
> >  static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
> >  				 struct mtd_oob_region *oobregion)
> >  {
> > @@ -109,6 +140,23 @@ const struct mtd_ooblayout_ops
> > nand_ooblayout_sp_ops =3D { };
> >  EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
> > =20
> > +static int nand_ooblayout_free_lp_no_ecc(struct mtd_info *mtd, int
> > section,
> > +					   struct mtd_oob_region
> > *oobregion) +{
> > +	if (section)
> > +		return -ERANGE;
> > +
> > +	oobregion->offset =3D 2;
> > +	oobregion->length =3D mtd->oobsize - oobregion->offset;
> > +
> > +	return 0;
> > +}
> > +
> > +const struct mtd_ooblayout_ops nand_ooblayout_lp_no_ecc_ops =3D {
> > +	.free =3D nand_ooblayout_free_lp_no_ecc,
> > +};
> > +EXPORT_SYMBOL_GPL(nand_ooblayout_lp_no_ecc_ops); =20
>=20
> No need to export those symbols until someone really needs them.
> BTW, they are exported but not declared in nand.h, so right now
> nobody can use them.

I though the EXPORT_* was expected as it was below every layout
function. I'll remove both of the exports, but as you said, while
nobody use them, I won't add the prototypes in nand.h neither, right ?

>=20
> > +
> >  static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
> >  				 struct mtd_oob_region *oobregion)
> >  {
> > @@ -4649,10 +4697,17 @@ int nand_scan_tail(struct mtd_info *mtd)
> >  			mtd_set_ooblayout(mtd,
> > &nand_ooblayout_lp_hamming_ops); break;
> >  		default:
> > -			WARN(1, "No oob scheme defined for oobsize
> > %d\n",
> > -				mtd->oobsize);
> > -			ret =3D -EINVAL;
> > -			goto err_free;
> > +			/*
> > +			 * In the case of on-die ECC (when ECC are
> > stored in an
> > +			 * isolated area inaccessible by the
> > driver), the OOB
> > +			 * layout must only reserve space for Bad
> > Block Markers.
> > +			 */ =20
>=20
> This kind of on-die ECC is not yet supported and I'd expect NAND
> manufacturer drivers to set the appropriate layout before reaching
> this point, so that's not really relevant here.

To be removed then.

>=20
> > +			if (mtd->writesize <=3D 512)
> > +				mtd_set_ooblayout(mtd,
> > +
> > &nand_ooblayout_sp_no_ecc_ops);
> > +			else
> > +				mtd_set_ooblayout(mtd,
> > +
> > &nand_ooblayout_lp_no_ecc_ops); =20
>=20
> That's not exactly what I was suggesting. What I had in mind was:
>=20
> 			if (ecc->mode =3D=3D NAND_ECC_NONE) {
> 				/*
> 				 * Expose the whole OOB area to users
> if ECC_NONE
> 				 * is passed. We could do that for
> all kind of
> 				 * ->oobsize, but we must keep the old
> 				 * large/small page with ECC layout
> for
> 				 * compatibility reasons.
> 				 */
> 				if (mtd->writesize <=3D 512)
> 					mtd_set_ooblayout(mtd,
> 							  &nand_ooblayout_sp_no_ecc_ops);
> 				else
> 					mtd_set_ooblayout(mtd,
> 							  &nand_ooblayout_lp_no_ecc_ops);
>=20
> 				break;
> 			}
>=20
> 			WARN(1, "No oob scheme defined for oobsize
> %d\n", mtd->oobsize);
> 			ret =3D -EINVAL;
> 			goto err_free;

Ok, I clearly misunderstood your previous explanation, sorry about
that. I'll use your version as is.

> >  		}
> >  	}
> >   =20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


Thank you,
Miqu=C3=A8l
