Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CB3C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9j9AMTdLHVCX2IY1PMUX+O9qfbMeC2NOxFw0FKn1wI=; b=KEPElfVjCSMvnj
	yJE649cXuTrhqz/9ABFEDnZR65U7ISGXADIaz7idnpNkLEhXnn9iBEK3q4ESA7w6v/c9LKeJC8qkr
	iDHJTXDfwJHHGVUhzXTJVZ67d9To597eR+4ifPLq8KgzPglMnC9R1XJX+Q7YSu/cz5pICYJcV5lGn
	SRoumDIPYWnz4dYI7fzRBrDqLtlpwYePXLxOcvW5XMsdm55RnYvbULATdOXVgXh+G+4JM4vb1ivl/
	w7eSs3C9It0VuMBZ05EOwIc7jKFtE6f8adsv00NVGYg38kjTpqtuxLwHZYsLqlNhxfw5uAzC7Xv5N
	ktsz1COABxnhaD7BuL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDMsS-0013BE-HR; Fri, 28 Jan 2022 08:45:04 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDMsH-00137j-5c
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 08:44:55 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B1392100005;
 Fri, 28 Jan 2022 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643359490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXLstaXFqkQfpjK16sCGXgpr/foQbKkP9gLuMv+ou+M=;
 b=UHjjxbcFiruNBwEk71qbiOX/ic2cUZqEMTrY03OY1dlteDtBQ0cn+qtIpJj1iPZ2NarX1M
 OR2IYEuzNO4cVW+Yubjxvkt3W/HjA03qjoufrYjhDThLAmIkhixAyIGVgQCoO/r2cV4IOd
 6F6IDEEeQ5qS3ea8WLhoYsiCE5tpxCPWJls4qWZA2k03F7RSNVwdz1sdgPttVA5hJtHVP9
 79WwyA15uxdiMlzo3AIoAStrxwK511rjXCQ0w/23Nbh3LqHObBUOqQUhIKRr8k/DnA4qQN
 rTxcO1jDWMOoOuCOfOOQWNZbAEpuNRLeeLFFq62EMvvKhm+ldO7jO6djTENNhw==
