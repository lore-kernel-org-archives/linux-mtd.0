Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g83NR-0003FY-Oa
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 13:09:50 +0000
Date: Thu, 4 Oct 2018 15:08:50 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/10] mtd: physmap_of: Release resources on error
Message-ID: <20181004150850.780f6d21@bbrezillon>
In-Reply-To: <20181004130110.8496-1-ricardo.ribalda@gmail.com>
References: <20181004130110.8496-1-ricardo.ribalda@gmail.com>
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

Hi Ricardo,

On Thu,  4 Oct 2018 15:01:01 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> During probe, if there was an error the memory region and the memory
> map were not properly released.
> 
> This can lead a system unusable if deferred probe is in use.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/maps/physmap_of_core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
> index 4129535b8e46..062add8b3a6e 100644
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ b/drivers/mtd/maps/physmap_of_core.c
> @@ -241,10 +241,10 @@ static int of_flash_probe(struct platform_device *dev)
>  
>  		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
>  		if (err)
> -			goto err_out;
> +			goto err_out_release;
>  		err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
>  		if (err)
> -			goto err_out;
> +			goto err_out_release;
>  
>  		err = -ENOMEM;
>  		info->list[i].map.virt = ioremap(info->list[i].map.phys,
> @@ -252,7 +252,7 @@ static int of_flash_probe(struct platform_device *dev)
>  		if (!info->list[i].map.virt) {
>  			dev_err(&dev->dev, "Failed to ioremap() flash"
>  				" region\n");
> -			goto err_out;
> +			goto err_out_release;
>  		}
>  
>  		simple_map_init(&info->list[i].map);
> @@ -290,7 +290,7 @@ static int of_flash_probe(struct platform_device *dev)
>  		err = -ENXIO;
>  		if (!info->list[i].mtd) {
>  			dev_err(&dev->dev, "do_map_probe() failed\n");
> -			goto err_out;
> +			goto err_out_iounmap;
>  		} else {
>  			info->list_size++;
>  		}
> @@ -329,6 +329,10 @@ static int of_flash_probe(struct platform_device *dev)
>  
>  	return 0;
>  
> +err_out_iounmap:
> +	iounmap(info->list[i].map.virt);
> +err_out_release:
> +	release_mem_region(res.start, resource_size(&res));
>  err_out:
>  	kfree(mtd_list);
>  err_flash_remove:

Please fix that using devm_ioremap_resource() instead.

Thanks,

Boris
