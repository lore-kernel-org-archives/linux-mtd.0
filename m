Date: Sun, 19 Jun 2016 21:37:17 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: wens@csie.org, boris.brezillon@free-electrons.com, robh+dt@kernel.org,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] mtd: nand: sunxi: add reset line support
Message-ID: <20160619193717.GE26668@lukather>
References: <20160619161435.50404-1-icenowy@aosc.xyz>
 <20160619161435.50404-2-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Content-Disposition: inline
In-Reply-To: <20160619161435.50404-2-icenowy@aosc.xyz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 12:14:35AM +0800, Icenowy Zheng wrote:
> The NAND controller on some sun8i chips needs its reset line to be
> deasserted before they can enter working state.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v2:
>   - Corrected the error checking code of reset line.
>=20
> Changes in v3:
>   - Corrected a more serious error brought in the "fix" of v2.
>=20
> Changes in v4:
>   - Removed unneeded code block after "else".
>=20
> Changes in v5:
>   - Added reassertion code in case of initialization error and device
>     remove.
>=20
>  drivers/mtd/nand/sunxi_nand.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index a83a690..3b40186 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -39,6 +39,7 @@
>  #include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
> +#include <linux/reset.h>
> =20
>  #define NFC_REG_CTL		0x0000
>  #define NFC_REG_ST		0x0004
> @@ -269,6 +270,7 @@ struct sunxi_nfc {
>  	void __iomem *regs;
>  	struct clk *ahb_clk;
>  	struct clk *mod_clk;
> +	struct reset_control *reset;
>  	unsigned long assigned_cs;
>  	unsigned long clk_rate;
>  	struct list_head chips;
> @@ -1871,26 +1873,41 @@ static int sunxi_nfc_probe(struct platform_device=
 *pdev)
>  	if (ret)
>  		goto out_ahb_clk_unprepare;
> =20
> +	nfc->reset =3D devm_reset_control_get_optional(dev, "ahb");
> +
> +	if (!IS_ERR(nfc->reset)) {
> +		ret =3D reset_control_deassert(nfc->reset);
> +		if (ret) {
> +			dev_err(dev, "reset err %d\n", ret);
> +			goto out_mod_clk_unprepare;
> +		}
> +	} else if (PTR_ERR(nfc->reset) !=3D -ENOENT) {
> +		return PTR_ERR(nfc->reset);

You're leaking all the resources here. Please use a goto.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xA/XKXTdy9G3iaIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXZvRtAAoJEBx+YmzsjxAgMYcP/0+3/PRYjGFlTUOUDwdoVIul
KP5C29l0s1Uhub1qMkLl8a6/FnxLFhHYvEf52Y3iPWcRk8Xknx9e5i4/kgQHiidD
qqWiHIyF+ee93C3il33FqA3ThC+WZR2KteTO1HuEfKWezNtGjFQKHNtAtsbMlCsw
m+GKvgld9k4oQthSJ/GTuLkgrTPo5cKswIGLrn1B24OOUEXvYmI+3EnF6wV6H/XR
hMi1Gi2QuHq99YZ/CN9EVGMdHPax0RiJoBWT2xNLP2m+xf4enYKsqyajt0EdxJ9b
qQvzcvSJYSVl6/f4+cVQlSxNE7T+CoUcl8OlJwmngGk2/g79hzAJcBY9yfnnbpLI
ui14lTxe3868u6A/+at2oxDwoaF6ETalDdvBtgU5UjTOl/fxbaxzRt0L/RaTR9pu
bgBFIVCaM5g7ZY+dyLZP6ZOkOjucENxXZVDnhaWzVZkXu/jHbdGdYGXo9kgGTjNT
/B6b2DMbFBLPL4i3vpRAMsXD0P817zdhOB5zw0zL8DrQusPtCT18xtvulkiTRkZU
5+/RG5bedwQ62SaKIDjwkl+V21EV1QwFTcD65hf1oGZ97+voHWULPXnjTLM8t03O
yvMWtuNBZO0K8Qhm/KbYnK4Xsg+tzwC5m1E49wzWrTnanIlq3SSge6g/Esa78ffE
6m74yC8kiI17gIFm4UHB
=heub
-----END PGP SIGNATURE-----

--xA/XKXTdy9G3iaIz--
