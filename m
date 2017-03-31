Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cttIx-0006iq-Sc
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 09:57:17 +0000
Date: Fri, 31 Mar 2017 11:56:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] mtd: move code reading DT specified part probes
 to the core
Message-ID: <20170331115654.41592eba@bbrezillon>
In-Reply-To: <20170331093013.29123-1-zajec5@gmail.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170331093013.29123-1-zajec5@gmail.com>
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

On Fri, 31 Mar 2017 11:30:12 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Handling (creating) partitions for flash devices requires using a proper
> driver that will read partition table (out of somewhere). We can't
> simply try all existing drivers one by one, so MTD subsystem allows
> drivers to specify a list of applicable part probes.
>=20
> So far physmap_of was the only driver with support for linux,part-probe
> DT property. Other ones had list or probes hardcoded which wasn't making
> them really flexible. It prevented using common flash drivers on
> platforms that required some specific partition table access.
>=20
> This commit moves support for mentioned DT property to the MTD core
> file. Thanks to calling it on device parse registration (as suggested by
> Boris) all drivers gain support for it for free.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/maps/physmap_of.c | 36 +-----------------------------------
>  drivers/mtd/mtdcore.c         | 34 ++++++++++++++++++++++++++++++++++

Maybe you should split the patch:
1/ add core infrastructure
2/ remove open-coded version in drivers/mtd/maps/physmap_of.c

BTW, not sure the intermediate "mtd: physmap_of: use OF helpers
for reading strings" patch is really useful, since you move to the
common infrastructure here.
By following my suggestion you get rid of the dependency you have
between this series and patch "mtd: physmap_of: use OF helpers for
reading strings".

>  2 files changed, 35 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 62fa6836f218..49dbb7235848 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -114,37 +114,9 @@ static struct mtd_info *obsolete_probe(struct platfo=
rm_device *dev,
>  static const char * const part_probe_types_def[] =3D {
>  	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
> =20
> -static const char * const *of_get_probes(struct device_node *dp)
> -{
> -	const char **res;
> -	int count;
> -
> -	count =3D of_property_count_strings(dp, "linux,part-probe");
> -	if (count < 0)
> -		return part_probe_types_def;
> -
> -	res =3D kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
> -	if (!res)
> -		return NULL;
> -
> -	count =3D of_property_read_string_array(dp, "linux,part-probe", res,
> -					      count);
> -	if (count < 0)
> -		return NULL;
> -
> -	return res;
> -}
> -
> -static void of_free_probes(const char * const *probes)
> -{
> -	if (probes !=3D part_probe_types_def)
> -		kfree(probes);
> -}
> -
>  static const struct of_device_id of_flash_match[];
>  static int of_flash_probe(struct platform_device *dev)
>  {
> -	const char * const *part_probe_types;
>  	const struct of_device_id *match;
>  	struct device_node *dp =3D dev->dev.of_node;
>  	struct resource res;
> @@ -310,14 +282,8 @@ static int of_flash_probe(struct platform_device *de=
v)
> =20
>  	info->cmtd->dev.parent =3D &dev->dev;
>  	mtd_set_of_node(info->cmtd, dp);
> -	part_probe_types =3D of_get_probes(dp);
> -	if (!part_probe_types) {
> -		err =3D -ENOMEM;
> -		goto err_out;
> -	}
> -	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
> +	mtd_device_parse_register(info->cmtd, part_probe_types_def, NULL,
>  			NULL, 0);
> -	of_free_probes(part_probe_types);
> =20
>  	kfree(mtd_list);
> =20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 66a9dedd1062..a7ab0a24ba1e 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -664,6 +664,32 @@ static void mtd_set_dev_defaults(struct mtd_info *mt=
d)
>  	}
>  }
> =20
> +static const char * const *mtd_of_get_probes(struct device_node *np)
> +{
> +	const char **res;
> +	int count;
> +
> +	count =3D of_property_count_strings(np, "linux,part-probe");
> +	if (count < 0)
> +		return NULL;
> +
> +	res =3D kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		return NULL;
> +
> +	count =3D of_property_read_string_array(np, "linux,part-probe", res,
> +					      count);
> +	if (count < 0)
> +		return NULL;
> +
> +	return res;
> +}
> +
> +static inline void mtd_of_free_probes(const char * const *probes)
> +{
> +	kfree(probes);
> +}
> +
>  /**
>   * mtd_device_parse_register - parse partitions and register an MTD devi=
ce.
>   *
> @@ -698,11 +724,16 @@ int mtd_device_parse_register(struct mtd_info *mtd,=
 const char * const *types,
>  			      const struct mtd_partition *parts,
>  			      int nr_parts)
>  {
> +	const char * const *part_probe_types;
>  	struct mtd_partitions parsed;
>  	int ret;
> =20
>  	mtd_set_dev_defaults(mtd);
> =20
> +	part_probe_types =3D mtd_of_get_probes(mtd_get_of_node(mtd));
> +	if (!part_probe_types)
> +		part_probe_types =3D types;
> +
>  	memset(&parsed, 0, sizeof(parsed));
> =20
>  	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
> @@ -720,6 +751,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, c=
onst char * const *types,
>  		memset(&parsed, 0, sizeof(parsed));
>  	}
> =20
> +	if (part_probe_types !=3D types)
> +		mtd_of_free_probes(part_probe_types);
> +
>  	ret =3D mtd_add_device_partitions(mtd, &parsed);
>  	if (ret)
>  		goto out;
