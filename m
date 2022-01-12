Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E567BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YI0zmGkd/7Z7ycGHSmqD1bHGdTxrsmW3OZRxCrHeRyk=; b=dFZEH9EBOpvPI0
	60OFPN+H4ynScB4O30hN2lrYbQE57WymYCbOq2pDZnfe3EZEoq0kpHPHmK+r+YCmW8bZYLgYp/gH1
	5NaZqebrZn9O37aBm7jRxVpy22dO+c7QM/aVoNFKqyD8bzThlTVyyY6gqmgwd+zQmAjGJrGVJET3U
	zXKPZzUSi6fy6KSl2i0kSTjKHdTg9rn9BNW6/8wD2iRHn0j6hKWhPSDWq3eG9acY4+mK+8+SBLXVo
	33ha44LemnilNV4ON70V+AGFBaltBHyWf5EW15/MKXKSkMGwVfiCs2H9rmFSvgU5fdMvR89OOXVDp
	68qnZElxArA/gqfOY8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7e5d-002dUX-V2; Wed, 12 Jan 2022 13:55:02 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7e5b-002dTV-Go; Wed, 12 Jan 2022 13:55:01 +0000
Received: by mail-vk1-f170.google.com with SMTP id h16so1711170vkp.5;
 Wed, 12 Jan 2022 05:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=liYNFdlsWo55pmV9ntmO9rGWUh5k4VTb3DRABECHgIo=;
 b=lRMYfSDAjasMuyhSjqTnEnXssdc5DfS3Gd6glafogfIZBYSH4iWr8wRUndhQZn8b+Y
 A7D9XmEr4vRWbuZqk3X2Aw4nI5yyuzYcMPIKV73NHJYuDT93PyEDhapUBE4vz1It++aG
 ZBnBEHvcCWt0MAxOW7uXdIH4n+tc4L9jTTrCCgc+3eNBaLP64QZ27jmeTXANkPs1vbEr
 dZt/1sGMhH1BmosmHLH5CgYNL71pcp5C0mNCLw9kVxCvmwqaAm1uzzDqVxotuyls3Y0h
 zwhLap91Yi55PnXGQqH7Q9z348U1FgaTMKrLDIlATSrlxe8H3s5BybuEiMN8/YJIj6Xd
 96+w==
X-Gm-Message-State: AOAM530ChsJd/13y6F6Fb9gplgckp8o1AIm8fy8RsVutyEO7xcahtc/F
 o8kMCnJmekyJnvU0LD+eldSj6ZbvuCkE1ko6
X-Google-Smtp-Source: ABdhPJyplyxOtn7p0turI1b8FasUrWiJjtrziXmQ/+gLKB+JujPJLYEPU23bEoMR1OZYtPExzT+s/g==
X-Received: by 2002:a1f:3490:: with SMTP id b138mr4389283vka.31.1641995698216; 
 Wed, 12 Jan 2022 05:54:58 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id o26sm6288927vsl.9.2022.01.12.05.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:54:57 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 191so1725964vkc.1;
 Wed, 12 Jan 2022 05:54:57 -0800 (PST)
X-Received: by 2002:ac5:c967:: with SMTP id t7mr4740789vkm.20.1641995696856;
 Wed, 12 Jan 2022 05:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de> <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <Yd7Z3Qwevb/lEwQZ@lunn.ch>
In-Reply-To: <Yd7Z3Qwevb/lEwQZ@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 14:54:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2cGvqMppwt9xhpze=pcnHfTozDZMjwT1DkivLD+_nbQ@mail.gmail.com>
Message-ID: <CAMuHMdV2cGvqMppwt9xhpze=pcnHfTozDZMjwT1DkivLD+_nbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 KVM list <kvm@vger.kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org, 
 Jiri Slaby <jirislaby@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 platform-driver-x86@vger.kernel.org, 
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>, 
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>, 
 Linux PM list <linux-pm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Eric Auger <eric.auger@redhat.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 openipmi-developer@lists.sourceforge.net, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 Vinod Koul <vkoul@kernel.org>, 
 James Morse <james.morse@arm.com>, Zha Qipeng <qipeng.zha@intel.com>, 
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-mediatek@lists.infradead.org, 
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_055459_586540_025D707C 
X-CRM114-Status: GOOD (  47.75  )
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

Hi Andrew,

On Wed, Jan 12, 2022 at 2:38 PM Andrew Lunn <andrew@lunn.ch> wrote:
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

Agreed.

Note that in most (all?) other cases, the return type is a pointer
(e.g. to struct clk), and NULL is the magic cookie.

> You seems to be suggesting in binary return value: non-zero
> (available) or zero (not available)

Only in case of success. In case of a real failure, an error code
must be returned.

> This discards the error code when something goes wrong. That is useful
> information to have, so we should not be discarding it.

No, the error code must be retained in case of failure.

> IRQ don't currently have a magic cookie value. One option would be to
> add such a magic cookie to the subsystem. Otherwise, since 0 is
> invalid, return 0 to indicate the IRQ does not exist.

Exactly. And using 0 means the similar code can be used as for other
subsystems, where NULL would be returned.

The only remaining difference is the "dummy cookie can be passed
to other functions" behavior.  Which is IMHO a valid difference,
as unlike with e.g. clk_prepare_enable(), you do pass extra data to
request_irq(), and sometimes you do need to handle the absence of
the interrupt using e.g. polling.

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

There are still a few platforms where IRQ 0 does exist.

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
