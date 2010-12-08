Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PQMwG-0008W7-Vj
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2010 16:32:22 +0000
Date: Wed, 8 Dec 2010 17:32:18 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D6x16UxM NOR chips
Message-ID: <20101208163218.GG4641@pengutronix.de>
References: <20101208160018.22017.8779.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y+xroYBkGM9OatJL"
Content-Disposition: inline
In-Reply-To: <20101208160018.22017.8779.stgit@dev.siriade.com>
Cc: Matthias Buecher / Germany <mail@maddes.net>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Y+xroYBkGM9OatJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2010 at 05:00:18PM +0100, Guillaume LECERF wrote:
> These chips report CFI v0.0 [1], so extend cfi_fixup_major_minor()
> to patch all Samsung chips with Major =3D=3D 0 to 1.0.
> Discussed and tested by the OpenWRT people [2].
>=20
> [1] http://www.samsung.com/global/system/business/semiconductor/product/2=
007/6/11/NORFlash/64Mbit/K8D6316UTM/ds_K8D6x16UxM_rev16.pdf
> [2] https://dev.openwrt.org/ticket/7348
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

One question left:

> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   16 +++++++++++++---
>  1 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 9d68ab9..7966f07 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -392,9 +392,19 @@ static struct cfi_fixup fixup_table[] =3D {
>  static void cfi_fixup_major_minor(struct cfi_private *cfi,
>  				  struct cfi_pri_amdstd *extp)
>  {
> -	if (cfi->mfr =3D=3D CFI_MFR_SAMSUNG && cfi->id =3D=3D 0x257e &&
> -	    extp->MajorVersion =3D=3D '0')
> -		extp->MajorVersion =3D '1';
> +	if (cfi->mfr =3D=3D CFI_MFR_SAMSUNG) {
> +		if (extp->MajorVersion =3D=3D '0') {
> +			/*
> +			 * Samsung K8P2815UQB and K8D6x16UxM chips report major=3D0 / minor=
=3D0

The code below is prepared to show minor !=3D 0, so is the comment above
apropriate? Given that it is okay to fixup major =3D 0 and minor !=3D 0 to
1.0, you can add my

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

> +			 */
> +			printk(KERN_NOTICE "  Fixed Samsung's Amd/Fujitsu Extended Query vers=
ion from 0.%c to 1.0\n",
> +			       extp->MinorVersion);
> +
> +			extp->MajorVersion =3D '1';
> +			extp->MinorVersion =3D '0';
> +		}
> +	}
> +
>  	/*
>  	 * SST 38VF640x chips report major=3D0xFF / minor=3D0xFF.
>  	 */
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Y+xroYBkGM9OatJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkz/sxIACgkQD27XaX1/VRsslACgmn2i+U7E1y4fZC+FbmGlB6qz
474An0YIRmUEmnvK9JOtXbILGhJlt7WY
=sHBx
-----END PGP SIGNATURE-----

--Y+xroYBkGM9OatJL--
