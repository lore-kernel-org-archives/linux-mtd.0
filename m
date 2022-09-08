Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF8C38145
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9tI9HKfHR/Ri0AeaAR4un6C2DFbFjyxqzSw3SSjdUQ=; b=ZNyaorOe+qZggR
	OsLB2Q05FZZxmfFglxfYfss9u33ZY7xnDO1SAZDcl/X8eibEjP2u/9teyvkvl7Bawc4Zeh545Op1Q
	zb5dgyRPgiqrW7x0Y1BVxnfS9uouYQmuJwiOgLmkoaCDqCNWyGaVNVna9eD5QygR4UKbNqhyoMmuK
	l8Sw5L+WfRKaDoXDNPd82QGrPQfGGHuIkEpQNjuC35XF+KHC9t9WZAZGSJIygIrskHIdWsLqFZnPe
	hF6C5XuOKW8jtUvG2aiCMzX5RZQVh092998Q862A1WH8IrLsBDJZLXEhdCIvdJ6nb+mMU2eF8+ykT
	Qko4lj89dw0RrT0LBSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCcq-000xHf-8a; Thu, 08 Sep 2022 08:11:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCcV-000xAE-L8
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 08:10:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u9so36261743ejy.5
        for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2022 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=j4bs3PwCf8LAGt65QBrJwkN23+x5pcdlnIufUSNJIIQ=;
        b=XlFrs6f1Ru6mfmrDHSloR2yePiVJ+BuOhZJkeSnSJ/SOiEPgkH7fc5Qh53N1oKwQvH
         +OoAiOMDe47PpbvHsnBhm6aYdjqjrlxYnSo7yiZbqsAzABr7z6IbsSFiYRJdU8C2FmM8
         5DH3vl93eI862Lj3YGNPcem5IKwqOFLfYUBV/2qlp66cAcJz+GK/kSoE2Nn6RNzXIdZ9
         oJUIG5tDSXTW/MSaMC7qK7mdrhaTxlGrLwOPowZ4WpaBUKmm7LiCFjVvj0ZXOF9c8KIJ
         SNp39mJEoQxBFUzec2wJzhGoK5rRNZ4WQVIZ8FGwGa0dLMi1y1WJKYonoLdQWd7mN1KK
         y6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=j4bs3PwCf8LAGt65QBrJwkN23+x5pcdlnIufUSNJIIQ=;
        b=lD0jhsPWfGTtjgQiToZPC3cTCNo3I962VvJNKoNhQk1OZJBklbfZ6Y59R2VitetGc0
         nqBoF2Eg3Pmc1AmUlT5of1A4iQNcLF+yXIvjmIVu37BEC2HHydstcug9sckbo9sLnHbC
         oV0E5qCCBN+qk0Db/i4htAm80pgEYoLtKq1Pw3KH7GGOqvwUyx/1z7lsTpMwUftVaaiL
         1HXlEUghajEzgvENjFXD+4dWd0Vo1KaZ3L0vOA3YJeRsgD0mWCUtUyG1tL4Dd6zrR0GE
         pAIECInYxR1+izfzG25Dwgrsmq5elFgvzBWMDd4HrRMCNme3kLyFpOizdklBOwTRPelH
         McKQ==
X-Gm-Message-State: ACgBeo1mmQoXVmCm6MPFpxP9o+M/k9fNlj45W0jXaGe3bwLu4S5zon8/
	wqPbokrVlkQLjxcmRj+uRY6B/w3fCrEjT3RSJfSVcg==
X-Google-Smtp-Source: AA6agR5SiTp1RzXd7QfGvIaagW9XneozTUfgGg71dHg/7zkzwgHHmEoyMH3isqJfBMUwPz7K/i/VjO5b2+tszIQ2lUg=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr5269882ejc.208.1662624640469; Thu, 08
 Sep 2022 01:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 10:10:29 +0200
Message-ID: <CACRpkdakswdcFTgEGX-+2fgOHZ+VsDsRe+yj8hnExKuugnO9xQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] regulator: bd71815: switch to using devm_fwnode_gpiod_get()
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
X-CRM114-CacheID: sfid-20220908_011043_699733_D6BF4E79 
X-CRM114-Status: GOOD (  12.00  )
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
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
