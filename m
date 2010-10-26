Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAgj0-0005LL-BI
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 10:25:51 +0000
Date: Tue, 26 Oct 2010 12:25:48 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH 2 2/3] mtd: cfi_cmdset_0002: add CFI detection for SST
	38VF640x chips
Message-ID: <20101026102548.GB31843@pengutronix.de>
References: <20101026092626.5790.91523.stgit@dev.siriade.com>
	<20101026092631.5790.95453.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <20101026092631.5790.95453.stgit@dev.siriade.com>
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


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2010 at 11:26:31AM +0200, Guillaume LECERF wrote:
> Add support for SST38VF640x chips in CFI mode.
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> Signed-off-by: yidong zhang <zhangyd6@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   26 ++++++++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 1934476..1cdba02 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -293,6 +293,21 @@ static void fixup_sst39vf_rev_b(struct mtd_info *mtd=
, void *param)
>  	cfi->addr_unlock2 =3D 0x2AA;
>  }
> =20
> +static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd, void *par=
am)
> +{
> +	struct map_info *map =3D mtd->priv;
> +	struct cfi_private *cfi =3D map->fldrv_priv;
> +
> +	fixup_sst39vf_rev_b(mtd, param);
> +
> +	/*
> +	 * CFI reports 1024 sectors (0x03ff +1) of 64KBytes (0x0100 *256) where
> +	 * it should report a size of 8KBytes (0x0020 *256).

Spaces after operators?

> +	 */
> +	cfi->cfiq->EraseRegionInfo[0] =3D 0x002003ff;
> +	pr_warning("%s: Bad 38VF640x CFI data, adjust sector size from 64 to 8K=
Bytes\n", mtd->name);

Should be "adjusting", otherwise it sounds like a task for the user to do.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkzGrKwACgkQD27XaX1/VRtwQACePiKDpWo/2HievF5JeHHkEyi3
0CEAnjQ+Uvlv/tm27NTL7KUVAo344vql
=Q82w
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
