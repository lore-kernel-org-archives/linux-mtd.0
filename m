Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P6kqa-0003NR-UI
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 14:01:26 +0000
Date: Fri, 15 Oct 2010 16:01:12 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: zhangyd <zhangyd6@gmail.com>
Subject: Re: [PATCH] [MTD] [CHIPS] Add JEDEC probe support for the
	SST38VF6401 flash chip
Message-ID: <20101015140112.GD4276@pengutronix.de>
References: <1286992482-6009-1-git-send-email-zhangyd6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <1286992482-6009-1-git-send-email-zhangyd6@gmail.com>
Cc: Artem.Bityutskiy@nokia.com, ladis@linux-mips.org, jkosina@suse.cz,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2010 at 01:54:42PM -0400, zhangyd wrote:
> Add SST38VF6401(64Mbit) chip to jedec_probe. Sorry for the wrong descript=
ion of the flash size in last patch.=20

Can you explain why CFI can't be used?

>=20
> Signed-off-by: yidong zhang<zhangyd6@gmail.com>
> ---
>  drivers/mtd/chips/jedec_probe.c |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_pr=
obe.c
> index d72a5fb..b7a1016 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -163,6 +163,7 @@
>  #define SST49LF030A	0x001C
>  #define SST49LF040A	0x0051
>  #define SST49LF080A	0x005B
> +#define SST38VF6401	0x536B
>  #define SST36VF3203	0x7354
> =20
>  /* Toshiba */
> @@ -1569,6 +1570,18 @@ static const struct amd_flash_info jedec_table[] =
=3D {
>  		}
>  	}, {
>  		.mfr_id		=3D CFI_MFR_ST,
> +		.dev_id		=3D SST38VF6401,
> +		.name		=3D "SST 38VF6401",
> +		.devtypes	=3D CFI_DEVICETYPE_X16,
> +		.uaddr		=3D MTD_UADDR_0X0AAA_0x555,
> +		.dev_size	=3D SIZE_8MiB,
> +		.cmd_set	=3D P_ID_AMD_STD,
> +		.nr_regions	=3D 1,
> +		.regions	=3D {
> +			ERASEINFO(0x10000,128),
> +		}
> +	}, {
> +		.mfr_id		=3D CFI_MFR_ST,
>  		.dev_id		=3D M29F800AB,
>  		.name		=3D "ST M29F800AB",
>  		.devtypes	=3D CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> --=20
> 1.7.2.3
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAky4XqcACgkQD27XaX1/VRtKRQCfemn4m3IOVP15NugnbKdkbKgR
yzoAn2NWzpp/F1GPUO+TW3vB3j9aZR2r
=Ak1U
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
