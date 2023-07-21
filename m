Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB046EB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CshDpROkA6JWcFL+KSMShx6apWOhHonaotNBbJVQ8L4=; b=tykf/qI+k4UGTo
	sc8O7bqXMt908ZwW3QlZbg0zArXEn3mZylhXj+93gqWmDwom4bK0A5cfsRBqUe3R92KislfaaJRJS
	Y3J9YPxBOWGj8qkZhZvxNtHOkVN+tKI4TqJ6k4/UfTv5odxrWJ9z/8DkznYegkeqdnDH4mm+hWWfa
	cWlSFaVyV+eisCdYbssQpsX+pQ5dM9u2DWqdYR2Nlhyje6rQs7bGMOo4pKdfZKX5mb2J6svdDQAcm
	7LVXmhv598n8qtiFFYO+6D0qEvD6UrpTh4oK9yEva27+VDSgxrUKmPYHvFB2eng3xukJicyErEfhW
	/1RNCLQLJVZ7nbm/zBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtz5-00El9v-2f;
	Fri, 21 Jul 2023 17:32:07 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsyz-00Eaf8-1F;
	Fri, 21 Jul 2023 16:27:58 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346665442"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="346665442"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 09:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055606811"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="1055606811"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2023 09:27:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMsyf-00CQg1-0P;
	Fri, 21 Jul 2023 19:27:37 +0300
Date: Fri, 21 Jul 2023 19:27:36 +0300
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
Subject: Re: [PATCH v3 24/42] mtd: nand: add support for ts72xx
Message-ID: <ZLqx+Osn3gcHjUph@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-24-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-24-3d63a5f1103e@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_092757_435020_5256DF0F 
X-CRM114-Status: GOOD (  23.58  )
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

On Thu, Jul 20, 2023 at 02:29:24PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Technologic Systems has it's own nand controller implementation in CPLD.

...

+ bits.h

> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

...

> +static int ts72xx_nand_attach_chip(struct nand_chip *chip)
> +{
> +	switch (chip->ecc.engine_type) {
> +	case NAND_ECC_ENGINE_TYPE_SOFT:
> +		if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
> +			chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
> +		break;
> +	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> +		return -EINVAL;
> +	default:

> +		break;

Here it will return 0, is it a problem?

> +	}
> +
> +	return 0;
> +}

...

> +static int ts72xx_nand_probe(struct platform_device *pdev)
> +{
> +	struct ts72xx_nand_data *data;
> +	struct device_node *child;
> +	struct mtd_info *mtd;
> +	int err;

> +	/* Allocate memory for the device structure (and zero it) */

Useless comment.

> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->controller.ops = &ts72xx_nand_ops;
> +	nand_controller_init(&data->controller);
> +	data->chip.controller = &data->controller;
> +
> +	data->io_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(data->io_base))
> +		return PTR_ERR(data->io_base);
> +
> +	child = of_get_next_child(pdev->dev.of_node, NULL);

Why not using device property API from day 1?

	fwnode_get_next_child_node()

> +	if (!child)
> +		return dev_err_probe(&pdev->dev, -ENXIO,
> +				"ts72xx controller node should have exactly one child\n");

From now on you leak the reference count in error path.

> +	nand_set_flash_node(&data->chip, child);
> +	mtd = nand_to_mtd(&data->chip);
> +	mtd->dev.parent = &pdev->dev;
> +
> +	data->chip.legacy.IO_ADDR_R = data->io_base;
> +	data->chip.legacy.IO_ADDR_W = data->io_base;
> +	data->chip.legacy.cmd_ctrl = ts72xx_nand_hwcontrol;
> +	data->chip.legacy.dev_ready = ts72xx_nand_device_ready;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	/*
> +	 * This driver assumes that the default ECC engine should be TYPE_SOFT.
> +	 * Set ->engine_type before registering the NAND devices in order to
> +	 * provide a driver specific default value.
> +	 */
> +	data->chip.ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
> +
> +	/* Scan to find existence of the device */
> +	err = nand_scan(&data->chip, 1);
> +	if (err)
> +		return err;
> +
> +	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
> +	if (err) {
> +		nand_cleanup(&data->chip);

> +		return err;
> +	}
> +
> +	return 0;


These 4 lines can be simply

	return err;

but see above.

> +}

...

> +static void ts72xx_nand_remove(struct platform_device *pdev)
> +{
> +	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &data->chip;
> +	int ret;
> +
> +	ret = mtd_device_unregister(nand_to_mtd(chip));

> +	WARN_ON(ret);

Why?!  Is it like this in other MTD drivers?

> +	nand_cleanup(chip);
> +}

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
