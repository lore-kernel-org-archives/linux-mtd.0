Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0CO1-0001il-E8
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 19:32:36 +0000
Date: Mon, 17 Apr 2017 21:31:28 +0200
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
Subject: Re: [PATCH V4 2/3] mtd: add core code reading DT specified part probes
Message-ID: <20170417213128.0d56f033@bbrezillon>
In-Reply-To: <20170417182853.24281-2-zajec5@gmail.com>
References: <20170331114016.26858-1-zajec5@gmail.com>
 <20170417182853.24281-1-zajec5@gmail.com>
 <20170417182853.24281-2-zajec5@gmail.com>
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

On Mon, 17 Apr 2017 20:28:52 +0200
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
> V4: Rename of functions
>     Add comment to the of_get_mtd_part_probes
>     Simplify mtd_device_parse_register changes
>     Thanks Boris for help on all above!
> ---
>  drivers/mtd/mtdcore.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 66a9dedd1062..07b07de7e080 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -664,6 +664,33 @@ static void mtd_set_dev_defaults(struct mtd_info *mt=
d)
>  	}
>  }
> =20
> +static const char * const *of_get_mtd_part_probes(struct device_node *np)
> +{
> +	const char **res;
> +	int count;
> +
> +	count =3D of_property_count_strings(np, "linux,part-probe");
> +	if (count < 0)
> +		return NULL;
> +
> +	/* This looks common: consider helper function if copying */
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
> +static void of_free_mtd_part_probes(const char * const *probes)
> +{
> +	kfree(probes);
> +}
> +
>  /**
>   * mtd_device_parse_register - parse partitions and register an MTD devi=
ce.
>   *
> @@ -698,11 +725,16 @@ int mtd_device_parse_register(struct mtd_info *mtd,=
 const char * const *types,
>  			      const struct mtd_partition *parts,
>  			      int nr_parts)
>  {
> +	const char * const *part_probe_types;

One last thing: can we rename this variable of_part_probe_types?

With this addressed,

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

>  	struct mtd_partitions parsed;
>  	int ret;
> =20
>  	mtd_set_dev_defaults(mtd);
> =20
> +	part_probe_types =3D of_get_mtd_part_probes(mtd_get_of_node(mtd));
> +	if (part_probe_types)
> +		types =3D part_probe_types;
> +
>  	memset(&parsed, 0, sizeof(parsed));
> =20
>  	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
> @@ -720,6 +752,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, c=
onst char * const *types,
>  		memset(&parsed, 0, sizeof(parsed));
>  	}
> =20
> +	of_free_mtd_part_probes(part_probe_types);
> +
>  	ret =3D mtd_add_device_partitions(mtd, &parsed);
>  	if (ret)
>  		goto out;
