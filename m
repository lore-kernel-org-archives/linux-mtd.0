Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB89C19F4F
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgpffcNb+/J3Ke6P32bn//nPMrwzANOL3Q04nDdlqmw=; b=X3nytOQcWONHIP
	7Otk/CpS6a5kRbrW8MMGN9lvJptcXVtFg7vIHqQZLgrPk+z++2VaqQdonkMlBDbNNv99CBNrnYCTu
	6FOgpxS8/qzEa3LS9TJ2wMq54EnVfb+QF/Z8CTxrucq5LJiMwWxldX2NduSh4FBFOKGTrQ5UGAfg6
	1w1qJqq9aDaipbPMtM6G5P+SfbfgEUTeGx6Dre+sRdKWVdGX7rkCvTtZpFByTBY1eYVv2bDX+Afps
	ow6MwlMBISYN/UED9jmrLRTHc6Jwl7nu5CKI6N2huPYsOZWlvUn0GyTGv7cTyg/y2dd4oJH8nkIPp
	iAz5CgFnOWxFbIQjL3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyEL-005Ure-2C;
	Sat, 24 Jun 2023 08:02:49 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyEH-005Uoj-2w
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:02:47 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e0c1d5289so2239266b.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593763; x=1690185763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaGxY+NnkNtbiINqgZVIrn7LMLj+M5ushBYs/d6ygok=;
        b=w8QQgONDomUOqDBoVh74CKpXdYrNhuFs41+qRLRJ7+fbvCMztxR2frYWC/83GW8hxQ
         3999BqBWVkJkuE9zm1JY6YjkcJceD+QK8nJzyeaQCGD24DDH+0SG6712mcjzXHoAWzM5
         m4ybyz1vjuPBLNw9H7DwOIngDiMWxYC6lTWMStgy4ra9SRYTJ1ld9vMzfpmrRabfHZ1W
         l9EohQU41D2zbZS0eNatZtiDvIYHa4nIYO0iuwVzKFNi1KNiAwzY+VYQu99FV+fe4bhL
         8f0QKWSQetVmrEASvd1LR7mIEihTpdS6wcmS7mAgyQ6/10XhHyEcYX3XwOqGChl7fY7J
         VPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593763; x=1690185763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaGxY+NnkNtbiINqgZVIrn7LMLj+M5ushBYs/d6ygok=;
        b=hRK2Zt+DlQTwBYe/lVtxOYzHLujDOcilaN0Srcry5/XuFWyo8fhg6eKHLAsj/HLarb
         gt8gkybLHHdrJOSjs/tKwfnjZIeSsQrRCN0D3x5m/GQIqfoxHVCbInv4uU8vA3RF9QUK
         ggMR+CT90xoehft+7BCKNIqjlPsigbfz5TuPPg9+d0HeaFQmvOihcZlXaiYdJ1PFPZ9g
         U5rFi3joeMCAquhOYhQQ+2DQoG5WBGQgOS6v+y4MwN5ih/ACwGYuf2kZ3VOJCUcLVcjz
         EI7QhMJ6aZjcVHvsG5QfeUnPwhhykiFos8KNQSqLjIXQ52sCa4zL4RnHUb8Rs+5pAbC6
         6WYg==
X-Gm-Message-State: AC+VfDxgLm1N95LyrhV9cpQkrLV/pDeTkx6nXgIa2q3rwHjWdn4Jzd7I
	ZkLzGXCdfjKzuZYK6sjWsKOhig==
X-Google-Smtp-Source: ACHHUZ6vL+lt0p59DekkavEVRdH+VurtmvBUx/CDPLLIsizULEgMBaYfOxG9eWuvaLpHLjFTBqHNMQ==
X-Received: by 2002:a17:906:5d0d:b0:988:cbf5:3a80 with SMTP id g13-20020a1709065d0d00b00988cbf53a80mr15099774ejt.62.1687593762629;
        Sat, 24 Jun 2023 01:02:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a2-20020a1709065f8200b009878b0b5302sm619453eju.98.2023.06.24.01.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:40 -0700 (PDT)
Message-ID: <2d3f27ba-62ce-b37f-3672-df8ee58cdcc0@linaro.org>
Date: Sat, 24 Jun 2023 10:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 31/45] dt-bindings: atmel-classd: add sam9x7 compatible
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
 <20230623203056.689705-32-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-32-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_010246_756797_9FE6C4C8 
X-CRM114-Status: GOOD (  13.29  )
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
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> index 43d04702ac2d..d53addbcd41b 100644
> --- a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> +++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> @@ -18,7 +18,10 @@ description:
>  
>  properties:
>    compatible:
> -    const: atmel,sama5d2-classd
> +    oneOf:
> +      - items:
> +          - const: atmel,sama5d2-classd
> +          - const: microchip,sam9x7-classd

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
