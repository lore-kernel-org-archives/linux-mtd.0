Date: Thu, 23 Jun 2016 18:01:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: maxime.ripard@free-electrons.com, wens@csie.org, robh+dt@kernel.org,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/2] mtd: nand: sunxi: add reset line support
Message-ID: <20160623180108.382bbaae@bbrezillon>
In-Reply-To: <20160620044838.56904-2-icenowy@aosc.xyz>
References: <20160620044838.56904-1-icenowy@aosc.xyz>
 <20160620044838.56904-2-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 20 Jun 2016 12:48:38 +0800
Icenowy Zheng <icenowy@aosc.xyz> wrote:

> The NAND controller on some sun8i chips needs its reset line to be
> deasserted before they can enter working state.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  =C2=A0Changes in v2:
>  =C2=A0=C2=A0=C2=A0- Corrected the error checking code of reset line.
>=20
>  =C2=A0Changes in v3:
>  =C2=A0=C2=A0=C2=A0- Corrected a more serious error brought in the "fix" =
of v2.
>=20
>  =C2=A0Changes in v4:
>  =C2=A0=C2=A0=C2=A0- Removed unneeded code block after "else".
>=20
>  =C2=A0Changes in v5:
>  =C2=A0=C2=A0=C2=A0- Added reassertion code in case of initialization err=
or and device
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0remove.
>=20
>   Changes in v6:
>     - Fixed a resource leak by not using goto to exit in case of error.
>=20
>  drivers/mtd/nand/sunxi_nand.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index a83a690..08d5e88 100644
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
> @@ -1871,26 +1873,42 @@ static int sunxi_nfc_probe(struct platform_device=
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
> +		ret =3D PTR_ERR(nfc->reset);

You should return -EDEFER_PROBE here.

And can you please rebase this series on top of nand/next [1]?

[1]https://github.com/linux-nand/linux/tree/nand/next
