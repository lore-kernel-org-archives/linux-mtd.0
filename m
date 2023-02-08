Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08924C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyGSxplORjL505P1PUOltPx8KtT2o6pCs2N7chE2VSs=; b=AqmSUj6R16RXv3
	nLY3PZaNnMDoeJskIjdVu8VmBz3j5+8s+4VzwjcFZmaW7Ahfi91G+6wURx1++yPaI8YB0aKwrNsbP
	rjTfsQL6JtTYGWVG4BcEcMi4K295bxAjQMMdXzfrtpULVgscfd7x2wVGk1hRQKFQwXo/zF38t40hU
	uPMBPbb/075tG98KcKuknenZVl2Ep1zAUr3vWU417edV/a5AGUGuWAtb9HgiFL4WuAyZ5/9hV8KBP
	Pn544o4maNp9VbYWwe5Ue4PY16V68Xz3hy58P3KvJh/FQcy1ak93ylq/qNyXRer+u1+2SYCMldGK2
	lytiUqL2Q8OngSK1i0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfKV-00EVSD-3C; Wed, 08 Feb 2023 07:57:23 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfKJ-00EVPh-W4; Wed, 08 Feb 2023 07:57:13 +0000
Received: by mail-qt1-f173.google.com with SMTP id c2so19853425qtw.5;
        Tue, 07 Feb 2023 23:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfN06Fr/21gttqDSQulqZGi0pmIW2PjRSxTzZoYMCB8=;
        b=mm+LWlKbXQUbrfSriWt0D7+ifGkOke4QDPwE29eCl0AGBdo2UB8m75JiV3zGxkpWDw
         Mm00du4qVBx03Cbi82uKtOVZtY6ey4LB6Xd+QUULGWXT4ApZqH2jY/n1RWJOpz9JEnrH
         AtP4xjJXGipSyVDiaEjI6gXob0mGVV0qIa5R4+u5q9rkf0yTCTsgXDObKZN5JuxH7I37
         lWdE/XeIecOB9imyf8mCYk60KsjcddiMwZRTYQyvDy9YQukdf0StaEEwhKnz87glcMx6
         wy5fS5aa9PdpqgBinYg6rUont+gaebwoSnEfkbemAle+oghra1fMMb0Eo3hM7CNh5M7C
         oH/Q==
X-Gm-Message-State: AO0yUKXZNCyD5/9QI38fke+ZOJ8bMoYtcVJDJtR4ScgDhe/T8PDsAc60
	V3jvJcLNw4QOdswQ6/uLzv7pDsP0Jublow==
X-Google-Smtp-Source: AK7set/t6KLk+uAnDZK/gL0TqIeF9Y3yYinYDufLCipJOqd0mjZicnEF43b8niAaBnYRVGmqEOq/MQ==
X-Received: by 2002:ac8:7d52:0:b0:3ad:9e9a:17de with SMTP id h18-20020ac87d52000000b003ad9e9a17demr10486973qtb.42.1675843029280;
        Tue, 07 Feb 2023 23:57:09 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id g12-20020a05620a278c00b0070531c5d655sm11132659qkp.90.2023.02.07.23.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 23:57:09 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id a1so21267362ybj.9;
        Tue, 07 Feb 2023 23:57:08 -0800 (PST)
X-Received: by 2002:a0d:f444:0:b0:526:78ad:bb15 with SMTP id
 d65-20020a0df444000000b0052678adbb15mr694356ywf.47.1675843017906; Tue, 07 Feb
 2023 23:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-10-saravanak@google.com> <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
 <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com> <CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=9e881qmK=vx3hBMyg@mail.gmail.com>
In-Reply-To: <CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=9e881qmK=vx3hBMyg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Feb 2023 08:56:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVREiVoGp-jvXKAdPSwjio13VgtPXWppnGOB+gSS9op+g@mail.gmail.com>
Message-ID: <CAMuHMdVREiVoGp-jvXKAdPSwjio13VgtPXWppnGOB+gSS9op+g@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] of: property: Simplify of_link_to_phandle()
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Abel Vesa <abel.vesa@linaro.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Tony Lindgren <tony@atomide.com>, John Stultz <jstultz@google.com>, 
	Doug Anderson <dianders@chromium.org>, Guenter Roeck <linux@roeck-us.net>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxim Kiselev <bigunclemax@gmail.com>, 
	Maxim Kochetkov <fido_max@inbox.ru>, Luca Weiss <luca.weiss@fairphone.com>, 
	Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_235712_056120_F16B2E7A 
X-CRM114-Status: GOOD (  72.13  )
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

Hi Saravana,

