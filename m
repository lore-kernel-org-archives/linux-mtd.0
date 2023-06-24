Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC51EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnePosyEJZbJxoSu5IiJI0h4idjwFRq8p15K6bsMzi8=; b=1o645C8FHL+CIm
	QeKzd25xz2gUy6lQ6CcPCzD1plLv/SIbzRl9+qCfhoFA9rdO7aMu7I6g6JgMfE0/s4xHV3qCfIU/f
	7iWmUxHFHDxi8o1SWKACV5/If9f97iSN1jT5wwxqbySWwO1z0SqiTc8j1Y/vYtRa/vFqI4GLtth7B
	bgDnou3yFc1tWlbZf6HXSigkS6ticj2ZNyHsQryN1FLbHcBJAm1590MYRJ/qHWYYe5zO8pCfWfWFq
	tE6BSUkDs56ss3IS2yiI/Eti80fwdztarNtQptMYqXL8rnpIrVoHeFTtEhH0lbdfpk8o1nNZXLvEC
	H415u95s3t00ONTPM9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyZV-005Xz2-2K;
	Sat, 24 Jun 2023 08:24:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCyZR-005Xvn-0n
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 08:24:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51d7f350758so485986a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2023 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595076; x=1690187076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9m88tdrjltI5afqB2y4W0GvMxnga3YhkyI5zgzVbcGE=;
        b=Xq63fn/XWemDzkx3c0aeAAWnkqQM+vMTmqJyDMM+c8xqtOklqM5UVjx/QJRBSnWaqw
         jrvpmmv7+n1h1fwYvqTDppb7q3v4CxpcBFLat2c8scG7YJTYn2RmymqLDDJsDvPD7ylE
         rE42LjjD4p8GfEZlnyuM6Y+bxAwhLcTrcE5m6SXqpdYJPckhjxHR3sa7nsmPaHTOo4bo
         QG1MD5s2ZYzijyxmfTee6mNrCmD3Uj2fs3fB+ZiZj7XCg9jNuU7jC6SzGnlAVZ1GVS9s
         eCF8jLAK5vJGcqxv1zMzR0xfIlnd31mZdDJeDioTtl88mW/oLVOMCuZtZlIjCR83PEas
         8/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595076; x=1690187076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9m88tdrjltI5afqB2y4W0GvMxnga3YhkyI5zgzVbcGE=;
        b=Sxk7iYSm5DLdsxhekUWlSWGO2/DuBkankbj3ir8bYJREknXLoqqxm/apj1Q8timxuF
         Z90XiIS+6q4KUPtniYzRBvSdfMrzXbc1FTuFO4PzmLsNJj09tov+KcbAA8xeMZY5lah5
         6rlhptX/QsULQVsUCiot13xyOewqdt297dkRUFFJCqMPXZBTzWaQDxztfql54kAv0zdG
         phnohcY9HcWZH17vSRiNfPl3EaabnkFk9RbJHAqd0aAmM8rE3gQyN8CyXeu7mj4uYRCO
         DSJMD27GT7S1IO+MhoUi624ZSddTLQyd1Y/zljO7FPMSwKPnbrleyn4ElwD2t9hwPo/a
         rqOg==
X-Gm-Message-State: AC+VfDy9aS7COKNjwpqNZQ/3FmEwZMup7px2NqbZwH0oDsfgoBqv77y3
	mC6ydlLDW0XcfWvva+W9EFPATQ==
X-Google-Smtp-Source: ACHHUZ4kfvWWOU4PQnvhhihUyXC/j4nl3PRhbWc6xuByephTLC+3tBRktkXGlK7+K+j6XrtjsNoPmg==
X-Received: by 2002:a17:907:3e16:b0:978:a186:464f with SMTP id hp22-20020a1709073e1600b00978a186464fmr23817557ejc.39.1687595075771;
        Sat, 24 Jun 2023 01:24:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906654700b009875a6d28b0sm626289ejn.51.2023.06.24.01.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:35 -0700 (PDT)
Message-ID: <769b5cf3-0182-d046-a56d-c3a076249c57@linaro.org>
Date: Sat, 24 Jun 2023 10:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 25/45] dt-bindings: atmel-nand: add
 microchip,sam9x7-pmecc
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
 <20230623203056.689705-26-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-26-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_012437_305487_25A00EF5 
X-CRM114-Status: GOOD (  11.55  )
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
> Add microchip,sam9x7-pmecc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 50645828ac20..9c9dfab38fdf 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -56,6 +56,7 @@ Required properties:
>  	"atmel,sama5d4-pmecc"
>  	"atmel,sama5d2-pmecc"
>  	"microchip,sam9x60-pmecc"
> +	"microchip,sam9x7-pmecc"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
