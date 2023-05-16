Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB27EC77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 16 May 2023 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PU8/KxI74ie8T6tfWere3K3dj661FK6kC7D7IHjkaxc=; b=msTvmdiCjwrRnQ
	uwrXr2ZsUjkUaxqdnhlrM11alz6S/7bO0eFEA4PWvICUbz4Q/Wx6hBVHKInq4q7dqZJqg5g1rxmdM
	5+RBG2DYs/Deo0spXakqnF2CLYhzwB+uOvO/TPNvsEVkl2j7idkd1vsiBjgVnauXbaxc4PayuF/YH
	jFygYuBIEDrN5MOptb1LAJ8rBb1dVw3+QHj1xblY34YWT+kp0QOUdjGfB/ohFmeQmcsBgH3TK30ht
	CV7k0TV7PsafC8TABA+xgnSyWnL0Ji7BIhAHbrhn/rJZHZXuQShYuEUQOxR7pQBfG5jhw6ve7xpcQ
	sYQidRSz2xGqPfT0oRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pypG7-004gNM-39;
	Tue, 16 May 2023 07:38:11 +0000
Received: from forward501b.mail.yandex.net ([178.154.239.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pypG4-004gKN-02;
	Tue, 16 May 2023 07:38:09 +0000
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:2991:0:640:bb47:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTP id 6695D5F29E;
	Tue, 16 May 2023 10:38:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id rbVsqF6Wo4Y0-UkaxrYJI;
	Tue, 16 May 2023 10:38:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1684222681;
	bh=R3NyR73k7IhF7nI84HX4UghfXKGpid2SwwTSfXwtO70=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=QotG58g6dFkLdzg/jCTCPqPNHWfIFJSnx9H8OHC12M2roLLuxVWKx6W2h25dkjVSe
	 HRwtXoqfClom0cLuEY16ejoh6MbeEy+uPI8UAhwOs+j0NQ/gw1AVexLnYUBpraFKDp
	 l0egQl1rEQANggrBncTSCi4j3ZinsQfxms2ylvX4=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <4f81a96b826344f45d0994539e3b3fe94fe7eb50.camel@maquefel.me>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Brian Norris <briannorris@chromium.org>,
 Chuanhong Guo <gch981213@gmail.com>,  Conor Dooley
 <conor.dooley@microchip.com>, Damien Le Moal <dlemoal@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Emil Renner Berthing <kernel@esmil.dk>, Eric
 Dumazet <edumazet@google.com>, Guenter Roeck <linux@roeck-us.net>, Hartley
 Sweeten <hsweeten@visionengravers.com>, Heiko Stuebner <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Jakub Kicinski
 <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jean Delvare
 <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Le Moal
 <damien.lemoal@opensource.wdc.com>,  Liam Girdwood <lgirdwood@gmail.com>,
 Liang Yang <liang.yang@amlogic.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>, Lv Ruyi
 <lv.ruyi@zte.com.cn>, Mark Brown <broonie@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>, Paolo Abeni
 <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Robert Jarzmik
 <robert.jarzmik@free.fr>,  Russell King <linux@armlinux.org.uk>, Sebastian
 Reichel <sre@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,  Stephen
 Boyd <sboyd@kernel.org>, Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven
 Peter <sven@svenpeter.dev>,  Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,  Ulf
 Hansson <ulf.hansson@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Walker Chen <walker.chen@starfivetech.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org,  linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org,  linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
Date: Tue, 16 May 2023 13:37:54 +0300
In-Reply-To: <1ff2333a-8f78-c066-0158-9c8a1a17684f@gmail.com>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	 <1ff2333a-8f78-c066-0158-9c8a1a17684f@gmail.com>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_003808_226164_5D820504 
X-CRM114-Status: GOOD (  17.09  )
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

Hello Florian!

On Mon, 2023-05-15 at 20:47 -0700, Florian Fainelli wrote:
> 
> 
> On 4/24/2023 5:34 AM, Nikita Shubin wrote:
> > This series aims to convert ep93xx from platform to full device
> > tree support.
> > 
> > Tested on ts7250 64 RAM/128 MiB Nand flash, edb9302.
> > 
> > Thank you Linus and Arnd for your support, review and comments,
> > sorry if i missed something -
> > these series are quite big for me.
> > 
> > Big thanks to Alexander Sverdlin for his testing, support, review,
> > fixes and patches.
> 
> If anyone is interested I still have a TS-7300 board [1] that is
> fully 
> functional and could be sent out to a new home.

Thank you kindly, i'll keep this in mind !

> 
> https://www.embeddedts.com/products/TS-7300


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
