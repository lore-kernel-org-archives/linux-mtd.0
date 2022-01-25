Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D3DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqWdb/62eiTKgZTfr6eWmG3u3x9Y4YKVvZzaey7pam4=; b=S5dsxK6tY5g8gQ
	kDf9bwkA+Yd1P30UCDFrt+JBx1cuodsINEIU9oruINuO8Jrf5GFrux+s316HRktROEfSrAkZHyryV
	Vu6W34uZ9TDRK0E/YmtCCMtIdbSJG6qMJA2x0FCXsgb4wFYHUc3knHsp2eWyDzQOARQscJBdxtb5O
	rlxg+x4cIycjN/mEMDPzQqXlIzkRarGhSOK9XKgmuXJLVBpiJ5ttZK/RQag4U7edtJZ/toEdRg/jv
	AlY6K2fhqnD22kMhQFjXrRnAnp+8KFOnHbJP6S7Qa59FHnYXLfYlwSUU7/uAE8y60Kwovxox+EoHP
	WqY9+Jy4FYvHSJyTCJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCMQL-0083YP-GX; Tue, 25 Jan 2022 14:03:53 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCMQG-0083Wp-RV; Tue, 25 Jan 2022 14:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643119428; x=1674655428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z6iO4goP/6mOntNu6iUnXj156J2xRO3zDzNJWbq5fzg=;
 b=ItQZeiPZ+WrpX7KCPPxdhwX5sw9iuSoaE8GDXNhkCHlyKYWpqts00nMs
 Obuurzb1uibUEg72fKECYnUClzq339J+OgBdPgVkpmI5wlcabzJ3f98Ol
 VktejgxGoDX0jYhYj8RbodX0Z8D5zLKW6JGAShvOpVvXuRlXcJy9yzU37
 MkJGhyCFv/pQ2WNkaJOsNbq5K6V8aYUeODtTwPQ4uY+ctW73B5Y9xOWKn
 JSN0TDvRrObbodhwGl0u64OApfPKulLBUNFZ93K+uTMmfSmPsZIfDrXFO
 2eiLOhepG4Y1741nEMG1N0r68jjU7RdcL1/jzACA+87Ab3tmPxsXgzqqu A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246249061"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="246249061"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 06:02:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="695840276"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 06:02:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCMNp-00EGb4-Aj; Tue, 25 Jan 2022 16:01:17 +0200
Date: Tue, 25 Jan 2022 16:01:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
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
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
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
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <YfACrffZCCeleOjK@smile.fi.intel.com>
References: <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeF05vBOzkN+xYCq@smile.fi.intel.com>
 <20220115154539.j3tsz5ioqexq2yuu@pengutronix.de>
 <YehdsUPiOTwgZywq@smile.fi.intel.com>
 <20220120075718.5qtrpc543kkykaow@pengutronix.de>
 <Ye6/NgfxsZnpXE09@smile.fi.intel.com>
 <15796e57-f7d4-9c66-3b53-0b026eaf31d8@omp.ru>
 <CAMuHMdXouECKa43OwUgQ6dA+gNeOqEZHZgOmQzqknzYiA924YA@mail.gmail.com>
 <33e55c4c0a637b23d76db5d33872378ad04121bd.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33e55c4c0a637b23d76db5d33872378ad04121bd.camel@ew.tq-group.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_060349_004577_4C7A9399 
X-CRM114-Status: GOOD (  57.09  )
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

On Tue, Jan 25, 2022 at 01:56:05PM +0100, Matthias Schiffer wrote:
> On Tue, 2022-01-25 at 09:25 +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 24, 2022 at 10:02 PM Sergey Shtylyov <s.shtylyov@omp.ru>
> > wrote:
> > > On 1/24/22 6:01 PM, Andy Shevchenko wrote:

...

