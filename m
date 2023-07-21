Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F506EB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 16:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k57mm75oi+CUSKuELFqMKts6ZFO2SBQeS/s2k0oTdtQ=; b=1QppqZm6c5pebH
	7fW4SCmde7wf6Q/uFtQ9KEIwz7TG4fcGMJQo9o5cI43TkGBlXCbr4S4+WUDsfHt5EWkgBqYDJ8Tba
	jsIzBANgzVZFYgngFWRNTZ3rbYzqpkaOxqtamQP0PyGNBl9yHdf8TjZWWFpHfE4cLTa2FUoiV8aka
	5G81rjhi/jJV7eDiCplpWw4tpbzcCNBwBlw8sSJR12av22bbYxxhAeXDpzOYHjOAz56mmIQQ1wTRy
	bHGlTi93KnQMggUfR21cD6A6M8UiRaoMr18FzGcfJ7A8a8vZUzdRcJl0kLvNwRFc7aJouTYJD+Aw3
	c/gyAgIbv/uQQVFvfgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMssc-00EZWq-0W;
	Fri, 21 Jul 2023 16:21:22 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMssX-00EZVh-2r;
	Fri, 21 Jul 2023 16:21:19 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453435634"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="453435634"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 09:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848870377"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="848870377"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 09:21:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMssF-00CCBV-0a;
	Fri, 21 Jul 2023 19:20:59 +0300
Date: Fri, 21 Jul 2023 19:20:58 +0300
From: Andy Shevchenko <andy@kernel.org>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 22/42] dma: cirrus: add DT support for Cirrus EP93xx
Message-ID: <ZLqwajir6kFLgbcm@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-22-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-22-3d63a5f1103e@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_092117_933993_37165ED0 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu, Jul 20, 2023 at 02:29:22PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> - drop subsys_initcall code
> - add OF ID match table with data
> - add of_probe for device tree

...

> +#include <linux/of_device.h>

Why?

...

> +#ifdef CONFIG_OF

Why this ugly ifdeffery?

...

> +	data = of_device_get_match_data(&pdev->dev);

device_get_match_data()

> +	if (!data)
> +		return ERR_PTR(dev_err_probe(&pdev->dev, -ENODEV, "No device match found\n"));

...

> +	edma = devm_kzalloc(&pdev->dev,
> +					  struct_size(edma, channels, data->num_channels),
> +				      GFP_KERNEL);

Something wrong with indentation. Not the first time, please check all your
patches for this kind of issues.

> +		return ERR_PTR(-ENOMEM);

...

> +		edmac->regs = devm_platform_ioremap_resource(pdev, i);

No check?

> +		edmac->irq = platform_get_irq(pdev, i);

No check?

> +		edmac->edma = edma;
> +
> +		edmac->clk = of_clk_get(np, i);

> +

Redundant blank line.

Why one of devm_clk_get*() can't be called?

> +		if (IS_ERR(edmac->clk)) {
> +			dev_warn(&pdev->dev, "failed to get clock\n");
> +			continue;
> +		}

...

> +	if (platform_get_device_id(pdev))
> +		edma = ep93xx_init_from_pdata(pdev);
> +	else
> +		edma = ep93xx_dma_of_probe(pdev);

> +

Unneeded blank line.

> +	if (!edma)
> +		return PTR_ERR(edma);

...

> --- a/include/linux/platform_data/dma-ep93xx.h
> +++ b/include/linux/platform_data/dma-ep93xx.h

>  #include <linux/types.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>

> +#include <linux/of.h>

property.h.

...

> +	if (of_device_is_compatible(dev_of_node(chan->device->dev), "cirrus,ep9301-dma-m2p"))
> +		return true;
> +

device_is_compatible()

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
