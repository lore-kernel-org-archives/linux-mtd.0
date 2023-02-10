Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA68C05027
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Feb 2023 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvz37F/vSIY9tTvlhNxKl6ScjAKmPsX1HBkls4GHJIc=; b=EBYHT5cHCdTMSv
	KqiiE0hNflEKhSiI4BXDdX66mo+Y7merj59BNlKFFsQrOEjUQ1+DrGr9IDq6d7WSu0Z+XoVJ68VYL
	jGqaMNuKygd436bBlNLZJNen+e1lyseidQDjk6LX+IpMEsG/+x5RcXPBjWxYYBAd+Dv2+tItjafqt
	2U+Diwc4lvEZBLYWHM7dgJZ8fwTDhoU38fpTrBOriG78IR99zgAuqwuhPZk9FcU2STUbtZE1Wyk+f
	dEiwuMcuuylctTdDoRs3l2rQYDkbLuejRerRdWPqffqPydhe0SzzDMwaCS63ytYgrVDzWvwC+Z22D
	wsOp0gyrjw92hs6uuhJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQZ3s-0075pn-DU; Fri, 10 Feb 2023 19:27:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQZ3p-0075n5-Gs
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2023 19:27:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id iz19so6140634plb.13
        for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2023 11:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwrUc84I/sw9tW3rFINcSrPClBVAQXnQCQkcXqCJwLw=;
        b=hQAxFU0UWDL+c15mTPMopFsa+DtSgaC7lA9lDiZRF+/FBqEeZ1Sy6LFHOtrrmF7Sd2
         v3IQ4IcAubIN0sr/1IcMzervGsBGnx/9uVGBupdYwT7CYjSfUyh2ey92RUSzoBbbgpYn
         0yrTbvmX6Y5z5uGK5Fr3w7qB8YcpBQwxPf068+nJTDp3fMtnUOry570Pkrgu+Z0vJX0T
         /oD0wDMz7A461CTNkbVBFXvkA3x1tdf1xcy/8c23ZzOgsoyCkwyAxKek0E8ib8LB8umD
         JbVUcVsa0e4608OvA+Dgszfc0dcvb4K/Bn/gnpXg2T2gMtByW8tFjWx/0j/YrIp98Bph
         Jh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwrUc84I/sw9tW3rFINcSrPClBVAQXnQCQkcXqCJwLw=;
        b=ksylNrIUJ/gBg9TIU2Wf7lFbAYcQeko0HdKWo/UdJa7RR3gDIJFlw/mel01H3X7lPl
         TACA+uK6hSHmWR7qKMo4F2rwL2wzKD0kRPg0/9UdWHVOhjjMedsKT8Y4PFG5oGhlTGvo
         osetC8diwqj/VIAbc50w03Mkr+L4fpuTHC8WdNGiFqfWs9FqVtNOpOPhrupQ4Zf/Ggue
         7ZQT1120ZkR8A1xof03r3HWp6gxnGjl7SLsox1GxMrZQNdovfDL+M0NPpWMQK3rpcj6u
         y1E1/t6JAJKyRMBmu9tFSGebtHJ+1mKYU17Rv1Qu9r1shIZFKVePdd5fBctJGlV+DjZD
         c19w==
X-Gm-Message-State: AO0yUKWSYxFtshd0FH0POWltsUls5xG70QOyZjSmLGl7gaY7dx5nh5Kv
	uc5FU+f3rovh3bYLr9Wlyrt+SpYR7F/zPe+J7AGB3Q==
X-Google-Smtp-Source: AK7set8YqUGIKC41zQQA+imGuckADHerNWZeukO+5tCxdqLGYKK3iW3D9WDbQqKroQBsftoX1HY4I+fjcAkwH4jn0w0=
X-Received: by 2002:a17:90a:f018:b0:230:9e2a:ebd8 with SMTP id
 bt24-20020a17090af01800b002309e2aebd8mr2796418pjb.48.1676057267896; Fri, 10
 Feb 2023 11:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com> <20230210101333.h2e7hcl3ylsoh6fy@skbuf>
In-Reply-To: <20230210101333.h2e7hcl3ylsoh6fy@skbuf>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 10 Feb 2023 11:27:11 -0800
Message-ID: <CAGETcx_SQJ1q_f8r+zKATF-EEb0P-T_ot15AQ1x1Vc_3h=XfCw@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] fw_devlink improvements
To: Vladimir Oltean <vladimir.oltean@nxp.com>
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
	Guenter Roeck <linux@roeck-us.net>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Maxim Kiselev <bigunclemax@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Luca Weiss <luca.weiss@fairphone.com>, Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_112753_580937_D645A567 
X-CRM114-Status: GOOD (  29.64  )
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

On Fri, Feb 10, 2023 at 2:13 AM Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
>
> Hi Saravana,
>
> On Mon, Feb 06, 2023 at 05:41:52PM -0800, Saravana Kannan wrote:
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
> >    figures this out more dynamically. The only expectation is that
> >    fwnodes that are converted to devices actually get probed by a driver
> >    for the dependencies to be enforced correctly.
> >
> > 2. Finer grained dependency tracking. fw_devlink will now create device
> >    links from the consumer to the actual resource's device (if it has one,
> >    Eg: gpio_device) instead of the parent supplier device. This improves
> >    things like async suspend/resume ordering, potentially remove the need
> >    for frameworks to create device links, more parallelized async probing,
> >    and better sync_state() tracking.
> >
> > 3. Handle hardware/software quirks where a child firmware node gets
> >    populated as a device before its parent firmware node AND actually
> >    supplies a non-optional resource to the parent firmware node's
> >    device.
> >
> > 4. Way more robust at cycle handling (see patch for the insane cases).
> >
> > 5. Stops depending on OF_POPULATED to figure out some corner cases.
> >
> > 6. Simplifies the work that needs to be done by the firmware specific
> >    code.
> >
> > The v3 series has gone through my usual testing on my end and looks good
> > to me.
>
> Booted on an NXP LS1028A (arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts)
> and a Turris MOX (arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts)
> with no observed regressions.

Thanks for testing Vladimir!

> Is there something specific you would like
> me to test?


Not really, I just want to make sure the common DSA architectures
don't hit any regression. In the hardware you tested, are there cases
of PHYs where the supplier is the parent MDIO? I remember that being
the only case where I needed special casing
(FWNODE_FLAG_NEEDS_CHILD_BOUND_ON_ADD) in fw_devlink -- so it'll be
good to make sure I didn't accidentally break anything there.


-Saravana

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
