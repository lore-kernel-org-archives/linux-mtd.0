Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE602C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 22:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6nVvqsblqCoRw3fNMzfiAiD2+eofAxzE8w/ichkUEw=; b=FKJrT8+kLSveHj
	oYhfVi7oYepo9BivMXScOZSXZtg7G+J8h+GvD+DaWGftR12Xr7CUV2EUnt5VkGt9KpiCxFSekaOjt
	wcrsymiyz+0qTL6nRhM/dlu9Ar508QDdKEGRJOezM9HO/SczFA1DwCSaaZ123xerZHW/8ZB8bsJEu
	rkPLNr6f/nSAs0mdZ3O1XIbLNWhQVoQ/XEW1ZVrhDDrtEjXrndy7f06hP862j8xxZ3q0GrHFkKtXk
	4psjcS44IoT7S6RjEiwXLXzxPspjNobFGKm5eiqrwXn6466Nf8onQyXpoyPhxhuCisBNv8g4B19Qa
	pfN0vL3z+MVqo9qOMppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFO6p-00H0Pm-SJ; Wed, 02 Feb 2022 22:28:15 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFO6m-00H0PI-GS; Wed, 02 Feb 2022 22:28:14 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTAJr-1mnAlp0avH-00UWVZ; Wed, 02 Feb 2022 23:28:10 +0100
Received: by mail-ej1-f43.google.com with SMTP id k25so1752916ejp.5;
 Wed, 02 Feb 2022 14:28:10 -0800 (PST)
X-Gm-Message-State: AOAM5334oUF/8NOROsbONKNUhJwh8aummFXNw0LZCfPJO8MTTXFxsadf
 Tlxh5EF0RrsE5uCENTOhc1CbzxT48K4BdqLZ9es=
X-Google-Smtp-Source: ABdhPJyS0pXYjoI1KSj8v4HS5DRpiR5z8Z+MmivHV59Rfz0qHTXBAOHLhOORnhnqrVG7qMP59ls3cQTx3h8P+oStNX4=
X-Received: by 2002:a05:6000:3c6:: with SMTP id
 b6mr26662700wrg.12.1643836901999; 
 Wed, 02 Feb 2022 13:21:41 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <20220202175635.GC2091156@minyard.net>
 <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
In-Reply-To: <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Feb 2022 22:21:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Message-ID: <CAK8P3a3itj=nshdRCoFQQh5fg-RsEaqj1PdBxfeN2-TzqmoPpQ@mail.gmail.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
To: "Verdun, Jean-Marie" <verdun@hpe.com>
Cc: "minyard@acm.org" <minyard@acm.org>, "Hawkins, Nick" <nick.hawkins@hpe.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, 
 "soc@kernel.org" <soc@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Hao Fang <fanghao11@huawei.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, 
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:JPnGPWuMv55SeIWyYDptqoEMuWABu2KVylN7Ygi9OfrMknexrVN
 B1pcmMI/4KA7M8GYUwz23KpHDSvIrSatuCrwmaGUKFWQMxd7xOAyaMB9GXT8bwEjZX0YF9y
 qk4t+OnTG0GdqTox1fgH8RAVQSnDYX06qGtBqcQ6GFZGKRLFjBpXfI7FRzTEqkSzRzaswRU
 QeOIKRAExH9p+caJopQdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:up/wm53N7AI=:YE/e9hQ3HCW9nmdStPOg2n
 3rD9B2GWcadWqfUWQu5netUQiMs6WIYFv+97a5AHAxCkA/tTy0yJaO4eDgOrjtDOOkoX5tM1N
 a3olvbx88X+f9HJokLQEr0hIF3eI/+Dmlak3Eow3LGur4mqH+QJJRDxdcKGwx6zi8/aMHjFmg
 jxpzZGq/RKqNfXduEDyu5/LVXrnur4MNl0nlUSQ9TX//ZIOobaZAmNUB8MKVfgowN3u0v0Omo
 JSfLciApz4OXFyyAYFolSA1OHWiXVcrte495ZdZ9pL/CJrGjh9Jti3a6XR6poqZbZnANuk3yW
 Bc11aQ7i7yrsnfVTV2dMA+ZBFjTetjVXDO+IUvkactBOnlnlZvl9hjgFTtA4VDiOZ8MOUSuUR
 hv9NkxaSPR5U+33FIoTc336PTGsbBvwZgaMSECkynqjue0lab30vF6LeVF4x28YgAEUm4XTfs
 PlUwTXKDkP9o8MQH/4RDwYwoosBndiwZR9bXmsCe/x0vKXfOlSZvFtrrmm9DqC1NVrUPVcKEY
 Jh5aOtvhiwUfeYHGBPSvCJHaay5kVeSp66N9YICKMrFvvluLI7p3YMB+yLb+j03UeJ7hdi1mY
 cB753V9yJ0rqIeUvy4vRmQakgb0jOkRXVgJkawQcHZR1cgmh/bh1MQ6ViboJFzx8tcfGpMo37
 T0KMgHNAkVd6n2tOf5fZjkTdRJVbFrLs6yXQdI7u9Mg8gxSpRVyojNRYCKLrYXi89vyYA2Y7Q
 1qutjU/C5fGF5GVnuorJV7s/oMvmHNRv2DuQNKStLMHExPjOMOWImlxy/Oqx2Lwc/JYYd2JG0
 AxPEwyXRsMMVQ9vTq9U/EhoiiSx9ymVuPX48ilyg56sz/c+izQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_142812_873073_DCE4D0DE 
X-CRM114-Status: GOOD (  30.16  )
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

On Wed, Feb 2, 2022 at 7:14 PM Verdun, Jean-Marie <verdun@hpe.com> wrote:
>
> > This is far too big for a single patch.  It needs to be broken into
> > functional chunks that can be reviewed individually.  Each driver and
> > each device tree change along with it's accompanying code need to be
> > done in individual patches.  The way it is it can't be reviewed in any
> > sane manner.
>
> > -corey
>
> Thanks for your feedback. We are getting a little bit lost here, as our plan was to submit initial
>
> - bindings
> - dts for SoC and 1 board
> - initial platform init code
>
> Then drivers code avoiding to send many dts updates which might complexify the
> review. We wanted to send all drivers code to relevant reviewers by tomorrow.
>
> So, what you are asking ( do not worry I am not trying to negotiate, I just want
> to avoid English misunderstandings as I am French) is to send per driver
>
> - binding
> - dts update
> - driver code
>
> For each driver through different submission (with each of them containing the
> 3 associated parts) ?
>
> What shall be the initial one in our case as we are introducing a platform ?
> An empty dts infrastructure and then we make it grow one step at a time ?

Ideally, what I prefer to see is a series of patches for all "essential" drivers
and the platform code that includes:

- one patch for each new binding
- one patch for each new driver
- one patch that hooks up arch/arm/mach-hpe/, MAINTAINERS
  and any other changes to arch/arm/ other than dts
- one patch that adds the initial .dts and .dtsi files, with all the
  devices added that have a valid binding, no need to split this
  up any further

This should include everything you need to boot into an initramfs
shell, typically cpu, serial, timer, clk, pinctrl,  gpio, irqchip. We will
merge these as a git branch in the soc tree.

In parallel, you can work with subsystem maintainers for the
"non-essential" drivers to review any other driver and binding,
e.g. drm/kms, network, i2c, pci, usb, etc. The patches for
the corresponding .dts additions also go through the soc tree,
but to make things simpler, you can send those in for a later
release.

          Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
