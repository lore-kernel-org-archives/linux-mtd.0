Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eD4Ya-000779-MX
 for linux-mtd@lists.infradead.org; Fri, 10 Nov 2017 08:20:58 +0000
Subject: Re: [PATCH v3 4/7] mtd: onenand: omap2: Remove partitioning support
 from platform data
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091444.dxvoaaafjgkf43a2@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <de8a8a40-af31-01af-f523-6fa6dbca2a70@ti.com>
Date: Fri, 10 Nov 2017 10:19:11 +0200
MIME-Version: 1.0
In-Reply-To: <20171109091444.dxvoaaafjgkf43a2@lenoch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/17 11:14, Ladislav Michl wrote:
> No platform data user setups partitioning informations, so remove.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  Changes:
>  -v2: new patch
>  -v3: none
> 
>  drivers/mtd/onenand/omap2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index 93bd94337b35..883993bbe40b 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -703,8 +703,7 @@ static int omap2_onenand_probe(struct platform_device *pdev)
>  	if ((r = onenand_scan(&c->mtd, 1)) < 0)
>  		goto err_release_dma;
>  
> -	r = mtd_device_register(&c->mtd, pdata ? pdata->parts : NULL,
> -				pdata ? pdata->nr_parts : 0);
> +	r = mtd_device_register(&c->mtd, NULL, 0);
>  	if (r)
>  		goto err_release_onenand;
>  
> 

Same here. Need to update platform data structure.

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
