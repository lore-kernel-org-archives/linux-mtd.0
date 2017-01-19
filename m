Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUAPs-0000Kn-1Q
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 10:58:04 +0000
Received: by mail-wm0-x231.google.com with SMTP id r126so284275255wmr.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 02:57:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170117231421.16310-10-paul@crapouillou.net>
References: <20170117231421.16310-1-paul@crapouillou.net>
 <20170117231421.16310-10-paul@crapouillou.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jan 2017 11:55:41 +0100
Message-ID: <CAPDyKFp4idZx+ynQByz22zwsiK+reBcvt3OdHm1kR2QUy+sUhw@mail.gmail.com>
Subject: Re: [PATCH 09/13] mmc: jz4740: Let the pinctrl driver configure the
 pins
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Paul Burton <paul.burton@imgtec.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@linux-mips.org,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-pwm@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 James Hogan <james.hogan@imgtec.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[...]

>
> -#ifdef CONFIG_PM_SLEEP
> -
> -static int jz4740_mmc_suspend(struct device *dev)
> -{
> -       struct jz4740_mmc_host *host = dev_get_drvdata(dev);
> -
> -       jz_gpio_bulk_suspend(jz4740_mmc_pins, jz4740_mmc_num_pins(host));
> -

Shouldn't this be replaced with a call to:
pinctrl_pm_select_sleep_state();

> -       return 0;
> -}
> -
> -static int jz4740_mmc_resume(struct device *dev)
> -{
> -       struct jz4740_mmc_host *host = dev_get_drvdata(dev);
> -
> -       jz_gpio_bulk_resume(jz4740_mmc_pins, jz4740_mmc_num_pins(host));

Shouldn't this be replaced with a call to:
pinctrl_pm_select_default_state();

[...]

Kind regards
Uffe
