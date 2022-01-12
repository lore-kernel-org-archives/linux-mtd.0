Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E341C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li8n0tWPjLti0kaaWRi7ILTBJ1eRBikMoMSe1BPiYiY=; b=E3eDBUHDME+9T4
	TXL0wl3aCCIZl0h05S52z+fN62QbjK+twcertE9mHR+uSKr6YDRaLLL65bmvCteCklB/tPUv9u5Lc
	W381uiF33w/vDyCDzg7IatdYYLEnOpyZpVT18D36acE5ZAS95IzT/ZYqiZpWZpESkR28l8eJGufFh
	S9YkSmYcYxBCYXkChLOcCaU/7bR2CIa+WOPhvEW9SOB0a0jHB1xJ1cPScklyM2wuir8XsJt0QtJT7
	XZ2M7hVbuo0xQGPyKEfHOizM7jUx9IkARBgh9yY12B1ahHiH+bSBHCyVldYd6jcq6zdG0Pc8xquPM
	JAt5nJYCa29wZEabIyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7e3j-002cvO-W9; Wed, 12 Jan 2022 13:53:04 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7e3f-002cs1-Od; Wed, 12 Jan 2022 13:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641995579; x=1673531579;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6o9aGlupJ5pLyORTimcn6DvGUzsV6iRYvEXQu/xlHjg=;
 b=nTwMvAxqsLGjEdnv1t3Ca6fu/Hq6lj112WXRizLYR4VoWx0+vkyZThTa
 b7lBc3MGDbUX0VW1wivv7gp1TcWtTQd13V9WsPo51aZYSLSMfIoFiIxan
 Oz6Nlo6b46aTQEG3CSrXU49Yqj0x3qEn5EJ67GitkMfqYiPTHvk49sjoX
 EpsKnq6y3tYveqbnnT91m0RD/BBqZS9bpj8X13DwcKtJ7waSZYvu4/Z+1
 dyL2wAgJbDA3Bqsr+qhEZvsxy96WWR5MFyfij2sHjoNvRYCI2A0y2mAwC
 ZijHonAVaKuA2uPgMOjfIZQBp0m7sQCKbdJOPa59jC+r//7I/ycScWjpP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="231077539"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="231077539"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 05:52:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="474911438"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 05:52:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n7e28-009hhk-Us; Wed, 12 Jan 2022 15:51:24 +0200
Date: Wed, 12 Jan 2022 15:51:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Eric Auger <eric.auger@redhat.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, openipmi-developer@lists.sourceforge.net,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-edac@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Richard Weinberger <richard@nod.at>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <Yd7c3BTcdXcbHDUM@smile.fi.intel.com>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <Yd7Z3Qwevb/lEwQZ@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yd7Z3Qwevb/lEwQZ@lunn.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_055259_908608_33E203D0 
X-CRM114-Status: GOOD (  37.87  )
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

On Wed, Jan 12, 2022 at 02:38:37PM +0100, Andrew Lunn wrote:
> > If an optional IRQ is not present, drivers either just ignore it (e.g.
> > for devices that can have multiple interrupts or a single muxed IRQ),
> > or they have to resort to polling. For the latter, fall-back handling
> > is needed elsewhere in the driver.
> > To me it sounds much more logical for the driver to check if an
> > optional irq is non-zero (available) or zero (not available), than to
> > sprinkle around checks for -ENXIO. In addition, you have to remember
> > that this one returns -ENXIO, while other APIs use -ENOENT or -ENOSYS
> > (or some other error code) to indicate absence. I thought not having
> > to care about the actual error code was the main reason behind the
> > introduction of the *_optional() APIs.
> 
> The *_optional() functions return an error code if there has been a
> real error which should be reported up the call stack. This excludes
> whatever error code indicates the requested resource does not exist,
> which can be -ENODEV etc. If the device does not exist, a magic cookie
> is returned which appears to be a valid resources but in fact is
> not. So the users of these functions just need to check for an error
> code, and fail the probe if present.
> 
> You seems to be suggesting in binary return value: non-zero
> (available) or zero (not available)


No, what is suggested is to (besides the API changes):
- do not treat ENXIO as something special in platform_get_irq*()
- allow platform_get_irq*() to return other error codes

> This discards the error code when something goes wrong. That is useful
> information to have, so we should not be discarding it.
> 
> IRQ don't currently have a magic cookie value. One option would be to
> add such a magic cookie to the subsystem. Otherwise, since 0 is
> invalid, return 0 to indicate the IRQ does not exist.
> 
> The request for a script checking this then makes sense. However, i
> don't know how well coccinelle/sparse can track values across function
> calls. They probably can check for:
> 
>    ret = irq_get_optional()
>    if (ret < 0)
>       return ret;
> 
> A missing if < 0 statement somewhere later is very likely to be an
> error. A comparison of <= 0 is also likely to be an error. A check for
> > 0 before calling any other IRQ functions would be good. I'm
> surprised such a check does not already existing in the IRQ API, but
> there are probably historical reasons for that.
> 
>       Andrew

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
