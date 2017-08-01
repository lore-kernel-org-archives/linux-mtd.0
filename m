Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcVgK-0001WY-6c
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 11:49:51 +0000
Received: by mail-wr0-x22c.google.com with SMTP id 33so5732297wrz.4
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 04:49:27 -0700 (PDT)
Subject: Re: [PATCH 2/6] mtd: oxnas_nand: Handle
 clk_prepare_enable/clk_disable_unprepare.
To: Arvind Yadav <arvind.yadav.cs@gmail.com>,
 boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@lists.tuxfamily.org
References: <1501587447-21079-1-git-send-email-arvind.yadav.cs@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <e30bab37-4aea-fad4-2ea0-912508bdaa80@baylibre.com>
Date: Tue, 1 Aug 2017 13:49:22 +0200
MIME-Version: 1.0
In-Reply-To: <1501587447-21079-1-git-send-email-arvind.yadav.cs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/01/2017 01:37 PM, Arvind Yadav wrote:
>  - clk_prepare_enable() can fail here and we must check its return value.
>  - oxnas_nand_probe() can fail here and we must disable clock.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/mtd/nand/oxnas_nand.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/oxnas_nand.c
> index 1b207aa..7061bb2 100644
> --- a/drivers/mtd/nand/oxnas_nand.c
> +++ b/drivers/mtd/nand/oxnas_nand.c
> @@ -112,14 +112,19 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	if (count > 1)
>  		return -EINVAL;
>  
> -	clk_prepare_enable(oxnas->clk);
> +	err = clk_prepare_enable(oxnas->clk);
> +	if (err)
> +		return err;
> +
>  	device_reset_optional(&pdev->dev);
>  
>  	for_each_child_of_node(np, nand_np) {
>  		chip = devm_kzalloc(&pdev->dev, sizeof(struct nand_chip),
>  				    GFP_KERNEL);
> -		if (!chip)
> -			return -ENOMEM;
> +		if (!chip) {
> +			err = -ENOMEM;
> +			goto err_clk_unprepare;
> +		}
>  
>  		chip->controller = &oxnas->base;
>  
> @@ -139,12 +144,12 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  		/* Scan to find existence of the device */
>  		err = nand_scan(mtd, 1);
>  		if (err)
> -			return err;
> +			goto err_clk_unprepare;
>  
>  		err = mtd_device_register(mtd, NULL, 0);
>  		if (err) {
>  			nand_release(mtd);
> -			return err;
> +			goto err_clk_unprepare;
>  		}
>  
>  		oxnas->chips[nchips] = chip;
> @@ -152,12 +157,18 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Exit if no chips found */
> -	if (!nchips)
> -		return -ENODEV;
> +	if (!nchips) {
> +		err = -ENODEV;
> +		goto err_clk_unprepare;
> +	}
>  
>  	platform_set_drvdata(pdev, oxnas);
>  
>  	return 0;
> +
> +err_clk_unprepare:
> +	clk_disable_unprepare(oxnas->clk);
> +	return err;
>  }
>  
>  static int oxnas_nand_remove(struct platform_device *pdev)
> 

Indeed, Thanks,
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
