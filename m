Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA00C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Feb 2022 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjmeiBuNFSLWTE9CTlMKDH+5zA5nOnHcX1jVJTuC9Lc=; b=01vErAByIY5D4Z
	gYZrOAyB0xOSYwClvlOKcF1MVb55lUpaf4U0l0qHy9iO5YCChWy32mYJx8YldLM5hb0TPCXelW/8a
	+zi54RWbfPJXqOiiu8Z5lqJFmoouVGCieGgwNh5h08YGldRmOivvIcgo+VILAS00Y/ggmnppFl0cW
	b3xys6CGXCE8moMX4gisFMoRXFuzNVwsZtu1Hh9GizqS70iIihOjxHe8wtaw15bjeqLpvlALDU5HW
	rdqQFuQgEZNPlES5XK389H4G3YN1pMV2CsaJB8lUSX0h0skDIpTdzpPuRczuu2A6OXm44CdYQlA2P
	4NQk03Ckk+2j2XOAzO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFxku-004IJo-KU; Fri, 04 Feb 2022 12:32:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFxkq-004IHo-7H; Fri, 04 Feb 2022 12:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mzxF9rMeHdGHwkTPDimCxRmilWqf6MiwMi9qg5Sr64g=; b=vl3i11hF8iQy1h0Ag1YRBLQAG7
 dAUWYNtSwGnV/h/3SZGvDI79vCb1IEbbtu1UQ3FfZta2TTQ2uI3cfSWVhx6A7bIW/Wj5SVNcGD6XY
 418/0rcrILwiuHAWq2bEWrG3CtJrTzBtQ1S0fQbDDKu7PuyDjJWcpusaTPiE+f8BhmPgO0W9dxqG4
 ANF4a80aclwToWxEzEbz1ZbszC59Wpan34MN2z1REh6gVUGqTNlsaxyfNT/K03UeG6PDgF8dQPSMY
 lB6C1Kf71mwm4Og/bizKfCFlky7D1xuMSKf6R6BoJmtueaOi3urC0I9J+3NpAOum1WYjEIoCK3VOg
 bTdYh5bg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57040)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nFxk9-0004Zj-N4; Fri, 04 Feb 2022 12:31:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nFxk2-0004yb-7L; Fri, 04 Feb 2022 12:31:06 +0000
Date: Fri, 4 Feb 2022 12:31:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joe Perches <joe@perches.com>
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
Message-ID: <Yf0cihUQ1byjnh3d@shell.armlinux.org.uk>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
 <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_043156_285319_FE99AFA5 
X-CRM114-Status: GOOD (  16.16  )
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

On Fri, Feb 04, 2022 at 04:18:24AM -0800, Joe Perches wrote:
> On Fri, 2022-02-04 at 12:05 +0000, Russell King (Oracle) wrote:
> > On Wed, Feb 02, 2022 at 10:52:50AM -0600, nick.hawkins@hpe.com wrote:
> > > +	if (readb_relaxed(timer->control) & MASK_TCS_TC) {
> > > +		writeb_relaxed(MASK_TCS_TC, timer->control);
> > > +
> > > +		event_handler = READ_ONCE(timer->evt.event_handler);
> > > +		if (event_handler)
> > > +			event_handler(&timer->evt);
> > > +		return IRQ_HANDLED;
> > > +	} else {
> > > +		return IRQ_NONE;
> > > +	}
> > > +}
> 
> It's also less indented code and perhaps clearer to reverse the test
> 
> 	if (!readb_relaxed(timer->control) & MASK_TCS_TC)

This will need to be:

 	if (!(readb_relaxed(timer->control) & MASK_TCS_TC))

> 		return IRQ_NONE;
> 
> 	writeb_relaxed(MASK_TCS_TC, timer->control);
> 
> 	event_handler = READ_ONCE(timer->evt.event_handler);
> 	if (event_handler)
> 		event_handler(&timer->evt);
> 
> 	return IRQ_HANDLED;
> 
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
