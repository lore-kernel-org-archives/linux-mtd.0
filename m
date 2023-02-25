Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A36C64EC7
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Feb 2023 06:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VJaC9VtSdBJUIwDolq2D0Xa/1uqwxxQf2gXzsSToPQ=; b=nljalefV5jP+Rb
	Mzyxev1Bzd6o6vJzGjYeJJSzyFhS8p8lreg0k/+bHmrgCHU3qTCmtaFg70ov0KsKlSN2Fq7UZxdwO
	sXRqs3SIJuJPCu1DeZ/Jhew6qZ5fkCCo4HTylva2QE6+o9u5RtgZLkzpWypx5BxwEntrSBkZvb6T+
	83VeF+OR2IsdPZ5iXDBlAV5v/94IvtowvKAJuLbJ2En557bfihk63wzsW92aqGB8AS7bZCpkm0Jy2
	BaIoOPau9cwOQY6/zGhm4F1UFUNuLkQcpuYD/Z/1LvnmoeOnxHsIVAyq3vhanEm5T9GtkBxCQJy0s
	aZ3NSY17l2QY7VACxZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVo0G-00519s-NB; Sat, 25 Feb 2023 06:25:52 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVo05-00516l-5j
	for linux-mtd@lists.infradead.org; Sat, 25 Feb 2023 06:25:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id c1so1683514plg.4
        for <linux-mtd@lists.infradead.org>; Fri, 24 Feb 2023 22:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4QPCIfZpunPpGQRjZ0CLzZgvh1bMrAOlRsJYurE9VOI=;
        b=i2OnX+qtVkxWkVFcUUUtHoMVo58k8kPteFOU3yRJoch4UrZVjVtoKgQCILPsSIH2IM
         9SuCn3vu72nb3n2gCsoCb9MQcwZbuXYf5jgyHDO34s/gR8M5CxRU5gV0+YnHw+9V/jL3
         UereLqEbLRdif9+wLl1Wv9EJQ5zwKS3GE8nA8qUJSHw1j151949EZ1cDEtx0EJ19hLV9
         2i4mG+2eo1p0BSS1qZavXyXOVwVlLf24HyC12nbm1kz7x2IzYuc7LLP1/1i2knyLhN87
         asicV45YD46sfQWagebPdNnXBrCMp8DyEYimgDowgWuBomRC1Gc2M0hNTbO7Evf7ew4Y
         cwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QPCIfZpunPpGQRjZ0CLzZgvh1bMrAOlRsJYurE9VOI=;
        b=ooDpeX21hNXIiFPOM137GnfQTmCvJ3rG9w3P540sCEjqYPafSreLUPTVRl4B/+Dthv
         9Y8Ejbzdf6UUdU62s0ZcSd01/trFW7TCxbEuurSsd+uXPXuSYdQKf6HKz1kXQ5Eu9JQG
         axNVJaFatsRJ1suC66W7uMYRkcWRs8p6L/3jiB7t3Nr3l269VsR8m3XzjT2UMOp/5jeM
         xgflT4Zjra4s7Tc0aN/KR92Khlwk6s0wk0AqeeB2pZku5oc9qYnQsNHz2lIIu9NafFXz
         YtOQRSDfIdMAk044jWPGrNe0FK+4ELFV52OVWXzWZOP32TbLNDzEEle/audeKAHLhxNw
         sT2w==
X-Gm-Message-State: AO0yUKU/KphVF+Um/xC3vvx/GFn2QASCrW0kpcXuX6mzHM8Bed3kY86P
	CnDQ/RkJcD8ZJedpKGiKlOr3B6pl2KVb7BVjBGIYgw==
X-Google-Smtp-Source: AK7set/k/0eO1pGMhcQMet0YU6e3h9+c98wFu1JipuFF0QZYfLgw6WY/Kw7NUyUCthebeNVAXRQmnWBsB84kG+im0+I=
X-Received: by 2002:a17:903:2402:b0:19c:a7a7:7072 with SMTP id
 e2-20020a170903240200b0019ca7a77072mr3005999plo.10.1677306336589; Fri, 24 Feb
 2023 22:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com> <CAA8EJprMMh3udsKKwtGJW9kBLfMv=_OXFnnPGobK=dK-raX5ew@mail.gmail.com>
