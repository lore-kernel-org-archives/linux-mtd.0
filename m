Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CD3EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BQlzO/5b3D4W7aK3NWjxHjajaDsn9PRjEvc2hGS9PA=; b=S95DnmAv4O0IDc
	HHhBjFO9LMDGIMG6EmgeuC5eCT5Xj6Yyv5kzUX3TyGRa4bcbjtbdekoGSpYwySH+ePuJOJesDAvwh
	2/U99xaoGB7+Fk8bKZz1j09MkOuZfjoH4nvX4w/Mo5MUBnUBF119jXvW4BusGmyTxaHIDG45m8030
	eGidj9uy3HdiZyTX6Dvt11JmegU1XoXMGQL9RaAEe2bMiSjg5sdjcllHzBwNmnv30y1Cyf3nUso9z
	BRkQI8WDKhA6//qdTG6n/vIslvysp+bUxt5nAixpgKFfAQHRxdg1OAq+qUdNJrumHNWIcwTjeErCL
	927Jyi1NyJAA0/Bwm5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyDb-005UZO-2A;
	Sat, 24 Jun 2023 08:02:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyDZ-005UYX-0Y
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:02:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977e0fbd742so158370366b.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593720; x=1690185720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evwXLshiChnPPoFaOHbuHqZ762vCCjuGEyQDNCOD67s=;
        b=D9tJ/SfpPzuEgx6VkFAna6q37GPvy140Mp1+3AL4FalYGKRecNq4J5+7jqN3/okS8O
         6VCYYFjRmknfk1Pc6cmV5km+eu6S8+dNsd/6ZxlJHnuwXBsHrGYlDYPQc+5f6+k6+IuB
         GQ2i6ZzaDPj3eVQfF+ha5N+EegiRLR6qQUSP7YQmJByxynUIP9FFNPV1KvaIldisXyYf
         CEC0Kmvo9lFLJYFbPpu7qy9Q8Xiyb4NJqbwsjDnHHtgoqGqOd9Th0k19ifx675SrSoj/
         Q0oNeP6rMCMHk685HjSqRhDPeDMfnhCGrCr0QzKvt4/28ajDuSinwy8LILhi/tqkhGoC
         s1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593720; x=1690185720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evwXLshiChnPPoFaOHbuHqZ762vCCjuGEyQDNCOD67s=;
        b=Aa9uHitRXmfIXMiSbgeKrXeQQ9H/3I1eeT6havzkhhQg9WayLzfFNvZ4vMFwHUYuhj
         jdOITALOV8IwNJvrgvvMgpQUMnftSeze4g7/l2HXq/SaCSgprfu4ZekBO5o4atUt+Ms/
         z6F2ubnmTBGQfczLF/uCU5g7Pc7NefNRUTa5YBRCMe6hnydf/3ieKTPOgAmcuYlhD9NV
         5DDI/MF1MdQLezHpc98h4TvtDzM8gLtFE+SBni4DfQrj+IvlT0LFe6Nkh9VCbW4v9DHs
         7jOcXWRGFP5f/bVFWIg5bBCWePoRzH+ZtjCBztqPT4aQT9KJoQ92isq/KY3r0S/YXZYK
         TP/w==
X-Gm-Message-State: AC+VfDwwN0AZEHS1q3czpmA+6nNnCP8Gb6682SPWPERdVsPV8tjAEvrU
	PmOreAEScac0j4V4y0iUsMHrbA==
X-Google-Smtp-Source: ACHHUZ6WVqK97+L/rLsxsj0TIcEtyCmujOvKdKn3w1rntsMk+nGINy7dJc6MjB9ynUGuEpDSVTkQsA==
X-Received: by 2002:a17:907:3da6:b0:98c:b942:dc7d with SMTP id he38-20020a1709073da600b0098cb942dc7dmr8195232ejc.64.1687593719652;
        Sat, 24 Jun 2023 01:01:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lo6-20020a170906fa0600b00982bf866f9esm607015ejb.66.2023.06.24.01.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:01:58 -0700 (PDT)
Message-ID: <fb91791c-760f-45f5-12db-04f2ff1be8c1@linaro.org>
Date: Sat, 24 Jun 2023 10:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 28/45] dt-bindings: rtc: at91rm9200: add sam9x7
 compatible
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
 <20230623203056.689705-29-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-29-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_010201_210661_4011E732 
X-CRM114-Status: GOOD (  12.16  )
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
> Add compatible for SAM9X7 RTC.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> index 4d2bef15fb7a..e15872bbdd7e 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -20,6 +20,7 @@ properties:
>        - atmel,sama5d4-rtc
>        - atmel,sama5d2-rtc
>        - microchip,sam9x60-rtc
> +      - microchip,sam9x7-rtc
>        - microchip,sama7g5-rtc

Same as in other cases, so just to avoid applying by submaintainer:
looks not tested and not working.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
