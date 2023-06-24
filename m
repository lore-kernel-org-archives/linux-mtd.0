Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F337EB64DC
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QO0DSvDDijyCwpE7brkXAGrJRx0+8folHs+o5uGub08=; b=DIkxOoRwAGHWuh
	XLl8hTx4eSs+dtV0rNeFLI28K7iR9PryrUsqa51nD5OiHROWB7wOocMKNccVW40iclu28cMZj6Pyi
	zY2ndDmWFOfEuQlKMvXXTF244dOrfRLrtCFDgM4d8s6mIO4/yH70PrKfD8765j2F4xNaUKrqGHbRG
	t0MdfCJnhqXsihwpX2t4oGU6fYXQ+mLA7sf/HOoe0BG4ZjMD31zPxIV+sdzLnH5yxGtvK2g/qFrRW
	O7xHh+ZXaVO47O6dc6ZjIxaj2cz9Oi7PnR6nuYHrSrIhYD6OljMm1/U0Nbg8h0q2eowfLTqepjrfq
	4DOyfhzewU3RtsLJjvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy5z-005St5-3C;
	Sat, 24 Jun 2023 07:54:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy5x-005Srr-0u
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 07:54:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-988a2715b8cso463731866b.0
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593246; x=1690185246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ItoFIh/55aB/e70WP466UAh+90Zeto+YBld1GOUDlc=;
        b=DjI6EnIt0I30aO4+HTDU2Bee7J4vBxnKRd9UupAVeWwpXVR+/r44DC0Asz08Bbuogp
         A3Aatz82DO8yHVMwWhn1gZCqEe6a2rWXkuiA6GfBUfoZTs2e6cwPHLJ+YuaeHPEUIAQJ
         DJhwVAmDzSax0DlG6oJFsEy6UVQ/dIS8cQ+3QCTL9/CI0CL0ZoRWS02I2uBuEAJJk09M
         Og5/SFPOzVmyQO9aVPrw3zuNNqm8+pzstsdw5EMvXLcY8o+3wfyYcS7e8fj+IvyDLk8l
         BV2H6dDfJXmnGhqVtns8T1Mm5OFcAqbapX7uBCu2Qe31+yaUBaZBymo/wMUBAVDBKbPz
         XF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593246; x=1690185246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ItoFIh/55aB/e70WP466UAh+90Zeto+YBld1GOUDlc=;
        b=Vnw9gWzgnvD52EEXSjg4A7e6do6bAltP37pMA2LMJGlGRF76+6Rl7mo7I+AEmXFcWd
         bG4/5QEiD7Y14QfUh8QFRzu8ukkNrvFpmAhKbaoKY2vA+QGzTyu7OhQNnguv5U4HRpu6
         2DBn46P33bcevbUf4BHDcQwm+rqGpQ4Z2uDIQuvtF4d/EeUrsgKqaF2XAXvmr9ynYEAg
         werYxwn8c69yj6OaCOTNP+73eO5k5ohpFB3ZGhvZpAkFBk2DolA5A6Upe9vVoq3KhcdP
         YM0+Mv4rW8PuSgBT2t4Juv0h6ufbtcdzPj2Pi1L3igKbz2b1ioudoBuFDmYQrU0hEGwJ
         ch4A==
X-Gm-Message-State: AC+VfDyKKUxbXpfT7IjDDGqgS0JpIVnkfTz3Hgedm+rHdvMFiY0DSA63
	KLe6acqwvIZZ59OCrlF/qzAZGQ==
X-Google-Smtp-Source: ACHHUZ49jFwiXxqnSCSn4kNoVnnSW/YdtiArnK3FxalPv2kaFMQNSvBgECWFO9OcGbSuOPMw0UOLPA==
X-Received: by 2002:a17:906:58d2:b0:988:77f0:b671 with SMTP id e18-20020a17090658d200b0098877f0b671mr14792178ejs.38.1687593246753;
        Sat, 24 Jun 2023 00:54:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u12-20020a170906068c00b0098856d1470csm592132ejb.75.2023.06.24.00.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:54:06 -0700 (PDT)
Message-ID: <4f1015bb-50d3-84c9-ca32-564a0fe204e1@linaro.org>
Date: Sat, 24 Jun 2023 09:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 03/45] dt-bindings: usb: generic-ehci: Document
 clock-names property
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
 <20230623203056.689705-4-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-4-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_005409_318528_9C77AAFF 
X-CRM114-Status: GOOD (  10.42  )
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
> Document the property clock-names in the schema.
> 
> It fixes the dtbs_check warning,
> 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 4 ++++

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
