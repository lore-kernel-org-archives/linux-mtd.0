Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B838FC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aG2VlML8EasK2hhRIToAEjqATeyKDz4oYSrEPIjorIE=; b=XR2nyGKva/m2kj
	osmNCxJQhKaVo1p9Q6DdISg3HPvUubnNJbvG8Qxsu1c7BJqfVUP10VHcUpy9po3b7V0PVTKMhQiG/
	gadzSMm6dyBdiA60eWU3zbYiZ9DVHJ2+kWB6wTkiLshh+yUS67sosRexe9boNpI7eCC07fFpPw6Td
	ESczdcdvlZhojWApY+54VSG2NLM0jEUcgNM1ZtkdxkP+8NcH40/WQzUCenPiFRhWgY/SgXBYUkEJQ
	FFT795iCs/fw/f098tdCady0xZIT7s6bhdPVBqHtf6Od+lnFPQtqx9fGJP/CqrR7e/PooQwUVIpQ5
	XSgd44EvsJIwvakujKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwjk-002m1x-Ua; Fri, 18 Nov 2022 08:28:36 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwjh-002lyy-Lp
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 08:28:35 +0000
Received: by mail-lj1-x236.google.com with SMTP id u2so5904237ljl.3
        for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2022 00:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZabo7ibEwOOw8J7VwUfivpQWJQQOqpTQOP6qmrwcFs=;
        b=c0DwlSGGZnpMt70g7cvHCqqLtClo+HqnYC/KDMQT/2C4Kgme2ED6Ajko4OIXpmbeXS
         m5SIke4QdtVszOu65Cv1AnF200xxc1a/iy1cj+W/4WPUi1idnzCq3jL3rOCyXQ/Sy7Xo
         FhxYYZmL7CP0ofdSTlNio6J4qvL4Gb4QE7SbMbyvGwdcz0q2lnaiEphLSDGuz3cWY979
         gQT9VdBtzdRs59dL/dUgCq5BV84WRT+Q7ok8jIBAq5G8XWvjz6kIifP/efd7/+/UMkZu
         +qzJPaRvsSeqy/GGhmsAycmFzituYnYzJUATh2BkazIz98eeuD3Eq9fkv2cSDtBNQpLB
         eqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZabo7ibEwOOw8J7VwUfivpQWJQQOqpTQOP6qmrwcFs=;
        b=Dwcxm7N6P4OvaEpPMMmUsB4ySZ4qU3N+gEFWNaXO3RjCaOwCPqz6iuzX/FJ+sGojzn
         ySa2k5lCNeiMIvTMSeHk/JafToHpkn4IIb9HPbmnh9LvV6hwNjlg6NnedztIGOjYNDII
         ay8rjqBe/05OLx74E80cB0TvtyQDbNYe0bNxRiSp5w4zj2RBZlIZiMreoRs4RqEcRSIB
         P68m80uyFfDETY4Ne1f3mSQ+SkjVuJn7RjJopL0f+DzIzPY0Iv5kqf1R7BruMp3m3H6+
         E0zf+ZKmIBjiryfYeNAfoVDxC+iCh6x5AoT9psbAPPyIva6gfFIZPyRReKEx5GJqCglU
         l9IA==
X-Gm-Message-State: ANoB5pkZDjrUF6TeXBa4WBSZUTIq5f+S92QUgjkwKlbCYpR0dkKUdJwF
	OeJmkXU2d3PTH06hoxZPssDxJQ==
X-Google-Smtp-Source: AA0mqf5FUU/an0yPckwGnu0iJ8FLtTfHewcyaiyp5w+c6ymGf8LMkNj5Lkw1yXdUuHVX3l3x9IvIFA==
X-Received: by 2002:a2e:a5c7:0:b0:277:8d48:27dd with SMTP id n7-20020a2ea5c7000000b002778d4827ddmr2207144ljp.192.1668760111721;
        Fri, 18 Nov 2022 00:28:31 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d24-20020a056512369800b0049b8c0571e5sm564273lfs.113.2022.11.18.00.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:28:31 -0800 (PST)
Message-ID: <578b686e-8461-a959-86c5-83a8be1dc981@linaro.org>
Date: Fri, 18 Nov 2022 09:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-watchdog@vger.kernel.org
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
 <20221117220756.7a1bf734@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117220756.7a1bf734@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_002833_765658_FB82389A 
X-CRM114-Status: GOOD (  20.34  )
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

On 17/11/2022 22:07, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> krzysztof.kozlowski@linaro.org wrote on Thu, 17 Nov 2022 13:38:42 +0100:
> 
>> The Devicetree bindings document does not have to say in the title that
>> it is a "binding", but instead just describe the hardware.  For shared
>> (re-usable) schemas, name them all as "common properties".
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml         | 2 +-
>>  Documentation/devicetree/bindings/dma/dma-common.yaml         | 2 +-
>>  Documentation/devicetree/bindings/dma/dma-controller.yaml     | 4 ++--
>>  Documentation/devicetree/bindings/dma/dma-router.yaml         | 4 ++--
>>  Documentation/devicetree/bindings/iio/adc/adc.yaml            | 2 +-
>>  .../devicetree/bindings/media/video-interface-devices.yaml    | 2 +-
>>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 2 +-
>>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml     | 2 +-
>>  Documentation/devicetree/bindings/mtd/nand-chip.yaml          | 2 +-
>>  Documentation/devicetree/bindings/mtd/nand-controller.yaml    | 2 +-
>>  .../bindings/net/bluetooth/bluetooth-controller.yaml          | 2 +-
>>  Documentation/devicetree/bindings/net/can/can-controller.yaml | 2 +-
>>  .../devicetree/bindings/net/ethernet-controller.yaml          | 2 +-
>>  Documentation/devicetree/bindings/net/ethernet-phy.yaml       | 2 +-
>>  Documentation/devicetree/bindings/net/mdio.yaml               | 2 +-
>>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml        | 2 +-
>>  .../devicetree/bindings/power/reset/restart-handler.yaml      | 2 +-
>>  Documentation/devicetree/bindings/rtc/rtc.yaml                | 2 +-
>>  .../devicetree/bindings/soundwire/soundwire-controller.yaml   | 2 +-
>>  Documentation/devicetree/bindings/spi/spi-controller.yaml     | 2 +-
>>  Documentation/devicetree/bindings/watchdog/watchdog.yaml      | 2 +-
>>  21 files changed, 23 insertions(+), 23 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
>> index 97ac3a3fbb52..20b195ef9b70 100644
>> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: NAND Chip and NAND Controller Generic Binding
>> +title: NAND Chip and NAND Controller common properties
> 
> I only see this now but the title should be
> 
> 	"NAND chip common properties"
> 
>>  
>>  maintainers:
>>    - Miquel Raynal <miquel.raynal@bootlin.com>
>> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> index 359a015d4e5a..a004efc42842 100644
>> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: NAND Chip and NAND Controller Generic Binding
>> +title: NAND Chip and NAND Controller common properties
> 
> And here just "NAND controller..."
> 
> Of course the original purpose of your series is more to clean those
> titles rather than fixing them and if you disagree I am fine doing it
> myself aside, but if you could at the same time make the title more
> accurate that would be perfect.
> 
> Either ways:
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks, I update these manually, so I can correct the names to ones you
mentioned. Thanks.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
