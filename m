Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAE4C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 21:52:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BDD864E4D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 21:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BDD864E4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Al/DJIMmAgHXCg06lq74l26wxJ25CEcSjOGj2ggTjZ8=; b=WKOzKhFhjbP0n62EQqmPl5To6
	mDtOhxre5VYoshks4NNl+ADe4t4mjdY2pvF73J0eG4ZQf2zmOPoa+f6G3b354g+jDR9fgAMhUpCmM
	D++/8eNRAOkq4+4GYkzpDmoxgkfg5fwveOUvDgdnhS1nRTFaLzjcprFKBeuTPE1UcvFwDsv8PauVo
	lui2ucZo/3zUPzg4UOvfLyEExs9OywoPnaoglFCRZhVTUvakdKDrS1u9YA0U7I7j7+65vzq8nWTYb
	Qr2OM+BnHwjU1F4qEu2GG0RxFY0w1hiXG8UL9WNoLXHIetwQaP+YRli1qmjhBw/VAhdYiltsf/GC4
	iEO8D9uZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMHbG-001viz-Ks; Tue, 16 Mar 2021 21:51:40 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMHb8-001vho-Lq; Tue, 16 Mar 2021 21:51:33 +0000
Received: by mail-il1-f171.google.com with SMTP id d5so14162957iln.6;
 Tue, 16 Mar 2021 14:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6sggz0cW6S5oWFTZs2rV+TqaEbdoBcz8RBGBjA8S3b8=;
 b=dSeXzHqFz/c5FQaWS4MPfEg6IdU4HGAmqWPW5pDdtWmavTg69Y82B/bsmPrXkGA3Ab
 WkLgfwIZJVpxZouowMpEfwufFT6kxwYeWB5VWBMH73VcTXm4uz4F/7W+kWcHspt2g/aB
 ccYNadcsmv1gd3F4+sve5IoHliyckVU1tnF8CNop7UIgHM67VNPNvEWYtBu503Fs998F
 HTIN4Ex1kK/IBeMHSu148SSV0oWfBQL/E1ZUhPdL+wUBuvFHwU5vhSE5wLDo6yTZKHGt
 tkkAfc04nLoqSYAwIohLt1zwYckOhIV5/1T0rKS1m2rv94Q3M3JDvaMiww8ZMZhDsTKk
 RkEQ==
X-Gm-Message-State: AOAM530aBeKoA5vfp9U606vNVLTF1kirSAMlTJV5tPeIqmpzQTqfu7YW
 amV+IK9IcYRHpRKMWuWIEQ==
X-Google-Smtp-Source: ABdhPJwsSv9g0C0LxRsIhgTNLhkUz3c9irY8ZHBA/9wlz76whYv3hXMw4HFmiG/1sHtqi21CBxGXRw==
X-Received: by 2002:a05:6e02:dce:: with SMTP id
 l14mr5298695ilj.102.1615931488394; 
 Tue, 16 Mar 2021 14:51:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b12sm10054845ilr.55.2021.03.16.14.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:51:27 -0700 (PDT)
Received: (nullmailer pid 3739030 invoked by uid 1000);
 Tue, 16 Mar 2021 21:51:23 -0000
Date: Tue, 16 Mar 2021 15:51:23 -0600
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210316215123.GA3712408@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net> <YDQhgkftoW4J9AtY@piout.net>
 <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
 <20210306195645.GA1112592@robh.at.kernel.org>
 <20210308140358.diolcpbaq7gow3y4@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308140358.diolcpbaq7gow3y4@earth.universe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_215131_458855_9304170C 
X-CRM114-Status: GOOD (  50.27  )
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

