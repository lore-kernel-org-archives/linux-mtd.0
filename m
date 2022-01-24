Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665C7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcLbRo9Yz2LAmVKVxeAHHxv6I2+PhX641Nhyd0Bq0hg=; b=WKV8y3s1ws2aC9
	dMP/c60Tq++rHA7b/HYNe1lmMhz7vPkBNFu9l4eJETaVNthOfa26RAcKfVtbEyi9xQr5WJsFRYccY
	JOCdoQpK8sXvTDNhqyXTsMxj0q9L1d5xrs8qo8Sux17YGyA/hWe5M4nhedFdcqMMpfEcYs2GPqItI
	ojGYELxryB/6L1CI7VxBxURHyTdPljfo8AxOSBeW1qPAQ+1QMmSvbg/+yxbHY3WJNY9MbqjPpGQRT
	6N6n43GmfgeStJrvS81wwnTrZlKu3NKAK5QdV7JDx0s1MmeI5ptidicxo+or9QznfOc8Fmix/mgXQ
	CUP9XfpASXNsavy8sqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC0rr-003jkx-Jw; Mon, 24 Jan 2022 15:02:51 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC0rn-003jjC-9H; Mon, 24 Jan 2022 15:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036567; x=1674572567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=12MT7URXnDq/Fp4XFhkmyf3ldBVGzHv0vwmewAlkDXU=;
 b=XolPZwCBm4jlWy/NMDoT8qtZTKc5udbKKjRQMoiTVeMuAu560qWYrz4O
 bVKv3XFCqOQfTe9ACXfpMsyaAi7YuBx060u0++v0fw0+P2ZRHHyLFaHgp
 Mth0oZFgzH4pcAszCtKGb8JFqAc+I9Q/rtocdTQB5EPG4e5aMbGX7q8Ij
 bRW/iEkglSFOkRJZHpzcn+MUpzEUx3JDM8zF4e12qBvvP+zPGIeNvJyKo
 zKqCA70UE5RCmx81IvoKOP7Nz80iWMZKuBXEXdTSi3RpduSX/ujtrUVHE
 zk2ZYplJAplNX8jsHex5KN8wOmDPZAOKHv+MOu0Jv+uS4Fkx6pREsx1vj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306776681"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="306776681"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:02:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="519972062"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:02:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nC0qE-00Dvkq-Jt; Mon, 24 Jan 2022 17:01:10 +0200
Date: Mon, 24 Jan 2022 17:01:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
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
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Sebastian Reichel <sre@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <Ye6/NgfxsZnpXE09@smile.fi.intel.com>
References: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeF05vBOzkN+xYCq@smile.fi.intel.com>
 <20220115154539.j3tsz5ioqexq2yuu@pengutronix.de>
 <YehdsUPiOTwgZywq@smile.fi.intel.com>
 <20220120075718.5qtrpc543kkykaow@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120075718.5qtrpc543kkykaow@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_070247_439598_095913FE 
X-CRM114-Status: GOOD (  55.73  )
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

On Thu, Jan 20, 2022 at 08:57:18AM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Jan 19, 2022 at 08:51:29PM +0200, Andy Shevchenko wrote:
> > On Sat, Jan 15, 2022 at 04:45:39PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Fri, Jan 14, 2022 at 03:04:38PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Jan 13, 2022 at 08:43:58PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > > > It'd certainly be good to name anything that doesn't correspond=
 to one
> > > > > > of the existing semantics for the API (!) something different r=
ather
> > > > > > than adding yet another potentially overloaded meaning.
> > > > > =

> > > > > It seems we're (at least) three who agree about this. Here is a p=
atch
> > > > > fixing the name.
> > > > =

> > > > And similar number of people are on the other side.
> > > =

> > > If someone already opposed to the renaming (and not only the name) I
> > > must have missed that.
> > > =

> > > So you think it's a good idea to keep the name
> > > platform_get_irq_optional() despite the "not found" value returned by=
 it
> > > isn't usable as if it were a normal irq number?
> > =

