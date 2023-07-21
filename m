Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4783DEB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+eekf1YWdss/sf8R3DrKB49T4MLELYK5LoVvBs9wrU=; b=bGE1rCaiqAevFh
	f4MWqweBXnEdpu6jA4rBjoFpM8xjvzz3q02Oj5lQT60a0mlO0H13iu2LiGOZY2qrygK9hzo0Amgpi
	DWayAyeMywHmjAxAvP4NHOkHUjJ3TaBZGy1Zn3EiQM/u+JHw45dcpzeJ5IxWRxn7eNEU8tf+uf/Cv
	+oAYBthXz6LS//Ym7Qhq/cf1VcbRsp0U/rZLn9ku/oBSkmZ0PiFceXfyA7TdeLHfClnHLBO3KtMak
	/bogBCqgzRpFq+FWOj+juuASwjAcXwociRl0N8cqc0SxfmYYQacko2n/6QjscjR5dfaCRSJVd3byQ
	CJP2/dF2oC7ZPSeq/X3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqtg-00EFsM-1y;
	Fri, 21 Jul 2023 14:14:20 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqtc-00EFrs-1B;
	Fri, 21 Jul 2023 14:14:17 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351909959"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="351909959"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 07:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="794968734"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="794968734"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 07:13:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMqtH-007oK8-1x;
	Fri, 21 Jul 2023 17:13:55 +0300
Date: Fri, 21 Jul 2023 17:13:55 +0300
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
Subject: Re: [PATCH v3 07/42] soc: Add SoC driver for Cirrus ep93xx
Message-ID: <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_071416_447322_FC8E6BA1 
X-CRM114-Status: GOOD (  26.03  )
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

On Thu, Jul 20, 2023 at 02:29:07PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> This adds an SoC driver for the ep93xx. Currently there
> is only one thing not fitting into any other framework,
> and that is the swlock setting.
> 
> It's used for clock settings and restart.

> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>
> +#include <linux/soc/cirrus/ep93xx.h>

...

> +#define EP93XX_SYSCON_SYSCFG_REV_MASK	0xf0000000

GENMASK() (you will need bits.h, and looking below you seem missed it anyway)

...

> +	spin_lock_irqsave(&ep93xx_swlock, flags);
> +
> +	regmap_read(map, EP93XX_SYSCON_DEVCFG, &val);
> +	val &= ~clear_bits;
> +	val |= set_bits;
> +	regmap_write(map, EP93XX_SYSCON_SWLOCK, EP93XX_SWLOCK_MAGICK);
> +	regmap_write(map, EP93XX_SYSCON_DEVCFG, val);

Is this sequence a must?
I.o.w. can you first supply magic and then update devcfg?

> +	spin_unlock_irqrestore(&ep93xx_swlock, flags);

...

> +void ep93xx_swlocked_update_bits(struct regmap *map, unsigned int reg,
> +				 unsigned int mask, unsigned int val)
> +{

Same Q as above.

> +}

...

> +	int rev = ep93xx_chip_revision(map);
> +
> +	switch (rev) {

	switch(ep93xx_chip_revision(map))

?

> +	case EP93XX_CHIP_REV_D0:
> +		return "D0";
> +	case EP93XX_CHIP_REV_D1:
> +		return "D1";
> +	case EP93XX_CHIP_REV_E0:
> +		return "E0";
> +	case EP93XX_CHIP_REV_E1:
> +		return "E1";
> +	case EP93XX_CHIP_REV_E2:
> +		return "E2";
> +	default:
> +		return "unknown";
> +	}

...

> +static unsigned long __init calc_pll_rate(u64 rate, u32 config_word)
> +{
> +	rate *= ((config_word >> 11) & GENMASK(4, 0)) + 1;	/* X1FBD */
> +	rate *= ((config_word >> 5) & GENMASK(5, 0)) + 1;	/* X2FBD */
> +	do_div(rate, (config_word & GENMASK(4, 0)) + 1);	/* X2IPD */
> +	rate >>= ((config_word >> 16) & 3);			/* PS */

GENMASK()

> +	return rate;
> +}

...

> +	/* Multiplatform guard, only proceed on ep93xx */
> +	if (!of_machine_is_compatible("cirrus,ep9301"))
> +		return 0;

Why?

> +	map = syscon_regmap_lookup_by_compatible("cirrus,ep9301-syscon");
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);

Is this not enough?

...

> +	if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
> +		clk_pll1_rate = EP93XX_EXT_CLK_RATE;
> +	else
> +		clk_pll1_rate = calc_pll_rate(EP93XX_EXT_CLK_RATE, value);

Positive conditionals in if-else are easier to be read.

...

> +	clk_f_div = fclk_divisors[(value >> 25) & 0x7];
> +	clk_h_div = hclk_divisors[(value >> 20) & 0x7];
> +	clk_p_div = pclk_divisors[(value >> 18) & 0x3];

GENMASK() in all three?

...

> +	np = of_find_node_by_path("/");
> +	of_property_read_string(np, "model", &machine);
> +	if (machine)
> +		attrs->machine = kstrdup(machine, GFP_KERNEL);

No error check?

> +	of_node_put(np);

Looks like NIH of_flat_dt_get_machine_name(). Can you rather make use of it as
it's done, e.g., here arch/riscv/kernel/setup.c:251?

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
