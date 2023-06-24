Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D56CEB64DD
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvEou2/0n1gZUn6TlPwhoN7DhA9ceRH3pL1tDMPfJ9w=; b=S46BXQlghTmdCV
	MKblmxI3Dg7yx1cnBc2Twjpg6h5yqtRem3J+N1iCN/0SyfRpyaMLQodvaAD4Hghb2ccZrLG+mMEWY
	tWoNM3brAZIlwzeqpICpgCshqob5Ezu6ENX0hccxQDRhiuVDzjmZHg1cezoW5T/Qby5H96QCDLkKo
	WKslgV8WCuhSnJgMxbVejbK997fdRUlKYgVPplKnCiN4Dz/+OJ1Wcae2ge3QL0PehnEuot59Z+hm2
	9TW7HuNZD+TcFLUmj/QO65qEP0SD90MKV0M240/5P/JrjUcmy1mXVpONA+gvdYcBbd2AcJX6A90/Z
	zECot8iOyTbqCJzsdHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCybz-005YjB-1h;
	Sat, 24 Jun 2023 08:27:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCybw-005YiR-1w
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:27:13 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51bee0c0acbso1385685a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595231; x=1690187231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJlPeAcJkflrsYHeqhAxG1xpnKkKctKx9VK4XOcUSNU=;
        b=Kkt2tu0fZVyjdnIT+9aWz+2dC0xTVD3lu4yLwV0kQqZHuhz8Ro07GQdKqy6N1bU9f6
         pQSHbTPMPW6t676hrqq5z5c4/jC1zAayJMvQIsQvygTbtQ1Ast7+Cs+Sp/qYXZDLJHWw
         XBE4dYbEQtIeIRkumTncrrM+RY7bqG5QLJTYAogks8em7F36iQZDlMeHdRvWBibNfJyB
         5GEQ4ZMC7udapD1WxMM6AWpT4cPZ2HWl0da/r/wrXgxUiY6gz4DHtTZ2kx7RHe9LGGjI
         QKd+aWA5QHSnmV6Qgt2UIMZ5Ylb44sRp4CxcC3kLBCXNXnUnEVR8y9x1idlk9Lr31Gd9
         XPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595231; x=1690187231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJlPeAcJkflrsYHeqhAxG1xpnKkKctKx9VK4XOcUSNU=;
        b=krfkzn6ZD+v8hM5g02dkORoIoNPstAsqxFSWnZdC8IA/Jke5iCQQXajUWsau8UEqA0
         nax2b0+5C1t1rVyhuNNtcGzeWvxxqqEh6poc0AdRxzky9u0EGT/Pf912UwJKXUeGWMbB
         cOstgXjv91mDXb+uyvU2qqNjt+kebrziLiEFGHf9oUSEt2a58Ps/k/GPHkKWuHf88Tmh
         b5mro+h8Q5Nx+tu4GELi3MSnlr5Kqw/lpMe3ImhIZjBj3tlGveiXWaBlGmjRi53OTzu9
         CB26Twcb+R5bilstNWlVbAys6O1is8IGphhv48bcissviAZUv8iku1tb3oejp5oY2w0S
         eTCg==
X-Gm-Message-State: AC+VfDz3q1EPrpAYvg5P+2yXtGFsUwq2bRGPkpUVH+zE52XwhpGTIqPw
	Ibo/giaMdSJEcx8IlBkn+/N8Ew==
X-Google-Smtp-Source: ACHHUZ5t7epZFC28S4hxtPyy+RCHfLvODV3nPC4aL8/psJFMdpVy5ABk2SDosvlu0zr3308+wJnq2w==
X-Received: by 2002:a17:907:8a03:b0:988:acb4:f63 with SMTP id sc3-20020a1709078a0300b00988acb40f63mr12986422ejc.74.1687595230874;
        Sat, 24 Jun 2023 01:27:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709060c4600b0098654d3c270sm635400ejf.52.2023.06.24.01.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:27:10 -0700 (PDT)
Message-ID: <caff28bc-8824-f173-99ea-267dd26e5cbc@linaro.org>
Date: Sat, 24 Jun 2023 10:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/45] dt-bindings: dmaengine: at_xdmac: add compatible
 with microchip,sam9x7
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
 <20230623203056.689705-18-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-18-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_012712_636582_DA06A603 
X-CRM114-Status: GOOD (  13.57  )
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
> Add compatible for sam9x7.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/atmel-xdma.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/atmel-xdma.txt b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> index 510b7f25ba24..f672556ea715 100644
> --- a/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> +++ b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> @@ -2,8 +2,8 @@
>  
>  * XDMA Controller
>  Required properties:
> -- compatible: Should be "atmel,sama5d4-dma", "microchip,sam9x60-dma" or
> -  "microchip,sama7g5-dma".
> +- compatible: Should be "atmel,sama5d4-dma", "microchip,sam9x60-dma",
> +  "microchip,sam9x7-dma" or "microchip,sama7g5-dma".

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