> > I meant that on the other side people who are in favour of Sergey's pat=
ch.
> > Since that I commented already that I opposed the renaming being a stan=
dalone
> > change.
> > =

> > Do you agree that we have several issues with platform_get_irq*() APIs?
> > =

> > 1. The unfortunate naming
> =

> unfortunate naming for the currently implemented semantic, yes.

Yes.

> > 2. The vIRQ0 handling: a) WARN() followed by b) returned value 0
> =

> I'm happy with the vIRQ0 handling. Today platform_get_irq() and it's
> silent variant returns either a valid and usuable irq number or a
> negative error value. That's totally fine.

It might return 0.
Actually it seems that the WARN() can only be issued in two cases:
- SPARC with vIRQ0 in one of the array member
- fallback to ACPI for GPIO IRQ resource with index 0

But the latter is bogus, because it would mean a bug in the ACPI code.

The bottom line here is the SPARC case. Anybody familiar with the platform
can shed a light on this. If there is no such case, we may remove warning
along with ret =3D 0 case from platfrom_get_irq().

> > 3. The specific cookie for "IRQ not found, while no error happened" case
> =

> Not sure what you mean here. I have no problem that a situation I can
> cope with is called an error for the query function. I just do error
> handling and continue happily. So the part "while no error happened" is
> irrelevant to me.

I meant that instead of using special error code, 0 is very much good for
the cases when IRQ is not found. It allows to distinguish -ENXIO from the
low layer from -ENXIO with this magic meaning.

> Additionally I see the problems:
> =

> 4. The semantic as implemented in Sergey's patch isn't better than the
> current one.

I disagree on this. See above on why.

> platform_get_irq*() is still considerably different from
> (clk|gpiod)_get* because the not-found value for the _optional variant
> isn't usuable for the irq case. For clk and gpio I get rid of a whole if
> branch, for irq I only change the if-condition. (And if that change is
> considered good or bad seems to be subjective.)

You are mixing up two things:
 - semantics of the pointer
 - semantics of the cookie

Like I said previously the mistake is in putting an equal sign between appl=
es
and oranges (or in terms of Python, which is a good example here, None and
False objects, where in both case 0 is magic and Python `if X`, `while `X` =
will
work in the same way, the `typeof(X)` is different semantically).

> For the idea to add a warning to platform_get_irq_optional for all but
> -ENXIO (and -EPROBE_DEFER), I see the problem:
> =

> 5. platform_get_irq*() issuing an error message is only correct most of
> the time and given proper error handling in the caller (which might be
> able to handle not only -ENXIO but maybe also -EINVAL[1]) the error messa=
ge
> is irritating. Today platform_get_irq() emits an error message for all
> but -EPROBE_DEFER. As soon as we find a driver that handles -EINVAL we
> need a function platform_get_irq_variant1 to be silent for -EINVAL,
> -EPROBE_DEFER and -ENXIO (or platform_get_irq_variant2 that is only
> silent for -EINVAL and -EPROBE_DEFER?)
> =

> IMHO a query function should always be silent and let the caller do the
> error handling. And if it's only because
> =

> 	mydev: IRQ index 0 not found
> =

> is worse than
> =

> 	mydev: neither TX irq not a muxed RX/TX irq found
> =

> . Also "index 0" is irritating for devices that are expected to have
> only a single irq (i.e. the majority of all devices).

Yeah, ack the #5.

> Yes, I admit, we can safe some code by pushing the error message in a
> query function. But that doesn't only have advantages.

> [1] Looking through the source I wonder: What are the errors that can hap=
pen
>     in platform_get_irq*()? (calling everything but a valid irq number
>     an error) Looking at many callers, they only seem to expect "not
>     found" and some "probe defer" (even platform_get_irq() interprets
>     everything but -EPROBE_DEFER as "IRQ index %u not found\n".)
>     IMHO before we should consider to introduce a platform_get_irq*()
>     variant with improved semantics, some cleanup in the internals of
>     the irq lookup are necessary.

-- =

With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
