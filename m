Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE99EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpiubqLd7PuR4RJSWEgRmw/KDwgsJqnQtcIR352rfcM=; b=3BVq53hCOCqRXx
	oM4xtblaNGWZFZ7Le56t3pad+XMJjUZR9THklFhs5+0BYyAtZthhKsM+CHIOR76aXl/0a6W5ZrMLy
	eEdtITBDxE8GREw2SBa63kxD4LBp2RC1I4tMDw1BIKvVgainep82N2NBpYblEH4MRWXbfu9cuhhlk
	macPDOrl56BvmPycWLIvkQm2DT/3YQhVE8na2mzq9zkJesU5YOn6Ga4xqNGjjVmQJEA363LAXKWfU
	c5dIfr8xo6WkqjZdYHBmGg0QgWkIeCSpvbkmpqho5PG+qENxYT1XbxaMIl4fzZZby4WqjidxRdsXh
	U4eUYh/4uGUncETC9X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyYw-005XeN-0o;
	Sat, 24 Jun 2023 08:24:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyYu-005XdA-0d
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:24:05 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d80c5c834so350080a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595042; x=1690187042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rmdMg6KqyfM4vHKUpwecy9214du+qFl2Fy/UDsrrm4=;
        b=TvwuTD1hCQ3nAnAEpHE885dBBw4DHnfj7ey5fw+Ut93n/UtCNrwY7zyxy+yJ2oyrMH
         sxHwRJzUJSZ/bSL6g42Wlt6bH+FNB8GXTMRXJHp2yIWUR3vuJAEuFs0XV22u+npYhezV
         jM6N9NOBgpVT757Eu0gl5uSwDlFQwyf3Imb1S4hpCRDhP7KHj8DryeuHFasi+M2hQwlP
         5tELy8f7cVXULLPBAh3GxkbkHFgiBasCTU9Sp/mcHqEe+UyaSC/SKiyqCadgZmZ40bFK
         +/vlZw/erX6ARWTIiHOAF0g1NYYIdeZ3hT6m6rnlSB70vaJkO/1E/y4zDlLiBzNmi4nw
         heww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595042; x=1690187042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rmdMg6KqyfM4vHKUpwecy9214du+qFl2Fy/UDsrrm4=;
        b=TcqXVXY49zfWPIEpGlxpCnZn5Nkf+FQq16OVWcHLx2Tc/3V9eI2uu4PgxIH/7Z6MFL
         7YfFdGTY06LJdmVn8yMfSaCJ4MLaP+jW3HTfaR1RXvaFl9sqy6Bhp7nZ5HICgng0Uqe1
         cpsjslvWppElelIfF6wbSheOdLq2mrTPtAuWB3hbiFEEbMX3xPdbq+deW6Kfpr98M1ry
         izAx8T11rVNRI0Ilnw9Ul4IJqHhsVAeVMGksYjkbaiSe0XqhVo2hja/CNwZE9ykORKC2
         tIN8EdrFNyAMLomPY/budRVxgELO3CgspQ9TMGVJXdw7n8pOCsYa7DsPw51jz/EQr59U
         TJDQ==
X-Gm-Message-State: AC+VfDz3gGIpbA5VDD4iE83u1QLaxqUnoHjdD15K5EIHIIhExunsc53v
	yNCxS6EW4fqf1L55H41f1gpGhg==
X-Google-Smtp-Source: ACHHUZ5uBeAmtj/QzF2pyScKZoEXKfoalX1DGZidPH3H+lFnKKTjF/iE5DlV5Gq3MvXs8SEHiYbmvg==
X-Received: by 2002:a05:6402:1d49:b0:51b:d59f:8518 with SMTP id dz9-20020a0564021d4900b0051bd59f8518mr12391317edb.16.1687595042718;
        Sat, 24 Jun 2023 01:24:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id y11-20020a50e60b000000b0051bdd068492sm423197edm.52.2023.06.24.01.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:02 -0700 (PDT)
Message-ID: <c2dfaa33-3d37-75b6-3035-cd6b70d87b07@linaro.org>
Date: Sat, 24 Jun 2023 10:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 20/45] dt-bindings: atmel-gpbr: add
 microchip,sam9x7-gpbr
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
 <20230623203056.689705-21-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-21-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_012404_237562_8AC1D09B 
X-CRM114-Status: GOOD (  12.55  )
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
> Add microchip,sam9x7-gpbr to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-gpbr.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt b/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
> index e8c525569f10..2cc39524af8c 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
> @@ -6,6 +6,7 @@ Required properties:
>  - compatible:		Should be one of the following:
>  			"atmel,at91sam9260-gpbr", "syscon"
>  			"microchip,sam9x60-gpbr", "syscon"
> +			"microchip,sam9x7-gpbr", "syscon"

That's not what your DTS is saying. Srsly, just open the DTS and compare
the list.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
