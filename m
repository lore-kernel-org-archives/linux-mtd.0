Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJRni-0005Ot-DO
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 21:50:42 +0000
Date: Fri, 9 Jun 2017 23:50:16 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: fsl_ifc: remove unused variable
Message-ID: <20170609215016.GC28596@amd>
References: <20170609104829.3488073-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
In-Reply-To: <20170609104829.3488073-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-06-09 12:47:43, Arnd Bergmann wrote:
> This one was accidentally introduced without any references,
> and it causes a harmless warning:
>=20
> drivers/mtd/nand/fsl_ifc_nand.c: In function 'fsl_ifc_read_page':
> drivers/mtd/nand/fsl_ifc_nand.c:696:7: error: unused variable 'res' [-Wer=
ror=3Dunused-variable]
>=20
> Fixes: 79f40cc12fd3 ("mtd: nand: fsl_ifc: fix handing of bit flips in era=
sed pages")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks!
									Pavel
								=09
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_n=
and.c
> index 14ef2f4524ac..d1c4538f870f 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -693,8 +693,6 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, st=
ruct nand_chip *chip,
>  		fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> =20
>  	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
> -		int res;
> -
>  		if (!oob_required)
>  			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> =20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlk7GBgACgkQMOfwapXb+vKe4ACghq1f5BIm1nAT4hbTegUGAJyx
T8YAn0hrl2MSFOWHLTcm0pI2TddEPJAJ
=fGqK
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
