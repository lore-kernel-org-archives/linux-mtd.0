Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1Llu-0004Qj-Ih
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 23:46:00 +0000
Received: by mail-io0-x242.google.com with SMTP id h41so22470651ioi.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 16:45:38 -0700 (PDT)
Date: Thu, 20 Apr 2017 16:45:34 -0700
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
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH RESEND 2/4] mtd: partitions: factor out code calling parser
Message-ID: <20170420234534.GK20555@google.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
 <20170420135731.13272-1-zajec5@gmail.com>
 <20170420135731.13272-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170420135731.13272-3-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 20, 2017 at 03:57:29PM +0200, Rafał Miłecki wrote:
> From: Brian Norris <computersforpeace@gmail.com>
> 
> This code is going to be reused for parsers matched using OF so let's
> factor it out to make this easier.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Could have used a changelog to note dropping the
mtd_part_parser_get_by_name() refactoring. Also the corresponding change
in subject (from "mtd: partitions: factor out "match by name"
handling").

But this seems fine to me.

Acked-by: Brian Norris <computersforpeace@gmail.com>

>  drivers/mtd/mtdpart.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 81e0b80237df..73c52f1a2e4c 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -840,6 +840,27 @@ static const char * const default_mtd_part_types[] = {
>  	NULL
>  };
>  
> +static int mtd_part_do_parse(struct mtd_part_parser *parser,
> +			     struct mtd_info *master,
> +			     struct mtd_partitions *pparts,
> +			     struct mtd_part_parser_data *data)
> +{
> +	int ret;
> +
> +	ret = (*parser->parse_fn)(master, &pparts->parts, data);
> +	pr_debug("%s: parser %s: %i\n", master->name, parser->name, ret);
> +	if (ret <= 0)
> +		return ret;
> +
> +	pr_notice("%d %s partitions found on MTD device %s\n", ret,
> +		  parser->name, master->name);
> +
> +	pparts->nr_parts = ret;
> +	pparts->parser = parser;
> +
> +	return ret;
> +}
> +
>  /**
>   * parse_mtd_partitions - parse MTD partitions
>   * @master: the master partition (describes whole MTD device)
> @@ -880,16 +901,10 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>  			 parser ? parser->name : NULL);
>  		if (!parser)
>  			continue;
> -		ret = (*parser->parse_fn)(master, &pparts->parts, data);
> -		pr_debug("%s: parser %s: %i\n",
> -			 master->name, parser->name, ret);
> -		if (ret > 0) {
> -			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
> -			       ret, parser->name, master->name);
> -			pparts->nr_parts = ret;
> -			pparts->parser = parser;
> +		ret = mtd_part_do_parse(parser, master, pparts, data);
> +		/* Found partitions! */
> +		if (ret > 0)
>  			return 0;
> -		}
>  		mtd_part_parser_put(parser);
>  		/*
>  		 * Stash the first error we see; only report it if no parser
> -- 
> 2.11.0
> 
