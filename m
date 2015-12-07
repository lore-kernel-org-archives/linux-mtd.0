Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5lom-0002uF-7R
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2015 02:46:24 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id BA1162056E
 for <linux-mtd@lists.infradead.org>; Mon,  7 Dec 2015 02:46:02 +0000 (UTC)
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EAE32055B
 for <linux-mtd@lists.infradead.org>; Mon,  7 Dec 2015 02:46:01 +0000 (UTC)
Received: by ykdr82 with SMTP id r82so180149199ykd.3
 for <linux-mtd@lists.infradead.org>; Sun, 06 Dec 2015 18:46:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 6 Dec 2015 20:45:40 -0600
Message-ID: <CAL_JsqLV1mDpW9tD0XjWRxZSSsYuDiqHbuADQmBUtACgYiHJ+w@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and
 of_mtd_match_mtd_parser() helpers
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Arlott <simon@fire.lp0.eu>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Jonas Gorski <jogo@openwrt.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 4, 2015 at 11:19 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Like the corresponding OF-based device/driver matching infrascture,

typo.

> let's begin to support a mtd/partition-parser matching infrastructure.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/of/of_mtd.c            | 33 +++++++++++++++++++++++++++++++++

BTW, this file should be moved to drivers/mtd/ at some point.

>  include/linux/mtd/partitions.h |  2 ++
>  include/linux/of_mtd.h         | 13 +++++++++++++
>  3 files changed, 48 insertions(+)
>
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index b7361ed70537..169d7500af5d 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/of_mtd.h>
>  #include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
>  #include <linux/export.h>
>
>  /**
> @@ -117,3 +118,35 @@ bool of_get_nand_on_flash_bbt(struct device_node *np)
>         return of_property_read_bool(np, "nand-on-flash-bbt");
>  }
>  EXPORT_SYMBOL_GPL(of_get_nand_on_flash_bbt);
> +
> +static const struct of_device_id *of_match_mtd_parser(

This function name and the only caller's function name are very
similar. Why not just move this function inline.

> +               struct mtd_part_parser *parser, struct device_node *np)
> +{
> +       if (!parser || !np)
> +               return NULL;
> +
> +       return of_match_node(parser->of_match_table, np);
> +}
> +
> +static struct device_node *mtd_get_partitions_of_node(struct mtd_info *master)
> +{
> +       struct device_node *np = mtd_get_of_node(master);
> +
> +       if (!np)
> +               return NULL;
> +
> +       return of_get_child_by_name(np, "partitions");
> +}
> +
> +bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
> +                            struct mtd_part_parser *parser)
> +{
> +       struct device_node *np = mtd_get_partitions_of_node(mtd);
> +       bool ret;
> +
> +       ret = of_match_mtd_parser(parser, np) != NULL;
> +       of_node_put(np);
> +
> +       return ret;
> +}
