Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VytQD-0004Jd-40
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 01:19:33 +0000
Received: by mail-ie0-f169.google.com with SMTP id e14so15602066iej.28
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2014 17:19:11 -0800 (PST)
Date: Thu, 2 Jan 2014 17:19:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 2/8] mtd: ixp4xx: Use devm_*() functions
Message-ID: <20140103011908.GB5631@ld-irv-0074>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
 <001101cefd3f$e99a17c0$bcce4740$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001101cefd3f$e99a17c0$bcce4740$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Marc Kleine-Budde' <mkl@blackshift.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 20, 2013 at 01:56:58PM +0900, Jingoo Han wrote:
> --- a/drivers/mtd/maps/ixp4xx.c
> +++ b/drivers/mtd/maps/ixp4xx.c
> @@ -220,20 +214,9 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
>  	info->map.write = ixp4xx_probe_write16;
>  	info->map.copy_from = ixp4xx_copy_from;
>  
> -	info->res = request_mem_region(dev->resource->start,
> -			resource_size(dev->resource),
> -			"IXP4XXFlash");
> -	if (!info->res) {
> -		printk(KERN_ERR "IXP4XXFlash: Could not reserve memory region\n");
> -		err = -ENOMEM;
> -		goto Error;
> -	}
> -
> -	info->map.virt = ioremap(dev->resource->start,
> -				 resource_size(dev->resource));
> -	if (!info->map.virt) {
> -		printk(KERN_ERR "IXP4XXFlash: Failed to ioremap region\n");
> -		err = -EIO;
> +	info->map.virt = devm_ioremap_resource(&dev->dev, dev->resource);
> +	if (IS_ERR(info->map.virt)) {
> +		err = PTR_ERR(info->map.virt);

I don't have a defconfig on hand for compiling this one yet, but I
assume this has the same problem as the plat_nand one (missing
<linux/err.h>), so I'm not taking it yet.

>  		goto Error;
>  	}
>  

Brian
