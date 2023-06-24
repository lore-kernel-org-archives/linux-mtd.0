Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD9CEB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCe4+ZsJqiqOaGuGhexsB87iRw7sWxqAy75bl8ywdpg=; b=qeL3CUWMdk4MnE
	pXPUs4pqv9Zn3vPBDzhtiX1k91bmuLv2VzmX9AAtbf6WngwQ2MSNm5XKcoalUROTp5Kle+ID780Tb
	kQPcnqFwooFRryllGwOaPgDujSPV4GZfK19ETZWlx4hTQUbYgqAk/MbiN9FeyzAGkJeS/EYGPOtWZ
	9HfinenHJOSh8NxLLoQkOIhhw8f/zE3Td+J6lr/gqmI0zgOtV6B0Mfn0O7hIew+vQDvjnSHgBLseg
	OCAqkm/AY3B/y3j/6eQNGQFM6RHA/4ssqhXmI17Du3la8iuZFagYXzks6YkrfA6uFV5N4ouNLWkiw
	g9k1X3jvzA7ZXIMcf0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyNe-005WHU-0G;
	Sat, 24 Jun 2023 08:12:26 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyNa-005WGW-2V
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:12:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51bde6a8c20so1533033a12.0
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687594340; x=1690186340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgWfgLnDBYXfvDGmBGK93+dUC4prG/sfhkKHOWCy+iE=;
        b=CeQubJTn6j0jNT3zVHbnyi/OlWK07oYYKYmYnO1fTb/41xdGpGoli63rMBuXpnVT7D
         sSUaLlRG5aKjfoF6TsftMToW+24gQOaua1zmo6JuKxH56yBf6CT++Mt3XWS+cCyDMOud
         HyMc76+D+M+zSHd+bysviM2ccvFOtfoSGoj82TilaVgri+zJO6rTgcFVDQT2xoj4l/XE
         hjePT23/EWDlmXSzOEyLdmNTzztKxDkobYQJvui96bpxS9brExJVaJEn74hiLWtjXnuW
         852DnGj+CAuNaFerhbOIAMcqSCugUa81HVuhjp1/ozYt8W1KGDcuTShZx9O21hH69Xpw
         nYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687594340; x=1690186340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgWfgLnDBYXfvDGmBGK93+dUC4prG/sfhkKHOWCy+iE=;
        b=SnHt0r6odAJSvQNaGeS2nWRNi2Y4Ef+M5a/px7viQPypNz9vKuMcSmn5SNufUrO3Xa
         T4h9uIHRR4MS+mYeqP0tk45juI7Fg5k46e62/oFtLLzOCAYgDnsJp1y7lxqmMyrURORK
         xLYwS5G1YLZ72kGjyRSMmn0usigIJF6sV3jh7/8dS0FnDJampfcaylaUIw/iyYNlW+BS
         POfO4PdjKk8OxdvIpB7B2nWOycoSop/WAcJQXkJcZStvjkxFHe2w/BdpwwGY0gECyeS4
         9Rm/pcci2F1MxsGuQyLqIwgLQTyiJLxS70Ec7hyWgytL/BFhY+lylIiQO/FnSZIuvZBq
         4txw==
X-Gm-Message-State: AC+VfDygCPdZBFAb2S4EWAUEaisSTbV+7OehJRAF1qnmsOKzfl7zF/zE
	rd1+Tn4KIoHP3LAr8+b38t0GMw==
X-Google-Smtp-Source: ACHHUZ5Rew0XhfwsYlFMUaLNmLSeNdfJi5OvwMCRiF/HMRv0s1S3Hjzr6jtGZts9Zub1Ru8qB3Xfiw==
X-Received: by 2002:a05:6402:1389:b0:51a:441f:75d7 with SMTP id b9-20020a056402138900b0051a441f75d7mr14078910edv.6.1687594340214;
        Sat, 24 Jun 2023 01:12:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q18-20020a056402033200b0051be83f75e6sm408661edw.95.2023.06.24.01.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:12:19 -0700 (PDT)
Message-ID: <796a0cf2-2411-26e4-5b53-53d560936b7a@linaro.org>
Date: Sat, 24 Jun 2023 10:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 45/45] ARM: dts: at91: sam9x75_curiosity: add device
 tree for sam9x75 curiosity board
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, sre@kernel.org,
 jerry.ray@microchip.com, horatiu.vultur@microchip.com,
 durai.manickamkr@microchip.com, andrew@lunn.ch, alain.volmat@foss.st.com,
 neil.armstrong@linaro.org, mihai.sain@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-46-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-46-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_011222_812740_55E49596 
