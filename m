Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWnnA-0005Lz-0p
 for linux-mtd@lists.infradead.org; Wed, 03 Jan 2018 18:29:33 +0000
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10D0F218CA
 for <linux-mtd@lists.infradead.org>; Wed,  3 Jan 2018 18:29:20 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id k19so3199192qtj.6
 for <linux-mtd@lists.infradead.org>; Wed, 03 Jan 2018 10:29:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180103105543.17897-1-zajec5@gmail.com>
References: <20180102130458.16226-1-zajec5@gmail.com>
 <20180103105543.17897-1-zajec5@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 Jan 2018 12:28:58 -0600
Message-ID: <CAL_JsqLYjUsWGAYm978oPmMAue6YDRb=K00gReZTia6iaJ6xsA@mail.gmail.com>
Subject: Re: [PATCH V6 1/2] mtd: partitions: add of_match_table parser matching
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 John Crispin <john@phrozen.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 3, 2018 at 4:55 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
> From: Brian Norris <computersforpeace@gmail.com>
>
> Partition parsers can now provide an of_match_table to enable
> flash<-->parser matching via device tree as documented in the
> mtd/partition.txt.
>
> It works by looking for a matching parser for every string in the
> "compatibility" property (starting with the most specific one).
>
> This support is currently limited to built-in parsers as it uses
> request_module() and friends. This should be sufficient for most cases
> though as compiling parsers as modules isn't a common choice.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> This is based on Brian's patches:
> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parse=
r() helpers
> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
>
> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
>     Merge helpers into a single of_mtd_match_mtd_parser
> V3: Add a simple comment to note we will need the best match in the futur=
e
> V4: Rework new functions to pick parser with the best match
>     Move new code in parse_mtd_partitions up so it has precedence over fl=
ash
>     driver defaults and MTD defaults
> V5: Rework matching code to start checking with the most specific string =
in the
>     "compatibility" property.
> V6: Initialize "ret" variable in mtd_part_get_parser_by_cp to NULL
> ---
>  drivers/mtd/mtdpart.c          | 64 ++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mtd/partitions.h |  1 +
>  2 files changed, 65 insertions(+)
>
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index be088bccd593..b11958adcf45 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -30,6 +30,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
>
>  #include "mtdcore.h"
>
> @@ -880,6 +881,48 @@ static int mtd_part_do_parse(struct mtd_part_parser =
*parser,
>  }
>
>  /**
> + * mtd_part_get_parser_by_cp - find MTD parser by a compatible string

What's "cp"? Perhaps mtd_part_get_compatible_parser.

> + *
> + * @cp: compatible string describing partitions in a device tree

"compat" would be clearer IMO

> + *
> + * MTD parsers can specify supported partitions by providing a table of
> + * compatibility strings. This function finds a parser that advertises s=
upport
> + * for a passed value of "compatible".
> + */
> +static struct mtd_part_parser *mtd_part_get_parser_by_cp(const char *cp)
> +{
> +       struct mtd_part_parser *p, *ret =3D NULL;
> +
> +       spin_lock(&part_parser_lock);
> +
> +       list_for_each_entry(p, &part_parsers, list) {
> +               const struct of_device_id *matches;
> +
> +               matches =3D p->of_match_table;
> +               if (!matches)
> +                       continue;
> +
> +               for (; matches->name[0] || matches->type[0] || matches->c=
ompatible[0];
> +                    matches++) {
> +                       if (!matches->compatible[0])
> +                               continue;

It would be simpler to just ignore name and type. Having either of
those would be an error and the only consequence if there are entries
without compatible is returning early.

> +                       if (!strcmp(matches->compatible, cp) &&
> +                           try_module_get(p->owner)) {
> +                               ret =3D p;
> +                               break;
> +                       }
> +               }
> +
> +               if (ret)
> +                       break;
> +       }
> +
> +       spin_unlock(&part_parser_lock);
> +
> +       return ret;
> +}
> +
> +/**
>   * parse_mtd_partitions - parse MTD partitions
>   * @master: the master partition (describes whole MTD device)
>   * @types: names of partition parsers to try or %NULL
> @@ -905,8 +948,29 @@ int parse_mtd_partitions(struct mtd_info *master, co=
nst char *const *types,
>                          struct mtd_part_parser_data *data)
>  {
>         struct mtd_part_parser *parser;
> +       struct device_node *np;
> +       struct property *prop;
> +       const char *cp;
>         int ret, err =3D 0;
>
> +       np =3D of_get_child_by_name(mtd_get_of_node(master), "partitions"=
);
> +       if (np) {

You can drop this. of_property_for_each_string and of_node_put will
work if np is NULL.

> +               of_property_for_each_string(np, "compatible", prop, cp) {
> +                       parser =3D mtd_part_get_parser_by_cp(cp);
> +                       if (!parser)
> +                               continue;
> +                       ret =3D mtd_part_do_parse(parser, master, pparts,=
 data);
> +                       if (ret > 0) {
> +                               of_node_put(np);
> +                               return 0;
> +                       }
> +                       mtd_part_parser_put(parser);
> +                       if (ret < 0 && !err)
> +                               err =3D ret;
> +               }
> +               of_node_put(np);
> +       }
> +
>         if (!types)
>                 types =3D default_mtd_part_types;
>
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partition=
s.h
> index c4beb70dacbd..11cb0c50cd84 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -77,6 +77,7 @@ struct mtd_part_parser {
>         struct list_head list;
>         struct module *owner;
>         const char *name;
> +       const struct of_device_id *of_match_table;

I generally like using of_device_id over just an array of strings, but
I'm wondering if there's really cases where you have multiple
compatible strings for a single parser? Perhaps a single string here
would be sufficient. And if you did have multiple matches, how would
you distinguish them later on in the parsing functions? Normally we'd
use the matched data ptr, but that's not provided here.

>         int (*parse_fn)(struct mtd_info *, const struct mtd_partition **,
>                         struct mtd_part_parser_data *);
>         void (*cleanup)(const struct mtd_partition *pparts, int nr_parts)=
;
> --
> 2.11.0
>
