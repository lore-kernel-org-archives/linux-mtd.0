Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0BDC38145
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZY2zDRnHhq8r3X/9RxcT9DVE8B2DPPe5ssyPkpPffk=; b=OckHR4xsmq7U8c
	hWrfB1lQ5OiLZX+GyYNavY42vELfCH+goCOQeC460nq3+ZK7n916MFJxsHK3zihwX9put57YfZCWm
	fBEyFpTcFLs5Pfl0NUGAhlHlPfSQ8abkintrSpEELSUucXfMc2QkM6S+fYyAVdsD90J2xBfgJgXlH
	CcuRJGgM2Pa22b4GMxtQETZoVG6Q31/ITZu1nl4hKcWdyc+zMQZgPWLt6jDzJ9PWnl/nGxmTdfH2K
	513UjNGZmh13DI23JkpKJxjUpkLg+Wy2GfagKKQ4R3x0fIYuQVXzT1uuw2Gu4mdf1IfOJK6bcXe9o
	NtjFaXz5PWRB2Z/dp48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCxv-0013E6-Gu; Thu, 08 Sep 2022 08:32:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCxk-0013By-Sf
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 08:32:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id bj12so36256546ejb.13
        for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2022 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jfNxp3kBTvkWQp+z++yGCicLFIdP3WSDrE1bvSJvPmY=;
        b=N7OrHuhPmgpLtKe7tnHDZ7RwDs9JtGDJ1pEZAugqax5yV6+dKsP1g39dwektERtKK9
         CqiUuFQqXSSuUbo+lbqds7kHNQyuAL/Veez+V9HFOwJssWjKLEA54Jx+xvOnWdZg1gU6
         JOxfP/9/NxYiQrnLd3UxjZHv8TMQ+wgHt7KdSXV0V6cbJmW4D2Gwb7ov2pd9SlH66fj6
         WijmIrNii/pRVcLStzTngeZFuroX0sCBHB94+ZwmirZBSIfw1kFdXAtYlaSw1bazNWqB
         9cSY6xpglQGMGo0jkZGZJzkv20FP4T7zRyAO/IH7JbUYsvCN+q3yaVGE1LQNbtGUJdZX
         OmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jfNxp3kBTvkWQp+z++yGCicLFIdP3WSDrE1bvSJvPmY=;
        b=EMpA9e8z7bXa0r+dX5ek1iOeXwxgYMIkX924NsVqIu9mVrKsFOvxaY5d+FFKwvGXXg
         PAaTG4T1OGD1VZGj9/vDvT2K4Y/GT/QqNmUeUv0bgbeYJTTXJ111LeoxGg904MME2F+1
         +z/KaP03kNaevWl5XWst5uvTGqNIbMxTtQwoW1W6xHmc/I09HJcxQPiR00eoqDrhP8Rg
         muzRsiyd6cRQODFu3qarFsmce0p4V4WwegFmWCGCgBY4iK+UPQsPJp6ar93SG+/8OGJt
         SQQChWot7yOVq70p32gtAvKEIu+swT7aW6yKK86r5zz32kFRLv1+zdyL7il4DIhhmpm0
         GFGA==
X-Gm-Message-State: ACgBeo21in8XRvN7fBDgK+ztXFlozYkz/kyV2x2Xe6O8R7bLSlpZmd37
	KhCcd/+EuyUhNS/YkwpHb6iMqOSKi18aufxSOsP4VA==
X-Google-Smtp-Source: AA6agR5Pikao0PJyi3RWxDK9ckpLNq+5mIIPSLz2103lmxoJTGOdaR+FFIYnzUMOtVhVwUgnD2qSZsn8UUkJGH1BEqg=
X-Received: by 2002:a17:907:1690:b0:770:80d4:ec4c with SMTP id
 hc16-20020a170907169000b0077080d4ec4cmr4628049ejc.690.1662625957353; Thu, 08
 Sep 2022 01:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:32:26 +0200
Message-ID: <CACRpkdY_TrA7DB1AkQhNALbAdMdw+T2PkA4+s9ORUNAA--DZEg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using devm_gpiod_get_optional()
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
X-CRM114-CacheID: sfid-20220908_013240_962053_198404F0 
X-CRM114-Status: GOOD (  15.59  )
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

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> device property API.
>
> I believe that the only reason the driver, instead of the standard
> devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> because it wanted to set up a pretty consumer name for the GPIO,
> and we now have a special API for that.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