X-CRM114-Status: GOOD (  16.45  )
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

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add device tree file for sam9x75 curiosity board.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  arch/arm/boot/dts/Makefile                   |   2 +
>  arch/arm/boot/dts/at91-sam9x75_curiosity.dts | 336 +++++++++++++++++++
>  2 files changed, 338 insertions(+)
>  create mode 100644 arch/arm/boot/dts/at91-sam9x75_curiosity.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 59829fc90315..31f357f8e947 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -53,6 +53,8 @@ dtb-$(CONFIG_SOC_AT91SAM9) += \
>  dtb-$(CONFIG_SOC_SAM9X60) += \
>  	at91-sam9x60_curiosity.dtb \
>  	at91-sam9x60ek.dtb
> +dtb-$(CONFIG_SOC_SAM9X7) += \
> +	at91-sam9x75_curiosity.dtb
>  dtb-$(CONFIG_SOC_SAM_V7) += \
>  	at91-kizbox2-2.dtb \
>  	at91-kizbox3-hs.dtb \
> diff --git a/arch/arm/boot/dts/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/at91-sam9x75_curiosity.dts
> new file mode 100644
> index 000000000000..56d3af549201
> --- /dev/null
> +++ b/arch/arm/boot/dts/at91-sam9x75_curiosity.dts
> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * at91-sam9x75_curiosity.dts - Device Tree file for Microchip SAM9X75 Curiosity board
> + *
> + * Copyright (C) 2023 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Varshini Rajendran <varshini.rajendran@microchip.com>
> + */
> +/dts-v1/;
> +#include "sam9x7.dtsi"
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Microchip SAM9X75 Curiosity";
> +	compatible = "microchip,sam9x75-curiosity", "microchip,sam9x7", "atmel,at91sam9";
> +
> +	aliases {
> +		i2c0 = &i2c6;
> +		i2c1 = &i2c7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		clock-slowxtal {
> +			clock-frequency = <32768>;
> +		};
> +
> +		clock-mainxtal {
> +			clock-frequency = <24000000>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_key_gpio_default>;
> +		status = "okay";

Why? Did you disable it?

> +
> +		button-user {
> +			label = "USER";
> +			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_PROG1>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_led_gpio_default>;
> +		status = "okay";

Why? Did you disable it?

> +
> +		led-0 {
> +			label = "red";
> +			gpios = <&pioC 19 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			label = "green";
> +			gpios = <&pioC 21 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-2 {
> +			label = "blue";
> +			gpios = <&pioC 20 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	memory@20000000 {
> +		device_type = "memory";
> +		reg = <0x20000000 0x10000000>;
> +	};
> +};
> +
> +&dbgu {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_dbgu>;
> +	status = "okay";
> +};
> +
> +&dma0 {
> +	status = "okay";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&flx6 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> +	status = "okay";
> +
> +	i2c6: i2c@600 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_flx6_default>;
> +		i2c-analog-filter;
> +		i2c-digital-filter;
> +		i2c-digital-filter-width-ns = <35>;
> +		status = "okay";

Did you disable it? If so this should be overridden by label...


> +
> +		mcp16502@5b {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "microchip,mcp16502";
> +			reg = <0x5b>;
> +			status = "okay";

Srsly, drop.

> +
> +			regulators {
> +				vdd_3v3: VDD_IO {
> +					regulator-name = "VDD_IO";
> +					regulator-min-microvolt = <3000000>;
> +					regulator-max-microvolt = <3600000>;

...

> +&flx7 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> +	status = "okay";
> +
> +	i2c7: i2c@600 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_flx7_default>;
> +		i2c-analog-filter;
> +		i2c-digital-filter;
> +		i2c-digital-filter-width-ns = <35>;
> +		status = "okay";

Empty bus. Keep disabled. Anyway overrides should be done via label, not
by duplicating children.

> +	};
> +};
> +
> +&ohci0 {
> +	num-ports = <3>;
> +	atmel,vbus-gpio = <0
> +			   &pioC 27 GPIO_ACTIVE_HIGH
> +			   &pioB 18 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usb_default>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +
> +	dbgu {
> +		pinctrl_dbgu: dbgu-0 {
> +			atmel,pins = <AT91_PIOA 26 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
> +				      AT91_PIOA 27 AT91_PERIPH_A AT91_PINCTRL_NONE>;
> +		};
> +	};
> +
> +	flexcom {
> +		pinctrl_flx6_default: flx6_twi {

No underscors in node names.

This applies everywhere.



Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
