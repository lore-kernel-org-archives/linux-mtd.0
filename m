Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAtdD-0004Xz-Kz
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 09:21:24 +0000
Date: Fri, 12 Oct 2018 11:20:54 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: physmap_of: Move custom initialization
Message-ID: <20181012112054.2c74b9c7@bbrezillon>
In-Reply-To: <20181011185326.1371-1-linus.walleij@linaro.org>
References: <20181011185326.1371-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

On Thu, 11 Oct 2018 20:53:25 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> In order to be able to assign custom complex mappings
> to the physmap_of plugin for Gemini, move the initialization
> so that the simple map is initialized before we enter the
> platform-specific functions so the latter can override
> them.

I forgot to Cc you but I'm currently reworking the physmap driver to
merge the physmap_of logic in it [1]. I'll probably ask you to rebase
this patchset on top of mtd/next once [1] is applied.

Sorry for the inconvenience.

Boris

[1]https://patchwork.ozlabs.org/cover/980800/

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/maps/physmap_of_core.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
> index 4129535b8e46..74ad753265f3 100644
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ b/drivers/mtd/maps/physmap_of_core.c
> @@ -239,13 +239,6 @@ static int of_flash_probe(struct platform_device *dev)
>  		else if (of_property_read_bool(dp, "little-endian"))
>  			info->list[i].map.swap = CFI_LITTLE_ENDIAN;
>  
> -		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
> -		if (err)
> -			goto err_out;
> -		err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
> -		if (err)
> -			goto err_out;
> -
>  		err = -ENOMEM;
>  		info->list[i].map.virt = ioremap(info->list[i].map.phys,
>  						 info->list[i].map.size);
> @@ -257,6 +250,14 @@ static int of_flash_probe(struct platform_device *dev)
>  
>  		simple_map_init(&info->list[i].map);
>  
> +		/* Variants can override map accessors */
> +		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
> +		if (err)
> +			goto err_out;
> +		err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
> +		if (err)
> +			goto err_out;
> +
>  		/*
>  		 * On some platforms (e.g. MPC5200) a direct 1:1 mapping
>  		 * may cause problems with JFFS2 usage, as the local bus (LPB)
