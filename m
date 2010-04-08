Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NznZq-0004Pg-32
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 08:59:07 +0000
Date: Thu, 8 Apr 2010 10:59:02 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 1/7] mtd: cfi_probe: enter Auto Select Mode after
	filling cfi->cfiq members
Message-ID: <20100408085902.GB21805@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
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


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guillaume,

thanks for this patch series! I will test it right away.
A few comments/questions after having a look at the code:

On Tue, Mar 30, 2010 at 03:34:48PM +0200, Guillaume LECERF wrote:
> Move the code to enter Auto Select Mode down to be able to use cfi->cfiq
> members to add support for chips using alternative sequence / unlock
> addresses.
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_probe.c |   46 +++++++++++++++++++++--------------=
------
>  1 files changed, 23 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index e63e674..9b511ef 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -181,29 +181,6 @@ static int __xipram cfi_chip_setup(struct map_info *=
map,
>  	for (i=3D0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
>  		((unsigned char *)cfi->cfiq)[i] =3D cfi_read_query(map,base + (0x10 + =
i)*ofs_factor);
> =20
> -	/* Note we put the device back into Read Mode BEFORE going into Auto
> -	 * Select Mode, as some devices support nesting of modes, others
> -	 * don't. This way should always work.
> -	 * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
> -	 * so should be treated as nops or illegal (and so put the device
> -	 * back into Read Mode, which is a nop in this case).
> -	 */
> -	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
> -	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
> -	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
> -	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
> -	cfi->mfr =3D cfi_read_query16(map, base);
> -	cfi->id =3D cfi_read_query16(map, base + ofs_factor);
> -
> -	/* Get AMD/Spansion extended JEDEC ID */
> -	if (cfi->mfr =3D=3D CFI_MFR_AMD && (cfi->id & 0xff) =3D=3D 0x7e)
> -		cfi->id =3D cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
> -			  cfi_read_query(map, base + 0xf * ofs_factor);
> -
> -	/* Put it back into Read Mode */
> -	cfi_qry_mode_off(base, map, cfi);
> -	xip_allowed(base, map);
> -
>  	/* Do any necessary byteswapping */
>  	cfi->cfiq->P_ID =3D le16_to_cpu(cfi->cfiq->P_ID);
> =20
> @@ -228,6 +205,29 @@ static int __xipram cfi_chip_setup(struct map_info *=
map,
>  #endif
>  	}
> =20
> +	/* Note we put the device back into Read Mode BEFORE going into Auto
> +	 * Select Mode, as some devices support nesting of modes, others
> +	 * don't. This way should always work.
> +	 * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
> +	 * so should be treated as nops or illegal (and so put the device
> +	 * back into Read Mode, which is a nop in this case).
> +	 */

Very minor: If you touch this code anyhow, maybe you could adapt it to
standard kernel-multiline comments?

> +	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
> +	cfi->mfr =3D cfi_read_query16(map, base);
> +	cfi->id =3D cfi_read_query16(map, base + ofs_factor);
> +
> +	/* Get AMD/Spansion extended JEDEC ID */
> +	if (cfi->mfr =3D=3D CFI_MFR_AMD && (cfi->id & 0xff) =3D=3D 0x7e)
> +		cfi->id =3D cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
> +			  cfi_read_query(map, base + 0xf * ofs_factor);
> +
> +	/* Put it back into Read Mode */
> +	cfi_qry_mode_off(base, map, cfi);
> +	xip_allowed(base, map);
> +
>  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
>  	       map->name, cfi->interleave, cfi->device_type*8, base,
>  	       map->bankwidth*8);
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAku9mtYACgkQD27XaX1/VRs71gCfXkIxvfdJONZKvOiZu4qVaLHT
AY4AnRMSFpZDjmOYfwZq6Yj89cEJ6yBr
=6Yb3
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
