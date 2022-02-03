Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B349FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0VvvpeCZmN5e8Oqmx+/r+LEsmUWxGCFb8M5Iei7OL0=; b=cAOFXpBGCDKrP2
	gdBigXXQ19nom93jF6GbXTl8ybNRDeZtt5kn3hQW3HKxpjbl6xFYFsLeLsU3e1mKIGxsBejf3C0pq
	ZAW/rsSu18qwxiLIODJ7+P1jp3phWdMHC7zhhIVYDM7QWi/4yhonWyYjSjMPEolVl09lo+Ns6TRvc
	oKlSQjD/ckumE7LbsGkkqAlQav/u7wypbZfiDQ6m7L81NjN70kpwqCzLGyPDgwaQpX1coX1I4YpX5
	3OHzqoO8FIOeKiPvgNIJoPInAh4We8ny89VBzqBOn3Rv23MeDhyW30fRbuVpgaxrRlXOXbUJ6qvhO
	WR3Av+5ShbbmCb/d/NlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFQvB-00HIiv-0N; Thu, 03 Feb 2022 01:28:25 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFQv8-00HIiB-4S; Thu, 03 Feb 2022 01:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5hB4xZfLGfPF68sFnaphimiyN3Dvoyj649Ifdg6NzMk=; b=2650jDKWUISCHWTrw+2qSb29hf
 Eg0kIWNamRCUEsMC3LfeWZNitulODz/nCXrDMPmXFPMUE72VH61hPSx5uwNVoOZnrOvRJe9UHfori
 IRhH/NKpS6Y8uLmfet+KJgbH4rzTYuyCthmjEIni6imLGrzK8nnQnLlUntVfmlaQkEJ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nFQdR-0042dQ-Py; Thu, 03 Feb 2022 02:10:05 +0100
Date: Thu, 3 Feb 2022 02:10:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: nick.hawkins@hpe.com
Cc: verdun@hpe.com, David Airlie <airlied@linux.ie>,
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
 Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Hao Fang <fanghao11@huawei.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
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
Message-ID: <YfsrbcgPb5de3Bvw@lunn.ch>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202165315.18282-1-nick.hawkins@hpe.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_172822_194455_35868ECC 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

>  .../bindings/display/hpe,gxp-thumbnail.txt    |  21 +
>  .../devicetree/bindings/gpio/hpe,gxp-gpio.txt |  16 +
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.txt   |  19 +
>  .../bindings/ipmi/hpegxp-kcs-bmc-cfg.txt      |  13 +
>  .../bindings/ipmi/hpegxp-kcs-bmc.txt          |  21 +

Hi Nick

In addiiton to the other feedback also given, for new bindings you
should be using yaml, not txt. You then gain validation of the
bindings.

	Andrew


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
