Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F66C54EE9
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08O5OKlSEgdTf/zWCj5aOskLEHnnOl2asp/YHwaZbTk=; b=rFWu0zGoKsJMJ8
	c43zmhwajd9MMKtTSYk36HFaYIpAw2UuYgfLBJIqhmE7zjNOmtcXt8e7xCQ4Tkf5zMQAZp38SN1yB
	uVU5uVgzTbFLzVk/rvsObdnn7LXOXrS1YXZOLMR1MZ34GPUwEJMBOYdKfF8Pzh1UmJaxhEAnAEawZ
	nv0EwkrrWDDJqB7ZH4BZcGW/04c6yvG8qdKJuBKngbtAvPR4Gdk/QjB2M9b31S/BYQCtjDmppTUl0
	rP7WG7/n2To8RY/Tfim9qXW2uYZcvAMU9udfBHDM3Q5p2kowhK2ryAfGu8Gw/SLfFElXptStMxiH/
	+ZPcZCTcH38rylL4tLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCyy-0013Tg-Qp; Thu, 08 Sep 2022 08:33:56 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCyl-0013Nl-3F
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 08:33:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id gh9so14445249ejc.8
        for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2022 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZlO9z6iariE6j62dDg3WdSSqBdCZFPhJNQtrGMOHOrM=;
        b=yoKt2dR8DpMlh2XORFcltXAYMgjes8PsrrPXKGawrKEhed4y+WSSTQmmNgG0Gf1SJu
         /FfQ3PEPixSLl61o/wNzP2mAl16GeJnsTLbhWLnWfaVkAwo6y83SYrJYUs2zfFeTOmCJ
         KCfvXIX2k6sUR9M4H2LnnadTsaJNBeTiS5ZBjIN9tOf2Kpq6GTWefCkCUFHSnLO/4AAN
         bF2Kwwu1NBRMUHGOV8o4kZ9m3PqjItvKGaAHum8EmxiW7WxhfY/+qFWuKiEN2m/2UZCf
         n8HtcVv1JxiPWMi7HHbrHpse1K4PW6ghIMCVLd1VC32slTHEjJxXugMgMhGNvWgPOPtq
         zkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZlO9z6iariE6j62dDg3WdSSqBdCZFPhJNQtrGMOHOrM=;
        b=SvW4GSY+viHQMRP7jW4WuNCCivW6g8HPmrn0R6e2TYC494R6kbEsqnmG0c+X5DPw3s
         vWcj3TN/wDpGgVxjT4uMlI83AB2CMPBE2wVbB0lIYQw5WZkcRcvPiRJB+P72KYoRUsIm
         G/DJhBOsgMKJDWby22wgJcWQzUsS6Tpoo4cgGMfJ8PLJVirBpImAH/TfMnVZYaWQsjlv
         Pmr6rO80EnwPmykiBZuTkMwVPlmtPQLFGWifIzk2qmC2cmDTlz2ppV3E1qwSIhkO8Is5
         3rqywPbRxjTLj/b2jignUE9YbsF1tVoyI3MSjSzCQkKv3VT+ITuOG9fTzNmkOd+8CwqX
         NMsg==
X-Gm-Message-State: ACgBeo3K8rRCLlBdkRZXkjG+JIgfLoEzpc/yqB9iKVSEL78wAql8I7Vg
	qVhKv5HyetyLe5tQdqUnYUt+/dFKcOH1cP8rAOMk6Q==
X-Google-Smtp-Source: AA6agR6YdmowLCqDy13X6GVFnJajdgoAbYXT6/9jX+Ol46w4Ykshwr2tFJzDmJvExLu3Rbp1DyOQwdZVX8mDYcaxnJ0=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr5235773ejc.203.1662626019497; Thu, 08
 Sep 2022 01:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com> <YxaSBRkAG/hKjFol@google.com>
In-Reply-To: <YxaSBRkAG/hKjFol@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:33:28 +0200
Message-ID: <CACRpkdb2dYvNkyx7O24uURjSYcCPkGR+Gj=weCSG6GdcM1B7Xw@mail.gmail.com>
Subject: Re: [PATCH v1 07/11] PCI: apple: switch to using fwnode_gpiod_get_index()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Felipe Balbi <balbi@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_013343_144921_96A2EB3D 
X-CRM114-Status: GOOD (  22.06  )
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

On Tue, Sep 6, 2022 at 2:19 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> On Sun, Sep 04, 2022 at 11:30:59PM -0700, Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > fwnode property API.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > index a2c3c207a04b..d83817d3ff86 100644
> > --- a/drivers/pci/controller/pcie-apple.c
> > +++ b/drivers/pci/controller/pcie-apple.c
> > @@ -516,8 +516,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
> >       u32 stat, idx;
> >       int ret, i;
> >
> > -     reset = gpiod_get_from_of_node(np, "reset-gpios", 0,
> > -                                    GPIOD_OUT_LOW, "PERST#");
> > +     reset = fwnode_gpiod_get_index(of_fwnode_handle(np),
> > +                                    "reset", 0, GPIOD_OUT_LOW, "PERST#");
>
> Hmm, I am looking at the driver and it leaks the reset gpio on
> unbind/unload. I guess it does not matter in practice, but still nice
> not to leak. Thankfully it is easy to cure by switching to devm option:
> devm_fwnode_gpiod_get().
>
> I'll send and updated patch with a new justification.

With that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