In-Reply-To: <CAA8EJprMMh3udsKKwtGJW9kBLfMv=_OXFnnPGobK=dK-raX5ew@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 24 Feb 2023 22:24:59 -0800
Message-ID: <CAGETcx8iR20dtrKMu+5VdqqTG8xYY7PFjLnkgUfvMNV2bmfhkw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] fw_devlink improvements
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Abel Vesa <abel.vesa@linaro.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	John Stultz <jstultz@google.com>, Doug Anderson <dianders@chromium.org>, 
	Guenter Roeck <linux@roeck-us.net>, Maxim Kiselev <bigunclemax@gmail.com>, 
	Maxim Kochetkov <fido_max@inbox.ru>, Luca Weiss <luca.weiss@fairphone.com>, 
	Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_222541_245955_B5DBE426 
X-CRM114-Status: GOOD (  47.67  )
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

On Wed, Feb 15, 2023 at 7:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 07/02/2023 03:41, Saravana Kannan wrote:
> > Naresh, Tony, Abel, Geert, Dmitry, Maxim(s), Miquel, Luca, Doug, Martin,
> > Jean-Philippe,
> >
> > Can I get your Tested-by's for this v3 series please?
> >
> > Vladimir,
> >
> > Ccing you because DSA's and fw_devlink have known/existing problems
> > (still in my TODOs to fix). But I want to make sure this series doesn't
> > cause additional problems for DSA.
> >
> > All,
> >
> > This patch series improves fw_devlink in the following ways:
> >
> > 1. It no longer cares about a fwnode having a "compatible" property. It
> >     figures this out more dynamically. The only expectation is that
> >     fwnodes that are converted to devices actually get probed by a driver
> >     for the dependencies to be enforced correctly.
> >
> > 2. Finer grained dependency tracking. fw_devlink will now create device
> >     links from the consumer to the actual resource's device (if it has one,
> >     Eg: gpio_device) instead of the parent supplier device. This improves
> >     things like async suspend/resume ordering, potentially remove the need
> >     for frameworks to create device links, more parallelized async probing,
> >     and better sync_state() tracking.
> >
> > 3. Handle hardware/software quirks where a child firmware node gets
> >     populated as a device before its parent firmware node AND actually
> >     supplies a non-optional resource to the parent firmware node's
> >     device.
> >
> > 4. Way more robust at cycle handling (see patch for the insane cases).
> >
> > 5. Stops depending on OF_POPULATED to figure out some corner cases.
> >
> > 6. Simplifies the work that needs to be done by the firmware specific
> >     code.
> >
> > The v3 series has gone through my usual testing on my end and looks good
> > to me.
>
> Saravana,
>
> Please excuse me, I was completely overwhelmed with my regular work and
> had no time to properly test the series, while doing just the light
> test would defeat the purpose of testing.
>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # Qualcomm RB3
>
> Thanks a lot for going through all the troubles and hunting all the issues!

You are welcome! Thanks for testing it.

> Just a note: on an RB3 device (arm64 qcom/sdm845-db845c.dtsi) extended
> with the patch at [3] I got the following messages in dmesg:
>
> [    1.051325] platform ae00000.mdss: Failed to create device link
> with ae00000.mdss
> [    1.059368] platform ae00000.mdss: Failed to create device link
> with ae00000.mdss
> [    1.067174] platform ae00000.mdss: Failed to create device link
> with ae00000.mdss
> [    1.088322] platform c440000.spmi: Failed to create device link
> with c440000.spmi
> [    1.096019] platform c440000.spmi: Failed to create device link
> with c440000.spmi
> [    1.103707] platform c440000.spmi: Failed to create device link
> with c440000.spmi
> [    1.111400] platform c440000.spmi: Failed to create device link
> with c440000.spmi
> [    1.119141] platform c440000.spmi: Failed to create device link
> with c440000.spmi
> [    1.126825] platform c440000.spmi: Failed to create device link
> with c440000.spmi
> [    2.024763] qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb:
> Failed to create device link with c440000.spmi
> [    2.035026] qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb:
> Failed to create device link with c440000.spmi
>
> They look to be harmless, but it might be good to filter some of them
> out? Especially the ones which tell about creating a device link
> pointing back to the same device.

