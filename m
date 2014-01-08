Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0gcd-0007fc-J4
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 00:03:48 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ200I7W2TOTU20@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 09:03:24 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Wei Yongjun' <weiyj.lk@gmail.com>,
 'Brian Norris' <computersforpeace@gmail.com>
References: <CAPgLHd-2rHs_v0=tsnG08oJqaf1YmF2peeB_6KJQRnwK6r2N+w@mail.gmail.com>
In-reply-to: <CAPgLHd-2rHs_v0=tsnG08oJqaf1YmF2peeB_6KJQRnwK6r2N+w@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: plat_nand: remove redundant return value check
 of platform_get_resource()
Date: Wed, 08 Jan 2014 09:03:24 +0900
Message-id: <001501cf0c05$0ca196c0$25e4c440$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>, yongjun_wei@trendmicro.com.cn,
 'Rob Herring' <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 'Grant Likely' <grant.likely@linaro.org>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, January 07, 2014 10:38 PM, Wei Yongjun wrote:
> 
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource(). And move those two call together
> to make the connection between them more clear.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/mtd/nand/plat_nand.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
> index 4ebed72..0b068a5 100644
> --- a/drivers/mtd/nand/plat_nand.c
> +++ b/drivers/mtd/nand/plat_nand.c
> @@ -48,16 +48,13 @@ static int plat_nand_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENXIO;
> -
>  	/* Allocate memory for the device structure (and zero it) */
>  	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
>  			    GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> 
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	data->io_base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(data->io_base))
>  		return PTR_ERR(data->io_base);
