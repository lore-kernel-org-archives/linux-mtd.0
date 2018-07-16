Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ff6Hf-0007cB-Tj
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 16:23:37 +0000
Date: Mon, 16 Jul 2018 18:23:12 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH RFC API ONLY] mtd: get parsers from lookup table
Message-ID: <20180716182312.74fc55a9@bbrezillon>
In-Reply-To: <20180716111712.7636-1-zajec5@gmail.com>
References: <20180716111712.7636-1-zajec5@gmail.com>
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

Hi Rafal,

On Mon, 16 Jul 2018 13:17:12 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Existing implementation of specifying flash device parsers became a bit
> hacky and needs a cleanup. Currently it requires:
> 1) Passing parsers in a custom platform data by arch code
> or
> 2) Hardcoding parsers table in a flash driver
>=20
> The purpose of the new implementation is to:
> 1) Clean up flash drivers
> 2) Have a generic solution
> 3) Avoid code duplication
>=20
> That new implementation assigns table of parsers to a MTD's parent
> device. That way flash driver doesn't have to take care of passing
> parsers. It's inspired by GPIO lookup table.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> It's obviously a RFC patch only. It doesn't really implement anything.
> It DOESN'T COMPILE.
>=20
> I'd like to know if you like this idea and if it's worth for me to
> actually spend time implementing it.

I love the idea. Actually, I'd like to extend that to fixed partition
definitions (those passed to mtd_device_register()) so that they can be
parsed by the fixed-partition parser (the one already taking care of
compatible =3D "fixed-partitions").

One comment below.

> ---
>  arch/arm/mach-pxa/corgi.c | 21 +++++++++++++--------
>  drivers/mtd/mtdpart.c     |  4 ++++
>  2 files changed, 17 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
> index 9a5a35e90769..0ff77e078d2b 100644
> --- a/arch/arm/mach-pxa/corgi.c
> +++ b/arch/arm/mach-pxa/corgi.c
> @@ -615,16 +615,8 @@ static struct nand_bbt_descr sharpsl_bbt =3D {
>  	.pattern =3D scan_ff_pattern
>  };
> =20
> -static const char * const probes[] =3D {
> -	"cmdlinepart",
> -	"ofpart",
> -	"sharpslpart",
> -	NULL,
> -};
> -
>  static struct sharpsl_nand_platform_data sharpsl_nand_platform_data =3D {
>  	.badblock_pattern	=3D &sharpsl_bbt,
> -	.part_parsers		=3D probes,
>  };
> =20
>  static struct resource sharpsl_nand_resources[] =3D {
> @@ -688,6 +680,16 @@ static struct i2c_board_info __initdata corgi_i2c_de=
vices[] =3D {
>  	{ I2C_BOARD_INFO("wm8731", 0x1b) },
>  };
> =20
> +static struct mtd_parser_lookup_table corgi_mtd_parser_lookup_table =3D {
> +	.dev_name =3D NULL, /* Set with registered name */

Can't you guess the device name? It's really weird that you have to
register the lookup table after the device has been registered. I
already had a similar discussion on GPIO lookup tables registration on
ams-delta here [1], and I think my comments apply to this case as well.

> +	.table =3D {
> +		{ .parser =3D "cmdlinepart" },
> +		{ .parser =3D "ofpart" },
> +		{ .parser =3D "sharpslpart" },
> +		{ },
> +	},
> +};
> +
>  static void corgi_poweroff(void)
>  {
>  	if (!machine_is_corgi())
> @@ -740,6 +742,9 @@ static void __init corgi_init(void)
> =20
>  	platform_add_devices(devices, ARRAY_SIZE(devices));
> =20
> +	corgi_mtd_parser_lookup_table.dev_name =3D dev_name(&sharpsl_nand_devic=
e.dev);
> +	mtd_parsers_add_lookup_table(corgi_mtd_parser_lookup_table);
> +
>  	regulator_has_full_constraints();
>  }
> =20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 52e2cb35fc79..0d96857a57d0 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -936,6 +936,10 @@ int parse_mtd_partitions(struct mtd_info *master, co=
nst char *const *types,
>  	struct mtd_part_parser *parser;
>  	int ret, err =3D 0;
> =20
> +	if (!types) {
> +		types =3D mtd_parsers_get(master->dev.parent);
> +	}
> +
>  	if (!types)
>  		types =3D mtd_is_partition(master) ? default_subpartition_types :
>  			default_mtd_part_types;

Regards,

Boris

[1]https://patchwork.ozlabs.org/patch/920798/
