Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C767CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hItbQO4qqDszq1RY2e0TcCGidL135c2mfQuD+do+ftQ=; b=2g0AiRHr0Fdd7Y
	HqTVeU+E66OSOe7wBS/Dqa1nUBQyzR9+gxUBigxzjhzLNcszU2QHFPZ/kda1gO/Ays3CqymoONLkl
	cwA2Apsu5K5CkeLiDnHxq4lzMqOzEGzuTmuFzbBma2yQRdg2micMoisaJnSQHLjJJxE5JHCTy6yNL
	HwV7tj4DhnWpX/7vP2M0jaiSQmOq12XWJf5NEZkt3kXnwFQ+Lg+dzPG5vTcW7r7I77V8TyDyXyI9c
	xWycl+wg8Bp3qTZ8eYOAztcSA+7Y3IXye/dU4xByTzDTV14cLipfTbwVR2uo6JMWGIEc2mYhEW2uC
	FzduE/1l7kxGrZ2fZMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCHH3-006rrn-EE; Tue, 25 Jan 2022 08:33:57 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHH0-006rrG-4M; Tue, 25 Jan 2022 08:33:55 +0000
Received: by mail-pj1-f47.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so1131169pjy.1; 
 Tue, 25 Jan 2022 00:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nj3tQtaS2Jftix8pFrL2+Rvw9SRm0Q+IWJ3wAkzl0s=;
 b=Rnmp/DKfCKsCfWgYzH0BtqNBzZrc9SUfeYOVnYjjnGwf3Rpder+POzsQeAnvzNVmFt
 z+IePeYyCJKNwYqz8ppv0ETKMYZGIlv7tlZYEpqfy8hDL2y6ZPIyoWr+PWnmhU1NpJfT
 75WaX8ykTg9glTSn++O6DzV1Oj6Hb7SXcs9JCDqkDQUPjlzUu6x+TaFrdZ2XbfqLaZfu
 fXXFS+vIocqEnDaKjzRMe6Z1MaTGk5m0/3NxJt8Pct6XM+jHsnzHsMHDArxxJyUpT45G
 /3JEk43VpEgGNXweRvvOq6MZhUSDHtjpDUwnEEIbPldhchn00QI+L3f9LbSLe5Yf12kv
 iRtA==
X-Gm-Message-State: AOAM533QvmqkBnoN6eEQM/P/dtZZGu3RIBQy7+rHuGnTX1YUFNuLrmCi
 PUGH3yId433tQcxAQ4SsevTUH95RR0PrMePE
X-Google-Smtp-Source: ABdhPJzCqRHchZBrLVScSlipu8HsYBF+YqbTyfWHKWQ12o8PyHlWI69PlIZkxsW8Aeenge5iUERyog==
X-Received: by 2002:a17:902:e80a:b0:14b:4a6d:4694 with SMTP id
 u10-20020a170902e80a00b0014b4a6d4694mr9065348plg.160.1643099633172; 
 Tue, 25 Jan 2022 00:33:53 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com.
 [209.85.216.41])
 by smtp.gmail.com with ESMTPSA id nn4sm1819857pjb.39.2022.01.25.00.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 00:33:53 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id h12so19237200pjq.3;
 Tue, 25 Jan 2022 00:33:52 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id
 t4mr1874173vsa.77.1643099137125; 
 Tue, 25 Jan 2022 00:25:37 -0800 (PST)
MIME-Version: 1.0
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
 <Ye6/NgfxsZnpXE09@smile.fi.intel.com>
 <15796e57-f7d4-9c66-3b53-0b026eaf31d8@omp.ru>
In-Reply-To: <15796e57-f7d4-9c66-3b53-0b026eaf31d8@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 09:25:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXouECKa43OwUgQ6dA+gNeOqEZHZgOmQzqknzYiA924YA@mail.gmail.com>
Message-ID: <CAMuHMdXouECKa43OwUgQ6dA+gNeOqEZHZgOmQzqknzYiA924YA@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Rename platform_get_irq_optional()
 to platform_get_irq_silent()
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>, 
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org, 
 Jiri Slaby <jirislaby@kernel.org>, openipmi-developer@lists.sourceforge.net, 
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, 
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, 
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Sebastian Reichel <sre@kernel.org>, 
 Eric Auger <eric.auger@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 platform-driver-x86@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_003354_189463_21B81F37 
X-CRM114-Status: GOOD (  47.42  )
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

Hi Sergey,

On Mon, Jan 24, 2022 at 10:02 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 1/24/22 6:01 PM, Andy Shevchenko wrote:
> >>>>>>> It'd certainly be good to name anything that doesn't correspond to one
> >>>>>>> of the existing semantics for the API (!) something different rather
> >>>>>>> than adding yet another potentially overloaded meaning.
> >>>>>>
> >>>>>> It seems we're (at least) three who agree about this. Here is a patch
> >>>>>> fixing the name.
> >>>>>
> >>>>> And similar number of people are on the other side.
> >>>>
> >>>> If someone already opposed to the renaming (and not only the name) I
> >>>> must have missed that.
> >>>>
> >>>> So you think it's a good idea to keep the name
> >>>> platform_get_irq_optional() despite the "not found" value returned by it
> >>>> isn't usable as if it were a normal irq number?
> >>>
> >>> I meant that on the other side people who are in favour of Sergey's patch.
> >>> Since that I commented already that I opposed the renaming being a standalone
> >>> change.
> >>>
> >>> Do you agree that we have several issues with platform_get_irq*() APIs?
> [...]
> >>> 2. The vIRQ0 handling: a) WARN() followed by b) returned value 0
> >>
> >> I'm happy with the vIRQ0 handling. Today platform_get_irq() and it's
> >> silent variant returns either a valid and usuable irq number or a
> >> negative error value. That's totally fine.
> >
> > It might return 0.
> > Actually it seems that the WARN() can only be issued in two cases:
> > - SPARC with vIRQ0 in one of the array member
> > - fallback to ACPI for GPIO IRQ resource with index 0
>
>    You have probably missed the recent discovery that arch/sh/boards/board-aps4*.c
> causes IRQ0 to be passed as a direct IRQ resource?

So far no one reported seeing the big fat warning ;-)

> > The bottom line here is the SPARC case. Anybody familiar with the platform
> > can shed a light on this. If there is no such case, we may remove warning
> > along with ret = 0 case from platfrom_get_irq().
>
>    I'm afraid you're too fast here... :-)
>    We'll have a really hard time if we continue to allow IRQ0 to be returned by
> platform_get_irq() -- we'll have oto fileter it out in the callers then...

So far no one reported seeing the big fat warning?

> >>> 3. The specific cookie for "IRQ not found, while no error happened" case
> >>
> >> Not sure what you mean here. I have no problem that a situation I can
> >> cope with is called an error for the query function. I just do error
> >> handling and continue happily. So the part "while no error happened" is
> >> irrelevant to me.
> >
> > I meant that instead of using special error code, 0 is very much good for
> > the cases when IRQ is not found. It allows to distinguish -ENXIO from the
> > low layer from -ENXIO with this magic meaning.
>
>    I don't see how -ENXIO can trickle from the lower layers, frankly...

It might one day, leading to very hard to track bugs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
