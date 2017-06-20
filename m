Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNQG2-0003GL-Cg
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 21:00:20 +0000
Received: by mail-pf0-x242.google.com with SMTP id y7so25902992pfd.3
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 13:59:57 -0700 (PDT)
Date: Tue, 20 Jun 2017 13:59:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 3/4] mtd: partitions: add of_match_table parser matching
Message-ID: <20170620205953.GA14148@google.com>
References: <20170523053022.3251-1-zajec5@gmail.com>
 <20170523053022.3251-4-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170523053022.3251-4-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rafal,

On Tue, May 23, 2017 at 07:30:21AM +0200, Rafał Miłecki wrote:
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
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Brian Norris <computersforpeac@gmail.com>

I've pushed patches 1 and 2 to l2-mtd.git. I'm still looking at one
piece below:

> ---
> This is based on Brian's patches:
> [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
> [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
> 
> V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
>     Merge helpers into a single of_mtd_match_mtd_parser
> V3: Add a simple comment to note we will need the best match in the future
> ---
>  drivers/mtd/mtdpart.c          | 48 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/partitions.h |  1 +
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 73c52f1a2e4c..0d3cc1e79014 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -861,6 +861,42 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
>  	return ret;
>  }
>  
> +static bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
> +				    struct mtd_part_parser *parser)
> +{
> +	struct device_node *np;
> +	bool ret;
> +
> +	np = mtd_get_of_node(mtd);
> +	np = of_get_child_by_name(np, "partitions");
> +
> +	ret = !!of_match_node(parser->of_match_table, np);
> +
> +	of_node_put(np);
> +
> +	return ret;
> +}
> +
> +static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info *mtd)
> +{
> +	struct mtd_part_parser *p, *ret = NULL;
> +
> +	spin_lock(&part_parser_lock);
> +
> +	/* TODO: Pick parser with the best match (score) */

I don't usually like sticking in TODOs for known issues like this on new
code. This one isn't really that hard to solve; there just aren't any
nice helpers for it. I see you even wrote up something on one of the
prior versions.

I might take a look myself at improving your other proposal. I'd rather
give that a chance than take this with a TODO.

> +	list_for_each_entry(p, &part_parsers, list) {
> +		if (of_mtd_match_mtd_parser(mtd, p) &&
> +				try_module_get(p->owner)) {
> +			ret = p;
> +			break;
> +		}
> +	}
> +
> +	spin_unlock(&part_parser_lock);
> +
> +	return ret;
> +}
> +
>  /**
>   * parse_mtd_partitions - parse MTD partitions
>   * @master: the master partition (describes whole MTD device)

Brian
