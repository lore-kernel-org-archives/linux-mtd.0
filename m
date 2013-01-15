Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvBdB-0000uo-Dt
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 18:53:07 +0000
Date: Tue, 15 Jan 2013 10:52:51 -0800
From: Tony Lindgren <tony@atomide.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v8 2/5] mtd: omap-nand: pass device_node in platform data
Message-ID: <20130115185251.GB14149@atomide.com>
References: <1355481404-27695-1-git-send-email-zonque@gmail.com>
 <1355481404-27695-3-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1355481404-27695-3-git-send-email-zonque@gmail.com>
Cc: paul@pwsan.com, x0148406@ti.com, devicetree-discuss@lists.ozlabs.org,
 nsekhar@ti.com, rob.herring@calxeda.com, Daniel Mack <zonque@gmail.com>,
 grant.likely@secretlab.ca, jon-hunter@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Looks like this patch related to making GPMC work with DT was
never sent to linux-mtd or to you so adding to cc.

Is this OK to apply along with the GPMC patches, or do you want to
take this separately with the MTD patches?

Regards,

Tony

* Daniel Mack <zonque@gmail.com> [121214 02:39]:
> Pass an optional device_node pointer in the platform data, which in turn
> will be put into a mtd_part_parser_data. This way, code that sets up the
> platform devices can pass along the node from DT so that the partitions
> can be parsed.
> 
> For non-DT boards, this change has no effect.
> 
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
>  drivers/mtd/nand/omap2.c                     | 4 +++-
>  include/linux/platform_data/mtd-nand-omap2.h | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 0002d5e..1d333497c 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1332,6 +1332,7 @@ static int omap_nand_probe(struct platform_device *pdev)
>  	dma_cap_mask_t mask;
>  	unsigned sig;
>  	struct resource			*res;
> +	struct mtd_part_parser_data	ppdata = {};
>  
>  	pdata = pdev->dev.platform_data;
>  	if (pdata == NULL) {
> @@ -1557,7 +1558,8 @@ static int omap_nand_probe(struct platform_device *pdev)
>  		goto out_release_mem_region;
>  	}
>  
> -	mtd_device_parse_register(&info->mtd, NULL, NULL, pdata->parts,
> +	ppdata.of_node = pdata->of_node;
> +	mtd_device_parse_register(&info->mtd, NULL, &ppdata, pdata->parts,
>  				  pdata->nr_parts);
>  
>  	platform_set_drvdata(pdev, &info->mtd);
> diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux/platform_data/mtd-nand-omap2.h
> index 24d32ca..6bf9ef4 100644
> --- a/include/linux/platform_data/mtd-nand-omap2.h
> +++ b/include/linux/platform_data/mtd-nand-omap2.h
> @@ -60,6 +60,8 @@ struct omap_nand_platform_data {
>  	int			devsize;
>  	enum omap_ecc           ecc_opt;
>  	struct gpmc_nand_regs	reg;
> -};
>  
> +	/* for passing the partitions */
> +	struct device_node	*of_node;
> +};
>  #endif
> -- 
> 1.7.11.7
> 
