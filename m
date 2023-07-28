Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CD5C41513
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlEOdx+G94Lq2c3UESxnSe0pMAU7t0XQbNgjnjjCmzk=; b=FaiYOppECUVSQ2
	PUfByBiGZXam8nZL/tlxvjMYQ3tsKPU9R8OiDJ5u3Q7yqvShfSGFIgVbY4mhmuasNooSNO6qOo5Do
	Js2BR7bvfyymknf2H+iWXkte0VwFZLQLUTHUVim5HoasIULBtSgQn/4+/+ONVnUQsi7XDgdkKYbDo
	TKb106m67I5uK8kOlwzi0bNyJ8m3ipIl0J0ax8+vVQunI1mOH9UbijS4CDaWtdiKyEQlH6Hf0OnLA
	k7jVhDxavPsyWISFubrhstvNeBTd2pZN5woH53LuE3EimG5FD/2zd9Sqprv0iZXo+05Vnndx/OKIT
	U8R2n08QyWIH777pUWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLiO-0039aj-00;
	Fri, 28 Jul 2023 11:33:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLiL-0039Zg-2o
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 11:32:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3178dd81ac4so412659f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690543975; x=1691148775;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvt6gTVxDn+2sUGsn1CSbJgPH86R0eTVqQfCu4TXUDo=;
        b=ihYG/3HHPl5FBpQ+akutSxXPgMXuWO0DzvVRM1SksGA8Z6z6pOdw0xIixvMEZJwJcd
         4Z9oCv17ECKWSDIarWP03zMzkLYWgMwcwhoxSSaT5GUpRNxEjtRo4EY8oOokfuAmg2K3
         X3bV9VHSl8t4uwTz1mse0RuhyVeDc9KRKdziDQTXDWRDJdS8WyXvQtCDSSpsLP63bbdW
         cOiiI52GZVUebGyMsG2X5E6fYT0OIJFnxGAXUetZKDydkrF3Wl2/fb0Wxp0Z75TVQh6T
         giWorb/o+3LTFwvzrenWwbszz2vm7NxrLdr+hhPHn+acqPkmYagZ70swmgFq3rn/3E7w
         YSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690543975; x=1691148775;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvt6gTVxDn+2sUGsn1CSbJgPH86R0eTVqQfCu4TXUDo=;
        b=g9wFwY7lIVZ09uv7blofKrhlPylbZhWXM93Qe4w1Qr7YEN7baj9OyGzMt+kmh2rKnL
         rslO4g4hyvle93hS8cwDfpzjvhfq6cXBja5zu25qXswUWQ2GnSw+g/9iemEjY9NnpjJt
         OzWSuuC+WXrvfJEtYXA36+zktwcEoD8Ub0h1pbi9/d7rNEJAKPZ0vYNC6gb6M+6ZOpSk
         /dNiOVKiRxn6r0gs1Nv2wKUL5pPPjnEzvXBS+v2GIBRXNLHHleindy8mJnV/ettyAOc+
         NING4coZoX/a6kcp8NVaS7APOJa0+ceKA0WVMhJxO43sNc9TaTICZi6M1QwtJXIfgLtC
         Pk6g==
X-Gm-Message-State: ABy/qLbtUOI71G7GVuzkMfFDE9XIExEqH9DF6LvOogv7FjGv/IyVFt76
	6wWvZFL0cJWykNqlyNVkY/uxPg==
X-Google-Smtp-Source: APBJJlGzFqci86oHnzgj2vDsZF3+rlLFEk6DPLtkPGOiNL5NezUh1WtcFdshRpGeLkVsg8nMnAV0bg==
X-Received: by 2002:a5d:554b:0:b0:317:6816:578c with SMTP id g11-20020a5d554b000000b003176816578cmr2003464wrw.5.1690543975603;
        Fri, 28 Jul 2023 04:32:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id y8-20020adffa48000000b003159d2dabbasm4575839wrr.94.2023.07.28.04.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:32:55 -0700 (PDT)
Message-ID: <75fb91cc-e505-7aa9-b90d-0b4d5c643b69@linaro.org>
Date: Fri, 28 Jul 2023 13:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
 ulf.hansson@linaro.org, tudor.ambarus@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linus.walleij@linaro.org, sre@kernel.org,
 p.zabel@pengutronix.de, olivia@selenic.com, a.zummo@towertech.it,
 radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, linux@armlinux.org.uk,
 durai.manickamkr@microchip.com, andrew@lunn.ch, jerry.ray@microchip.com,
 andre.przywara@arm.com, mani@kernel.org, alexandre.torgue@st.com,
 gregory.clement@bootlin.com, arnd@arndb.de, rientjes@google.com,
 deller@gmx.de, 42.hyeyoo@gmail.com, vbabka@suse.cz, mripard@kernel.org,
 mihai.sain@microchip.com, codrin.ciubotariu@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102223.265216-1-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_043257_904752_1809B697 
X-CRM114-Status: GOOD (  12.54  )
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

On 28/07/2023 12:22, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v3:
>  --------------
> 
>  - Fixed the DT documentation errors pointed out in v2.

That's too generic. What changed?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
