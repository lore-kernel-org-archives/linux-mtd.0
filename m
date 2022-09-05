Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58566ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3fedLuZC7rTceL1LncrThOXWeoL9P46T49az9ahJ6k=; b=vkisnfmnhrGVha
	WJ457Yc8W14cAKvbxWUx3c2RH/dablE9A1G03uQBVHjrEWIajDj1upWgLd8jzWgDJ8PT5FdcRK3Ox
	4GjuelFVj9OoGvTUfVo+YTGPM/plGhZ+HWLgq9hQlKTssbfX71UVAtHBqAZSDRIC8eKMLquPSh2Al
	W5+7OxITh6wwgtBDRgTGXBdk0zlcNhUj9I5AXJAgpoBw6uh8sXuZE+61FIta7vQBvJl42I7+xMgvm
	Gn8ld6JHxSB2M2pX7iLIb4WUP1Is+HilhHFCJj+WiVJjioh5oVZkTjB5p4ZsCdQLM3WLbyjUmSYoN
	K/48m9aqB9vLFn5AXgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVEwv-006qR6-Pz; Mon, 05 Sep 2022 16:27:50 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVC4k-0037uu-Kf; Mon, 05 Sep 2022 13:23:52 +0000
Received: by mail-qk1-x735.google.com with SMTP id h27so6271659qkk.9;
        Mon, 05 Sep 2022 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xqnaWRmSxWCHIXi5Qlq2gni2AdAVZeps2ahh12VkulY=;
        b=nOletpYDW/GRPvkaWSlAC0rzt34URfVHbiUKwVMsxFl09VUwy8XOqhWqRsptamq/Dg
         II+253/l3T6DgJP066py1bWTdICT2vRCXvzy2Ur+pO4VC493+7Sqn84yvDmlJFGAVdYl
         5PZSVDMi1QDxBMQa2pV/FSXYTAwvX/lFVcFPmgHoO3U8MnbkwA9h7jonAO1nFwBsGmoW
         q5f2ZglIOVt/xEgJLA6EBKdc3gOuFnoMDDVILIKTeoTg7qTOPypEYwVwaO1cq1N6YfbI
         me+dt6lOnpM5B3FzI09ooPbgjOvgXIow30OcLwUv/NaL/eE7AkZh0zMQ2HIMHBfa4q7S
         WwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xqnaWRmSxWCHIXi5Qlq2gni2AdAVZeps2ahh12VkulY=;
        b=qu1H0y+/gZNC03MgWYujUrRqnCZrFB+jKKHstbC6nSZ3MaT3zJB0V+fGKBALN1L6Fr
         vk3GO+XReShjkOkrjuQTJSFO84J3/d2akow3ZS9haWZ5YDP+rMUmTNqtT+RBRiWNrf0d
         11jjYTRqVuuU/bhTxFSBqcBwLO+Uus0ck9rPk5fGyzIP5CblUysRnRB/sr0j1uZqOkqA
         j/hXiYILpfdoEuvlQlUfGzms1VnXhCmKwqgWA13vXeV6h2k7w3SZyHNZGsux74A4738X
         jQ6tP2rX7nmlmBxMwjkphrlYNKSLLyZVOQE9zBWpm7+HXdOyaOy/+4dLHy3SlaXDtdnQ
         1b9g==
X-Gm-Message-State: ACgBeo27Q/FK8KDzVPTZHdY0z/Mhr8T18Pvwlp05JZLl/dRebZjX5HfX
	Osuj8/qy7WEQ9uRJ+QnHtZ6D0x4ekYGmQ1PyXjo=
X-Google-Smtp-Source: AA6agR5sttgUX/02ygd4oRH8E7CwuO10nDnWttnl6PSpdnCic7gOwb1KDafibQkxIBgdBbgVXC2AwvPX08spe4Hyycw=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr33223900qkp.504.1662384221554; Mon, 05
 Sep 2022 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
 <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com> <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
In-Reply-To: <0fa0c09f-c801-a0c7-1f6e-b6cc8b45d961@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 16:23:05 +0300
Message-ID: <CAHp75Vek1WOyEdkfCgrcH2FL6GA5gTtxXaV5Qy9aJMCQ3qGxyg@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using devm_fwnode_gpiod_get()
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, 
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_062348_104621_D44FC6D2 
X-CRM114-Status: GOOD (  19.71  )
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

On Mon, Sep 5, 2022 at 4:19 PM Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> On 9/5/22 13:40, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> >> +       vout_mode = device_property_read_bool(pdev->dev.parent,
> >> +                                             "rohm,vout1-en-low");
> >
> > They all using parent device and you may make code neater by adding
> >
> >    struct device *parent = pdev->dev.parent;
>
> This is a matter of personal preference. I prefer seeing
> pdev->dev.parent - as it is more obvious (to me) what the 'pdev' is than
> what 'parent' would be.
>
> I'd use the local variable only when it shortens at least one of the
> lines so that we avoid splitting it. After that being said - I'm not
> going to argue over this change either if one who is improving the
> driver wants to use the "helper" variable here.

And I believe the quoted one is exactly the case of what you are saying above.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
