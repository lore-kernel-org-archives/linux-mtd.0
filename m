Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C3CEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOrlD8wFoBpXVDiPwQT/KddTwspaupbjBm9UzuKvs6w=; b=Yla89nZvrvn3nL
	bkSE7fRAAy9r5U1uiXVCRWJLAo5KnJWhEOtJXHRDKWPdgTQ1kcEDfH6prKGamITOu1AivDGa13WmD
	WJRRJLXKre5HEge4poAAjXTBAFIsmaehmwilyKqH0NSfOaQAPvsonrdRiafpso0AM0HxSw0k3+8m2
	5/dcLg8jE2kqzt4U6W8cssOvc+Ju/tyIBSErDsieBnfkw/OMFwjoZybjX78yaztJnrYeNuIGNWbLT
	iXRONaMhz1XJlnxdBU0mm4kwJLWVr8dKkdmzwEbvdHjzFkpTqhDOsAfuKXmp62qvYgkaiWewbIZlC
	2U1OSP97if/Ruk2eyQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsXF-00EVFm-27;
	Fri, 21 Jul 2023 15:59:17 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsXA-00EVED-36;
	Fri, 21 Jul 2023 15:59:14 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="397947184"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="397947184"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055599368"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="1055599368"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2023 08:58:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMsWt-00BQxg-0w;
	Fri, 21 Jul 2023 18:58:55 +0300
Date: Fri, 21 Jul 2023 18:58:55 +0300
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
Subject: Re: [PATCH v3 09/42] clocksource: ep93xx: Add driver for Cirrus
 Logic EP93xx
Message-ID: <ZLqrPw933NOv1J8v@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-9-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-9-3d63a5f1103e@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_085913_012902_0BA893F4 
X-CRM114-Status: GOOD (  29.41  )
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

On Thu, Jul 20, 2023 at 02:29:09PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> This us a rewrite of EP93xx timer driver in
> arch/arm/mach-ep93xx/timer-ep93xx.c trying to do everything
> the device tree way:
> 
> - Make every IO-access relative to a base address and dynamic
>   so we can do a dynamic ioremap and get going.
> - Find register range and interrupt from the device tree.

...

+ bits.h

> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/sched_clock.h>

...

> +/*************************************************************************

Won't you marc it as a DOC: section?

> + * Timer handling for EP93xx
> + *************************************************************************
> + * The ep93xx has four internal timers.  Timers 1, 2 (both 16 bit) and
> + * 3 (32 bit) count down at 508 kHz, are self-reloading, and can generate
> + * an interrupt on underflow.  Timer 4 (40 bit) counts down at 983.04 kHz,
> + * is free-running, and can't generate interrupts.
> + *
> + * The 508 kHz timers are ideal for use for the timer interrupt, as the
> + * most common values of HZ divide 508 kHz nicely.  We pick the 32 bit
> + * timer (timer 3) to get as long sleep intervals as possible when using
> + * CONFIG_NO_HZ.
> + *
> + * The higher clock rate of timer 4 makes it a better choice than the
> + * other timers for use as clock source and for sched_clock(), providing
> + * a stable 40 bit time base.
> + *************************************************************************
> + */

...

> +/*
> + * This read-only register contains the low word of the time stamp debug timer
> + * ( Timer4). When this register is read, the high byte of the Timer4 counter is

One too many spaces.

> + * saved in the Timer4ValueHigh register.
> + */

...

> +static irqreturn_t ep93xx_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct ep93xx_tcu *tcu = ep93xx_tcu;
> +	struct clock_event_device *evt = dev_id;
> +
> +	/* Writing any value clears the timer interrupt */
> +	writel(1, tcu->base + EP93XX_TIMER3_CLEAR);

Would 0 suffice?

> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int __init ep93xx_timer_of_init(struct device_node *np)
> +{
> +	int irq;
> +	unsigned long flags = IRQF_TIMER | IRQF_IRQPOLL;
> +	struct ep93xx_tcu *tcu;
> +	int ret;
> +
> +	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
> +	if (!tcu)
> +		return -ENOMEM;
> +
> +	tcu->base = of_iomap(np, 0);

fwnode_iomap()?
See below why it might make sense.

> +	if (!tcu->base) {

> +		pr_err("Can't remap registers\n");

First of all, you may utilize pr_fmt().
Second, you may add %pOF for better user experience.

> +		ret = -ENXIO;
> +		goto out_free;
> +	}

> +	irq = irq_of_parse_and_map(np, 0);

fwnode_irq_get() which is better in terms of error handling.

> +	if (irq == 0)
> +		irq = -EINVAL;
> +	if (irq < 0) {

> +		pr_err("EP93XX Timer Can't parse IRQ %d", irq);

As per above.

> +		goto out_free;
> +	}

...

> +}

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
