Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD858EB64DD
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ux3Bjr75YW/RToqRmhOvbfeNOFSUnr/staOh3vOhjXU=; b=EtPKpLbPXa0x3v
	yqYctLNJfCpIDDZoPfqQGO/PQav7nBum1O0t/CAvUQHWsz9lOSkuqK3vJ2/erPO4+y3aWOSay067Y
	+swGyoI4Gg2HWjY5/UuuEMeO2ob1rRu6/QskPmmf6mG6OBwx2rgNDBXeQxfUP2vJ8sPoh4tVRI6Q0
	eywSxHKo7R9jJTuzwxKCGvcCdHXQA7NA5Mc8VP0DJqxaw8Zh33BKTcNKuYkf/1AVakPNWpFBdzsPu
	z6PpvVg1lOksxl5enwY0FL0pf9NfF0NSdGeuVQcvb8iTv0HlLZ3P8P0coI/6h8jfz38J1eF984vYO
	BBaS/6u6pXLnuDNH8ZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyZ3-005Xi6-2c;
	Sat, 24 Jun 2023 08:24:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyYz-005Xfm-2B
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:24:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e0c1d5289so3826866b.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595048; x=1690187048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNp0SuVUZqVVXCRqHhi3K5MkR/+Yy6bkXmBLVP0jnFg=;
        b=jhYOBsx3HADGCmeOqC6OjCZWNkO5/KTJfDVpw9J6lmEYmzL5HiXwDoc239Cv1lfpAf
         jZ1XFPIoeL3qlalJCxA0FhaGi7vzgisq9Z8HOrSMSOCtij2l1Vf8wC622ZWBSEI6w9Bv
         tb/zKAvq6RYZE0HuVOvxnBDwjvM9Co7tSVBLYpcHDPpAVMhQKB/QyiaZKtzCg35YId42
         690WWPFxeJmJW8HpMj1yM1JCQEfATMKKorKORK21ugqiPL/Y7AYQYIQA3iuYHH2rG9hn
         wKyxDMr3m+KLB5VpzAfFpv9YauEKhIHvu67lLHXen5m4ofDu7Y0eX56xxmPGhBa8yEhc
         WSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595048; x=1690187048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNp0SuVUZqVVXCRqHhi3K5MkR/+Yy6bkXmBLVP0jnFg=;
        b=IHhubPJfpeKdi+hBJKI4YX9lr3ste/DnMZAs7TDjUaT27NbeNZRPOU0ZgP8oNlyO4O
         1EFmyabCeoGwL+KfpMtTtaBGqovL7uOBd3poGMljz7E9aAV3b0HDveX8niVXUAYpJLCr
         WD0Y9z9LgDZdwgAKZzLxNFY0RrX2pEt55GrlTuePOLGxM3sdbqDAoR4f42BUfJWdIrAx
         QLUZA5M2kghrafZ5MWZ36gEsxzvyREtqaZIFb3rRYaZYF2f/C7wGMjmIRcRVVLMk16Fk
         vpjw+4q6zZ1MBifEwq+9oi39QRiyLJHlc8J4nL1wZOD4bOysI7oIKAiL7h2iqRppMG7+
         IM3g==
X-Gm-Message-State: AC+VfDzoYVhTAWLmB2VPdEZnEXu4iiGHY0Y/xb7S4bhXO2IXY0YY9Yx8
	9nWiD2DI/tZDCd/gvNP1qRvyOQ==
X-Google-Smtp-Source: ACHHUZ4gGdNTR0CSjAVHFIlEksa5SJdwiZGS08Kq1pYOdg+zg0I6klkaiPnVTZufYDi7QamMvR/5Yg==
X-Received: by 2002:a17:907:9706:b0:988:bad4:e403 with SMTP id jg6-20020a170907970600b00988bad4e403mr14932362ejc.55.1687595047903;
        Sat, 24 Jun 2023 01:24:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qp7-20020a170907206700b0098d0c01d9aasm621791ejb.87.2023.06.24.01.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:07 -0700 (PDT)
Message-ID: <f1a8a04b-4620-5bea-1542-0e425a95182e@linaro.org>
Date: Sat, 24 Jun 2023 10:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 21/45] dt-bindings: atmel-matrix: add
 microchip,sam9x7-matrix
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
 <20230623203056.689705-22-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-22-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_012409_729871_E2829239 
X-CRM114-Status: GOOD (  11.39  )
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
> Add microchip,sam9x7-matrix to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-matrix.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> index 89d05c64fb01..75378839fc7f 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> @@ -14,6 +14,7 @@ Required properties:
>  			"atmel,at91sam9x5-matrix", "syscon"
>  			"atmel,sama5d3-matrix", "syscon"
>  			"microchip,sam9x60-matrix", "syscon"
> +			"microchip,sam9x7-matrix", "syscon"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
