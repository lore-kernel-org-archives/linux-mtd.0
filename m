Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrnoe-0000zB-9z
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 09:46:25 +0000
Date: Mon, 30 Jan 2012 10:46:10 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120130094610.GA15596@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <1327898174-13656-1-git-send-email-b32955@freescale.com>
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 12:36:14PM +0800, Huang Shijie wrote:
> add the BBT support to the gpmi nand driver.
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 493ec2f..4fbb341 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1493,6 +1493,7 @@ static int __devinit gpmi_nfc_init(struct gpmi_nand=
_data *this)
>  	chip->ecc.mode		=3D NAND_ECC_HW;
>  	chip->ecc.size		=3D 1;
>  	chip->ecc.layout	=3D &gpmi_hw_ecclayout;
> +	chip->bbt_options	=3D NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;

You are making this default. Is there a bootloader which supports that
on MXS?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8mZuIACgkQD27XaX1/VRtUCQCfSK5APstYQ5uATV93SJUVSEVo
q1QAn1kuYmsfVrzuGqyGCHXgIKzqlFKJ
=N2qi
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
