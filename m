Date: Thu, 17 Aug 2017 15:04:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: physmap_of: Retire Gemini pad control
Message-ID: <20170817150408.79d16349@bbrezillon>
In-Reply-To: <20170808190510.11496-1-linus.walleij@linaro.org>
References: <20170808190510.11496-1-linus.walleij@linaro.org>
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

Le Tue,  8 Aug 2017 21:05:10 +0200,
Linus Walleij <linus.walleij@linaro.org> a =C3=A9crit :

> I wrote a proper pin control driver for the Gemini. Retire this
> SoC-specific pad control and rely on the pin controller to manage
> this.
>=20

Applied to l2-mtd/master.

Thanks,

Boris

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/maps/physmap_of_gemini.c | 16 ----------------
>  1 file changed, 16 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/physmap_of_gemini.c b/drivers/mtd/maps/phys=
map_of_gemini.c
> index 05b286b5289f..4ed1a6bb4d3c 100644
> --- a/drivers/mtd/maps/physmap_of_gemini.c
> +++ b/drivers/mtd/maps/physmap_of_gemini.c
> @@ -43,13 +43,6 @@
> =20
>  #define FLASH_PARALLEL_HIGH_PIN_CNT	(1 << 20)	/* else low pin cnt */
> =20
> -/* Miscellaneous Control Register */
> -#define GLOBAL_MISC_CTRL		0x30
> -#define FLASH_PADS_MASK			0x07
> -#define NAND_PADS_DISABLE		BIT(2)
> -#define PFLASH_PADS_DISABLE		BIT(1)
> -#define SFLASH_PADS_DISABLE		BIT(0)
> -
>  static const struct of_device_id syscon_match[] =3D {
>  	{ .compatible =3D "cortina,gemini-syscon" },
>  	{ },
> @@ -102,15 +95,6 @@ int of_flash_probe_gemini(struct platform_device *pde=
v,
>  				 map->bankwidth * 8);
>  	}
> =20
> -	/* Activate parallel (NOR flash) mode */
> -	ret =3D regmap_update_bits(rmap, GLOBAL_MISC_CTRL,
> -				 FLASH_PADS_MASK,
> -				 SFLASH_PADS_DISABLE | NAND_PADS_DISABLE);
> -	if (ret) {
> -		dev_err(dev, "unable to set up physmap pads\n");
> -		return -ENODEV;
> -	}
> -
>  	dev_info(&pdev->dev, "initialized Gemini-specific physmap control\n");
> =20
>  	return 0;
