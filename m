Received: from mail-qa0-x22e.google.com ([2607:f8b0:400d:c00::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWZUp-0000cw-AI
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2013 22:23:16 +0000
Received: by mail-qa0-f46.google.com with SMTP id j15so5008247qaq.12
 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2013 15:22:53 -0700 (PDT)
Date: Wed, 16 Oct 2013 15:22:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v9 4/9] mtd: nand: omap: enable auto-detection of
 bus-width for omap-nand drivers
Message-ID: <20131016222248.GZ23337@ld-irv-0074.broadcom.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381816197-20477-5-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, tony@atomide.com,
 ijc+devicetree@hellion.org.uk, avinashphilipk@gmail.com, balbi@ti.com,
 robherring2@gmail.com, bcousson@baylibre.com, swarren@wwwdotorg.org,
 olof@lixom.net, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 11:19:52AM +0530, Pekon Gupta wrote:
> Autodetection of NAND device bus-width was added in generic NAND driver as
> part of following commit
> 	commit 64b37b2a63eb2f80b65c7185f0013f8ffc637ae3
> 	Author:     Matthieu CASTET <matthieu.castet@parrot.com>
> 	AuthorDate: 2012-11-06
> 	mtd: nand: add NAND_BUSWIDTH_AUTO to autodetect bus width
> This patch enables this feature for OMAP2 NAND driver
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 5596368..57a3f51 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c

[...]

> @@ -1904,6 +1903,21 @@ static int omap_nand_probe(struct platform_device *pdev)
>  		nand_chip->chip_delay = 50;
>  	}
>  
> +	/* scan for NAND device connected to chip controller */
> +	if (nand_scan_ident(mtd, 1, NULL)) {
> +		err = -ENXIO;
> +		goto out_release_mem_region;
> +	}
> +	if ((nand_chip->options & NAND_BUSWIDTH_16) !=
> +			(pdata->devsize & NAND_BUSWIDTH_16)) {
> +		pr_err("%s: detected %s device but driver configured for %s\n",
> +			DRIVER_NAME,
> +			(nand_chip->options & NAND_BUSWIDTH_16) ? "x16" : "x8",
> +			(pdata->devsize & NAND_BUSWIDTH_16) ? "x16" : "x8");

I'm not sure on the policy choice here; if you're using BUSWIDTH_AUTO,
do you even want to try to configure the buswidth by platform data?
You're not really getting the full use out of NAND_BUSWIDTH_AUTO because
the platform data has to guess the same buswidth that nand_base.c
determines. This is worse than the previous behavior, in which you would
try both buswidths if the specified type failed.

IOW, what are you trying to achieve with auto-buswidth? Automatic
determination of the buswidth or just automatic validation? What do you
achieve with platform data's selection of buswidth? Specification of the
buswidth or just a hint? Do the goals conflict? Perhaps you can just
warn, and not error out if the two selections don't match? Or maybe you
really wanted to replace the platform data selection mechanism entirely
with auto-buswidth?

> +		err = -EINVAL;
> +		goto out_release_mem_region;
> +	}
> +
>  	switch (pdata->xfer_type) {
>  	case NAND_OMAP_PREFETCH_POLLED:
>  		nand_chip->read_buf   = omap_read_buf_pref;

[...]

Brian
