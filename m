Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5068CECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 19:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3Cy+2vO34Za7mwzufZEsts7cB06ekDGfPpeVjjT3ug=; b=ypmnWaRfnpCEzu
	e1KLXIcm4EdzGitu91BcsPzyF0TRsXwm2jV7MIiZkCqP2EX3TQiS7wlbdFvBEMIT1jD9tm3GWvGps
	yv5D2d0oN2bc+cxetP74wuHhV51hsrnhFKtUlqRGxBgSydvQfE94RIFgYwZQV1Pa9dBjoKYo0xTA+
	AHyuwTVImIrQgCYhaavCmZzC2NGx6sKdS03cwD8ZN5iE2/FxxfVXlPABrdoQlQOjuVayj4VJiz0ov
	fHeZbO7d6uVEu/FXg4XVfujlM4Ot0u2hYXwDB3phnXkIiftx8ZyfIGfpP1UoBSmVEVoWV98kJ7e7B
	pLhcELjuVvOmACelmHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHmW-009Jqw-9W; Mon, 05 Sep 2022 19:29:16 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9nP-000kHC-PN; Mon, 05 Sep 2022 10:57:41 +0000
Received: by mail-qt1-x830.google.com with SMTP id h22so5888175qtu.2;
        Mon, 05 Sep 2022 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SceFooGsQvk4/DBXpk/M7nv2E1Tqfm+MkuaSRZ3qev8=;
        b=QgN1fKt4DP2kb7sAiv+5KFok8U8dxv0x5611ZTop3HKEETihbtz9RufJ5RUJvT6oy3
         NsDYXvFgWk/79gT0t031cWuTJ9+0anNKT0/QMVUymrmw27VD2+Q9Fvf/a4F1TUNnaeSG
         rqxNiZxP2226FfdS2mZJiVeLEcQ2F7NOQTCivGpJw3EJafbSCKZtnmajkVfO//JmwESc
         OQ+A5m2uZ9uWB9V0ddapJ9/fH/JlBtRhD0Pv/BF1sgrOUoMmJeKFvXNsijHb3izSghCC
         dWQbrWPcWtAWtUFpsLJaj3WsvtsNYlDXfe5EMqd/eXC/8JZqf2A/mHdQZ+FdhXMyXOQX
         cbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SceFooGsQvk4/DBXpk/M7nv2E1Tqfm+MkuaSRZ3qev8=;
        b=OEvXSHKHZ5m2a6jg1rBq17MeUcQxXbtJOTHPqH0Smk83bdlJuzQatLEMMTD5mWm17G
         T3CzTRI85GCjRg5ochnBOV1tytvT2lHV0UBUutOMrcdNVtP7WHefC/b0bGqMFVHOgCqG
         TzVeJS5AG/iFTZ4Xrg+p+3rYYMpWFql7RA94zz9/2jU0vbB0BaR9WWsAISqFxnFwz1NC
         NGnZWyTA0VibBHwH0Es/ff4/SFI6H8eWukCKHMn/CTziP/Ix3dBcenahneCA+6vkxyD0
         zM3CJziYsLOCr2OMXo3x6Ic/EinQL+ENfZZ3Rh775WupQKHii6sHsiwg4nIXNViQs8lF
         DIRQ==
X-Gm-Message-State: ACgBeo12hDDjc9pSgUbNsuKELk0TQsZGieMWybIBf/cY1uV4KS9ekxKj
	WUVYfNQ4G4122B8V6FPOmlu62f77IMa8Cr7GiA0=
X-Google-Smtp-Source: AA6agR60W0s2Xg2TAEJ7W+zD52eGjGAMZEZ33WklScUG5wc6dHREuBxFFHnQsCibmN0jWps5VKuSjG68kRfEhV6Vu4I=
X-Received: by 2002:a05:622a:40a:b0:343:77ba:727f with SMTP id
 n10-20020a05622a040a00b0034377ba727fmr39279991qtx.481.1662375457185; Mon, 05
 Sep 2022 03:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:57:01 +0300
Message-ID: <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220905_035739_914189_3390EF9D 
X-CRM114-Status: GOOD (  12.84  )
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

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to limit (or maybe even remove) use of
> [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> a bit, so let's switch to the generic device property API.

> It may even
> help with handling secondary fwnodes when gpiolib is taught to handle
> gpios described by swnodes.

I would remove this sentence from all commit messages since it's a
debatable thing and might even not happen, so the above is a pure
speculation.


-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
