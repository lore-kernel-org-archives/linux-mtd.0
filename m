Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0331BC636CD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYtCniNid6riKr8eJZaIrF8NZ7dg1Kc/Km2Sudb0Umg=; b=L/GskPndiZ+xsS
	owzueJTMtiOUkz1yMCZCJDPLpEOUb+KBGXlze8L/ft0WcOUl3jXYJmGMusD2d2wp8q9kOj2uEWra4
	g8wwTX4bICTefbSSQuxw1liiQWJaAh1+IEhng5834DMhYZz3LeKYMp4TdmRdo46h/v/yKmo1OLhIg
	zIpFdGhIrOCw5Iy11HrXA3Wg4Vn96p9IllsvWE+PCdWySQucb0VfT/F2bSaK3PvwH0cZL7KVfSrac
	2j+WaF6SN73+rzIXl3txsuWoJ/bpJ+B/XMxcbcLCHvKD6BLCGX/EKU2cDHEqTUqW54SpO1WiAFGJD
	AN7Hse2gkRrUAdC4UQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIqO-00BD7Z-JH; Tue, 07 Feb 2023 07:56:48 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIqD-00BD4N-ID; Tue, 07 Feb 2023 07:56:39 +0000
Received: by mail-ot1-f41.google.com with SMTP id v24-20020a05683011d800b0068bdd29b160so3932494otq.13;
        Mon, 06 Feb 2023 23:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2wYlj6gN2naNv6gpoblV6OOQNS/n19UAH0L94v4JNA=;
        b=wk6IDB5lEM1lo0MStF+zxBUX2Xje77PT9FoV0RMGtHRXPih4geh5hfpXxDVMh/MvEv
         V/4kmrhcLolNIcLjqnpwjWGz81WxHYg669jkQoC6d2wNL0uvIeD1nNVmLALOv22HWg9o
         oTfkXq1HmQR6dt9/JKp4g6DV+TeEaI5MyQv2aL9BP3ZIzO4ysfMa2axVU/mv3rgUIEUe
         +7pWa2GMkcZRyyzNEdiucFigGnnO7xYUqZGMqcbHo679clnp7iTkVlRPa5E5X6zD/Q2H
         Z3AT+m7lf+BC3bEUzRq/vtWt7FU69hXrxcgv2rewnVlb8I/6X8EKwsVUnQw1E2moE0Jl
         lhZg==
X-Gm-Message-State: AO0yUKU5KYMk6czgFExkLuzI5g+fVZ3MmfOHzX0ecnPMH0EXtLSBxC9x
	r9N/dguwLPR1/JSVvsSJz0ek98vbc1xF2g==
X-Google-Smtp-Source: AK7set9vp9VM4BPRQYJ/hLkTTmmIef3SyKCo0nkbjtoKX0NLxJaD2YtqloyXlKSnaXSTyxiiSizTXw==
X-Received: by 2002:a05:6830:2b14:b0:68b:bd51:dd01 with SMTP id l20-20020a0568302b1400b0068bbd51dd01mr1664737otv.38.1675756594659;
        Mon, 06 Feb 2023 23:56:34 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id j74-20020a9d17d0000000b0068bd04b4292sm6069098otj.31.2023.02.06.23.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 23:56:34 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id f5-20020a9d5f05000000b00684c0c2eb3fso3937281oti.10;
        Mon, 06 Feb 2023 23:56:34 -0800 (PST)
X-Received: by 2002:a5b:508:0:b0:8a3:59a4:340e with SMTP id
 o8-20020a5b0508000000b008a359a4340emr269046ybp.604.1675756583781; Mon, 06 Feb
 2023 23:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com> <20230207014207.1678715-4-saravanak@google.com>
In-Reply-To: <20230207014207.1678715-4-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 08:56:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRq-+zMuMPMuqLt45t5X78P4nRWZ-cJe8fk=1TsugTYA@mail.gmail.com>
Message-ID: <CAMuHMdVRq-+zMuMPMuqLt45t5X78P4nRWZ-cJe8fk=1TsugTYA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] soc: renesas: Move away from using OF_POPULATED
 for fw_devlink
To: Saravana Kannan <saravanak@google.com>
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
X-CRM114-CacheID: sfid-20230206_235637_623509_1A43ACCA 
X-CRM114-Status: GOOD (  22.83  )
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

On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> The OF_POPULATED flag was set to let fw_devlink know that the device
> tree node will not have a struct device created for it. This information
> is used by fw_devlink to avoid deferring the probe of consumers of this
> device tree node.
>
> Let's use fwnode_dev_initialized() instead because it achieves the same
> effect without using OF specific flags. This allows more generic code to
> be written in driver core.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

You've missed my earlier:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
