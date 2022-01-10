Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA5BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 21:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQ6c2aAK6tmC3N0zTBRsAKAmCBbv2XDyg9244HODdko=; b=SUVcPZWEEj0eqk
	oUI0ZS/bQhXesFswrMydrwFJQlFogPPURThEHfQ+L1ryEJgOREo4JWTD1kECaSrK5Z7viGCSCDu7i
	HXw4zWPgErcR346KMTDnYX+NI8tU87dVPTgCInrvZEF2HOrXn0Qk63XBzJphiHOtgyJAicvFG08nM
	VMb4mgGb3ZoPORGlATWEmyjL30O8OX/YkE2qtRuSRAyIREYlq6GnAnKb5bM6Lcs2NSJLcsdtD+gQq
	MZx6ceZlkStHfNAjkpaOdM0lE9H7R7BtWB3mJweyZzdY0nw1BhEr6TMiw3dwevk2eMX8UHoWDPx99
	UeAaa888/9BoVfQpI37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n71uK-00DLs6-E7; Mon, 10 Jan 2022 21:08:48 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n71uD-00DLnv-4T; Mon, 10 Jan 2022 21:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641848921; x=1673384921;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=noXDmlMb/EBRvid+M0xTN4DJrqhApqmO9Jn6H9SNPpk=;
 b=gHbih01Mr3YKT1rv5nOjELNCkPGRHU83/EhA3wWGQz86+mj3m5NaLrGY
 cRNlionPmDPyhzgxiMHD+lmbdX4c38IpVssKIFt3Ez3wSV4fCP5BhJ2vk
 OUl8x6QnaP+pp7OxKMMBmEm8X3j3V4bJ7+wrhL3Ohu66MiFBD/2fZAIFJ
 SuThOXNcYRwgH9Q1ABzEc+sL9qao0v7wZsYyGhMpZG+5MA3sk6ADtqUHI
 D5Q40pE27lIsv6hcCdB197cktCGjmR2txz2OAAcrTC/ABxH0M0m1PhnhU
 hqBX0OGgXW31lhDi7Rj9tmYLSDf+AbanVw6XFyWYWNzCpob/jnBtwwCHk A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="240871316"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="240871316"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 13:08:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="490132599"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 13:08:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n71sd-00915P-Sm; Mon, 10 Jan 2022 23:07:03 +0200
Date: Mon, 10 Jan 2022 23:07:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 openipmi-developer@lists.sourceforge.net,
 Saravanan Sekar <sravanhome@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 kvm@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 John Garry <john.garry@huawei.com>,
 Robert Richter <rric@kernel.org>, Zha Qipeng <qipeng.zha@intel.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <Ydyf93VD8FrV7GH+@smile.fi.intel.com>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_130841_253975_BA752631 
X-CRM114-Status: GOOD (  32.30  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 10, 2022 at 09:10:14PM +0100, Uwe Kleine-K=F6nig wrote:
> On Mon, Jan 10, 2022 at 10:54:48PM +0300, Sergey Shtylyov wrote:
> > This patch is based on the former Andy Shevchenko's patch:
> > =

> > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@l=
inux.intel.com/
> > =

> > Currently platform_get_irq_optional() returns an error code even if IRQ
> > resource simply has not been found. It prevents the callers from being
> > error code agnostic in their error handling:
> > =

> > 	ret =3D platform_get_irq_optional(...);
> > 	if (ret < 0 && ret !=3D -ENXIO)
> > 		return ret; // respect deferred probe
> > 	if (ret > 0)
> > 		...we get an IRQ...
> > =

> > All other *_optional() APIs seem to return 0 or NULL in case an optional
> > resource is not available. Let's follow this good example, so that the
> > callers would look like:
> > =

> > 	ret =3D platform_get_irq_optional(...);
> > 	if (ret < 0)
> > 		return ret;
> > 	if (ret > 0)
> > 		...we get an IRQ...
> =

> The difference to gpiod_get_optional (and most other *_optional) is that
> you can use the NULL value as if it were a valid GPIO.

The problem is not only there, but also in the platform_get_irq() and that
problem is called vIRQ0. Or as Linus put it "_cookie_" for IRQ, which never
ever should be 0.

> As this isn't given with for irqs, I don't think changing the return
> value has much sense. In my eyes the problem with platform_get_irq() and
> platform_get_irq_optional() is that someone considered it was a good
> idea that a global function emits an error message. The problem is,
> that's only true most of the time. (Sometimes the caller can handle an
> error (here: the absence of an irq) just fine, sometimes the generic
> error message just isn't as good as a message by the caller could be.
> (here: The caller could emit "TX irq not found" which is a much nicer
> message than "IRQ index 5 not found".)
> =

> My suggestion would be to keep the return value of
> platform_get_irq_optional() as is, but rename it to
> platform_get_irq_silent() to get rid of the expectation invoked by the
> naming similarity that motivated you to change
> platform_get_irq_optional().

This won't fix the issue with vIRQ0.

-- =

With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