I'm sure it's harmless when the supplier == consumer. Agreed on
filtering these out.

I looked at [3], but it's not obvious to me how this is happening for
your specific case. There are a couple of  ways I can think of:
1. A SYNC_STATE_ONLY link being created as a proxy link (I don't do as
many checks here because it can't break anything)
2. __fw_devlink_pickup_dangling_consumers() causing the consumer and
supplier to be the same.

But I want to understand which one is happening in your case. Can you
add a WARN_ON(1) after the error message and give me the list of stack
dumps that are unique?

Thanks,
Saravana


>
> [3] https://lore.kernel.org/linux-arm-msm/20230118082048.2198715-1-dmitry.baryshkov@linaro.org/
>
> >
> > Thanks,
> > Saravana
> >
> > [1] - https://lore.kernel.org/lkml/20220810060040.321697-1-saravanak@google.com/
> > [2] - https://lore.kernel.org/lkml/CAGETcx-JUV1nj8wBJrTPfyvM7=Mre5j_vkVmZojeiumUGG6QZQ@mail.gmail.com/
> >
> > v1 -> v2:
> > - Fixed Patch 1 to handle a corner case discussed in [2].
> > - New patch 10 to handle "fsl,imx8mq-gpc" being initialized by 2 drivers.
> > - New patch 11 to add fw_devlink support for SCMI devices.
> >
> > v2 -> v3:
> > - Addressed most of Andy's comments in v2
> > - Added Colin and Sudeep's Tested-by for the series (except the imx and
> >    renesas patches)
> > - Added Sudeep's Acked-by for the scmi patch.
> > - Added Geert's Reviewed-by for the renesas patch.
> > - Fixed gpiolib crash reported by Naresh.
> > - Patch 6: Fix __fwnode_links_move_consumers() to preserve fwnode link flags.
> > - New Patch 12 to fix nvmem-cells issue reported by Maxim(s)/Miquel.
> > - Deleted some stale function doc in Patch 8
> >
> > Cc: Abel Vesa <abel.vesa@linaro.org>
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Maxim Kiselev <bigunclemax@gmail.com>
> > Cc: Maxim Kochetkov <fido_max@inbox.ru>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Luca Weiss <luca.weiss@fairphone.com>
> > Cc: Colin Foster <colin.foster@in-advantage.com>
> > Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
> > Cc: Jean-Philippe Brucker <jpb@kernel.org>
> > Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
> >
> > Saravana Kannan (12):
> >    driver core: fw_devlink: Don't purge child fwnode's consumer links
> >    driver core: fw_devlink: Improve check for fwnode with no
> >      device/driver
> >    soc: renesas: Move away from using OF_POPULATED for fw_devlink
> >    gpiolib: Clear the gpio_device's fwnode initialized flag before adding
> >    driver core: fw_devlink: Add DL_FLAG_CYCLE support to device links
> >    driver core: fw_devlink: Allow marking a fwnode link as being part of
> >      a cycle
> >    driver core: fw_devlink: Consolidate device link flag computation
> >    driver core: fw_devlink: Make cycle detection more robust
> >    of: property: Simplify of_link_to_phandle()
> >    irqchip/irq-imx-gpcv2: Mark fwnode device as not initialized
> >    firmware: arm_scmi: Set fwnode for the scmi_device
> >    mtd: mtdpart: Don't create platform device that'll never probe
> >
> >   drivers/base/core.c             | 449 +++++++++++++++++++++-----------
> >   drivers/firmware/arm_scmi/bus.c |   3 +-
> >   drivers/gpio/gpiolib.c          |   7 +
> >   drivers/irqchip/irq-imx-gpcv2.c |   1 +
> >   drivers/mtd/mtdpart.c           |  10 +
> >   drivers/of/property.c           |  84 +-----
> >   drivers/soc/imx/gpcv2.c         |   2 +-
> >   drivers/soc/renesas/rcar-sysc.c |   2 +-
> >   include/linux/device.h          |   1 +
> >   include/linux/fwnode.h          |  12 +-
> >   10 files changed, 344 insertions(+), 227 deletions(-)
> >
>
> --
> With best wishes
>
> Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
