Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B863EC636D4
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Feb 2023 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSqoRoPqfZfMQzkMGwgGGag58DzZqDGcbmwaBeFyUkI=; b=DsyYo0myRIU+u2
	aT011VV7GGD0SqGNL73MwR1hw2zvVakLOsMpwnYSvjy+jlP4qRvnJC4iuXDBPFBEOBzOe9yAyeQxb
	TBNj5GzZKtEUdABr+dWR0IYJmIoapcz3K+KLSTv5plqLi8MZJsgS2jlmUBfdGd3BaK4M1hCLVzaMd
	98EPNq+KcKjGV189cDavpVpXE+sFAoL2X2Eeiyrw7+kdA7GyG9x/2tqU2y20jYAjEd0dz3i/mJ0q6
	ZDz/RXPN9zm06lMRPlkWoEGemGXfbf06MxqzqpTyBa4b0Mon1WVfsJqxqebrvxIkU7QBqD9LfvI4b
	c8JnZ9XlgKALn8/+s9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYWT-00EkFD-Ma; Mon, 13 Feb 2023 13:05:33 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYWF-00EkC7-M6; Mon, 13 Feb 2023 13:05:22 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-52eb7a5275aso151582677b3.2;
        Mon, 13 Feb 2023 05:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ohQOW8LhW84vMCNSb56DrthzGYUI9jdNgZMzgHCpWY=;
        b=Soy+ydKc2Rzaa61Xtlay54NEC7ipYWdU6Xax5ObjW/0Knng9Gxh7XC7aU0iAWKh/Zp
         hwgaU/sLSA9bVyYJV2SmNmIfyx+zSWwx7iGiu4PO4lijhF1PWT5N2/TcsVXjnD/oZsoB
         Zm029N3o0dFBZPJufzNs1df8H2rQRY6Q3lUYXOeV53Ax5xAVYXvRbNuL9U2IggFNhmYV
         siQ9tO0cuH3OgmNm1+OnyWdNKVMj7Wc1rFuBvodszb+DfkmVnqUzW66H/xMSsjY6A3Mh
         38c3/I52KWh4a5WGytblFA/TINQtnO6ri0vePQpB4Ugw2ZvxDzvwh2u0vLm0WOhSOeX/
         EhKQ==
X-Gm-Message-State: AO0yUKXOCHtnLO4dl0jX4XqR98V9NlbjREiD1J1/LDa8yMv5OKTGSsKI
	pUDfU6VZbDa86j87BSV2T8q3JVj5VmShpw==
X-Google-Smtp-Source: AK7set+v7uUrUCplV0VoKoofWlwQWC+bXpBinrYVhpAtR3OBc8u45FnO40Bf2dYM91SeRnyVx7FS3w==
X-Received: by 2002:a81:d40d:0:b0:4ff:1aec:69a3 with SMTP id z13-20020a81d40d000000b004ff1aec69a3mr18764270ywi.47.1676293517355;
        Mon, 13 Feb 2023 05:05:17 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id s6-20020a372c06000000b00727538eb831sm9718450qkh.86.2023.02.13.05.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:05:17 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id l201so13254495ybf.10;
        Mon, 13 Feb 2023 05:05:17 -0800 (PST)
X-Received: by 2002:a25:8f82:0:b0:86e:1225:b335 with SMTP id
 u2-20020a258f82000000b0086e1225b335mr3099093ybl.455.1676293506630; Mon, 13
 Feb 2023 05:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-10-saravanak@google.com> <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
 <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com>
In-Reply-To: <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2023 14:04:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT-H4Ucm=7_ig@mail.gmail.com>
Message-ID: <CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT-H4Ucm=7_ig@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230213_050519_749139_4B83C021 
X-CRM114-Status: GOOD (  49.14  )
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