On Wed, Feb 8, 2023 at 8:32 AM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Feb 7, 2023 at 6:08 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Tue, Feb 7, 2023 at 12:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > The driver core now:
> > > > - Has the parent device of a supplier pick up the consumers if the
> > > >   supplier never has a device created for it.
> > > > - Ignores a supplier if the supplier has no parent device and will never
> > > >   be probed by a driver
> > > >
> > > > And already prevents creating a device link with the consumer as a
> > > > supplier of a parent.
> > > >
> > > > So, we no longer need to find the "compatible" node of the supplier or
> > > > do any other checks in of_link_to_phandle(). We simply need to make sure
> > > > that the supplier is available in DT.
> > > >
> > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > >
> > > Thanks for your patch!
> > >
> > > This patch introduces a regression when dynamically loading DT overlays.
> > > Unfortunately this happens when using the out-of-tree OF configfs,
> > > which is not supported upstream.  Still, there may be (obscure)
> > > in-tree users.
> > >
> > > When loading a DT overlay[1] to enable an SPI controller, and
> > > instantiate a connected SPI EEPROM:

[...]

> > > The SPI controller and the SPI EEPROM are no longer instantiated.

> > Sigh... I spent way too long trying to figure out if I caused a memory
> > leak. I should have scrolled down further! Doesn't look like that part
> > is related to anything I did.
> >
> > There are some flags set to avoid re-parsing fwnodes multiple times.
> > My guess is that the issue you are seeing has to do with how many of
> > the in memory structs are reused vs not when an overlay is
> > applied/removed and some of these flags might not be getting cleared
> > and this is having a bigger impact with this patch (because the fwnode
> > links are no longer anchored on "compatible" nodes).
> >
> > With/without this patch (let's keep the series) can you look at how
> > the following things change between each step you do above (add,
> > remove, retry):
> > 1) List of directories under /sys/class/devlink
> > 2) Enable the debug logs inside __fwnode_link_add(),
> > __fwnode_link_del(), device_link_add()
> >
> > My guess is that the final solution would entail clearing
> > FWNODE_FLAG_LINKS_ADDED for some fwnodes.
>
> You replied just as I was about to hit send. So sending this anyway...
>
> Ok, I took a closer look and I think it's a bit of a mess. The fact
> that it even worked for you without this patch is a bit of a
> coincidence.
>
> Let's just take platform devices that are created by
> driver/of/platform.c as an example.
>
> The main problem is that when you add/remove properties to a DT node
> of an existing platform device, nothing is really done about it at the
> device level. We don't even unbind and rebind the driver so the driver
> could make use of the new properties. We don't remove and add back the
> device so whoever might use the new property will use it. And if you
> are adding a new node, it'll only trigger any platform device level
> impact if it's a new node of a "simple-bus" (or similar bus) device.
>
> Problem 1:
> So if you add a new child node to an existing probed device that adds
> its children explicitly (as in, the parent is not a "simple-bus" like
> device), nothing will happen. The newly added child device node will
> get converted into a platform device, not will the parent device
> notice it. So in your case of adding msiof0_pins, it's just that when
> the consumer gets the pins, the driver doesn't get involved much and
> it's the pinctrl framework that reads the DT and figures it out.
>
> With this patch, the fwnode links point to the actual resource and the
> actual parent device inherits them if they don't get converted to a
> struct device. But since we are adding this msiof0_pins after the
> parent device has probed, the fwnode link isn't inherited by the
> parent pinctrl device.
>
> Problem 2:
> So if you add a property to an already bound device, nothing is done
> by the driver. In your overlay example, if you move the status="okay"
> line to be the first property you change in the msiof0 spi device,
> you'll probably see that fw_devlink is no longer the one blocking the
> probe. This is because the platform device will get added as soon as
> the status flips from disabled to enabled and at that point fw_devlink
> will think it has no suppliers and won't do any probe deferring. And
> then as the new properties get added nothing will happen at the device
> or fw_devlink level. If the msiof0's spi driver fails immediately with
> NOT -EPROBE_DEFER when platform device is added because it couldn't
> find any pinctrl property, then msiof0 will never probe (unless you
> remove and add the driver). If it had failed with -EPROBE_DEFER, then
> it might probe again if something else triggers a deferred probe
> attempt. Clearly, things working/not working based on the order of
> properties in DT is not a good implementation.
>
> Problem 3:
> What if you enable a previously disabled supplier. There's no way to
> handle that from a fw_devlink level without re-parsing the entire
> device tree because existing devices might be consumers now.
>
> Anyway, long story short, it's sorta worked due to coincidence and
> it's quite messy to get it to work correctly.

Several subsystems register notifiers to be informed of the events
above. E.g. drivers/spi/spi.c:

        if (IS_ENABLED(CONFIG_OF_DYNAMIC))
                WARN_ON(of_reconfig_notifier_register(&spi_of_notifier));
        if (IS_ENABLED(CONFIG_ACPI))
                WARN_ON(acpi_reconfig_notifier_register(&spi_acpi_notifier));

So my issue might be triggered using ACPI, too.

> Another way to get this to work is to:
> 1) unload pinctrl driver, unload spi driver.
> 2) apply overlay
> 3) reload pinctrl driver, reload spi driver.
>
> This is assuming unloading those 2 drivers doesn't crash your system.

Unloading the pinctrl driver is not an option.

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
