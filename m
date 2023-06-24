Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE265EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgJAHmRStX+K6NQNFMHVYiJhdMuzunTd8FKhMcMjTi4=; b=DOST8vzBFgSMB7
	7Tgt9UQJD6VckmZk9w73qIHx9AeiBFoIe8eKtfQ7SFiBCiQvGjfQ4zbBpzryFzs6Ow6FFEuEnSvcc
	L1tpcFMzGsoZLn1hRbEYErO1L+3NHgjzCJwHhz/hd1JNA4tXJt98muK/epdg1UdvzK6otazegjjwR
	3vSL3MLycauqsZPmyfANex8FmG4SBI5WZSyBI3cYjb8MVRTMDRcXL11meaUbU5DzQaHO3CKu+60Fk
	k7ygj+Noz4PMXK63v228NCP+OEmb25/7LoeEtBXgjO2Kgg9CFXi89XyMSFFqHIZsgLNnCKFvbKxIE
	ZXceHD5wtBPeYA+M6Gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyC5-005U9k-2P;
	Sat, 24 Jun 2023 08:00:29 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyC1-005U5R-1t
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:00:27 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d80c5c834so327489a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593616; x=1690185616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plRq9uRX7lb7dTEBq+/7uDl8MLqphJlYEezgY+W1p9o=;
        b=a43pJHJ0/i79GK0sVllmNDFxmLRvG6mdn29k3MDLUJpDO/vAzPg3YyQ818IBbmxC/u
         1gtZ48SyfAQ5B6l0nPXN+iauyWfgfXlbH0dfibAQKneNTKdjh2/VHLoEKzIxurh9DBP5
         ygKyuWkrfxIEeg0x0Ulo13gCWxCoWUMToLkqHYl6h6s3s4qa1bsqQQrA6iOgzlG7pLl+
         dIYVYidPvnGoTN3V2N4aRfUTueCnlqRpbuIYXLGn2MIJJvK807soiNVOfavxJ/gbhjQH
         difhgo70gZBHNBdb4AvayK2zERp3uN7fHKNQxbBPF+9B6cl2sxkR8NHUfutycTaQtmog
         Ussw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593616; x=1690185616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plRq9uRX7lb7dTEBq+/7uDl8MLqphJlYEezgY+W1p9o=;
        b=UTp03Om0BpqKdCE6bjSTjHVULu5uVfZso17Os8GXKe41Yj2jMjjW05zsM5eoDkQU9n
         iRTg5wSxw5yrfuA/IoOYynNanQIVW7zzo48lfQdGtkNbBYEwv5QyjkU6dw3ixfrQMvQC
         kGiXZOR32bMDKjwi+nsFJ8YEXI/xfqfxqBhrsdnAlLKiKYLw+RgCVdD5GF/MsoY3ow4G
         T0byK2C7eoITN8ffn0xYNlx59ubyQqZHxGdEpX7zmQfwj8VKSfj98+0m0+C+YE2lqql9
         SOd3hFlefsJfSiUOrFz/3Rom+RjqKI99EyoCSDxxAi2DN9AzQfN39fx9mKU9eDiNViGO
         cHWg==
X-Gm-Message-State: AC+VfDxUwzxKGWarZE+N1RAYVu4pIs8jHskeV1BLisq1JBy31EcAm/ty
	3uofx0GKInpMU856z/iruFiVEQ==
X-Google-Smtp-Source: ACHHUZ6M3mY16cNIWWFFSaJhLerF0OTUcHm2JKoX1SNGPbnrXFGF7T+AVx68dGzEKp0F0dxMjJC17w==
X-Received: by 2002:aa7:da90:0:b0:51b:de6f:2182 with SMTP id q16-20020aa7da90000000b0051bde6f2182mr9641369eds.8.1687593615898;
        Sat, 24 Jun 2023 01:00:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p18-20020aa7d312000000b0051a2d2f82fdsm422074edq.6.2023.06.24.01.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:00:15 -0700 (PDT)
Message-ID: <b837784a-50f0-7cab-a535-e699688640e5@linaro.org>
Date: Sat, 24 Jun 2023 10:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 13/45] dt-bindings: atmel-sysreg: add bindings for
 sam9x7
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
 <20230623203056.689705-14-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-14-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_010025_623235_07A57D0D 
X-CRM114-Status: UNSURE (   6.64  )
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
> Add RAM controller, shutdown controller & SFR DT bindings.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.

Applies to every patch, since there will be a v3.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
