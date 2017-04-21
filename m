Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1MAz-0005Uw-B3
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 00:11:54 +0000
Received: by mail-io0-x244.google.com with SMTP id x86so22711443ioe.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 17:11:29 -0700 (PDT)
Date: Thu, 20 Apr 2017 17:11:26 -0700
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
Subject: Re: [PATCH RESEND 4/4] mtd: ofpart: add of_match_table with
 "fixed-partitions"
Message-ID: <20170421001126.GM20555@google.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
 <20170420135731.13272-1-zajec5@gmail.com>
 <20170420135731.13272-5-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170420135731.13272-5-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 20, 2017 at 03:57:31PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This allows using this parser with any flash driver that takes care of
> setting of_node (using mtd_set_of_node helper) correctly. Up to now
> support for "fixed-partitions" DT compatibility string was working only
> with flash drivers that were specifying "ofpart" (manually or by letting
> mtd use the default set of parsers).
> 
> This matches existing bindings documentation.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Seems OK to me. I think this means we can even get away without putting
"ofpart" in the "probe type" arrays in drivers now, if we don't care
about the legacy binding. Probably not gonna happen for existing
drivers, but at least it helps going forward. And of course, it provides
a starting example for new partition-parser compatible properties, if
that's the way we go.

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
Tested-by: Brian Norris <computersforpeace@gmail.com>

>  drivers/mtd/ofpart.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 2861c7079d7b..fb6f3df40e94 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -140,9 +140,16 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  	return ret;
>  }
>  
> +static const struct of_device_id parse_ofpart_match_table[] = {
> +	{ .compatible = "fixed-partitions" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, parse_ofpart_match_table);
> +
>  static struct mtd_part_parser ofpart_parser = {
>  	.parse_fn = parse_ofpart_partitions,
>  	.name = "ofpart",
> +	.of_match_table = parse_ofpart_match_table,
>  };
>  
>  static int parse_ofoldpart_partitions(struct mtd_info *master,
> -- 
> 2.11.0
> 
