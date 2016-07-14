Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNoEg-0003sO-9c
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 21:31:58 +0000
Received: by mail-pf0-x242.google.com with SMTP id y134so1090374pfg.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jul 2016 14:31:37 -0700 (PDT)
Date: Thu, 14 Jul 2016 14:31:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Teresa Remmet <t.remmet@phytec.de>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [patch] mtd: nand: omap2: Cleanup a curly brace issue
Message-ID: <20160714213134.GA108554@google.com>
References: <20160714212608.GA10856@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160714212608.GA10856@mwanda>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 15, 2016 at 12:26:08AM +0300, Dan Carpenter wrote:
> It doesn't affect runtime, but curly braces were obviously intended.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, but you're just a tad late ;)

http://patchwork.ozlabs.org/patch/648283/

Nice to point out that technically, the behavior doesn't really change
though.

Brian

> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index a36ad3d..ab7c340 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1655,10 +1655,11 @@ static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
>  
>  	/* detect availability of ELM module. Won't be present pre-OMAP4 */
>  	info->elm_of_node = of_parse_phandle(child, "ti,elm-id", 0);
> -	if (!info->elm_of_node)
> +	if (!info->elm_of_node) {
>  		info->elm_of_node = of_parse_phandle(child, "elm_id", 0);
>  		if (!info->elm_of_node)
>  			dev_dbg(dev, "ti,elm-id not in DT\n");
> +	}
>  
>  	/* select ecc-scheme for NAND */
>  	if (of_property_read_string(child, "ti,nand-ecc-opt", &s)) {
