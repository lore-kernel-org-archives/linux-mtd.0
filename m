Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGAYi-0001rn-6Q
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 20:49:38 +0000
Date: Wed, 31 May 2017 22:49:13 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mark.marshall@omicronenergy.com" <mark.marshall@omicronenergy.com>,
 "b44839@freescale.com" <b44839@freescale.com>,
 "prabhakar@freescale.com" <prabhakar@freescale.com>
Subject: Re: mtd: nand: fsl_ifc: fix handing of bit flips in erased pages
Message-ID: <20170531204913.GC16962@amd>
References: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline
In-Reply-To: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We are also having the same problem where the IFC (nand flash) was=20
> reporting ECC uncorrectable errors on single bitflips with erased pages.=
=20
> Applying this patch with some minor modifications seems to solve our=20
> issue. We are still doing more testing but recent results looks
> promising.

First, thanks for letting me know.

> Our kernel is 4.4.6 so we have to modify it a bit to fit the old ECC=20
> layout structure. We just have a few comments about the patch:
>=20
>  > -				if (!is_blank(mtd, bufnum))
>  > -					ctrl->nand_stat |=3D
>  > -						IFC_NAND_EVTER_STAT_ECCER;
>  > -				break;
>  > +				ctrl->nand_stat |=3D IFC_NAND_EVTER_STAT_ECCER;
>=20
> Added 'error =3D 0' after setting the flag since no error was actually=20
> corrected.

You meen "errors =3D 0"? Does that actually make a difference? It is a
local variable, and continue makes sure the value is not used:

                for (i =3D sector; i <=3D sector_end; i++) {
                        errors =3D check_read_ecc(mtd, ctrl, eccstat, i);

                        if (errors =3D=3D 15) {
				/*=20
                                 * Uncorrectable error.=20
                                 * We'll check for blank pages later.=20
                                 *=20
                                 * We disable ECCER reporting due to...=20
                                 * erratum IFC-A002770 -- so report it now =
if we=20
                                 * see an uncorrectable error in ECCSTAT.=
=20
                                 */
                                ctrl->nand_stat |=3D IFC_NAND_EVTER_STAT_EC=
CER;
                                continue;
                        }


>  > -	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER)
>  > -		dev_err(priv->dev, "NAND Flash ECC Uncorrectable Error\n");
>  > -
>  >  	if (ctrl->nand_stat !=3D IFC_NAND_EVTER_STAT_OPC)
>  >  		mtd->ecc_stats.failed++;
>  > +
>  > +	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
>  > +		int res;
>  > +
>  > +		if (!oob_required)
>  > +			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>  > +
>  > +		res =3D check_erased_page(chip, buf);
>  > +		return res;
>  > +	}
>=20
> We have to do the check IFC_NAND_EVTER_STAT_ECCER first because the=20
> condition (ctrl->nand_stat !=3D IFC_NAND_EVTER_STAT_OPC) will never be=20
> true since IFC always sets IFC_NAND_EVTER_STAT_ECCER on empty pages.=20
> Incrementing failed stats first before doing check_erased_page() makes=20
> nand_read() report ECC error all time.

Yes, you are right; I overlooked that one. Thanks a lot!

> Our exact modification was:
> 	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
> 		if (!oob_required)
> 			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>=20
> 		return check_erased_page(chip, buf);
> 	}
>=20
> 	if (ctrl->nand_stat !=3D IFC_NAND_EVTER_STAT_OPC)
> 		mtd->ecc_stats.failed++;
>=20
> Because check_erased_page() will be updating the failed stat anyway.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkvLEkACgkQMOfwapXb+vJzfwCcDY+1u98vc08qDliy0g/5plRM
n4IAmgP3WQ3zmJpzsp+f3dK0ql0nkLoi
=gMO1
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
