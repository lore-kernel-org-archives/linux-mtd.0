Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7hA7-00038Q-1B
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 18:59:20 -0500
Date: Fri, 19 Jan 2007 00:59:00 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Stefan Roese <ml@stefan-roese.de>
Subject: Re: [PATCH] [MTD] physmap: Add support for 64 bit resources on PPC44x
Message-ID: <20070118235900.GA23974@xi.wantstofly.org>
References: <200701181808.11143.ml@stefan-roese.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200701181808.11143.ml@stefan-roese.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 18, 2007 at 06:07:53PM +0100, Stefan Roese wrote:

> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -116,7 +116,14 @@ static int physmap_flash_probe(struct platform_device 
> *dev)
>  	info->map.bankwidth = physmap_data->width;
>  	info->map.set_vpp = physmap_data->set_vpp;
>  
> +#ifdef CONFIG_44x
> +	if (sizeof(dev->resource->start) == 4)

CONFIG_RESOURCES_64BIT


> +		info->map.virt = ioremap(info->map.phys, info->map.size);
> +	else
> +		info->map.virt = ioremap64(dev->resource->start, info->map.size);
> +#else
>  	info->map.virt = ioremap(info->map.phys, info->map.size);
> +#endif

Ugh.  Do you have crap like this everywhere ioremap() is called?

Why can't you fix ioremap() to take >= 4G addresses instead?
