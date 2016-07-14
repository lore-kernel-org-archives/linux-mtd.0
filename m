Received: from mail.phytec.eu ([217.6.246.34] helo=root.phytec.de)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNgK0-0007Vx-Sv
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 13:04:57 +0000
Message-ID: <1468501472.4873.27.camel@lws-tremmet.phytec.de>
Subject: Re: [PATCH] mtd: nand: omap2: add missing braces
From: Teresa Remmet <t.remmet@phytec.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, "Cooper Jr.,
 Franklin" <fcooper@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 14 Jul 2016 15:04:32 +0200
In-Reply-To: <20160714095416.739127-1-arnd@arndb.de>
References: <20160714095416.739127-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Am Donnerstag, den 14.07.2016, 11:53 +0200 schrieb Arnd Bergmann:
> A bug fix just introduced incorrect behavior in the omap2 nand driver, as
> found by gcc-6.1:
> 
> drivers/mtd/nand/omap2.c: In function 'omap_get_dt_info':
> drivers/mtd/nand/omap2.c:1658:2: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
>   if (!info->elm_of_node)
>   ^~
> drivers/mtd/nand/omap2.c:1660:3: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
>    if (!info->elm_of_node)
>    ^~
> 
> We clearly need to put the indented code into { } braces to get the intended
> behavior.

how bad that I missed that :(.
But nice that gcc-6.1 catches such things.

Thanks,
Teresa

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 3bbca2c54f86 ("mtd: nand: omap2: Add check for old elm binding")
> ---
>  drivers/mtd/nand/omap2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index a36ad3d146a3..ab7c34096a62 100644
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
