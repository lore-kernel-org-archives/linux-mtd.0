Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3170EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJ0HWvkEG4krx2i/WqIWEDD/aEDW6VKqdyUkbbAo8ZY=; b=0mmDMJALck5YTq
	h1wBIRWUkzRUk/wdR+2TKM2uNvhsJWtxuKjTGSdF71KlNMKy58NOL8iDflcj3hjZ5C1h+ZogowdtE
	7cPGrQqWC2P5ab5zGDLGN18ctWrFKB2sjmqWffQsW0p5Qp0kqG4lRaBRsha6St62K3mpDao2JVHyb
	+gYEN3OykAnOUDlsgxiPMZlkNgnUs9s8SjlceeY9F110txafWzKGn1E88ZaeSevc/IzgHT5+CdkEw
	O3VLNUh7KQRu2X0hJzTUmOkN36yUAusckyKmfvB+WzXC1MU4vs4VnM4GbQHoXePxfBf2uE2uylVpn
	g+F/OLd75VDZ/r9ivFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy6n-005T7D-1J;
	Sat, 24 Jun 2023 07:55:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy6l-005T66-01
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 07:55:00 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51be881b425so1505137a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 00:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593297; x=1690185297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=soj7fUfKLSUMfNJRhcGNetkgOh1MYDCQh05RlBdkeN4=;
        b=eD/q9ISsMCL47wOXs6De7fuRpet/07x40xn71+pyopNmpfC/leMOmohtiJNK9d+/0e
         ILxksxb1fX6rwaa0PNl4dIKNWKQ0JE0p+6mC8Npy2RJ92zmvNc++lXF1Evombv7lLOhq
         j0dEkeCidthf58IY6B/xewKh7UeXN34mH4Tn/G+1iZuhgJY19SkmNAEXnRUl+6Hr2Pkf
         cSz2zRZiOrOsv0eavcQnSNRSp9hvrs6WsSE1JlocSaWw+8h6/lYnvjc7aqnaDQHYXfi2
         MGVSEIum3iSzoq+S0mokQ5a3djEQN7ISokIkliin4UzR1LuGSZT4+Gyjp384W6jbO4Hx
         53EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593297; x=1690185297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soj7fUfKLSUMfNJRhcGNetkgOh1MYDCQh05RlBdkeN4=;
        b=CrqZTq2a9f73m4FS8D56lOfXHAz0tW8AgSseJBd0fealMMWrCqP6tsqVJXiB8Adagg
         dtgjlyOCZNcwDoY8LUzsO+rWJmA56JZhi/qieXubjochGty1xYGhreQ6mBNo2qO0CutD
         DJptj4h73r1zzG0qbqpEyibkJXk/EKCNgaLiJUQlLNcRdiLr4g/5gIWV+eG8jg25TBad
         7bo2MbK6VZcDyIkyhq1PmHIRQ55bJEJUjSpMoc0Z7/HFzrjMxXY/wOc32K/wzttp4/Fk
         6hSjIzz6NTOGl8ow82Ci3B2FXdLJngLT91HbqsB0apBQpcZRBAfgJ0uKsGfsd5wOWdXA
         uulQ==
X-Gm-Message-State: AC+VfDxxqi9j9JYN+4Jh3lN1IXsShxtSOeiu3RhX45yRxWnaFl/zcTad
	/1TtbqHeTrDnbUYqoHye9HLqQw==
X-Google-Smtp-Source: ACHHUZ5vmH/wKISmL4HMBTOHg32GmJjKiHm7OZvesTfDEOfAm6Koe4Xv//vNxQvMZ5IiPxQ9Ro3PoQ==
X-Received: by 2002:a17:907:320e:b0:96f:912e:5ec4 with SMTP id xg14-20020a170907320e00b0096f912e5ec4mr19710575ejb.16.1687593296802;
        Sat, 24 Jun 2023 00:54:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o6-20020aa7d3c6000000b0051a5177adeasm400813edr.21.2023.06.24.00.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:54:56 -0700 (PDT)
Message-ID: <428a655e-8664-0e68-7eda-8edd47a4eee7@linaro.org>
Date: Sat, 24 Jun 2023 09:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/45] dt-bindings: net: cdns,macb: add documentation
 for sam9x7 ethernet interface
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
 <20230623203056.689705-5-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-5-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_005459_049216_43965152 
X-CRM114-Status: UNSURE (   7.48  )
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
> Add documentation for sam9x7 ethernet interface.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +

So you ignored the comments and tags everywhere?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
