From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ixp4xx: add support for static flash partitions
Date: Wed, 16 Jun 2010 01:59:08 +0200
References: <20100531162434.GA4599@riccoc20.at.omicron.at>
	<1276420566.19028.184.camel@localhost>
	<20100614161519.GB24877@riccoc20.at.omicron.at>
In-Reply-To: <20100614161519.GB24877@riccoc20.at.omicron.at>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201006160159.08491.marek.vasut@gmail.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Krzysztof Halasa <khc@pm.waw.pl>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dne Po 14. =C4=8Dervna 2010 18:15:19 Richard Cochran napsal(a):
> On Sun, Jun 13, 2010 at 12:16:06PM +0300, Artem Bityutskiy wrote:
> > I could fix your patch up myself, but I do not know the code, so please,
> > re-send a patch against the latest mtd-2.6 tree.
>=20
> Okay, here it is again, this time against today's master branch of
> git://git.infradead.org/mtd-2.6.git
>=20
> Thanks,
> Richard
>=20
>=20
> This patch adds support for static flash partitioning from a platform
> device. Also, we clean up some weirdness where statements were separated
> by commas instead of semicolons. While we are at it, fix some minor bad
> white space, too.
>=20
> Signed-off-by: Richard Cochran <richard.cochran@omicron.at>
> ---
>  drivers/mtd/maps/ixp4xx.c |   35 +++++++++++++++++++++++++++--------
>  1 files changed, 27 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
> index e0a5e04..1f9fde0 100644
> --- a/drivers/mtd/maps/ixp4xx.c
> +++ b/drivers/mtd/maps/ixp4xx.c
> @@ -118,7 +118,7 @@ static void ixp4xx_copy_from(struct map_info *map, vo=
id
> *to, *dest++ =3D BYTE1(data);
>  		src +=3D 2;
>  		len -=3D 2;
> -        }
> +	}
>=20
>  	if (len > 0)
>  		*dest++ =3D BYTE0(flash_read16(src));
> @@ -185,6 +185,8 @@ static int ixp4xx_flash_probe(struct platform_device
> *dev) {
>  	struct flash_platform_data *plat =3D dev->dev.platform_data;
>  	struct ixp4xx_flash_info *info;
> +	const char *part_type =3D NULL;
> +	int nr_parts =3D 0;
>  	int err =3D -1;
>=20
>  	if (!plat)
> @@ -218,9 +220,9 @@ static int ixp4xx_flash_probe(struct platform_device
> *dev) */
>  	info->map.bankwidth =3D 2;
>  	info->map.name =3D dev_name(&dev->dev);
> -	info->map.read =3D ixp4xx_read16,
> -	info->map.write =3D ixp4xx_probe_write16,
> -	info->map.copy_from =3D ixp4xx_copy_from,
> +	info->map.read =3D ixp4xx_read16;
> +	info->map.write =3D ixp4xx_probe_write16;
> +	info->map.copy_from =3D ixp4xx_copy_from;
>=20
>  	info->res =3D request_mem_region(dev->resource->start,
>  			resource_size(dev->resource),
> @@ -248,11 +250,28 @@ static int ixp4xx_flash_probe(struct platform_device
> *dev) info->mtd->owner =3D THIS_MODULE;
>=20
>  	/* Use the fast version */
> -	info->map.write =3D ixp4xx_write16,
> +	info->map.write =3D ixp4xx_write16;
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	nr_parts =3D parse_mtd_partitions(info->mtd, probes, &info->partitions,
> +					dev->resource->start);
> +#endif
> +	if (nr_parts > 0) {
> +		part_type =3D "dynamic";
> +	} else {
> +		info->partitions =3D plat->parts;
> +		nr_parts =3D plat->nr_parts;
> +		part_type =3D "static";
> +	}
> +	if (nr_parts =3D=3D 0) {
> +		printk(KERN_NOTICE "IXP4xx flash: no partition info "
> +			"available, registering whole flash\n");
> +		err =3D add_mtd_device(info->mtd);
> +	} else {
> +		printk(KERN_NOTICE "IXP4xx flash: using %s partition "
> +			"definition\n", part_type);
> +		err =3D add_mtd_partitions(info->mtd, info->partitions, nr_parts);
>=20
> -	err =3D parse_mtd_partitions(info->mtd, probes, &info->partitions,
> dev->resource->start); -	if (err > 0) {
> -		err =3D add_mtd_partitions(info->mtd, info->partitions, err);
>  		if(err)
>  			printk(KERN_ERR "Could not parse partitions\n");
>  	}


Maybe send the formating fixes in a separate patch. Thanks
