Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57582C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYE8D738SxwL5nLeIQDIFQ4NrAi/UkKpeXpyhrdrTmU=; b=CfnWxy30bNVh8R
	/PLGS03KEw60VHVlFAi2t5katIu4WjhO1o1IbWV0HeLQz6qEPBDDi1iRVLemSqcpns8P8P9WS8YCn
	M/GI4LV7qkT8E671Ko/Txqb7db2bqM288SuOsKx5CEDxVThUINRjBTB2sg4KlRNsjIvNDN8t6lIWf
	zZ/odlVc1lpurVNTfcH0WNIRycCDVUpnhk3XWpTzURg64s6bgffSt2mVIthpq+EHh9skZ9QE5lWK5
	AFuhqWUrm4+0Oo2zvz9rT/gEJfE6m0ckSPX2IK8jQL+veaBpTZvTEv/uAdf0VwSk3GWNT4RVoJzCi
	e4SwqPX9U9mG7H4Gl2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8MHZ-0099Fb-Rc; Fri, 14 Jan 2022 13:06:17 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8MHV-0099EE-6K; Fri, 14 Jan 2022 13:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642165573; x=1673701573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Eo7EfpdrH3wA8s8pzPgaa2QUgdkyHS+qVWfq0/cogWQ=;
 b=Q9/uY0gHtPSqmvIAilz0jJ9u/BOnyzhF4HoYODS5emwtH8HmPfA12pRN
 0P8NGAZxFqYrVHl1VSJogwS2lp3A1HFdOQfIHPbvWrsbBUfxe82wpLHf0
 heHmH4UZciS0pMPGTFgpsZU+udRLymZ4E0kR8VTpLdjjT79kfDsg/NYW5
 6r8PKA6etILniWgNazn6kOBSG87d/SVsjqa7fDd37WkLSMrRT7I2vFX0R
 jre5CE65Et0MJRfTYnaKWlU306P+vvS8MxtN2n7zgdxe9/yvqD7CkBA6r
 A7hSPNZlUi/L81EOpkwSl1y/W6j3VDy5QA+kIxmygvuNXVrchRV5bFOG2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="268604020"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="268604020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 05:06:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="530231083"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 05:05:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1n8MFy-00AcJJ-9G; Fri, 14 Jan 2022 15:04:38 +0200
Date: Fri, 14 Jan 2022 15:04:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 "David S. Miller" <davem@davemloft.net>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Sebastian Reichel <sre@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-edac@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <YeF05vBOzkN+xYCq@smile.fi.intel.com>
References: <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220113194358.xnnbhsoyetihterb@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_050613_299649_979D8764 
X-CRM114-Status: GOOD (  37.74  )
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

On Thu, Jan 13, 2022 at 08:43:58PM +0100, Uwe Kleine-K=F6nig wrote:
> The subsystems regulator, clk and gpio have the concept of a dummy
> resource. For regulator, clk and gpio there is a semantic difference
> between the regular _get() function and the _get_optional() variant.
> (One might return the dummy resource, the other won't. Unfortunately
> which one implements which isn't the same for these three.) The
> difference between platform_get_irq() and platform_get_irq_optional() is
> only that the former might emit an error message and the later won't.
> =

> To prevent people's expectations that there is a semantic difference
> between these too, rename platform_get_irq_optional() to
> platform_get_irq_silent() to make the actual difference more obvious.
> =

> The #define for the old name can and should be removed once all patches
> currently in flux still relying on platform_get_irq_optional() are
> fixed.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> =

> On Thu, Jan 13, 2022 at 02:45:30PM +0000, Mark Brown wrote:
> > On Thu, Jan 13, 2022 at 12:08:31PM +0100, Uwe Kleine-K=F6nig wrote:
> > =

> > > This is all very unfortunate. In my eyes b) is the most sensible
> > > sense, but the past showed that we don't agree here. (The most annoyi=
ng
> > > part of regulator_get is the warning that is emitted that regularily
> > > makes customers ask what happens here and if this is fixable.)
> > =

> > Fortunately it can be fixed, and it's safer to clearly specify things.
> > The prints are there because when the description is wrong enough to
> > cause things to blow up we can fail to boot or run messily and
> > forgetting to describe some supplies (or typoing so they haven't done
> > that) and people were having a hard time figuring out what might've
> > happened.
> =

> Yes, that's right. I sent a patch for such a warning in 2019 and pinged
> occationally. Still waiting for it to be merged :-\
> (https://lore.kernel.org/r/20190625100412.11815-1-u.kleine-koenig@pengutr=
onix.de)
> =

> > > I think at least c) is easy to resolve because
> > > platform_get_irq_optional() isn't that old yet and mechanically
> > > replacing it by platform_get_irq_silent() should be easy and safe.
> > > And this is orthogonal to the discussion if -ENOXIO is a sensible ret=
urn
> > > value and if it's as easy as it could be to work with errors on irq
> > > lookups.
> > =

> > It'd certainly be good to name anything that doesn't correspond to one
> > of the existing semantics for the API (!) something different rather
> > than adding yet another potentially overloaded meaning.
> =

> It seems we're (at least) three who agree about this. Here is a patch
> fixing the name.


And similar number of people are on the other side.

-- =

With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