Date: Fri, 28 Jan 2022 09:44:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: Fix misuses of of_match_ptr()
Message-ID: <YfOs/y3fIdr9B/3r@piout.net>
References: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_004453_593921_CD905AD6 
X-CRM114-Status: GOOD (  26.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/01/2022 12:06:31+0100, Miquel Raynal wrote:
> of_match_ptr() either expands to NULL if !CONFIG_OF, or is transparent
> otherwise. There are several drivers using this macro which keep their
> of_device_id array enclosed within an #ifdef CONFIG_OF check, these are
> considered fine. However, When misused, the of_device_id array pointed
> by this macro will produce a warning because it is finally unused when
> compiled without OF support.
> 
> A number of fixes are possible:
> - Always depend on CONFIG_OF, but this will not always work and may
>   break boards.
> - Enclose the compatible array by #ifdef's, this may save a bit of
>   memory but will reduce build coverage.
> - Tell the compiler the array may be unused, if this can be avoided,
>   let's not do this.
> - Just drop the macro, setting the of_device_id array for a non OF
>   enabled platform is not an issue, it will just be unused.
> 
> The latter solution seems the more appropriate, so let's use it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/mtd/devices/mchp23k256.c                | 2 +-
>  drivers/mtd/devices/mchp48l640.c                | 2 +-
>  drivers/mtd/nand/raw/atmel/nand-controller.c    | 2 +-
>  drivers/mtd/nand/raw/atmel/pmecc.c              | 2 +-
>  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
>  drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 2 +-
>  drivers/mtd/nand/raw/mtk_ecc.c                  | 2 +-
>  drivers/mtd/nand/raw/omap2.c                    | 2 +-
>  drivers/mtd/nand/raw/renesas-nand-controller.c  | 2 +-
>  drivers/mtd/nand/raw/sh_flctl.c                 | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> index a8b31bddf14b..bf51eebf052c 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -234,7 +234,7 @@ MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
>  static struct spi_driver mchp23k256_driver = {
>  	.driver = {
>  		.name	= "mchp23k256",
> -		.of_match_table = of_match_ptr(mchp23k256_of_table),
> +		.of_match_table = mchp23k256_of_table,
>  	},
>  	.probe		= mchp23k256_probe,
>  	.remove		= mchp23k256_remove,
> diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
> index 231a10790196..4ec505b3f4a6 100644
> --- a/drivers/mtd/devices/mchp48l640.c
> +++ b/drivers/mtd/devices/mchp48l640.c
> @@ -362,7 +362,7 @@ MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
>  static struct spi_driver mchp48l640_driver = {
>  	.driver = {
>  		.name	= "mchp48l640",
> -		.of_match_table = of_match_ptr(mchp48l640_of_table),
> +		.of_match_table = mchp48l640_of_table,
>  	},
>  	.probe		= mchp48l640_probe,
>  	.remove		= mchp48l640_remove,
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index f3276ee9e4fe..4ecbaccf5526 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -2648,7 +2648,7 @@ static SIMPLE_DEV_PM_OPS(atmel_nand_controller_pm_ops, NULL,
>  static struct platform_driver atmel_nand_controller_driver = {
>  	.driver = {
>  		.name = "atmel-nand-controller",
> -		.of_match_table = of_match_ptr(atmel_nand_controller_of_ids),
> +		.of_match_table = atmel_nand_controller_of_ids,
>  		.pm = &atmel_nand_controller_pm_ops,
>  	},
>  	.probe = atmel_nand_controller_probe,
> diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
> index 498e41ccabbd..43ebd78816c0 100644
> --- a/drivers/mtd/nand/raw/atmel/pmecc.c
> +++ b/drivers/mtd/nand/raw/atmel/pmecc.c
> @@ -1003,7 +1003,7 @@ static int atmel_pmecc_probe(struct platform_device *pdev)
>  static struct platform_driver atmel_pmecc_driver = {
>  	.driver = {
>  		.name = "atmel-pmecc",
> -		.of_match_table = of_match_ptr(atmel_pmecc_match),
> +		.of_match_table = atmel_pmecc_match,
>  	},
>  	.probe = atmel_pmecc_probe,
>  };
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> index b18861bdcdc8..ff26c10f295d 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -567,7 +567,7 @@ static struct platform_driver ingenic_nand_driver = {
>  	.remove		= ingenic_nand_remove,
>  	.driver	= {
>  		.name	= DRV_NAME,
> -		.of_match_table = of_match_ptr(ingenic_nand_dt_match),
> +		.of_match_table = ingenic_nand_dt_match,
>  	},
>  };
>  module_platform_driver(ingenic_nand_driver);
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> index d67dbfff76cc..12b5b0484fe9 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> @@ -260,7 +260,7 @@ static struct platform_driver jz4780_bch_driver = {
>  	.probe		= jz4780_bch_probe,
>  	.driver	= {
>  		.name	= "jz4780-bch",
> -		.of_match_table = of_match_ptr(jz4780_bch_dt_match),
> +		.of_match_table = jz4780_bch_dt_match,
>  	},
>  };
>  module_platform_driver(jz4780_bch_driver);
> diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
> index 1b47964cb6da..e7df3dac705e 100644
> --- a/drivers/mtd/nand/raw/mtk_ecc.c
> +++ b/drivers/mtd/nand/raw/mtk_ecc.c
> @@ -579,7 +579,7 @@ static struct platform_driver mtk_ecc_driver = {
>  	.probe  = mtk_ecc_probe,
>  	.driver = {
>  		.name  = "mtk-ecc",
> -		.of_match_table = of_match_ptr(mtk_ecc_dt_match),
> +		.of_match_table = mtk_ecc_dt_match,
>  #ifdef CONFIG_PM_SLEEP
>  		.pm = &mtk_ecc_pm_ops,
>  #endif
> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index f0bbbe401e76..58c32a11792e 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -2298,7 +2298,7 @@ static struct platform_driver omap_nand_driver = {
>  	.remove		= omap_nand_remove,
>  	.driver		= {
>  		.name	= DRIVER_NAME,
> -		.of_match_table = of_match_ptr(omap_nand_ids),
> +		.of_match_table = omap_nand_ids,
>  	},
>  };
>  
> diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
> index 428e08362956..6db063b230a9 100644
> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
> @@ -1412,7 +1412,7 @@ MODULE_DEVICE_TABLE(of, rnandc_id_table);
>  static struct platform_driver rnandc_driver = {
>  	.driver = {
>  		.name = "renesas-nandc",
> -		.of_match_table = of_match_ptr(rnandc_id_table),
> +		.of_match_table = rnandc_id_table,
>  	},
>  	.probe = rnandc_probe,
>  	.remove = rnandc_remove,
> diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
> index 13df4bdf792a..b85b9c6fcc42 100644
> --- a/drivers/mtd/nand/raw/sh_flctl.c
> +++ b/drivers/mtd/nand/raw/sh_flctl.c
> @@ -1220,7 +1220,7 @@ static struct platform_driver flctl_driver = {
>  	.remove		= flctl_remove,
>  	.driver = {
>  		.name	= "sh_flctl",
> -		.of_match_table = of_match_ptr(of_flctl_match),
> +		.of_match_table = of_flctl_match,
>  	},
>  };
>  
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
