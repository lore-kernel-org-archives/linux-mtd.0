Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAyZu-0007Rf-Gn
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 13:01:25 +0000
Date: Wed, 17 May 2017 15:00:59 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: [PATCH] fsl_ifc_nand: fix handing of bit flips in erased nand
Message-ID: <20170517130059.GA3437@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd> <20170421105107.GA7259@amd>
 <20170517122224.GB583@amd> <20170517143211.205ff5de@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20170517143211.205ff5de@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Wed, 17 May 2017 14:22:24 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > If we see unrecoverable ECC error, we need to count number of bitflips
> > from all-ones and report correctable/uncorrectable according to
> > that. Otherwise we report ECC failed on erased flash with single bit er=
ror.
> >=20
> > Signed-off-by: Pavel Machek <pavel@denx.de>
> >=20
> > @@ -678,6 +648,41 @@ static int fsl_ifc_wait(struct mtd_info *mtd, stru=
ct nand_chip *chip)
> >  	return nand_fsr | NAND_STATUS_WP;
> >  }
> > =20
> > +/*
> > + * The controller does not check for bitflips in erased pages,
> > + * therefore software must check instead.
> > + */
> > +static int check_erased_page(struct nand_chip *chip, u8 *buf)
> > +{
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	u8 *ecc =3D chip->oob_poi;
> > +	const int ecc_size =3D chip->ecc.bytes;
> > +	const int pkt_size =3D chip->ecc.size;
> > +	int i, res, bitflips =3D 0;
> > +	struct mtd_oob_region oobregion =3D { };
> > +
> > +	mtd_ooblayout_ecc(mtd, 0, &oobregion);
> > +	ecc +=3D oobregion.offset;
> > +
> > +	for (i =3D 0; i < chip->ecc.steps; ++i) {
> > +		res =3D nand_check_erased_ecc_chunk(buf, pkt_size, ecc, ecc_size,
> > +						  NULL, 0,
> > +						  chip->ecc.strength);
> > +		if (res < 0)
> > +			mtd->ecc_stats.failed++;
> > +		else
> > +			mtd->ecc_stats.corrected +=3D res;
> > +
> > +		bitflips =3D max(res, bitflips);
> > +		buf +=3D pkt_size;
> > +		ecc +=3D ecc_size;
> > +	}
> > +
> > +	mtd_ooblayout_ecc(mtd, 1, &oobregion);
>=20
> Why is this needed?

It is not, will remove.

> > @@ -904,6 +922,21 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *p=
riv)
> >  		chip->ecc.algo =3D NAND_ECC_HAMMING;
> >  	}
> > =20
> > +	{
> > +		struct mtd_oob_region oobregion =3D { };
> > +
> > +		mtd_ooblayout_ecc(mtd, 0, &oobregion);
> > +		if (!oobregion.length) {
> > +			dev_err(priv->dev, "No ECC in oobregion?\n");
> > +			return -EINVAL;
> > +		}
> > +		mtd_ooblayout_ecc(mtd, 1, &oobregion);
> > +		if (oobregion.length) {
> > +			dev_err(priv->dev, "Extra data in oobregion?\n");
> > +			return -EINVAL;
> > +		}
> > +	}
>=20
> This clearly doesn't belong in this patch. And if you really want to
> check that, please create a separate function instead of defining a
> non-conditional code block inside fsl_ifc_chip_init().

I am not sure I want to check that. check_erased_page() can only
handle layout with just one oobregion. If you think check is not
needed, I'll happily remove the checking.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkcSYsACgkQMOfwapXb+vJpTgCfZv2/WB3GR+Ka5gI3jJlibMHo
X9EAnA2s7K9zZc7yd9hv/xDeJOmoqV0k
=mXYt
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
