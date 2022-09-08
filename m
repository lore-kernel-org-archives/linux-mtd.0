Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAAEC54EE9
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6oroDxSKE/g/HSxeAF5NqY0VWpVHbBpi22U8c+qY/c=; b=RGFeantg7pz4dV
	ENRRFvHx80OzLUeHw+qY0jQnefaRNSOw/fR4Gxb/Mc5tSk2SdfHblwnV+MLp8jRje779IpXif6mTe
	msXmEktDITfl8YzRMg7Sooe+SWyKqhzsSRIaoW0bz8g3e+stxCqC5gd+S5NWUkXTbCU4zEGUyLONx
	GaDhhgEm4O5g1j7zEE9OVrfNnYezxor30Y4gTirXjdjNH+8TlH3kKyUz54ZECw1BAtzQL/nQPG+Ae
	ynbZf9sHOsD7oPY12hs8ayB8y2KcRXKvcm7oY30hP7Wg8KO7/KZdFn/pgcOtP49oVZJYu06invGsC
	mJpICnX3MKwzC6N9/fiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWD3h-0015Sn-Ox; Thu, 08 Sep 2022 08:38:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWD3c-0015PU-9V
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 08:38:47 +0000
Received: by mail-ej1-x633.google.com with SMTP id dv25so7091886ejb.12
        for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2022 01:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SqPML+unsouuIp4FVHK4Uf7DFvDcdAzoCu01LQ5xtJU=;
        b=SAoPOQWnZqu89mgLfBmiK5MrA8YCX5o9aGmYu4qqPNVoBkVnERkpNhCjHVCDQ9Zla1
         dwqjtxWA+cJ6EDML6KOuvVZ4R6NIPdCxT8QAEB80mIcXpDf2Zf9m7S4FsFoMJ51USitH
         Qd1pfZ4aI8HWIB9O1qt8jwZQ6YhUw0CUeBplhf899+yVwxpGxiGqmmXQn83Kl/G4s1eI
         C+ZSChYFtQHAmgSz+vgZPMqj3wcCWnPZrWj/U9r/3gRuxpP0SGbraorsJPs29Q973tKF
         kAzOfKhkV3IcUs1n2dwba5aeil8pWoUhDW7HjrjRLDXn9ByPmVyCvnNoBZTuKajNSFhw
         VwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SqPML+unsouuIp4FVHK4Uf7DFvDcdAzoCu01LQ5xtJU=;
        b=crbp2aSVa9VOuBw1i9IFwc4bPRdKM6qY5aH7qYVzGO4goELwhQQqLhAZ3bqqTNJleT
         C7xLOM0igo1QPkV3i3NgUxA0Sw8JHn6CuK0mHObrI/SrEC8kMBSjx+nV5SiKSHxd0urb
         IQ+Y/3VTiNEZsfcxfcD1/2tftFbShLUjHaHCp76+m6fHBOMlEYIc06seD4lWZ+jYCruT
         IOfwDb+3bVtGoneJ71StawDTt2Yf0EV2aRA30va7zzNKd/9zzp/qkAsgnr7SJ3DrMhGW
         qVAjpFbQh+tkE4DRjBjqGfLN3xEprnzhzjDYL8IDzMV0fSZNYIoKkJWL/OhPABK4yv6x
         TV2w==
X-Gm-Message-State: ACgBeo3gpyR/Z62wAFjiMDArO6oAKxelL+m9VrjfcCsPElafhD9u1BMC
	ZMpHDh3DeyGlmV8lzvtWOZTHwTuKNU2mjbY3uEVx1w==
X-Google-Smtp-Source: AA6agR5Qlu6bHigQRlsF7FnyAifGVWu07Yimovaj6W3A7lzSYgEVwFSZi08eyLAuAWp+B7C3eLgpufDg+xQ7EBPkK+Y=
X-Received: by 2002:a17:907:a420:b0:765:70a4:c101 with SMTP id
 sg32-20020a170907a42000b0076570a4c101mr5281501ejc.526.1662626322796; Thu, 08
 Sep 2022 01:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:38:31 +0200
Message-ID: <CACRpkdaeQFP+H786D=SG4s+sQmxScUzve-uWkm-Sg7xFDK_Syw@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
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
X-CRM114-CacheID: sfid-20220908_013844_378022_B631F46B 
X-CRM114-Status: GOOD (  13.49  )
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
> fwnode property API.
>
> While at it switch the rest of the calls to read properties in
> bd9576_wdt_probe() to the generic device property API as well.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
