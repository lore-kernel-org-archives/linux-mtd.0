Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3BDEB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJV8hbiq0jzfGE1EB0AuXgs9ZksraOTDviBnVqUOm4g=; b=stDqXPtGhNiRXg
	znV3dnqNLbZno1dVqoJdKPrAhnXbROZqqEWxtd+9i6m65S1WVssKg1d354uSf95Vds7hlZZgor9Jr
	cy7CjZH4uC5V2dpbBGJ8pHE+Y3CGNvljkrdCEx0lTYVXkuJi6CktI1f4kPyJqddBnnL8wNFxYJDKU
	Y/jCnIn0xKydex2T6S63cRuZiQ6fpr4g3X57SFiAUgcmc8rEg38xZdwKtdQDX9BPC43chNl+97PQZ
	vyXk9oWggaxBVq0VoijyX271BAGZDvlYU4YZUNFQvK4cRsPYEaAE0oGDSo2MIRcFoqcipvFrKtSGx
	/KW+L/b2RHciDT6B4Z7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyFT-005VLG-0T;
	Sat, 24 Jun 2023 08:03:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyFR-005VJx-0K
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:03:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51cb40f13f6so819364a12.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593835; x=1690185835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jxU1m/bl74A0iGu9LghKPO8HvECi5G5jZ9eqVP2K3E=;
        b=SQ0F0qO5g/dUpqxHfRkqAYysEzXvOCArdnrhQsHQTlUpG7NayIMU6j1M2rIyjBDVya
         x5px8eudLBvKa84lRJJJox+1RP1u6RG7I1xJ9FenVAaTLFcvXxgX7X5ih71vApTZLSbv
         jPst2ohqwiY8Dhs65PTypQT3PU1VOdXW3gc/LGGAmf2aKmiwxKxPmvg/XQ3LmeShtkHn
         TVnw0tPg8J0iFuIZ2T8pexQvID1xGMf6y37Y2M+HtoGRe+TKcwVt3TXz2RyCw4u5aGsC
         ExNyGnCkujtDC5OUwFx3xqyNXKIGBCRZBf8fZD4pMy0kbJDPIdlgOlzISH7nDoHMFTw1
         MrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593835; x=1690185835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jxU1m/bl74A0iGu9LghKPO8HvECi5G5jZ9eqVP2K3E=;
        b=E/NE/CKN24tuJ97t7wmKSqqRHmuP1hNzaPQzb5afMSLdUvVY/DxhQtWgixrjAEfsNI
         LxvQlxSvOv5IaaFvZIcio+YAk4s7US148JFKrNxSQsusMEYv1myM7nfLdNIy12iZfmc0
         lky/3ZhfIctLky6gDTAILmnmg63f6vL9DtE0XzgO4LJy31A0pB/W9z6wKuF3kfhrERzr
         hJr8X1utKMCS48cixD8XHkZYLU8N57PjbiY1XqVl+0qWrv7oxrFGoax8NZh4ewxy6aIS
         Ryly2eDC4cqGm+MT2OamwVzwgY0Y3QnBO93FFqifPrOL1Spokgo6Voiev+QD6ESC3GmG
         9BLg==
X-Gm-Message-State: AC+VfDxNBhkCc2J58ADcT7T96ci8vANYDH8IBwpkRf6X71yNYLpy6LMC
	4nn3cdDQKlxOuZt4uymnL6Rtkw==
X-Google-Smtp-Source: ACHHUZ7SxDDSVPtNN64oZsP8HBukovPFIpinv/C1GfUthOVpQroM4LCwYJgVu5igdC2NaJUOIO0FXQ==
X-Received: by 2002:aa7:dbd9:0:b0:518:7ad9:64bb with SMTP id v25-20020aa7dbd9000000b005187ad964bbmr15293063edt.19.1687593835490;
        Sat, 24 Jun 2023 01:03:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c4-20020aa7d604000000b0051a4a1abdbbsm411437edr.49.2023.06.24.01.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:03:54 -0700 (PDT)
Message-ID: <7ad81b90-0463-c660-d290-34ccfc1c2e5e@linaro.org>
Date: Sat, 24 Jun 2023 10:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 44/45] dt-bindings: arm: add sam9x75 curiosity board
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
 <20230623203056.689705-45-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-45-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_010357_144062_C7F71213 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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
> Add documentation for SAM9X75 Curiosity board.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++

Did you receive here tags?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
