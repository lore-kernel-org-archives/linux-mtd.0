Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxAe6-0008SP-G1
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 11:04:40 +0000
Date: Sun, 9 Apr 2017 13:04:06 +0200
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
Subject: Re: [PATCH V3 2/3] mtd: add core code reading DT specified part probes
Message-ID: <20170409130406.564802a4@bbrezillon>
In-Reply-To: <20170331114016.26858-2-zajec5@gmail.com>
References: <20170331114016.26858-1-zajec5@gmail.com>
 <20170331114016.26858-2-zajec5@gmail.com>
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

On Fri, 31 Mar 2017 13:40:15 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Handling (creating) partitions for flash devices requires using a proper
> driver that will read partition table (out of somewhere). We can't
> simply try all existing drivers one by one:
> 1) It would increase boot time
> 2) The order could be a problem
> 3) In some corner cases parsers could misinterpret some data as a table
> Due to this MTD subsystem allows drivers to specify a list of applicable
> part probes.
>=20
> So far physmap_of was the only driver with support for linux,part-probe
> DT property. Other ones had list or probes hardcoded which wasn't making
> them really flexible. It prevented using common flash drivers on
> platforms that required some specific partition table access.
>=20
> This commit adds support for mentioned DT property directly to the MTD
> core. It's a rewritten implementation of physmap_of's code and it makes
> original code obsolete. Thanks to calling it on device parse
> registration (as suggested by Boris) all drivers gain support for it for
> free.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/mtdcore.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 66a9dedd1062..917def28c756 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -664,6 +664,32 @@ static void mtd_set_dev_defaults(struct mtd_info *mt=
d)
>  	}
>  }
> =20
> +static const char * const *mtd_of_get_probes(struct device_node *np)

To be consistent with NAND DT helpers, can you put the of_get_ prefix
at the beginning: of_get_mtd_probes().
And get_probes() is a bit too generic IMHO, how about
of_get_mtd_part_probes() (or any other name clearly showing that this
is about partition parsers/probes).

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

Drop the inline, the compiler is smart enough to decide by itself.

> +{
> +	kfree(probes);
> +}

This is not really DT specific, and we might want to extract the list
of probes by other means in the future (cmdline, ACPI?).

How about declaring these 2 functions:

static char **mtd_alloc_part_type_table(int nentries)
{
	return kzalloc((nentries + 1) * sizeof(*res), GFP_KERNEL);
}

static void mtd_free_part_type_table(const char * const *table)
{
	kfree(table);
}

You can then use mtd_alloc_part_type_table() in
of_get_mtd_part_probes() to allocate your partition type table.

> +
>  /**
>   * mtd_device_parse_register - parse partitions and register an MTD devi=
ce.
>   *
> @@ -698,14 +724,19 @@ int mtd_device_parse_register(struct mtd_info *mtd,=
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

How about doing it the other way around:

	if (part_probe_types)
		types =3D part_probe_types;

>  	memset(&parsed, 0, sizeof(parsed));
> =20
> -	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
> +	ret =3D parse_mtd_partitions(mtd, part_probe_types, &parsed, parser_dat=
a);

this way you don't need this change

>  	if ((ret < 0 || parsed.nr_parts =3D=3D 0) && parts && nr_parts) {
>  		/* Fall back to driver-provided partitions */
>  		parsed =3D (struct mtd_partitions){
> @@ -720,6 +751,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, c=
onst char * const *types,
>  		memset(&parsed, 0, sizeof(parsed));
>  	}
> =20
> +	if (part_probe_types !=3D types)
> +		mtd_of_free_probes(part_probe_types);

and here you simply have:

	mtd_of_free_probes(part_probe_types);


> +
>  	ret =3D mtd_add_device_partitions(mtd, &parsed);
>  	if (ret)
>  		goto out;
