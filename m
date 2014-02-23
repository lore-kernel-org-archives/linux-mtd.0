Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHOfp-0000pH-6N
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 02:20:09 +0000
Received: by mail-pb0-f41.google.com with SMTP id up15so5056883pbc.14
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2014 18:19:46 -0800 (PST)
Date: Sat, 22 Feb 2014 18:19:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/2] mtd: denali_dt: Use devm_ioremap_resource()
Message-ID: <20140223021943.GB11836@norris-Latitude-E6410>
References: <000201cf279a$49891080$dc9b3180$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000201cf279a$49891080$dc9b3180$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Dinh Nguyen' <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dinh,

Do you have any comment on this patch?

Jingoo,

On Wed, Feb 12, 2014 at 11:29:42AM +0900, Jingoo Han wrote:
> Use devm_ioremap_resource() in order to make the code
> simpler, and remove redundant return value check of
> platform_get_resource_byname() because the value is
> checked by devm_ioremap_resource().
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/mtd/nand/denali_dt.c |   39 ++++++++-------------------------------
>  1 file changed, 8 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> index babb02c..35cb17f 100644
> --- a/drivers/mtd/nand/denali_dt.c
> +++ b/drivers/mtd/nand/denali_dt.c
> @@ -30,24 +30,6 @@ struct denali_dt {
>  	struct clk		*clk;
>  };
>  
> -static void __iomem *request_and_map(struct device *dev,
> -				     const struct resource *res)
> -{
> -	void __iomem *ptr;
> -
> -	if (!devm_request_mem_region(dev, res->start, resource_size(res),
> -				     "denali-dt")) {
> -		dev_err(dev, "unable to request %s\n", res->name);
> -		return NULL;
> -	}
> -
> -	ptr = devm_ioremap_nocache(dev, res->start, resource_size(res));

Your code here is not a direct replacement; Dinh originally used the
_nocache variant of ioremap, but you are replacing it with the standard
one. There is no difference between the two on several ARCH's, but I
can't guarantee that your patch is safe without confirmation/testing. So
I will not take this without an Ack or Tested-by from someone
knowledgeable about denali.

> -	if (!ptr)
> -		dev_err(dev, "ioremap_nocache of %s failed!", res->name);
> -
> -	return ptr;
> -}
> -
>  static const struct of_device_id denali_nand_dt_ids[] = {
>  		{ .compatible = "denali,denali-nand-dt" },
>  		{ /* sentinel */ }
> @@ -78,13 +60,6 @@ static int denali_dt_probe(struct platform_device *ofdev)
>  		return -ENOMEM;
>  	denali = &dt->denali;
>  
> -	denali_reg = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "denali_reg");
> -	nand_data = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "nand_data");
> -	if (!denali_reg || !nand_data) {
> -		dev_err(&ofdev->dev, "resources not completely defined\n");
> -		return -EINVAL;
> -	}
> -
>  	denali->platform = DT;
>  	denali->dev = &ofdev->dev;
>  	denali->irq = platform_get_irq(ofdev, 0);
> @@ -93,13 +68,15 @@ static int denali_dt_probe(struct platform_device *ofdev)
>  		return denali->irq;
>  	}
>  
> -	denali->flash_reg = request_and_map(&ofdev->dev, denali_reg);
> -	if (!denali->flash_reg)
> -		return -ENOMEM;
> +	denali_reg = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "denali_reg");
> +	denali->flash_reg = devm_ioremap_resource(&ofdev->dev, denali_reg);
> +	if (IS_ERR(denali->flash_reg))
> +		return PTR_ERR(denali->flash_reg);
>  
> -	denali->flash_mem = request_and_map(&ofdev->dev, nand_data);
> -	if (!denali->flash_mem)
> -		return -ENOMEM;
> +	nand_data = platform_get_resource_byname(ofdev, IORESOURCE_MEM, "nand_data");
> +	denali->flash_mem = devm_ioremap_resource(&ofdev->dev, nand_data);
> +	if (IS_ERR(denali->flash_mem))
> +		return PTR_ERR(denali->flash_mem);
>  
>  	if (!of_property_read_u32(ofdev->dev.of_node,
>  		"dma-mask", (u32 *)&denali_dma_mask)) {

Thanks,
Brian
