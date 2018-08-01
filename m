Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkqEM-000491-Fp
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 12:27:56 +0000
Date: Wed, 1 Aug 2018 14:27:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH] mtd: nand: use regmap_update_bits() in marvell_nand for
 syscon access
Message-ID: <20180801142741.66102538@xps13>
In-Reply-To: <20180801102505.18383-1-thomas.petazzoni@bootlin.com>
References: <20180801102505.18383-1-thomas.petazzoni@bootlin.com>
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

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Wed,  1 Aug
2018 12:25:05 +0200:

> The marvell_nfc_init() function fiddles with some bits of a system
> controller on Armada 7K/8K. However:
>=20
>  - It does a regmap_write() on GENCONF_SOC_DEVICE_MUX, potentially
>    losing other bits that might have been set by other drivers.

AFAIR, this was done on purpose. In the aim of being as independent as
possible from the earlier stages, we set here the full configuration of
register 0xF2440208 "SoC Device Multiplex Register". Bits are either
reserved or NAND controller related, nobody else is supposed to poke
here. I'm not sure using regmap_update_bits() here is relevant?

>  - It does a read/modify/write sequence on GENCONF_CLK_GATING_CTRL and
>    GENCONF_ND_CLK_CTRL, which isn't safe from a concurrency point of
>    view, as the regmap lock isn't taken accross the read/modify/write
>    sequence.

Yes, for this one I totally agree.

> To solve both issues, use regmap_update_bits().
>=20
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I think this a good candidate for stable if there is a v2, could you
please add the relevant tags? The problem is laying since:
02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")

> ---
> NOTE: This was only compile tested, and not runtime tested.
> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c
> index ebb1d141b900..742f2765b424 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2691,24 +2691,24 @@ static int marvell_nfc_init(struct marvell_nfc *n=
fc)
>  		struct regmap *sysctrl_base =3D
>  			syscon_regmap_lookup_by_phandle(np,
>  							"marvell,system-controller");
> -		u32 reg;
> +		u32 mask;
> =20
>  		if (IS_ERR(sysctrl_base))
>  			return PTR_ERR(sysctrl_base);
> =20
> -		reg =3D GENCONF_SOC_DEVICE_MUX_NFC_EN |
> -		      GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
> -		      GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
> -		      GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;
> -		regmap_write(sysctrl_base, GENCONF_SOC_DEVICE_MUX, reg);
> -
> -		regmap_read(sysctrl_base, GENCONF_CLK_GATING_CTRL, &reg);
> -		reg |=3D GENCONF_CLK_GATING_CTRL_ND_GATE;
> -		regmap_write(sysctrl_base, GENCONF_CLK_GATING_CTRL, reg);
> -
> -		regmap_read(sysctrl_base, GENCONF_ND_CLK_CTRL, &reg);
> -		reg |=3D GENCONF_ND_CLK_CTRL_EN;
> -		regmap_write(sysctrl_base, GENCONF_ND_CLK_CTRL, reg);
> +		mask =3D GENCONF_SOC_DEVICE_MUX_NFC_EN |
> +			GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
> +			GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
> +			GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;

Minor nit: indentation looks wrong here?

> +		regmap_update_bits(sysctrl_base, GENCONF_SOC_DEVICE_MUX,
> +				   mask, mask);
> +
> +		regmap_update_bits(sysctrl_base, GENCONF_CLK_GATING_CTRL,
> +				   GENCONF_CLK_GATING_CTRL_ND_GATE,
> +				   GENCONF_CLK_GATING_CTRL_ND_GATE);
> +		regmap_update_bits(sysctrl_base, GENCONF_ND_CLK_CTRL,
> +				   GENCONF_ND_CLK_CTRL_EN,
> +				   GENCONF_ND_CLK_CTRL_EN);
>  	}
> =20
>  	/* Configure the DMA if appropriate */


Thanks,
Miqu=C3=A8l
