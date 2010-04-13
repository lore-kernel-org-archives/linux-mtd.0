Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O1UaA-0000P9-8k
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2010 01:06:27 +0000
Date: Tue, 13 Apr 2010 03:06:17 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Alexander Kurz <linux@blala.de>
Subject: Re: [PATCH 2/2] drivers/mtd/maps/pcmciamtd.c: coding style cleanups
Message-ID: <20100413010617.GD8978@pengutronix.de>
References: <alpine.DEB.1.10.1004121949570.7438@blala.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.10.1004121949570.7438@blala.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-pcmcia@lists.infradead.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Magnus Damm <damm@opensource.se>, linux-mtd@lists.infradead.org,
	Karsten Keil <keil@b1-systems.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2010 at 07:51:12PM +0400, Alexander Kurz wrote:
> From df0e6529165643058e87595f40258a08bc01fec5 Mon Sep 17 00:00:00 2001
> From: Alexander Kurz <linux@kbdbabel.org>
> Date: Sun, 11 Apr 2010 23:07:19 +0200
> Subject: [PATCH 2/2] drivers/mtd/maps/pcmciamtd.c: coding style cleanups
>=20
> Signed-off-by: Alexander Kurz <linux@kbdbabel.org>
> ---
>  drivers/mtd/maps/pcmciamtd.c |   55 +++++++++++++++++++++++++-----------=
-----
>  1 files changed, 33 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
> index 2dbe939..0db1ac4 100644
> --- a/drivers/mtd/maps/pcmciamtd.c
> +++ b/drivers/mtd/maps/pcmciamtd.c
> @@ -40,10 +40,7 @@ MODULE_PARM_DESC(debug, "Set Debug Level 0=3Dquiet, 5=
=3Dnoisy");
>  static const int debug =3D 0;
>  #endif
> =20
> -#define err(format, arg...) printk(KERN_ERR "pcmciamtd: " format "\n" , =
## arg)
>  #define info(format, arg...) printk(KERN_INFO "pcmciamtd: " format "\n" =
, ## arg)
> -#define warn(format, arg...) printk(KERN_WARNING "pcmciamtd: " format "\=
n" , ## arg)
> -
> =20
>  #define DRIVER_DESC	"PCMCIA Flash memory card driver"
> =20
> @@ -100,7 +97,9 @@ module_param(mem_type, int, 0);
>  MODULE_PARM_DESC(mem_type, "Set Memory type (0=3DFlash, 1=3DRAM, 2=3DROM=
, default=3D0)");
> =20
> =20
> -/* read/write{8,16} copy_{from,to} routines with window remapping to acc=
ess whole card */
> +/* read/write{8,16} copy_{from,to} routines with window remapping
> + * to access whole card
> + */

When you are touching these anyway: CodingStyle suggests

	/*
	 * Multi
	 * line comment
	 */

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvDw4kACgkQD27XaX1/VRu3HACgmSx86r6pvW8FntkOYfkwO3ik
xKIAn34oAvWRtQPvPqI/fXYRzx/xxJZu
=Fl2x
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
