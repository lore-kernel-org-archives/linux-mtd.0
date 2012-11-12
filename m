Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXwUo-0003sZ-Qr
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 16:04:24 +0000
Message-ID: <1352736296.2262.25.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Date: Mon, 12 Nov 2012 18:04:56 +0200
In-Reply-To: <507DD09C.6050600@gmail.com>
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
 <1349954577.12014.13.camel@sauron.fi.intel.com>
 <507DD09C.6050600@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UYsBgtWnotx2DlS3NxYn"
Mime-Version: 1.0
Cc: arnd@arndb.de, dmanna@micron.com, lporzio@micron.com,
 linux-mtd@lists.infradead.org, valibert@micron.com, svenkatr@ti.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UYsBgtWnotx2DlS3NxYn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-16 at 23:24 +0200, Vincenzo Aliberti wrote:
> +/*
> + * Internal Type Definitions
> + * pcm_int_data contains memory controller details:
> + * @reg_data : LPDDR2_MODE_REG_DATA register address after remapping
> + * @reg_cfg  : LPDDR2_MODE_REG_CFG register address after remapping
> + * &bus_width: memory bus-width (eg: x16 2 Bytes, x32 4 Bytes)
> + */
> +struct pcm_int_data {
> +	void __iomem *reg_data;
> +	void __iomem *reg_cfg;
> +	int bus_width;
> +};
> +
> +static DEFINE_MUTEX(lpdd2_nvm_mutex);

A global mutes? So if you have 2 independent PCM chips handled by this
driver, the access to them will be mutually excluded?

> +
> +static inline map_word build_map_word(u_long myword)
> +{
> +	map_word val =3D { {0} };
> +	val.x[0] =3D myword;
> +	return val;
> +}
> +
> +static inline u_int build_mr_cfgmaks(u_int bus_width)
> +{
> +	u_int val =3D MR_CFGMASK;
> +
> +	if (bus_width =3D=3D 0x0004)		/* x32 device */
> +		val =3D val<<16;
> +
> +	return val;
> +}
> +
> +static inline u_int build_sr_ok_datamask(u_int bus_width)
> +{
> +	u_int val =3D SR_OK_DATAMASK;
> +
> +	if (bus_width =3D=3D 0x0004)		/* x32 device */
> +		val =3D (val<<16)+val;
> +
> +	return val;
> +}

How about adding some comments about what the functions above do?

> +
> +/*
> + * Enable lpddr2-nvm Overlay Window
> + */

How about a short comment explaining what is the Overlay Window?

> +static int lpddr2_nvm_do_op(struct map_info *map, u_long cmd_code,
> +	u_long cmd_data, u_long cmd_add, u_long cmd_mpr, u_char *buf)
> +{
> +	map_word add_l =3D { {0} }, add_h =3D { {0} }, mpr_l =3D { {0} },
> +		mpr_h =3D { {0} }, data_l =3D { {0} }, cmd =3D { {0} },
> +		exec_cmd =3D { {0} }, sr;
> +	map_word data_h =3D { {0} };	/* only for 2x x16 devices stacked */
> +	u_long i, status_reg, prg_buff_ofs;
> +	struct pcm_int_data *pcm_data =3D map->fldrv_priv;
> +	u_int sr_ok_datamask =3D build_sr_ok_datamask(pcm_data->bus_width);
> +
> +	/* Builds low and high words for OW Control Registers */
> +	add_l.x[0]	=3D cmd_add&0x0000FFFF;
> +	add_h.x[0]	=3D (cmd_add>>16)&0x0000FFFF;
> +	mpr_l.x[0]	=3D cmd_mpr&0x0000FFFF;
> +	mpr_h.x[0]	=3D (cmd_mpr>>16)&0x0000FFFF;
> +	cmd.x[0]	=3D cmd_code&0x0000FFFF;
> +	exec_cmd.x[0]	=3D 0x0001;
> +	data_l.x[0]	=3D cmd_data&0x0000FFFF;
> +	data_h.x[0]	=3D (cmd_data>>16)&0x0000FFFF; /* only for 2x x16 */
> +
> +	/* Set Overlay Window Control Registers */
> +	map_write(map, cmd, map->pfow_base+CMD_CODE_OFS*pcm_data->bus_width);
> +	map_write(map, data_l, map->pfow_base+CMD_DATA_OFS*pcm_data->bus_width)=
;
> +	map_write(map, add_l, map->pfow_base+CMD_ADD_L_OFS*pcm_data->bus_width)=
;
> +	map_write(map, add_h, map->pfow_base+CMD_ADD_H_OFS*pcm_data->bus_width)=
;
> +	map_write(map, mpr_l, map->pfow_base+MPR_L_OFS*pcm_data->bus_width);
> +	map_write(map, mpr_h, map->pfow_base+MPR_H_OFS*pcm_data->bus_width);

How about introducing a small helper inline unction for

map->pfow_base+ X * pcm_data->bus_width

It is repeated everywhere and makes driver difficult to follow, no?

Also, see the coding style about how to place spaces correctly. Make
sure checkpatch.pl is happy or almost happy (sometimes you should ignore
its complaints, they and not always correct).


--=20
Best Regards,
Artem Bityutskiy

--=-UYsBgtWnotx2DlS3NxYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoR4oAAoJECmIfjd9wqK0704P/12fA8R2X2AfuVdACZ2sYY+B
XwbpIaOud2OhS+LLoZJLmWW0d0T6SZW/dGGmozjg8oWsdRnFhr9BFpM5u9yxJK9J
Af4Cl+Iq5VJJo5HQ79uZAddEeD9/iXJ4rG8KARxmEolD/C1CG+R82cFN2wWPhiMC
zTJdJq2T/dGjkdb3zBNrSVQnj1jCeUP5LfYkBuYGlVasd3kw7oVsaZ0UYM5rXj/N
b3f+v4zchdVhABTLtNC5A933jMaMJJFCUDW3sGVb0HPLIElAQ4paVzPn1qxfMlMg
lCaSJdmLZIvMt/31nWyqAw7MFidrxs3bPtXQiROdE7VNBk+O6aUcKrB/APATNHHP
AjeXX4AlmfVmz1lZPHm0M19wPfUvUrSSLLvTE9OKsyWzgQt3IIpBq2k1LscpSwrJ
A1rL/sGjlARV7IvwntmwyioO3+yNakAgeXMx1vwKtRSzHK80tgLCZcxpRykoZlBo
P8N5kcuJzOcZ9lTSUlT8GLk2djy5npxMK5qyxJVrtnpJ1JeNKxfMJDbd/+EdP2EE
1epZ5q77YR70jcs8hsuO7gqYQx7qEgnPXC18dRtQYrOkoaV5Q7dzamFWCEOquyB0
l+ghlXkCgCRNNOSQz1W7F9t61u8YGVDik3qHkQIlFNo4q1bguY4NEy3Ng/TQszNA
8TJcxaJeyRRkvszpcNMR
=HMCI
-----END PGP SIGNATURE-----

--=-UYsBgtWnotx2DlS3NxYn--
