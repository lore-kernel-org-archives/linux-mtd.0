Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEcwr-0003Bo-W6
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 15:16:28 +0000
Subject: Re: [PATCH v4 06/16] mtd: onenand: omap2: Remove partitioning support
 from platform data
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111212020.mmz5wjogbctsgxas@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <a7686f8d-1d44-2d30-f8bc-78788c9db31d@ti.com>
Date: Tue, 14 Nov 2017 17:14:42 +0200
MIME-Version: 1.0
In-Reply-To: <20171111212020.mmz5wjogbctsgxas@lenoch>
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

On 11/11/17 23:20, Ladislav Michl wrote:
> No platform data user setups partitioning informations, so remove.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>  Changes:
>  -v2: new patch
>  -v3: none
>  -v4: none
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

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
