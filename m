Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2fxo-0007jI-Oq
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 15:31:46 +0000
Received: by mail-vk0-x243.google.com with SMTP id q78so5941080vke.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2017 08:31:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170424124120.31613-4-zajec5@gmail.com>
References: <20170420135731.13272-2-zajec5@gmail.com>
 <20170424124120.31613-1-zajec5@gmail.com>
 <20170424124120.31613-4-zajec5@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Apr 2017 17:31:03 +0200
Message-ID: <CAOiHx=njT+y6VqTbqRFQZ4rJNW6A8XsngTe2WRp=qND9c3ySpA@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] mtd: partitions: add of_match_table parser matching
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

Hi,

On 24 April 2017 at 14:41, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote=
:
> From: Brian Norris <computersforpeace@gmail.com>
>
> Partition parsers can now provide an of_match_table to enable
> flash<-->parser matching via device tree.
>
> This support is currently limited to built-in parsers as it uses
> request_module() and friends. This should be sufficient for most cases
> though as compiling parsers as modules isn't a common choice.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Acked-by: Brian Norris <computersforpeac@gmail.com>
> ---
> This is based on Brian's patches:
> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parse=
r() helpers
> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
>
> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
>     Merge helpers into a single of_mtd_match_mtd_parser
> ---
>  drivers/mtd/mtdpart.c          | 47 ++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mtd/partitions.h |  1 +
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 73c52f1a2e4c..d0cb1a892ed2 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -861,6 +861,41 @@ static int mtd_part_do_parse(struct mtd_part_parser =
*parser,
>         return ret;
>  }
>
> +static bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
> +                                   struct mtd_part_parser *parser)
> +{
> +       struct device_node *np;
> +       bool ret;
> +
> +       np =3D mtd_get_of_node(mtd);
> +       np =3D of_get_child_by_name(np, "partitions");
> +
> +       ret =3D !!of_match_node(parser->of_match_table, np);
> +
> +       of_node_put(np);
> +
> +       return ret;
> +}
> +
> +static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info=
 *mtd)
> +{
> +       struct mtd_part_parser *p, *ret =3D NULL;
> +
> +       spin_lock(&part_parser_lock);
> +
> +       list_for_each_entry(p, &part_parsers, list) {
> +               if (of_mtd_match_mtd_parser(mtd, p) &&
> +                               try_module_get(p->owner)) {
> +                       ret =3D p;
> +                       break;
> +               }
> +       }


Hm, maybe iterate over the compatibles, so parsers matching the most
specific compatible get precedence in case there is more than one
compatible? Currently it will match the first one that matches any
compatible, and registration order of parsers can change that. I'm
thinking of parsers that partially rely on fixed, unprobable layouts,
so can use "fixed-partitions" as a fallback compatible.

E.g. having something like this

partitions {
        compatible =3D "sample,custom-layout", "fixed-partitions";

        bootloader@0 { ...  };

        firmware@10000 { .... }; /* will be split by the parser */

        extra@780000 { .... }; /* partition the on-flash format can't speci=
fy */
};

Where you will still be able to write an image raw to the image
partition even if the "custom-layout"-parser isn't present/enabled,
but if it is present, it should always be used.


Regards
Jonas
