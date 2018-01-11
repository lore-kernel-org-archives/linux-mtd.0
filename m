Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZYnu-0001yN-Mc
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 09:05:49 +0000
Date: Thu, 11 Jan 2018 10:04:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
 <linus.walleij@linaro.org>, John Crispin <john@phrozen.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Frank Rowand
 <frowand.list@gmail.com>
Subject: Re: [PATCH V7 1/2] mtd: partitions: add of_match_table parser matching
Message-ID: <20180111100438.281db30a@bbrezillon>
In-Reply-To: <20180104070534.16248-1-zajec5@gmail.com>
References: <20180103105543.17897-1-zajec5@gmail.com>
 <20180104070534.16248-1-zajec5@gmail.com>
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

On Thu,  4 Jan 2018 08:05:33 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Brian Norris <computersforpeace@gmail.com>
>=20
> Partition parsers can now provide an of_match_table to enable
> flash<-->parser matching via device tree as documented in the
> mtd/partition.txt.
>=20
> It works by looking for a matching parser for every string in the
> "compatibility" property (starting with the most specific one).
>=20
> This support is currently limited to built-in parsers as it uses
> request_module() and friends. This should be sufficient for most cases
> though as compiling parsers as modules isn't a common choice.
>=20

Applied both patches.

Thanks,

Boris

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> This is based on Brian's patches:
> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parse=
r() helpers
> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
>=20
> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
>     Merge helpers into a single of_mtd_match_mtd_parser
> V3: Add a simple comment to note we will need the best match in the future
> V4: Rework new functions to pick parser with the best match
>     Move new code in parse_mtd_partitions up so it has precedence over fl=
ash
>     driver defaults and MTD defaults
> V5: Rework matching code to start checking with the most specific string =
in the
>     "compatibility" property.
> V6: Initialize "ret" variable in mtd_part_get_parser_by_cp to NULL
> V7: Rename function "mtd_part_get_parser_by_cp" to use "_compatible_"
>     Rename "cp" variable to "compat"
>     Drop unneeded if (np) check from the parse_mtd_partitions
> ---
>  drivers/mtd/mtdpart.c          | 59 ++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mtd/partitions.h |  1 +
>  2 files changed, 60 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index be088bccd593..76e12fb81563 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -30,6 +30,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
> =20
>  #include "mtdcore.h"
> =20
> @@ -880,6 +881,45 @@ static int mtd_part_do_parse(struct mtd_part_parser =
*parser,
>  }
> =20
>  /**
> + * mtd_part_get_compatible_parser - find MTD parser by a compatible stri=
ng
> + *
> + * @compat: compatible string describing partitions in a device tree
> + *
> + * MTD parsers can specify supported partitions by providing a table of
> + * compatibility strings. This function finds a parser that advertises s=
upport
> + * for a passed value of "compatible".
> + */
> +static struct mtd_part_parser *mtd_part_get_compatible_parser(const char=
 *compat)
> +{
> +	struct mtd_part_parser *p, *ret =3D NULL;
> +
> +	spin_lock(&part_parser_lock);
> +
> +	list_for_each_entry(p, &part_parsers, list) {
> +		const struct of_device_id *matches;
> +
> +		matches =3D p->of_match_table;
> +		if (!matches)
> +			continue;
> +
> +		for (; matches->compatible[0]; matches++) {
> +			if (!strcmp(matches->compatible, compat) &&
> +			    try_module_get(p->owner)) {
> +				ret =3D p;
> +				break;
> +			}
> +		}
> +
> +		if (ret)
> +			break;
> +	}
> +
> +	spin_unlock(&part_parser_lock);
> +
> +	return ret;
> +}
> +
> +/**
>   * parse_mtd_partitions - parse MTD partitions
>   * @master: the master partition (describes whole MTD device)
>   * @types: names of partition parsers to try or %NULL
> @@ -905,8 +945,27 @@ int parse_mtd_partitions(struct mtd_info *master, co=
nst char *const *types,
>  			 struct mtd_part_parser_data *data)
>  {
>  	struct mtd_part_parser *parser;
> +	struct device_node *np;
> +	struct property *prop;
> +	const char *compat;
>  	int ret, err =3D 0;
> =20
> +	np =3D of_get_child_by_name(mtd_get_of_node(master), "partitions");
> +	of_property_for_each_string(np, "compatible", prop, compat) {
> +		parser =3D mtd_part_get_compatible_parser(compat);
> +		if (!parser)
> +			continue;
> +		ret =3D mtd_part_do_parse(parser, master, pparts, data);
> +		if (ret > 0) {
> +			of_node_put(np);
> +			return 0;
> +		}
> +		mtd_part_parser_put(parser);
> +		if (ret < 0 && !err)
> +			err =3D ret;
> +	}
> +	of_node_put(np);
> +
>  	if (!types)
>  		types =3D default_mtd_part_types;
> =20
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partition=
s.h
> index c4beb70dacbd..11cb0c50cd84 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -77,6 +77,7 @@ struct mtd_part_parser {
>  	struct list_head list;
>  	struct module *owner;
>  	const char *name;
> +	const struct of_device_id *of_match_table;
>  	int (*parse_fn)(struct mtd_info *, const struct mtd_partition **,
>  			struct mtd_part_parser_data *);
>  	void (*cleanup)(const struct mtd_partition *pparts, int nr_parts);
