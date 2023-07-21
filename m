Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41405EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+gxeuSFmvvJr93suDaZn9FOHAXCWb248QODNeOscGE=; b=Jv+Jx6yJLSVhQW
	rFcfmPcDylzB6TAe0DrtNWz+wPxUROXlA4XylC/8TOVnFuyq6VqBUsakIND+tZUuDCiML0yQtnQCe
	ZbcWgpdtgA/ceda8NVcs4UJ5KjPZsefUV4o139q8dfJWWrdedcsL9jFsQbQbmf1J7PRMUXwp8I0Nl
	wsnrnFRm16aFqiy4Ah2C62kH8A0TJRE9Q05fTkt6XomCbTxfD9Cuq2CTdoHqhopEj0tOMq5HgUJHI
	wjLyqVkw2ZMCyo0ZkjQJWobFETPFyFWbjg/8wcG0TSvBi63+McdMi5QxLd5ABvkNIIG+u9NV2gyWV
	MkjlGrVqzJplvNSXz1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqT6-00EBIE-0V;
	Fri, 21 Jul 2023 13:46:52 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqT3-00EBH2-0A;
	Fri, 21 Jul 2023 13:46:50 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433255151"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="433255151"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 06:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="728103153"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="728103153"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 06:46:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMqSj-006s0v-2p;
	Fri, 21 Jul 2023 16:46:29 +0300
Date: Fri, 21 Jul 2023 16:46:29 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Kris Bahnsen <kris@embeddedts.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lukasz Majewski <lukma@denx.de>, Mark Brown <broonie@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>,
	Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Reichel <sre@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 03/42] clk: ep93xx: add DT support for Cirrus EP93xx
Message-ID: <ZLqMNU6XtTEO2a1R@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-3-3d63a5f1103e@maquefel.me>
 <3fcb760c101c5f7081235290362f5c02.sboyd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fcb760c101c5f7081235290362f5c02.sboyd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_064649_178329_26C31B89 
X-CRM114-Status: GOOD (  13.43  )
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

On Thu, Jul 20, 2023 at 04:27:45PM -0700, Stephen Boyd wrote:
> Quoting Nikita Shubin via B4 Relay (2023-07-20 04:29:03)

...

> > +static bool is_best(unsigned long rate, unsigned long now,
> > +                    unsigned long best)
> > +{
> > +       return abs(rate - now) < abs(rate - best);
> 
> Another case where we need abs_diff() so that it doesn't get confused
> when trying to do signed comparison.

Here you are: Message-Id: <20230721134235.15517-1-andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
