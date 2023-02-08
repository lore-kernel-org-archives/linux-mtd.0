Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BE4C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeOf+SSYToolLLmA/jxjueZFO0dV4QqFHM4O54+QL5w=; b=2m9QQBX/4aziIY
	dX9gZicc1tBkyp0170OldDDNA9lXIiT9aHVTwcAG6mNMDH2NYlMxuEwGBgNdRkRWfdbnD9v5fqzmz
	O80QtE1MPkkPmsJoG+qqcG7qmTjjr0F6DEvQm+O4jvO3zYHz94xIGgAgS/uufmOkjzSX/jzpxuv77
	JhBJnHoU77SvuT89Mbtk8OwUC8l/Zu77PIJfdLZGX9CFRIu28fWnX+uywh5TQ96evyJz/h3fkl2r4
	pG1IgADf6OlOzP11xS4ot2Hq/1ZrHjV2BdOaXEvGKckbHINFypp+Fi82LdjXBUqjkjwRqhJPwVbV+
	uJAs33SONAtDMU3dHC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPevU-00EQul-4w; Wed, 08 Feb 2023 07:31:32 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPevH-00EQte-JA; Wed, 08 Feb 2023 07:31:23 +0000
Received: by mail-qt1-f181.google.com with SMTP id cr22so19788505qtb.10;
        Tue, 07 Feb 2023 23:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2bppoHuX82os++/Py2NRHmX1jE3ZJ52UnRWRf0XIy0=;
        b=cZP3GRZWbp/ukBLP52FMAztxqk5EU9EiTSImrWi0PAtrPDLfv9sgRv7+HjfRCWXZeJ
         dmIypFYuLXcEK/J2tOwf9bD/+Eu+Dl+0otsC83vxNlQrhVzO7cKYbkR/y8pyl5XTW2Ct
         s2AzLjaGBuQe2cvF5W9J8oos96UdOs/CbByv1VtiTYSdECSuIiJMtUfUK0JN2gldjSrQ
         S8iITKq9haNejMY6/GLWuVs9Apjf/EOBy1JEt7usP4hNMtpIrg4U7EW0FWvnENhmAhfy
         wRtb0Dxnk1+asa5g2zVzsK9lwfmnwyiwh0S1hfsbMfsgpLbRVHWlOkYVgFPgNg3Ewiki
         Qbiw==
X-Gm-Message-State: AO0yUKVAJdXgfX+rT7cCwOJdGfUM7SCm4NVRpYVXCtSDKaTAim9/ifLQ
	gQ/sEk9mSNTaT2Spua9LjQdnGPDBYe/KFw==
X-Google-Smtp-Source: AK7set8vVlxZjhmy/Ef8F/5w3wvzMmhQDDi7kXypFPiI/hmbnwnnEJ5P2E0mbywGIjpdXYU+1gmT4A==
X-Received: by 2002:a05:622a:1825:b0:3ba:36f2:c207 with SMTP id t37-20020a05622a182500b003ba36f2c207mr6828360qtc.39.1675841475666;
        Tue, 07 Feb 2023 23:31:15 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id dl12-20020a05620a1d0c00b0071323d3e37fsm11082092qkb.133.2023.02.07.23.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 23:31:15 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-4b718cab0e4so224218827b3.9;
        Tue, 07 Feb 2023 23:31:15 -0800 (PST)
X-Received: by 2002:a0d:ca03:0:b0:506:6b5d:523c with SMTP id
 m3-20020a0dca03000000b005066b5d523cmr523838ywd.283.1675841464452; Tue, 07 Feb
 2023 23:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-10-saravanak@google.com> <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
 <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com>
In-Reply-To: <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Feb 2023 08:30:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPosaKarsRWZpuGGD7Xam6qngsej+3iJdfWGTBDiWhLA@mail.gmail.com>
Message-ID: <CAMuHMdXPosaKarsRWZpuGGD7Xam6qngsej+3iJdfWGTBDiWhLA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230207_233119_659638_77FFAD8E 
X-CRM114-Status: GOOD (  50.17  )
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

Please ignore the memory leak messages.  They are known issues
in the upstream DT overlay code, and not related to your series.

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

Thanks, I'll give that a try, later...

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
