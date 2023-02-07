Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4386FC61DA4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 01:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/wggLbfRXUC3M0N3UP9dPGBHnmAHYqxMttRsbVI/leU=; b=wjP
	b9VS9jB20kLIUJPQtM9UVj66Srj/CenNcW7oHV4gcXhUkVuW8JEhWU/kjIwZVdrxc4aHfyGgkwPI4
	8JDAFUKSbBsE7Og0aPhK6/YTZL9d2NSH2/+J8p7gj1dbCt1SfZ2l6NERN4ciE7vqTRqefa2+L0XbC
	MWQa553cHBxD0KeA/YNqxRisNj3zQSU441fUS+3wM1KcMb5ciisEfmFqmN1SwC+ZNnH9BOQ5omYHt
	oOc6vAu2oEHWoMh5fxGB1jjBeymNqwH3Cght8/gnr6enWvVtrB0XqXxVzhxaVg0ObFvjL6OxGTRu5
	j9nSoI4KPCgczed1mZnZvCM1HO/+T3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPCzz-00ANTW-0a; Tue, 07 Feb 2023 01:42:19 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPCzu-00ANSF-EY
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 01:42:16 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 3-20020a17090a098300b0023092a8d1acso2278346pjo.4
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 17:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Lzwmfi68lbdrUMbtc6adBz2FR099zCl1IbhLNZPH1k=;
        b=AiCfxSp7rvYdlgl0hl4blBlUcDhKmP2ipQWAy9D+v4OffGK0tOAZAVe6vj1m5Qqb1N
         EjVKK0seT/KHqRY31wLEaQnNOfPf2YnCeLt3UYVQcttmFjIdZOKxHDXNZbOFbd6VC/Qs
         YNWCMN8S77uoudgWgBuiUlIQHmrkrOS93xAFfs/JCgWixMPTZKa7k1u41pU7om9nNL9z
         xPGzdgebPBxzGe2RJ+Q4NwYLmakenKFtNcj/xZeImi7KWdRpF2+9iQmiJWyzIbJMCV4D
         E4rbGyjlteWJX7skmBf/WRPXHpbjKXCwbF2v1IQwRsB/gvBU/gqaLXL7ZiasmH3GDDgW
         1JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Lzwmfi68lbdrUMbtc6adBz2FR099zCl1IbhLNZPH1k=;
        b=B7GrDryL5wd4KTA1nLIiwatkZqR0vg8siT7ujnRcv7NmlJR/IYKZSKz4i/QatDLExP
         eDM8TKvry+gz36NpSIDAvM8ghEwRViSCw48bJvBHnxbu6fXxCdWfPB8UmhYPMVJAw/hC
         c9ZXEhLhVBLDWObIffgW2nj4tJn5eP6+Jqgs+kojmn5UjxaoJOu/GZZGsmr4g3LMbpvD
         3V4JeaEQ0FUeGxvFEKj+czTlsjaD7iDFvkVOYA+vhVdgHJULRDiZLb+VwOAc6sC3ZueL
         VPdfcrSNJmM1jozEEuAQ8TPWX93eifuo6XIgb5DJkUinMY/G0EpmZr7K3oo3PXa7Bqs7
         u8Hg==
X-Gm-Message-State: AO0yUKW3Y2PukZ5J1un+naZWX7toyrflx5abZrEsmV/dNOT/r9XMEVRb
	oC8oepXji99WyiHWEoxcsy/K2U7pPqkVqYQ=
X-Google-Smtp-Source: AK7set+EAwfeBS4EZdincaahfqhxKjG9TUS0REB1NbACugqOxKLsnOyVz3Xl+5qV5fiy7WsvyHpw/x+7WRzIigU=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a17:90a:5a05:b0:22c:46e:6510 with SMTP
 id b5-20020a17090a5a0500b0022c046e6510mr459339pjd.9.1675734130693; Mon, 06
 Feb 2023 17:42:10 -0800 (PST)
Date: Mon,  6 Feb 2023 17:41:52 -0800
Message-Id: <20230207014207.1678715-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 00/12] fw_devlink improvements
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
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
	Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?=" <rafal@milecki.pl>
Cc: Abel Vesa <abel.vesa@linaro.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	John Stultz <jstultz@google.com>, Doug Anderson <dianders@chromium.org>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Maxim Kiselev <bigunclemax@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Luca Weiss <luca.weiss@fairphone.com>, Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_174214_533734_D5E01950 
X-CRM114-Status: GOOD (  19.39  )
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

