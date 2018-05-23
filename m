Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLYRE-0004MO-DS
 for linux-mtd@lists.infradead.org; Wed, 23 May 2018 18:24:42 +0000
Date: Wed, 23 May 2018 20:24:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] mtd: partitions: use DT info for parsing partitions
 with specified type
Message-ID: <20180523202408.632edefa@bbrezillon>
In-Reply-To: <20180523171448.26234-2-zajec5@gmail.com>
References: <20180523171448.26234-1-zajec5@gmail.com>
 <20180523171448.26234-2-zajec5@gmail.com>
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

On Wed, 23 May 2018 19:14:48 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This supports nested partitions in a DT. If selected partition has a
> "compatible" property specified it will be parsed looking for
> subpartitions.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/mtdpart.c | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index f8d3a015cdad..52e2cb35fc79 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -322,22 +322,6 @@ static inline void free_partition(struct mtd_part *p)
>  	kfree(p);
>  }
> =20
> -/**
> - * mtd_parse_part - parse MTD partition looking for subpartitions
> - *
> - * @slave: part that is supposed to be a container and should be parsed
> - * @types: NULL-terminated array with names of partition parsers to try
> - *
> - * Some partitions are kind of containers with extra subpartitions (volu=
mes).
> - * There can be various formats of such containers. This function tries =
to use
> - * specified parsers to analyze given partition and registers found
> - * subpartitions on success.
> - */
> -static int mtd_parse_part(struct mtd_part *slave, const char *const *typ=
es)
> -{
> -	return parse_mtd_partitions(&slave->mtd, types, NULL);
> -}
> -
>  static struct mtd_part *allocate_partition(struct mtd_info *parent,
>  			const struct mtd_partition *part, int partno,
>  			uint64_t cur_offset)
> @@ -735,8 +719,8 @@ int add_mtd_partitions(struct mtd_info *master,
> =20
>  		add_mtd_device(&slave->mtd);
>  		mtd_add_partition_attrs(slave);
> -		if (parts[i].types)
> -			mtd_parse_part(slave, parts[i].types);
> +		/* Look for subpartitions */
> +		parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);
> =20
>  		cur_offset =3D slave->offset + slave->mtd.size;
>  	}
> @@ -812,6 +796,12 @@ static const char * const default_mtd_part_types[] =
=3D {
>  	NULL
>  };
> =20
> +/* Check DT only when looking for subpartitions. */
> +static const char * const default_subpartition_types[] =3D {
> +	"ofpart",
> +	NULL
> +};
> +
>  static int mtd_part_do_parse(struct mtd_part_parser *parser,
>  			     struct mtd_info *master,
>  			     struct mtd_partitions *pparts,
> @@ -882,7 +872,9 @@ static int mtd_part_of_parse(struct mtd_info *master,
>  	const char *fixed =3D "fixed-partitions";
>  	int ret, err =3D 0;
> =20
> -	np =3D of_get_child_by_name(mtd_get_of_node(master), "partitions");
> +	np =3D mtd_get_of_node(master);
> +	if (!mtd_is_partition(master))
> +		np =3D of_get_child_by_name(np, "partitions");
>  	of_property_for_each_string(np, "compatible", prop, compat) {
>  		parser =3D mtd_part_get_compatible_parser(compat);
>  		if (!parser)
> @@ -945,7 +937,8 @@ int parse_mtd_partitions(struct mtd_info *master, con=
st char *const *types,
>  	int ret, err =3D 0;
> =20
>  	if (!types)
> -		types =3D default_mtd_part_types;
> +		types =3D mtd_is_partition(master) ? default_subpartition_types :
> +			default_mtd_part_types;

Hm, that means the subparts inherit the parser types from their parent
if types !=3D NULL? Is that really what we want? And if that's what we
want, why don't we do the same for types =3D=3D NULL?

> =20
>  	for ( ; *types; types++) {
>  		/*
