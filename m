Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30BAEB64DD
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AFvHA2xjriK7pVHUtNYVfHS/sBPtddpPHc6KWDVTn0=; b=lsLcL0dzR0XYro
	/VSpQDcd1NIYHeC6vkr6+eIxBEyErU/tB2h+YE02VSRE6lNafNAMzHhsdGPuVoGgiTgOBWGW0r1SG
	rJdLd5jJAEFRl2h2Kq6137vkmQP/nvFNCouZYAFoQ8c+x4dmI5SxG302Go+QwQdvfu2jRhwK0+pVT
	my+X+eiqutWUNQ/SSaMAm0xJRv+0ykOc+t/nH2JB5671s/KQHU9mkqAv2wwFzd3lHghYrXlccUUCj
	0VFrgfWoFLHjJaqSCE831lfL/AR898Fd4hCG/FBunkktl/xMuuGN3XrLoFvcYgTFDZBNlnaYA6/7N
	zLjvQOxClILiR1ldO43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyZC-005XnB-2S;
	Sat, 24 Jun 2023 08:24:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyZ9-005Xkz-2N
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:24:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98377c5d53eso161068866b.0
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595058; x=1690187058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPneVN2rCFPZCWtN2Y3Y7VAYQxdyjaJ8jbh3KeTpdLs=;
        b=ma3NfE6b0iuczvDz33OkA/uVJrxAQ0MAFGHk9u7v1nR8D47ZBhw+gjIKtoDzcuY8wB
         5Pvy2qhRvcmPuwpH6Rnrell8MA5C7ERsiEZcNrkTdp2enRRGz9YPH87CceUiDv5qwK75
         d896yHgKdfHQUS9Eg9eIhEqyw4B9mE251eGpuz04MVFGWKdUuNcFeBoHnIh0QuUcthnS
         eJBnB3dNkPlBOU9M585Rs+CiS0CIFL/3ZSHm5w9+0Ssxpjw/anOhPvtredgrXIbeUSj1
         r9EbwEOwv+nT8pNTwsJJO4EB/ZoVNvunu6EeU/OOohiECV7HuhxnULraB/RzV8f3YdkX
         65nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595058; x=1690187058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPneVN2rCFPZCWtN2Y3Y7VAYQxdyjaJ8jbh3KeTpdLs=;
        b=LXeGw+3WiMa1reQU9qMt6bmePfgcamS1WLjtlAXhTi3/QYCbIu4OF3e986FB9cFLKP
         xWDtmPnxx76Kvf6SgsZBZx8PXrYKpZo0T+RSK1ZS1k+L+Ls+rzzUUFKSOcQ8X0A+a6Kh
         jTHNkVToGlsFnVIHxmZ394n7VlhB7VDKqFdzG824lglygAHltinvGSYV69Olflr9Vm+s
         2hCQcCjZgDhaXEHvrfYyKwlzChiBKF12njmgvJpycG8Yy0/6K3i4sKELBw0NZCkwkGG5
         E8CplgidHZrGLDeSQwn4UswnZTjcGpc1dl1O9B/xh0ME1GOAH8IdjNMMp/yyteyqsK56
         8jQQ==
X-Gm-Message-State: AC+VfDyKZo46MhfdWLc2nY9c1XDj9wLuq6ZAIoBXQzDe4XUHWsa4A+cK
	wbqQ3priBtmoW2Vhy8D/IBGbsA==
X-Google-Smtp-Source: ACHHUZ6AtPijKbF7bGoaGRTgUD1LMM3LYmmo8YnqmXKrV8jF1gHofaeMAnYGyMfoMbRKzIjPK+/0tw==
X-Received: by 2002:a17:907:980c:b0:988:c24d:3d33 with SMTP id ji12-20020a170907980c00b00988c24d3d33mr13654323ejc.12.1687595057964;
        Sat, 24 Jun 2023 01:24:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i23-20020a50fc17000000b0051c7b5692easm435291edr.7.2023.06.24.01.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:17 -0700 (PDT)
Message-ID: <fb79e3d6-7164-2dc6-0d73-c32ff8a1c7f9@linaro.org>
Date: Sat, 24 Jun 2023 10:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 23/45] dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
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
 <20230623203056.689705-24-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-24-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_012419_774561_4BDB2A5E 
X-CRM114-Status: GOOD (  12.08  )
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
> Add microchip,sam9x7-ssc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/misc/atmel-ssc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> index f9fb412642fe..67c1227a01bd 100644
> --- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> +++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> @@ -2,6 +2,7 @@
>  
>  Required properties:
>  - compatible: "atmel,at91rm9200-ssc" or "atmel,at91sam9g45-ssc"
> +	       or "microchip,sam9x7-ssc"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
