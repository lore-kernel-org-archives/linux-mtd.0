Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OJOBo-0002W7-0F
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 09:55:17 +0000
Received: from octopus.hi.pengutronix.de ([2001:6f8:1178:2:215:17ff:fe12:23b0])
	by metis.ext.pengutronix.de with esmtp (Exim 4.71)
	(envelope-from <wsa@pengutronix.de>) id 1OJOBk-0001Ht-Ns
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 11:55:12 +0200
Received: from wsa by octopus.hi.pengutronix.de with local (Exim 4.69)
	(envelope-from <wsa@pengutronix.de>) id 1OJOBk-0005o2-MT
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 11:55:12 +0200
Date: Tue, 1 Jun 2010 11:55:12 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Do we remove from jedec_probe.c?
Message-ID: <20100601095512.GC16143@pengutronix.de>
References: <20100526175320.GD24167@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <20100526175320.GD24167@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2010 at 07:53:20PM +0200, Wolfram Sang wrote:
> Hi,
>=20
> now that Guillaume introduced cfi-support for some SST-flashes, I wonder =
if
> those can be removed from jedec_probe.c? Or should they stay for
> backward-compatibility?

Ping?

>=20
> Proposed patch would look like this:
>=20
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_pr=
obe.c
> index d72a5fb..37fdff3 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -146,8 +146,6 @@
>  #define SST29LE512	0x003d
>  #define SST39LF800	0x2781
>  #define SST39LF160	0x2782
> -#define SST39VF1601	0x234b
> -#define SST39VF3201	0x235b
>  #define SST39WF1601	0x274b
>  #define SST39WF1602	0x274a
>  #define SST39LF512	0x00D4
> @@ -1500,19 +1498,6 @@ static const struct amd_flash_info jedec_table[] =
=3D {
>  			ERASEINFO(0x1000,256)
>  		}
>  	}, {
> -		.mfr_id		=3D CFI_MFR_SST,     /* should be CFI */
> -		.dev_id		=3D SST39VF1601,
> -		.name		=3D "SST 39VF1601",
> -		.devtypes	=3D CFI_DEVICETYPE_X16,
> -		.uaddr		=3D MTD_UADDR_0xAAAA_0x5555,
> -		.dev_size	=3D SIZE_2MiB,
> -		.cmd_set	=3D P_ID_AMD_STD,
> -		.nr_regions	=3D 2,
> -		.regions	=3D {
> -			ERASEINFO(0x1000,256),
> -			ERASEINFO(0x1000,256)
> -		}
> -	}, {
>  		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
>  		.mfr_id		=3D CFI_MFR_SST,
>  		.dev_id		=3D SST39WF1601,
> @@ -1541,21 +1526,6 @@ static const struct amd_flash_info jedec_table[] =
=3D {
>  			ERASEINFO(0x1000,256)
>  		}
>  	}, {
> -		.mfr_id		=3D CFI_MFR_SST,     /* should be CFI */
> -		.dev_id		=3D SST39VF3201,
> -		.name		=3D "SST 39VF3201",
> -		.devtypes	=3D CFI_DEVICETYPE_X16,
> -		.uaddr		=3D MTD_UADDR_0xAAAA_0x5555,
> -		.dev_size	=3D SIZE_4MiB,
> -		.cmd_set	=3D P_ID_AMD_STD,
> -		.nr_regions	=3D 4,
> -		.regions	=3D {
> -			ERASEINFO(0x1000,256),
> -			ERASEINFO(0x1000,256),
> -			ERASEINFO(0x1000,256),
> -			ERASEINFO(0x1000,256)
> -		}
> -	}, {
>  		.mfr_id		=3D CFI_MFR_SST,
>  		.dev_id		=3D SST36VF3203,
>  		.name		=3D "SST 36VF3203",
>=20
> --=20
> Pengutronix e.K.                           | Wolfram Sang                |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |



> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkwE2QAACgkQD27XaX1/VRsgpQCeIdKqPiI4luOFQbw2gvFslz+T
6YIAoJ8dQmbc+xUGxg39ETOHDe8lutMf
=Ys5p
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
