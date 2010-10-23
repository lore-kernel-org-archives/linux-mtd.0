Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P9bHU-0004Ow-IX
	for linux-mtd@lists.infradead.org; Sat, 23 Oct 2010 10:24:59 +0000
Date: Sat, 23 Oct 2010 12:24:49 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH 2/4] mtd: cfi_cmdset_0002: make sector erase command
	variable
Message-ID: <20101023102449.GB31623@pengutronix.de>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
	<20101022154020.11097.4024.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <20101022154020.11097.4024.stgit@dev.siriade.com>
Cc: zhangyd6@gmail.com, fggs@terra.com.br, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2010 at 05:40:20PM +0200, Guillaume LECERF wrote:
> Some old SST chips use 0x50 as sector erase command, instead
> of 0x30. Make this value variable to handle such chips.
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 3e6c47b..209928b 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -78,6 +78,7 @@ static struct mtd_chip_driver cfi_amdstd_chipdrv =3D {
>  	.module		=3D THIS_MODULE
>  };
> =20
> +static map_word sector_erase_cmd =3D CMD(0x30);

Uh? A static one? Why not per device?

I'd also suggest to fold the next patch into this one, so the need for the
change is more obvious.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkzCt/EACgkQD27XaX1/VRsmsgCgg9iLobQW8nQhxWGR5Ckm+JCh
dcgAoJw0gVp8LuZ9J6C6ybKnA1/w1puM
=g5xJ
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