On Wed, Feb 8, 2023 at 3:08 AM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Feb 7, 2023 at 12:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> > > The driver core now:
> > > - Has the parent device of a supplier pick up the consumers if the
> > >   supplier never has a device created for it.
> > > - Ignores a supplier if the supplier has no parent device and will never
> > >   be probed by a driver
> > >
> > > And already prevents creating a device link with the consumer as a
> > > supplier of a parent.
> > >
> > > So, we no longer need to find the "compatible" node of the supplier or
> > > do any other checks in of_link_to_phandle(). We simply need to make sure
> > > that the supplier is available in DT.
> > >
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> >
> > Thanks for your patch!
> >
> > This patch introduces a regression when dynamically loading DT overlays.
> > Unfortunately this happens when using the out-of-tree OF configfs,
> > which is not supported upstream.  Still, there may be (obscure)
> > in-tree users.
> >
> > When loading a DT overlay[1] to enable an SPI controller, and
> > instantiate a connected SPI EEPROM:
> >
> >     $ overlay add 25lc040
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /keys/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-0
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-names
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/cs-gpios
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /__symbols__/msiof0_pins
> >
> > The SPI controller and the SPI EEPROM are no longer instantiated.
> >
> >     # cat /sys/kernel/debug/devices_deferred
> >     e6e90000.spi    platform: wait for supplier msiof0
> >
> > Let's remove the overlay again:
> >
> >     $ overlay rm 25lc040
> >     input: keys as /devices/platform/keys/input/input1
> >
> > And retry:
> >
> >     $ overlay add 25lc040
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /keys/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-0
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-names
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/cs-gpios
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /__symbols__/msiof0_pins
> >     spi_sh_msiof e6e90000.spi: DMA available
> >     spi_sh_msiof e6e90000.spi: registered master spi0
> >     spi spi0.0: setup mode 0, 8 bits/w, 100000 Hz max --> 0
> >     at25 spi0.0: 512 Byte at25 eeprom, pagesize 16
> >     spi_sh_msiof e6e90000.spi: registered child spi0.0
> >
> > Now it succeeds, and the SPI EEPROM is available, and works.
> >
> > Without this patch, or with this patch reverted after applying the
> > full series:
> >
> >     $ overlay add 25lc040
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /keys/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-0
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-names
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/cs-gpios
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /__symbols__/msiof0_pins
> >     OF: Not linking spi@e6e90000 to interrupt-controller@f1010000 - No
> > struct device
> >     spi_sh_msiof e6e90000.spi: DMA available
> >     spi_sh_msiof e6e90000.spi: registered master spi0
> >     spi spi0.0: setup mode 0, 8 bits/w, 100000 Hz max --> 0
> >     at25 spi0.0: 444 bps (2 bytes in 9 ticks)
> >     at25 spi0.0: 512 Byte at25 eeprom, pagesize 16
> >     spi_sh_msiof e6e90000.spi: registered child spi0.0
> >
> > The SPI EEPROM is available on the first try after boot.
>
> Sigh... I spent way too long trying to figure out if I caused a memory
> leak. I should have scrolled down further! Doesn't look like that part
> is related to anything I did.
>
> There are some flags set to avoid re-parsing fwnodes multiple times.
> My guess is that the issue you are seeing has to do with how many of
> the in memory structs are reused vs not when an overlay is
> applied/removed and some of these flags might not be getting cleared
> and this is having a bigger impact with this patch (because the fwnode
> links are no longer anchored on "compatible" nodes).
>
> With/without this patch (let's keep the series) can you look at how
> the following things change between each step you do above (add,
> remove, retry):
> 1) List of directories under /sys/class/devlink
> 2) Enable the debug logs inside __fwnode_link_add(),
> __fwnode_link_del(), device_link_add()

Without "of: property: Simplify of_link_to_phandle()":

  - Adding overlay:

        spi@e6e90000 Linked as a fwnode consumer to clock-controller@e6150000
        spi@e6e90000 Linked as a fwnode consumer to system-controller@e6180000
        spi@e6e90000 Linked as a fwnode consumer to pinctrl@e6060000
        spi@e6e90000 Linked as a fwnode consumer to gpio@e6055000
        platform e6e90000.spi: Linked as a consumer to e6055000.gpio
        spi@e6e90000 Dropping the fwnode link to gpio@e6055000
        platform e6e90000.spi: Linked as a consumer to e6060000.pinctrl
        spi@e6e90000 Dropping the fwnode link to pinctrl@e6060000
        spi@e6e90000 Dropping the fwnode link to system-controller@e6180000
        platform e6e90000.spi: Linked as a consumer to e6150000.clock-controller
        spi@e6e90000 Dropping the fwnode link to clock-controller@e6150000

        +platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        +platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.spi
        +platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi
        -platform:e6060000.pinctrl--platform:keys ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:keys

        SPI EEPROM works

  - Removing overlay:

        platform keys: Linked as a sync state only consumer to e6055000.gpio

        -platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        -platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.spi
        -platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi

        platform:e6060000.pinctrl--platform:keys link is not recreated?!?!?

  - Adding overlay again:

        No debug output
        No change in sys/class/devlink?!?!?
        SPI EEPROM works


With "of: property: Simplify of_link_to_phandle()":

  - Adding overlay:

        spi@e6e90000 Linked as a fwnode consumer to
interrupt-controller@f1010000
        spi@e6e90000 Linked as a fwnode consumer to clock-controller@e6150000
        spi@e6e90000 Linked as a fwnode consumer to system-controller@e6180000
        spi@e6e90000 Linked as a fwnode consumer to msiof0
        spi@e6e90000 Linked as a fwnode consumer to gpio@e6055000
        platform e6e90000.spi: Linked as a consumer to e6055000.gpio
        spi@e6e90000 Dropping the fwnode link to gpio@e6055000
        spi@e6e90000 Dropping the fwnode link to system-controller@e6180000
        platform e6e90000.spi: Linked as a consumer to e6150000.clock-controller
        spi@e6e90000 Dropping the fwnode link to clock-controller@e6150000
        platform e6e90000.spi: Linked as a consumer to soc
        spi@e6e90000 Dropping the fwnode link to interrupt-controller@f1010000

        +platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        +platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi
        +platform:soc--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:soc--platform:e6e90000.spi

        -platform:e6060000.pinctrl--platform:keys ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:keys

        SPI EEPROM does not work

  - Removing overlay:

        platform keys: Linked as a sync state only consumer to e6055000.gpio
        spi@e6e90000 Dropping the fwnode link to msiof0

        -platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        -platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi
        -platform:soc--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:soc--platform:e6e90000.spi

        platform:e6060000.pinctrl--platform:keys link is not recreated?!?!?


  - Adding overlay again:

        No debug output
        No change in sys/class/devlink?!?!?
        SPI EEPROM works

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
