Message-ID: <1345811288.2848.308.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mxc_nand : allow swapping the Bad block Indicator
 for NFC v1.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Ga=EBtan?= Carlier <gcembed@gmail.com>
Date: Fri, 24 Aug 2012 15:28:08 +0300
In-Reply-To: <1345035872-11314-1-git-send-email-gcembed@gmail.com>
References: <1345035872-11314-1-git-send-email-gcembed@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NrrI3bEbKTE3WmdQgWZw"
Mime-Version: 1.0
Cc: Russell King <linux@arm.linux.org.uk>, J.Lambrecht@TELEVIC.com,
 linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-NrrI3bEbKTE3WmdQgWZw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2012-08-15 at 15:04 +0200, Ga=C3=ABtan Carlier wrote:
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 3f94e1f..7f5847a 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -682,6 +682,26 @@ static int mxc_nand_calculate_ecc(struct mtd_info *m=
td, const u_char *dat,
>  	return 0;
>  }
> =20
> +/*
> + * Swap the BI-byte on position 0x7D0 with a data byte at 0x835.
> + * To fix a bug in NFC v1 SoC's for 2K page NAND flashes: imx27 and imx3=
1.
> + * Warning: The same solution needs to be applied to the boot loader and=
 the
> + * flash programmer.
> + */
> +static void imx_bi_swap(struct mtd_info *mtd)

Could you please name the function 'nfcv1_bi_swap_quirk()' or something
like this, to make it clear that this is a work-around.

> +{
> +	struct nand_chip *nand_chip =3D mtd->priv;
> +	struct mxc_nand_host *host =3D nand_chip->priv;
> +	unsigned short temp1, temp2, new_temp1;
> +
> +	temp1 =3D *((volatile unsigned short*)(host->main_area0 + 0x7D0));
> +	temp2 =3D *((volatile unsigned short*)(host->main_area0 + 0x834));
> +	new_temp1 =3D (temp1 & 0xFF00) | (temp2 >> 8);
> +	temp2 =3D (temp2 & 0x00FF) | (temp1 << 8);
> +	*((volatile unsigned short*)(host->main_area0 + 0x7D0)) =3D new_temp1;
> +	*((volatile unsigned short*)(host->main_area0 + 0x834)) =3D temp2;

Within the linux kernel all the I/O memory accesses should be done using
accessor functions, not directly.

--=20
Best Regards,
Artem Bityutskiy

--=-NrrI3bEbKTE3WmdQgWZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN3NYAAoJECmIfjd9wqK035UP/RnTKHYpD0IMlWYHic/iomgC
xvHDv++CGEERbIS7z6XfIQ/cpw0xvHk3Ekfb6YHzGDSMGJ5T5wDctCSRqcVf3YWK
Mbn1LZidkPxZfABO5KchJx22J+eN4qtpzVrbMyDwtuonU7J6j+wz19ywv8Mbwkkg
a7WHAMmcaPzV1+mTcIHJgTLoUBq3JYEMp1ErX8zHGXdEhtiJMAr7ixlmjVcvZH8p
rIQ/zO+9uqauEzwUwT7Bb5+fl9CkxEOUqXxaJLHhqK8pZ0EYKzedMt+KDDalTgzp
D0hAKHS58UK8+iX/hdsgvo1yKopJdqjO12trZ8vzAH1ZYt5Tswk47BQOIAtldrbc
Dyr8SEyVjalPYXix97CxYbT4OnieEhBkC6uKQq0FTd6uMugmYY7+Us7CtIZzmpB9
VOxHfxDhicWioA649H420/gJ2DZLh3DNFelYueflmehOnDuukdnXkUPr9HJ6j6++
Kk+Apy3ef6dIOS92fvnvQfF1omqdnS7Bz/VUNqALCYzhKUpcHIkZ+h2w/MJjW1He
NQpus0y8BGCiF5YbFMvNcVf/bZmaLEArvFk5nc/kD/xFz5Ii3mPUR4Hhfp3ZP7Eo
Gac5+3eamabCanMLkqyBrbHwfD08p9l6WQLDwqWqFTWAYWXP84I2mki/xeL2Dtxa
67Bd/mUtr+4odNA1qwUH
=JnHS
-----END PGP SIGNATURE-----

--=-NrrI3bEbKTE3WmdQgWZw--
