Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PQM9M-0004zm-Ps
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2010 15:41:50 +0000
Date: Wed, 8 Dec 2010 16:41:43 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D3x16UxC NOR chips
Message-ID: <20101208154143.GC4641@pengutronix.de>
References: <20101208151901.20317.30721.stgit@dev.siriade.com>
	<20101208151906.20317.53000.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <20101208151906.20317.53000.stgit@dev.siriade.com>
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


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2010 at 04:19:06PM +0100, Guillaume LECERF wrote:
> These chips report CFI v3.3 [1], so patch them on the fly to the more
> correct v1.3.
> Discussed and tested by the OpenWRT people [2].
>=20
> [1] http://www.samsung.com/global/system/business/semiconductor/product/2=
007/6/11/NORFlash/32Mbit/K8D3216UBC/ds_K8D3x16UxC_rev17.pdf
> [2] https://dev.openwrt.org/ticket/866
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 28e05ad..bee619e 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -403,6 +403,19 @@ static void cfi_fixup_major_minor(struct cfi_private=
 *cfi,
>  			extp->MajorVersion =3D '1';
>  			extp->MinorVersion =3D '0';
>  		}
> +		if (extp->MajorVersion =3D=3D '3' && extp->MinorVersion =3D=3D '3') {
> +			/*
> +			 * Samsung K8D3x16UxC chips report major=3D3 / minor=3D3
> +			 */
> +			printk(KERN_NOTICE "  Newer Samsung flash detected, "
> +			                   "should be compatibile with Amd/Fujitsu.\n");

compatible

> +

Extra line could be removed, but that's terribly minor :)

> +			printk("  Fixed Samsung's Amd/Fujitsu Extended Query version from %c.=
%c to 1.3",
> +			       extp->MajorVersion, extp->MinorVersion);

loglevel? \n?

> +
> +			extp->MajorVersion =3D '1'; // set to 1.3

Use C-comments, please. Given the explanation in the printout above, can
also be dropped entirely IMHO.

> +			extp->MinorVersion =3D '3';
> +		}
>  	}

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkz/pzcACgkQD27XaX1/VRujBQCeMg8ZLj5Ta+eoggy7NxVp6cAP
58AAoKOccyxJYeCqdpVBTg2k3tqdZVh5
=5aCh
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
