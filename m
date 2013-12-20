Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vu29r-0006xT-8l
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 15:38:36 +0000
Date: Fri, 20 Dec 2013 12:38:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 3/8] mtd: lantiq-flash: Use devm_kzalloc()
Message-ID: <20131220153816.GA14450@localhost>
References: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
 <001001cefd55$aa828110$ff878330$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001001cefd55$aa828110$ff878330$%han@samsung.com>
Cc: 'David Woodhouse' <dwmw2@infradead.org>,
 'Brian Norris' <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 'Thomas Langer' <thomas.langer@lantiq.com>,
 'John Crispin' <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 20, 2013 at 04:32:41PM +0900, Jingoo Han wrote:
> Use devm_kzalloc() to make cleanup paths simpler.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Change since v1
> - Remove unnecessary goto labels.
> 
>  drivers/mtd/maps/lantiq-flash.c |   31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
> index d7ac65d..45a7ac7 100644
> --- a/drivers/mtd/maps/lantiq-flash.c
> +++ b/drivers/mtd/maps/lantiq-flash.c
> @@ -123,24 +123,22 @@ ltq_mtd_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	ltq_mtd = kzalloc(sizeof(struct ltq_mtd), GFP_KERNEL);
> +	ltq_mtd = devm_kzalloc(&pdev->dev, sizeof(struct ltq_mtd), GFP_KERNEL);

And you don't check if the allocation succeded?

>  	platform_set_drvdata(pdev, ltq_mtd);
>  
>  	ltq_mtd->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!ltq_mtd->res) {
>  		dev_err(&pdev->dev, "failed to get memory resource\n");
> -		err = -ENOENT;
> -		goto err_out;
> +		return -ENOENT;
>  	}
>  
> -	ltq_mtd->map = kzalloc(sizeof(struct map_info), GFP_KERNEL);
> +	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
> +				    GFP_KERNEL);

Ditto.

I think that's a far more urgent fix, than moving to devm_kzalloc.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
