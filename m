Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3Yzg-0003P0-3J
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 00:40:32 +0000
Received: by pabfh17 with SMTP id fh17so207577696pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 16:40:11 -0800 (PST)
Date: Mon, 30 Nov 2015 16:40:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Anup Limbu <anuplimbu14@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: davinci: remove unnecessary if cases
Message-ID: <20151201004008.GR64635@google.com>
References: <1448611534-21142-1-git-send-email-anuplimbu14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1448611534-21142-1-git-send-email-anuplimbu14@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 27, 2015 at 01:35:34PM +0530, Anup Limbu wrote:
> remove unnecessary if cases
> 
> Signed-off-by: Anup Limbu <anuplimbu14@gmail.com>
> ---

Did you test this?

>  drivers/mtd/nand/davinci_nand.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index c72313d..1f86ee1 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -568,21 +568,16 @@ static struct davinci_nand_pdata
>  		pdev->dev.platform_data = pdata;
>  		if (!pdata)
>  			return ERR_PTR(-ENOMEM);
> -		if (!of_property_read_u32(pdev->dev.of_node,
> -			"ti,davinci-chipselect", &prop))
> -			pdev->id = prop;
> -		else
> +		if (of_property_read_u32(pdev->dev.of_node,
> +			"ti,davinci-chipselect", &pdev->id))
>  			return ERR_PTR(-EINVAL);
>  
> -		if (!of_property_read_u32(pdev->dev.of_node,
> -			"ti,davinci-mask-ale", &prop))
> -			pdata->mask_ale = prop;
> -		if (!of_property_read_u32(pdev->dev.of_node,
> -			"ti,davinci-mask-cle", &prop))
> -			pdata->mask_cle = prop;
> -		if (!of_property_read_u32(pdev->dev.of_node,
> -			"ti,davinci-mask-chipsel", &prop))
> -			pdata->mask_chipsel = prop;
> +		of_property_read_u32(pdev->dev.of_node,
> +			"ti,davinci-mask-ale", &pdata->mask_ale);
> +		of_property_read_u32(pdev->dev.of_node,
> +			"ti,davinci-mask-cle", &pdata->mask_cle);
> +		of_property_read_u32(pdev->dev.of_node,
> +			"ti,davinci-mask-chipsel", &pdata->mask_chipsel);
>  		if (!of_property_read_string(pdev->dev.of_node,
>  			"nand-ecc-mode", &mode) ||
>  		    !of_property_read_string(pdev->dev.of_node,
> @@ -594,9 +589,8 @@ static struct davinci_nand_pdata
>  			if (!strncmp("hw", mode, 2))
>  				pdata->ecc_mode = NAND_ECC_HW;
>  		}
> -		if (!of_property_read_u32(pdev->dev.of_node,
> -			"ti,davinci-ecc-bits", &prop))
> -			pdata->ecc_bits = prop;
> +		of_property_read_u32(pdev->dev.of_node,
> +			"ti,davinci-ecc-bits", &pdata->ecc_bits);

NAK! You're treating a u8 as u32. This should give you some subset of
the following warnings, from gcc and sparse:

In file included from include/linux/of_device.h:8:0,
                 from drivers/mtd/nand/davinci_nand.c:35:
include/linux/of.h:857:19: note: expected ‘u32 *’ but argument is of type ‘u8 *’
drivers/mtd/nand/davinci_nand.c: In function ‘nand_davinci_get_pdata’:
drivers/mtd/nand/davinci_nand.c:593:4: warning: passing argument 3 of ‘of_property_read_u32’ from incompatible pointer type [enabled by default]
drivers/mtd/nand/davinci_nand.c:572:51: warning: incorrect type in argument 3 (different signedness) [sparse]
drivers/mtd/nand/davinci_nand.c:572:51:    expected unsigned int [usertype] *out_value [sparse]
drivers/mtd/nand/davinci_nand.c:572:51:    got int *<noident> [sparse]
drivers/mtd/nand/davinci_nand.c:593:49: warning: incorrect type in argument 3 (different type sizes) [sparse]
drivers/mtd/nand/davinci_nand.c:593:49:    expected unsigned int [usertype] *out_value [sparse]
drivers/mtd/nand/davinci_nand.c:593:49:    got unsigned char *<noident> [sparse]


and it leaves you open to memory corruption, as of_property_read_u32()
might try clobbering 3 more bytes of data after the ecc_bits field.

All in all, there's a reason the code is written the way it is, and I
don't see any good reason to do what your patch does.

Brian

>  
>  		prop = of_get_nand_bus_width(pdev->dev.of_node);
>  		if (0 < prop || !of_property_read_u32(pdev->dev.of_node,
> -- 
> 1.9.1
> 
