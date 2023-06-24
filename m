Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC469EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AfarQsl04fgX8kg/zTaL/e+ynz7ftHh05pFWBfDhZc=; b=Qp1Z3JHVIQVUCk
	W+tOAmzi/JzLF3GWIBSzKcdmI6BQ36TuNGcAAcPpx0gw1SgXp322VEQ5Z4Zd+T5r7lTVB74lACeAb
	u01EwCn/RGTn8STp7bhwJoB+VCaDVDe3yUy+j6YMffNLD/JihPPYfl+/LC9a1Zotpd7NTZDefDfAy
	5aepHkl2NhuStjMKTiPL0emFMuVLMgc5hp50mtC8Gna3HJaGqHI7BRZWUjsgqpsMrve4AhTyfn1Of
	FVhMM1bR/IFzPJFkQUmplStP+kAanMCxMe5TtPJldd2AWcupIkgOfLBqc2g5hkzS4jmSdiEjE8vAb
	vur4rqYWos+WDye/5E1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyYO-005XQy-2w;
	Sat, 24 Jun 2023 08:23:32 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyYL-005XPh-1a
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:23:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51d894b9b6cso26809a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595008; x=1690187008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGCuLOrcQg1CRlpQSfVcmvKebFGyaZsdxYX9CXcfLZM=;
        b=xFKigBdV83Jd1qUsH05hPiIU1P7h6ll6on3yqFhMjrYPwiCXFC0e303zASaD1ZqqKd
         Ndiy0iOYjUF8YhQxuAkR8Nx1s9PjpApJ0TyNtB1b5gwgsCvZs0iajX45ENiiPCQcPY96
         g4S9zr1214rNmDdio/oKh2DCVClan9uYvQlB4qQl0yjuKnXTLTRyO6dOXqyvfX0Ge8of
         8DruxxWJt1OJ2iHb05QqWeR0WDztLvfZd6ajx/RAVn5knbq8nIzSWIixJylIR/D0BwLR
         irpLdb/TPiW3i6BbsRoMZNvBM8AZ4+ztRJOKNPudJyzZ1WNXldj3Z+N3OczkwWUKt0K3
         5mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595008; x=1690187008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGCuLOrcQg1CRlpQSfVcmvKebFGyaZsdxYX9CXcfLZM=;
        b=cFpAx5IyR5uSgau38M5vY6/9nm1kr1sNopEa73OcQEgZJ+qlTLMDmgWNhIFLpTIZLE
         X5w0rKDWGz1R6t4uEl34mDzjfiRDeoWNuUJAMwLwS3iQLtUqjrsRUdtouGOeGRYzcs3/
         auaHjUG/vALj2h66PJbCQoU1mk6lgIZTjQlfnSIg+CQUuschb2PTXjC3uf+oyPswTBxn
         Wbie/sJDXeJITAqgirLb38NZsVwrTAcJtWtQIMRk/IC3SprMHY7VoC/NO0ffgrMKYbzh
         lDtV47p3U7JeWk/zUSHxqnWoSdYJlOF+ZgroASvGCnN1eiK7BDqEgBL7SqgmJcX2byhf
         xR1g==
X-Gm-Message-State: AC+VfDychNSIGRyWOqUTOZlIfbIG8PozvSZRPs6RZ3Sgc9LbkVas/gne
	q/WMWGVHcA3zQ/ee7jACkW51fw==
X-Google-Smtp-Source: ACHHUZ5rxUhuZrDxVobS5SDmzvY5J2k9KNpHXKQzE6cA0gPVXDKAPA/JRUBn5KncILCak4yP/Iurig==
X-Received: by 2002:aa7:d281:0:b0:51b:e89e:a848 with SMTP id w1-20020aa7d281000000b0051be89ea848mr4981862edq.17.1687595007953;
        Sat, 24 Jun 2023 01:23:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g19-20020a056402115300b0051873c201a0sm436026edw.26.2023.06.24.01.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:27 -0700 (PDT)
Message-ID: <2b6ee66b-b2d1-23c3-9b26-d44fce7fd6bd@linaro.org>
Date: Sat, 24 Jun 2023 10:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 35/45] dt-bindings: irqchip/atmel-aic5: Add support for
 sam9x7 aic
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
 <20230623203056.689705-36-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-36-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_012329_533436_3BC23A9E 
X-CRM114-Status: GOOD (  15.15  )
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
> Document the support added for the Advanced interrupt controller(AIC)
> chip in the sam9x7 SoC family.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/interrupt-controller/atmel,aic.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> index 7079d44bf3ba..2c267a66a3ea 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> @@ -4,7 +4,7 @@ Required properties:
>  - compatible: Should be:
>      - "atmel,<chip>-aic" where  <chip> can be "at91rm9200", "sama5d2",
>        "sama5d3" or "sama5d4"
> -    - "microchip,<chip>-aic" where <chip> can be "sam9x60"
> +    - "microchip,<chip>-aic" where <chip> can be "sam9x60", "sam9x7"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
