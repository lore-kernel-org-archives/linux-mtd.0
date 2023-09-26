Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0475E7E62D
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tk4mwHB/9RhXZGARK+wrIgmbb5ObbA35SVjA96cJlJ0=; b=mzoGRy9qrVgI7Z
	6wY8YQo9d1PaSPYSQKQU16hImg+nzSGviPkDWHoqvOxf54/0jkKaMjv0dV92i70FWNKybDb2fGFk7
	enVHbeQO1oNZj9U/AA2QigPEEwpKfwvhpeB+DS4nD5yEhvDkPqVoV6pmxSrHTunCjY2F+/q2e86Cs
	FX9Qvfobkw18wj75z7IFy8EVGgnvqQZf2Fmk4+6sWr0uLVDtOGFRcPzRYGPEM1R401xHSqtWqEp++
	wBCSzVXqtUtuF4HiMXt0hOxYK8noHhjN/cW4srDAx/0s9WM9sZ1zRScY241YyNkMcVrlFyZ/+Lruh
	vKbtIwvIuWJqOWJL2afA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6iY-00GJKl-17;
	Tue, 26 Sep 2023 11:59:06 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6iU-00GJJG-2c
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 11:59:04 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467831918"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="467831918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 04:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="922395899"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="922395899"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 04:58:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andy@kernel.org>)
	id 1ql6iI-00000000aw9-1RsA;
	Tue, 26 Sep 2023 14:58:50 +0300
Date: Tue, 26 Sep 2023 14:58:50 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RFT PATCH] mtd: rawnand: ingenic: move the GPIO quirk to
 gpiolib-of.c
Message-ID: <ZRLHeuohRgEtTLHz@smile.fi.intel.com>
References: <20230926090623.35595-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926090623.35595-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_045902_856347_B2A328A7 
X-CRM114-Status: GOOD (  24.48  )
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

On Tue, Sep 26, 2023 at 11:06:23AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We have a special place for OF polarity quirks in gpiolib-of.c. Let's
> move this over there so that it doesn't pollute the driver.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> This is an alternative to the previous patch that instead of replacing
> one active-low setter with another, just moves the quirk over to
> gpiolib-of.c

Much better than that in my opinion.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

>  drivers/gpio/gpiolib-of.c                       |  9 +++++++++
>  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 12 ------------
>  2 files changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 5515f32cf19b..58c0bbe9d569 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -192,6 +192,15 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
>  		 */
>  		{ "himax,hx8357",	"gpios-reset",	false },
>  		{ "himax,hx8369",	"gpios-reset",	false },
> +		/*
> +		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
> +		 * the ingenic driver) got it wrong. The active state encodes the
> +		 * NAND ready state, which is high level. Since there's no signal
> +		 * inverter on this board, it should be active-high. Let's fix that
> +		 * here for older DTs so we can re-use the generic nand_gpio_waitrdy()
> +		 * helper, and be consistent with what other drivers do.
> +		 */
> +		{ "qi,lb60",		"rb-gpios",	true },
>  #endif
>  	};
>  	unsigned int i;
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> index 6748226b8bd1..c816dc137245 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -380,18 +380,6 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
>  		return ret;
>  	}
>  
> -	/*
> -	 * The rb-gpios semantics was undocumented and qi,lb60 (along with
> -	 * the ingenic driver) got it wrong. The active state encodes the
> -	 * NAND ready state, which is high level. Since there's no signal
> -	 * inverter on this board, it should be active-high. Let's fix that
> -	 * here for older DTs so we can re-use the generic nand_gpio_waitrdy()
> -	 * helper, and be consistent with what other drivers do.
> -	 */
> -	if (of_machine_is_compatible("qi,lb60") &&
> -	    gpiod_is_active_low(nand->busy_gpio))
> -		gpiod_toggle_active_low(nand->busy_gpio);
> -
>  	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
>  
>  	if (IS_ERR(nand->wp_gpio)) {
> -- 
> 2.39.2
> 

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