On Mon, Mar 08, 2021 at 03:03:58PM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Sat, Mar 06, 2021 at 11:56:45AM -0800, Rob Herring wrote:
> > On Tue, Feb 23, 2021 at 02:26:57AM +0100, Sebastian Reichel wrote:
> > > On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> > > > On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > > > > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > > > > the clock is disabled and all i.MX6 functionality depending on
> > > > > > the 32 KHz clock has undefined behaviour. On systems using hardware
> > > > > > watchdog it seems to likely trigger a lot earlier than configured.
> > > > > > 
> > > > > > The proper solution would be to describe this dependency in DT,
> > > > > > but that will result in a deadlock. The kernel will see, that
> > > > > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > > > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > > > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > > > > the kernel's perspective this is a chicken-and-egg problem.
> > > > > > 
> > > > > 
> > > > > Reading the previous paragraph, I was going to suggest describing the
> > > > > dependency and wondering whether this would cause a circular dependency.
> > > > > I guess this will keep being an issue for clocks on an I2C or SPI bus...
> > > 
> > > Yes, it is a circular dependency on this particular system on
> > > module. It only works because the RTC enables the clock by
> > > default. The i.MX6 CKIL is expected to be always enabled.
> > 
> > I think you should describe the circular clocking and then provide a way 
> > to break the dependency.
> 
> This is very much not trivial. The clock is required during early
> initialization of the i.MX. At this point we are far from probing
> I2C drivers and without the I2C driver the clock is not registered.
> The current i.MX code expects the system clocks to be fixed clocks,
> since they must be enabled before any code is executed (incl.
> bootloader) and must never be disabled. From a HW design point of
> view it does not make sense to have a SW controllable clock for it,
> since it just adds extra cost. I believe for QMX6 it is only SW
> controllable, because that avoids the need for an extra crystal.
> 
> So how is the clock framework supposed to know, that it can ignore
> the clock during registration? I see the following options:
> 
> 1. My solution is the simplest one. Keep i.MX clock code the same
>    (it assumes a fixed-clock being used for CKIL) and avoid
>    registering RTC clock. This basically means the RTC is considered
>    to be a fixed-clock on this system, which is what the HW designers
>    seemed to have in mind (vendor kernel for the QMX6 is old enough
>    (4.9.x) to not to have CLK feature in the RTC driver. Vendor
>    U-Boot also does not touch the RTC. Booting mainline kernel once
>    bricks QMX6 boards until RTC battery is removed, so one could
>    actually argue addition of the CLK feature in 1373e77b4f10 (4.13)
>    is a regression). Currently Qualcomm device uses "protected-clocks"
>    for FW controlled clocks where Linux would crash the system by
>    trying to access them. IMHO the RTC is similar, since disabling
>    or modifying its frequency on QMX6 results in undefined behaviour
>    and possibly system crash.
> 
> 2. Make i.MX clock code use the RTC as CKIL clock provider, but
>    ignore it somehow. I see three sub-options:
> 
> 2.1. Add a property 'boot-enabled' to the RTC node, so that the
>      clock framework is aware of clock being enabled. This can
>      be used to satisfy clock dependencies somehow.
> 
> 2.2. The RTC device is not probed without I2C bus, but the driver
>      could also register a fake clock purely based on DT
>      information by adding some early init hook and take over
>      the clock once the I2C part is being probed. I think this
>      is a bad idea regarding maintainability of the driver.
>      Also for systems not using the RTC clock, the early clock
>      registration is basically wrong: If the kernel disables
>      the RTC it will stay disabled across boots if the RTC has
>      a backup battery. Basically we cannot imply anything from
>      the RTC compatible value alone.
> 
> 2.3 The i.MX core code could request CKIL with some flag, that
>     it's fine to have an unresolvable clock and just expect it
>     to be boot-enabled. The rationale would be, that CKIL must
>     be always-enabled.

I think 2.1 or 2.3 is fine. It boils down to detecting a cycle and then 
either you have a property or implicitly know to ignore a dependency.

> > It's a somewhat common issue.
> 
> It is? This only works, because one can treat the RTC's clock
> output like a fixed clock by not messing around with it.

Well, it's not the first time I've heard of the issue. Audio clocks are 
another example, but a bit different in that the clocks aren't needed 
until later. It's also come up in context of fw_devlinks which I 
think has some cycle breaking logic already.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