Naresh, Tony, Abel, Geert, Dmitry, Maxim(s), Miquel, Luca, Doug, Martin,
Jean-Philippe,

Can I get your Tested-by's for this v3 series please?

Vladimir,

Ccing you because DSA's and fw_devlink have known/existing problems
(still in my TODOs to fix). But I want to make sure this series doesn't
cause additional problems for DSA.

All,

This patch series improves fw_devlink in the following ways:

1. It no longer cares about a fwnode having a "compatible" property. It
   figures this out more dynamically. The only expectation is that
   fwnodes that are converted to devices actually get probed by a driver
   for the dependencies to be enforced correctly.

2. Finer grained dependency tracking. fw_devlink will now create device
   links from the consumer to the actual resource's device (if it has one,
   Eg: gpio_device) instead of the parent supplier device. This improves
   things like async suspend/resume ordering, potentially remove the need
   for frameworks to create device links, more parallelized async probing,
   and better sync_state() tracking.

3. Handle hardware/software quirks where a child firmware node gets
   populated as a device before its parent firmware node AND actually
   supplies a non-optional resource to the parent firmware node's
   device.

4. Way more robust at cycle handling (see patch for the insane cases).

5. Stops depending on OF_POPULATED to figure out some corner cases.

6. Simplifies the work that needs to be done by the firmware specific
   code.

The v3 series has gone through my usual testing on my end and looks good
to me.

Thanks,
Saravana

[1] - https://lore.kernel.org/lkml/20220810060040.321697-1-saravanak@google.com/
[2] - https://lore.kernel.org/lkml/CAGETcx-JUV1nj8wBJrTPfyvM7=Mre5j_vkVmZojeiumUGG6QZQ@mail.gmail.com/

v1 -> v2:
- Fixed Patch 1 to handle a corner case discussed in [2].
- New patch 10 to handle "fsl,imx8mq-gpc" being initialized by 2 drivers.
- New patch 11 to add fw_devlink support for SCMI devices.

v2 -> v3:
- Addressed most of Andy's comments in v2
- Added Colin and Sudeep's Tested-by for the series (except the imx and
  renesas patches)
- Added Sudeep's Acked-by for the scmi patch.
- Added Geert's Reviewed-by for the renesas patch.
- Fixed gpiolib crash reported by Naresh.
- Patch 6: Fix __fwnode_links_move_consumers() to preserve fwnode link flags.
- New Patch 12 to fix nvmem-cells issue reported by Maxim(s)/Miquel.
- Deleted some stale function doc in Patch 8

Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Stultz <jstultz@google.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>
Cc: Colin Foster <colin.foster@in-advantage.com>
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: Jean-Philippe Brucker <jpb@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>

Saravana Kannan (12):
  driver core: fw_devlink: Don't purge child fwnode's consumer links
  driver core: fw_devlink: Improve check for fwnode with no
    device/driver
  soc: renesas: Move away from using OF_POPULATED for fw_devlink
  gpiolib: Clear the gpio_device's fwnode initialized flag before adding
  driver core: fw_devlink: Add DL_FLAG_CYCLE support to device links
  driver core: fw_devlink: Allow marking a fwnode link as being part of
    a cycle
  driver core: fw_devlink: Consolidate device link flag computation
  driver core: fw_devlink: Make cycle detection more robust
  of: property: Simplify of_link_to_phandle()
  irqchip/irq-imx-gpcv2: Mark fwnode device as not initialized
  firmware: arm_scmi: Set fwnode for the scmi_device
  mtd: mtdpart: Don't create platform device that'll never probe

 drivers/base/core.c             | 449 +++++++++++++++++++++-----------
 drivers/firmware/arm_scmi/bus.c |   3 +-
 drivers/gpio/gpiolib.c          |   7 +
 drivers/irqchip/irq-imx-gpcv2.c |   1 +
 drivers/mtd/mtdpart.c           |  10 +
 drivers/of/property.c           |  84 +-----
 drivers/soc/imx/gpcv2.c         |   2 +-
 drivers/soc/renesas/rcar-sysc.c |   2 +-
 include/linux/device.h          |   1 +
 include/linux/fwnode.h          |  12 +-
 10 files changed, 344 insertions(+), 227 deletions(-)

-- 
2.39.1.519.gcb327c4b5f-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