> > > > > > 2. The vIRQ0 handling: a) WARN() followed by b) returned
> > > > > > value 0
> > > > > 
> > > > > I'm happy with the vIRQ0 handling. Today platform_get_irq() and
> > > > > it's
> > > > > silent variant returns either a valid and usuable irq number or
> > > > > a
> > > > > negative error value. That's totally fine.
> > > > 
> > > > It might return 0.
> > > > Actually it seems that the WARN() can only be issued in two
> > > > cases:
> > > > - SPARC with vIRQ0 in one of the array member
> > > > - fallback to ACPI for GPIO IRQ resource with index 0
> > > 
> > >    You have probably missed the recent discovery that
> > > arch/sh/boards/board-aps4*.c
> > > causes IRQ0 to be passed as a direct IRQ resource?
> > 
> > So far no one reported seeing the big fat warning ;-)
> 
> FWIW, we had a similar issue with an IRQ resource passed from the
> tqmx86 MFD driver do the GPIO driver, which we noticed due to this
> warning, and which was fixed
> in a946506c48f3bd09363c9d2b0a178e55733bcbb6
> and 9b87f43537acfa24b95c236beba0f45901356eb2.

No, it's not, unfortunately :-( You just band aided the warning issue, but the
root cause is the WARN() and possibility to see valid (v)IRQ0 in the resources.
See below.

> I believe these changes are what promted this whole discussion and led
> to my "Reported-by" on the patch?
> 
> It is not entirely clear to me when IRQ 0 is valid and when it isn't,
> but the warning seems useful to me. Maybe it would make more sense to
> warn when such an IRQ resource is registered for a platform device, and
> not when it is looked up?
> 
> My opinion is that it would be very confusing if there are any places
> in the kernel (on some platforms) where IRQ 0 is valid,

And those places are board files like yours :( They have to be fixed
eventually. Ideally by using IRQ domains. At least that's how it's
done elsewhere.

> but for
> platform_get_irq() it would suddenly mean "not found". Keeping a
> negative return value seems preferable to me for this reason.

IRQ 0 is valid, vIRQ0 (or read it as cookie) is not.

Now, the problem in your case is that you are talking about board files, while
ACPI and DT never gives resource with vIRQ0. For board files some (legacy) code
decides that it's fine to supply HW IRQ, while the de facto case is that
platform_get_resource() returns whatever is in the resource, while
platform_get_irq() should return a cookie.

> (An alternative, more involved idea would be to add 1 to all IRQ
> "cookies", so IRQ 0 would return 1, leaving 0 as a special value. I
> have absolutely no idea how big the API surface is that would need
> changes, and it is likely not worth the effort at all.)

This is what IRQ domains do, they start vIRQs from 1.

> > > > The bottom line here is the SPARC case. Anybody familiar with the
> > > > platform
> > > > can shed a light on this. If there is no such case, we may remove
> > > > warning
> > > > along with ret = 0 case from platfrom_get_irq().
> > > 
> > >    I'm afraid you're too fast here... :-)
> > >    We'll have a really hard time if we continue to allow IRQ0 to be
> > > returned by
> > > platform_get_irq() -- we'll have oto fileter it out in the callers
> > > then...
> > 
> > So far no one reported seeing the big fat warning?
> > 
> > > > > > 3. The specific cookie for "IRQ not found, while no error
> > > > > > happened" case
> > > > > 
> > > > > Not sure what you mean here. I have no problem that a situation
> > > > > I can
> > > > > cope with is called an error for the query function. I just do
> > > > > error
> > > > > handling and continue happily. So the part "while no error
> > > > > happened" is
> > > > > irrelevant to me.
> > > > 
> > > > I meant that instead of using special error code, 0 is very much
> > > > good for
> > > > the cases when IRQ is not found. It allows to distinguish -ENXIO
> > > > from the
> > > > low layer from -ENXIO with this magic meaning.
> > > 
> > >    I don't see how -ENXIO can trickle from the lower layers,
> > > frankly...
> > 
> > It might one day, leading to very hard to track bugs.
> 
> As gregkh noted, changing the return value without also making the
> compile fail will be a huge PITA whenever driver patches are back- or
> forward-ported, as it would require subtle changes in error paths,
> which can easily slip through unnoticed, in particular with half-
> automated stable backports.

Let's not modify kernel at all then, because in many cases it is a PITA
for back- or forward-porting :-)

> Even if another return value like -ENODEV might be better aligned with
> ...regulator_get_optional() and similar functions, or we even find a
> way to make 0 usable for this, none of the proposed changes strike me
> as big enough a win to outweigh the churn caused by making such a
> change at all.

Yeah, let's continue to suffer from ugly interface and see more band aids
landing around...

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
