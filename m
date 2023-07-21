Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9649FEB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MGVFLrVTL+Ug7D3HUcSI+LuU+YdrRGG4P0ruzpP/vc=; b=jW7PXRZiWikbbw
	PO6utjGc0E4cvRoNy5tzDSNdVV7s/ad6N5Oq28Qrwd+WoaKqmZhfZD7dZ7RPyzQsgMyaW6I28Pag4
	lkUwKiWfrO61181fFlHRCt3pX8FdezNE2mR2UMMRGIX1NhgyJn6Qq7mdzBDvkqORWldZqP7ZBuI3I
	/o9UVtBX76kal9sbJPRZ5O0otgLTAqn2gPLm7+r8Myna+94HMLdZtqvMnPWyDJRTMigY3OvV6VrI1
	JYinl0sH4sb/KHECshwRKLlsuZ/OsNG/5+eSBxSZz6mYKTRtoEbcFIvsZmp0o7RdVLjdZSHQKjDJK
	ZefguuuuBamYila4KBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqw7-00EGLY-1Z;
	Fri, 21 Jul 2023 14:16:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqw3-00EGJC-2u
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 14:16:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso12718215e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689949004; x=1690553804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dVWIG+zijfB5XhEq5zqARsQ/CZyE7I/cG3PK9Bqxgac=;
        b=c5IPu3l7Sljsuw8jE0dZSGTgwVaAaA15v8daFob2kFib1Kge23eCgMtTLUlSK2+3nr
         PhJjEf2k48l0PgLeujngSROlbV7nmbipQxuFV3YtQwrf4lT3QrD3ncnmj+kCl1Wg1jRB
         toc5x/2xxrOAk1NjWtBbN6z0hkbIKuAm8Hc4PhBm1jeeJEDSJauYMjQoEkd1oDNOIv9w
         ToV4lUwRuJ22MJRff09zYDpvlEzKnuk3wVkHH4Irz6Pl08wBA5xKMC/KCKm5yogWxDRc
         ya8nD4hZKqjhgz5KzQypLrv57FgjUxaRXCKYTbv24tKi31JvRYvzhhTTYlLWm8aF8rxG
         /4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689949004; x=1690553804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVWIG+zijfB5XhEq5zqARsQ/CZyE7I/cG3PK9Bqxgac=;
        b=iv8WLVEJpdNfy3EcTW12QgCF6oHuvO7hUOfNWn4pae59/84eqEjGY3cY92r8KnP2gj
         VV/LwFTcx8QLB2foTkjM8s3DDm1/JqO7/IM99le4GfYhpjwFL8Z0tUzT9NySG4UNwq8Z
         j7smwPLuStibW1BV5HSdFQIs/DxQZlYhehJ5FDsT8VoTKhvhc+A37yyttakSuAKP7x8I
         cN5l7yX3D0E7ogjp8qMVggvP59wWhWGuok5KK4jNviCq6wDAIsGSWAiu6GIUTQDz5GB4
         C21FvOZvB1Cwp20IAPbJ9eZDsf6118VM0hCesnI9gB32JtVJW0BelPIkHJ7MJXhFtWm6
         xDRg==
X-Gm-Message-State: ABy/qLb0Y6pt2DsToq8AepXHLGim+AuaqiCqRE1IR2S2C4nexcRAc1I3
	HSiSe57lzHzYmv88Be9o9uDEsg==
X-Google-Smtp-Source: APBJJlEn7W+o2Bc6tyoiQSmNE/IQp4AIiomxaKVG4rHFx1ctjSGpFRRBne+e459IpFKtG8dU4OnJ2w==
X-Received: by 2002:a1c:770a:0:b0:3f6:d90:3db with SMTP id t10-20020a1c770a000000b003f60d9003dbmr1919079wmi.3.1689949004610;
        Fri, 21 Jul 2023 07:16:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a21-20020a05600c225500b003fbb8c7c799sm6229313wmm.30.2023.07.21.07.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:16:43 -0700 (PDT)
Message-ID: <283c68a9-fdb5-8813-a68b-b2bdbaa51e26@linaro.org>
Date: Fri, 21 Jul 2023 16:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 41/42] ARM: dts: ep93xx: Add EDB9302 DT
Content-Language: en-US
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-41-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-41-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_071647_947181_9D691567 
X-CRM114-Status: GOOD (  22.42  )
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

On 20/07/2023 13:29, Nikita Shubin via B4 Relay wrote:
> From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> Add device tree for Cirrus EDB9302.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  arch/arm/boot/dts/cirrus/Makefile           |   1 +
>  arch/arm/boot/dts/cirrus/ep93xx-edb9302.dts | 178 ++++++++++++++++++++++++++++
>  2 files changed, 179 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/cirrus/Makefile b/arch/arm/boot/dts/cirrus/Makefile
> index 211a7e2f2115..e6015983e464 100644
> --- a/arch/arm/boot/dts/cirrus/Makefile
> +++ b/arch/arm/boot/dts/cirrus/Makefile
> @@ -4,5 +4,6 @@ dtb-$(CONFIG_ARCH_CLPS711X) += \
>  dtb-$(CONFIG_ARCH_CLPS711X) += \
>  	ep7211-edb7211.dtb
>  dtb-$(CONFIG_ARCH_EP93XX) += \
> +	ep93xx-edb9302.dtb \
>  	ep93xx-bk3.dtb \
>  	ep93xx-ts7250.dtb
> diff --git a/arch/arm/boot/dts/cirrus/ep93xx-edb9302.dts b/arch/arm/boot/dts/cirrus/ep93xx-edb9302.dts
> new file mode 100644
> index 000000000000..b048fd131aa5
> --- /dev/null
> +++ b/arch/arm/boot/dts/cirrus/ep93xx-edb9302.dts
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree file for Cirrus Logic EDB9302 board based on EP9302 SoC
> + */
> +/dts-v1/;
> +#include "ep93xx.dtsi"
> +#include <dt-bindings/dma/cirrus,ep93xx-dma.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "cirrus,edb9302", "cirrus,ep9301";
> +	model = "cirrus,edb9302";
> +
> +	chosen {
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		/* should be set from ATAGS */
> +		reg = <0x0000000 0x800000>,
> +		      <0x1000000 0x800000>,
> +		      <0x4000000 0x800000>,
> +		      <0x5000000 0x800000>;
> +	};
> +
> +	flash@60000000 {

Same problems - it's root, not soc bus.

> +		compatible = "cfi-flash";
> +		reg = <0x60000000 0x1000000>;
> +		bank-width = <2>;
> +	};
> +

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
