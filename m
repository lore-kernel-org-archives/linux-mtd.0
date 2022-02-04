Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Feb 2022 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5/c9o+jeZCHoRsr2IUQGbXdKc1CCot6FYPKC7sBiw4=; b=ZTGtJf74S1kVHk
	bbyQSn2tAEk0cwTStuPUnnoj6fCIIoS2xzAdfByrITTVoqJfrxQG8nbhFUfgXwzeK/omwSuupEGcu
	hu8BtXzOG/Y7n6zYHbXXy/WFGo7922o0P/vwtKzKMRDpXZczp+fshsz8o2EmeyffggOUbcPOeyKGi
	COT5JRFUxYDsUXMQDnvhgQvDvt3LVmfgKZuva7edfwM0mBdBzmuocoRUZjgJ9is1WuHaB5XEtd4tY
	lzwMrmJEBXrbQZsYhKD04B+3QGAfp5019HqCfwrqvIJMe9FfqImskkLCNY15hLiWPvbiXuxrd7c0d
	q578hPm1QF9xt0mgKZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFyif-004Oq3-QH; Fri, 04 Feb 2022 13:33:45 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFyic-004OmT-MN; Fri, 04 Feb 2022 13:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=4Ca9I/sAMzQIMCAYXBkIkytKRwdb7KuHMc9w1XGE+7A=; b=0N30fHOeJKKiEmBzHSSAjOwTCo
 NpvFMTne+ReR7L/rMoQIq2d5/1hRKjsDPqIORGjajQW+UTS2E2q3Z/w61nDp6gVZ6OVzpiYsw2EyW
 pLoL11FZdneTXfJN6pJjgvs7Ay984ejA0+yx0g4+Hjhydr9jhY9l2gbt/i994/BsW7lk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nFyhL-004Gxv-Fm; Fri, 04 Feb 2022 14:32:23 +0100
Date: Fri, 4 Feb 2022 14:32:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: nick.hawkins@hpe.com, verdun@hpe.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Corey Minyard <minyard@acm.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Hao Fang <fanghao11@huawei.com>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Message-ID: <Yf0q5/Jus+mz0B2E@lunn.ch>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_053342_769577_043493D0 
X-CRM114-Status: GOOD (  15.35  )
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

> > +#include <linux/init.h>
> > +#include <asm/mach/arch.h>
> > +#include <asm/mach/map.h>
> > +#include <linux/of.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/clocksource.h>
> 
> It's normal to list all linux/ includes before asm/ includes. Please
> rearrange.

Hi Nick

Since you are new to the kernel, please let me point out, you should
consider Russell comments for all your code, not just this one file.
Many of the comments are generic to code anywhere in the kernel. So it
would be good to fix the same issues in the rest of your code base
before submitting them.

I would also suggest that when you start submitting drivers, submit
just one or two to start with. You will learn a lot from the feedback
you get, and you can apply what you have learnt to the rest of your
code before you post them for review.

I would also suggest you spend 30 minutes a day just reading comments
other patches receive. You can also learn a lot that way, see if the
comments apply to your own code. You will also learn about processes
this way, which can be just as challenging to get right as code.

     Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
