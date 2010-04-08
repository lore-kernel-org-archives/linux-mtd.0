Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NzngR-0006FP-Ma
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 09:05:56 +0000
Date: Thu, 8 Apr 2010 11:05:53 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 3/7] mtd: cfi_probe: add support for SST 0x0701
	vendorname
Message-ID: <20100408090553.GC21805@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133458.20107.48734.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline
In-Reply-To: <20100330133458.20107.48734.stgit@shiryu.yomgui.biz>
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2010 at 03:34:58PM +0200, Guillaume LECERF wrote:
> SST 39VF160x and 39VF320x chips use vendorname id 0x0701 and alternative
> unlock addresses. Add support for them in cfi_probe.c.
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_probe.c |    9 +++++++++
>  include/linux/mtd/cfi.h       |    1 +
>  2 files changed, 10 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index a28659d..f931e94 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -214,6 +214,12 @@ static int __xipram cfi_chip_setup(struct map_info *=
map,
>  	 * back into Read Mode, which is a nop in this case).
>  	 */
>  	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
> +
> +	if (cfi->cfiq->P_ID =3D=3D P_ID_SST_OLD) {
> +		addr_unlock1 =3D 0x5555;
> +		addr_unlock2 =3D 0x2AAA;
> +	}

Can't we set cfi->addr_unlock[12] here already? This way, we could later ha=
ve
just one fixup function for all old SST flashes.

> +
>  	cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type, =
NULL);
>  	cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type, =
NULL);
>  	cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type, =
NULL);
> @@ -270,6 +276,9 @@ static char *vendorname(__u16 vendor)
>  	case P_ID_SST_PAGE:
>  		return "SST Page Write";
> =20
> +	case P_ID_SST_OLD:
> +		return "SST 39VF160x/39VF320x";
> +
>  	case P_ID_INTEL_PERFORMANCE:
>  		return "Intel Performance Code";
> =20
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index cee05b1..5716fc7 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -253,6 +253,7 @@ struct cfi_bri_query {
>  #define P_ID_MITSUBISHI_STD     0x0100
>  #define P_ID_MITSUBISHI_EXT     0x0101
>  #define P_ID_SST_PAGE           0x0102
> +#define P_ID_SST_OLD            0x0701
>  #define P_ID_INTEL_PERFORMANCE  0x0200
>  #define P_ID_INTEL_DATA         0x0210
>  #define P_ID_RESERVED           0xffff
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAku9nHEACgkQD27XaX1/VRvsuQCfVObQ3eYN1UvmVDE1YNKvtRtX
dkgAoKKL2BFy9ny/4IZGvzSMekyEFl1T
=Sq/G
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
