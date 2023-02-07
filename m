Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C86C636D3
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 20:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGGngaonNRvDVXVETrEWT9V86Z6mkUL0wRXQieBgKDc=; b=QiyyrdwLtB6doO
	1zKhdFfIZfnnz3xdhBTSTHE44P8Dvcrjih/NrU9OeLD4B5uQ15R2a4CocDm+omdn3K0NUi7/8XvU2
	YudrUD+vFclCHDcQ+RamXQ1RZ4neO1TLmoHZNUXEZsptzJlt7r4jL+oD28sFQb7vdgcX1wu6phXtt
	u1LlXc6VH4NhxqBqKAsMx2pVPo8eWVk2HGu3KMr0yYRIX1MwqlXWAOXGf2QFQIHnphKPRQAfs2RZd
	fmNACSKPo7dQoSWsAoNrqkUQNbREq5ju9KV9hYlVg9EUByEzqBua+Hp1ZZaLkANZBySeBE4oY9ZjW
	PJdo9QIT3RZ6KLiyxZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPV2E-00DOVp-E3; Tue, 07 Feb 2023 20:57:50 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPV22-00DOSs-Qh; Tue, 07 Feb 2023 20:57:40 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-16a7f5b6882so3352168fac.10;
        Tue, 07 Feb 2023 12:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stAVsaUhrI2VyH6NyKcHcY+/3Po2YLTE8rKYRoMV1wU=;
        b=Ip6ujCrKkc5DqGMryi45It0dwXXnRPJ6yVle2En0NdbUDysOPZQlVMY0r6b7s8BVxk
         GGN0zIR3AhWDRud89CJK5e6Na9mCSMnEaavjLIU8I3C78896ISg3egDu4lCIAqOuAiC6
         CovFNHhOfHsfARob3X1tJZTUlqD2gsPzJMt/Iag7NlP2+Cs2XU9qL80blgz6sk7QQYIs
         1gF+0ju4XLTLF0y+MckMuwliYWjk4LbEsgAMEVM69wUyG8aggq4wT8v2ATgAMUO7u1fX
         EIfIba4WDxXwJfuihr9CeqwzWT21ex5dnB0uat/udAKYzy0aGx2Q7sAnHNOuvs2kwSg8
         3MpA==
X-Gm-Message-State: AO0yUKWjIYnz+atCQ7QR4YXLiCOyu96349tiJCKJIAcFCPsZO7FOiD4r
	DFyxYDtDAgeczU3efZesTwXH/8Ak7XbPHQ==
X-Google-Smtp-Source: AK7set/SMrRSrw+i8y3nXfJVy66wuFVEK7MjxrjMQBSWN0ZIxNJoogla/ARVwpyNRwqirgo8w/Cowg==
X-Received: by 2002:a05:6870:4248:b0:15f:c10f:4e4c with SMTP id v8-20020a056870424800b0015fc10f4e4cmr3132673oac.44.1675803457446;
        Tue, 07 Feb 2023 12:57:37 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id a4-20020a056870618400b0014fc049fc0asm5899217oah.57.2023.02.07.12.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 12:57:37 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id e12-20020a0568301e4c00b0068bc93e7e34so4632417otj.4;
        Tue, 07 Feb 2023 12:57:37 -0800 (PST)
X-Received: by 2002:a25:928e:0:b0:8a0:2a4:a96c with SMTP id
 y14-20020a25928e000000b008a002a4a96cmr477401ybl.380.1675803446414; Tue, 07
 Feb 2023 12:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com> <20230207014207.1678715-10-saravanak@google.com>
In-Reply-To: <20230207014207.1678715-10-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 21:57:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
Message-ID: <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230207_125738_886865_529655A2 
X-CRM114-Status: GOOD (  28.73  )
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

On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> The driver core now:
> - Has the parent device of a supplier pick up the consumers if the
>   supplier never has a device created for it.
> - Ignores a supplier if the supplier has no parent device and will never
>   be probed by a driver
>
> And already prevents creating a device link with the consumer as a
> supplier of a parent.
>
> So, we no longer need to find the "compatible" node of the supplier or
> do any other checks in of_link_to_phandle(). We simply need to make sure
> that the supplier is available in DT.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Thanks for your patch!

This patch introduces a regression when dynamically loading DT overlays.
Unfortunately this happens when using the out-of-tree OF configfs,
which is not supported upstream.  Still, there may be (obscure)
in-tree users.

When loading a DT overlay[1] to enable an SPI controller, and
instantiate a connected SPI EEPROM:

    $ overlay add 25lc040
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /keys/status
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/pinctrl-0
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/pinctrl-names
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/cs-gpios
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/status
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /__symbols__/msiof0_pins

The SPI controller and the SPI EEPROM are no longer instantiated.

    # cat /sys/kernel/debug/devices_deferred
    e6e90000.spi    platform: wait for supplier msiof0

Let's remove the overlay again:

    $ overlay rm 25lc040
    input: keys as /devices/platform/keys/input/input1

And retry:

    $ overlay add 25lc040
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /keys/status
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/pinctrl-0
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/pinctrl-names
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/cs-gpios
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/status
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /__symbols__/msiof0_pins
    spi_sh_msiof e6e90000.spi: DMA available
    spi_sh_msiof e6e90000.spi: registered master spi0
    spi spi0.0: setup mode 0, 8 bits/w, 100000 Hz max --> 0
    at25 spi0.0: 512 Byte at25 eeprom, pagesize 16
    spi_sh_msiof e6e90000.spi: registered child spi0.0

Now it succeeds, and the SPI EEPROM is available, and works.

Without this patch, or with this patch reverted after applying the
full series:

    $ overlay add 25lc040
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /keys/status
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/pinctrl-0
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/pinctrl-names
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/cs-gpios
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /soc/spi@e6e90000/status
    OF: overlay: WARNING: memory leak will occur if overlay removed,
property: /__symbols__/msiof0_pins
    OF: Not linking spi@e6e90000 to interrupt-controller@f1010000 - No
struct device
    spi_sh_msiof e6e90000.spi: DMA available
    spi_sh_msiof e6e90000.spi: registered master spi0
    spi spi0.0: setup mode 0, 8 bits/w, 100000 Hz max --> 0
    at25 spi0.0: 444 bps (2 bytes in 9 ticks)
    at25 spi0.0: 512 Byte at25 eeprom, pagesize 16
    spi_sh_msiof e6e90000.spi: registered child spi0.0

The SPI EEPROM is available on the first try after boot.

All output is with #define DEBUG in drivers/of/property.c, and with
CONFIG_SPI_DEBUG=y.

Note that your patch has no impact on drivers/of/unittest.c, as that
checks only internal DT structures, not actual device instantiation.

Thanks! ;-)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/diff/arch/arm64/boot/dts/renesas/r8a77990-ebisu-cn41-msiof0-25lc040.dtso?h=topic/renesas-overlays&id=86d0cf6fa7f191145380485c22f684873c5cce26

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
