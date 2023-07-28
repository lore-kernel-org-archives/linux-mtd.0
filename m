Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E5DC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+lLlb9bIvPQbxc+e5ulF00VLaJtxJEuSLR7BNd8nVY=; b=W1RpEFiJimL3X9
	luoGpxtR2ShZMISvWe0ZTBSl/QVM9dDyAJ6DCJFW5O5p9Sbe1L5i4CnuQqi0g/+sWAql128JaxoX3
	5GfOKNo5tQlBRx2IiZzKoUkYUQZygOfzU8G9FRqtprrTNYdhkBfpjDc+gUfY813N+LUWh1sl7EcVC
	Fy5p7+HSSiXmwergVG4Yp0oxKCWz1LvktRMS5yjWJ43U0pk+2xOcGLDWCZ73/xQ69YDc/pw0DbN96
	vuqZgn00z1v/GVIQPOGFGGnUVegp3lr0QZ4cLVVfy0RzGmvBKplRQJne31EMMyVM/p68COPZMCZak
	DFtSGB+IMBuqKdpjfX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLhp-0039TV-0V;
	Fri, 28 Jul 2023 11:32:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLhk-0039Rl-1b
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 11:32:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso1866024f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690543937; x=1691148737;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+F++azjWGXR/zzwHylDS5zKIIkHfazjhU13uoVBCItI=;
        b=AMnkE9WuW7Szt2FbkP+Jy7gImGXicajY9/8nwcsWkrUwhvEUvP7ntHlB4esXk3K8U4
         0i6OvKn+5MRV/VvX72hQyI3+TxZnb6cRN+AlFwW7eoAEroux8iHcBnUojCtWchKA78jl
         SY5zsDpCGe7jFTiAVJefedCk62+1uRl1DCOGCwjHw3AcI7lBvwuS6yZmpan72Z124GkA
         HzuwDVmYWrxvejLrwD5DxuP7Te8Jagm+rkOkbxUiWNpEVTWGGoMyhL+3cuwlWbXGDr0B
         nKgA+tN0Fx8WjnGsZEpQTGxaPoJXDju/pS2BVUhj93heIIMcoWmwxaaXx1t90HNC7HAh
         LaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690543937; x=1691148737;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+F++azjWGXR/zzwHylDS5zKIIkHfazjhU13uoVBCItI=;
        b=i/fOxScscEdWMlnf3PujhPcPB/I1xzhGP3UgKnZjGe5HEgL2IfBnhiD84XhyAVXHun
         JTs0Y93s4ktInA7B4bhV69389cF8GzSOdqUxlwgfrnZKzz2V6xi7uJ34rN/p+RyPkTrv
         YRSob/l00uVUXpQZxbYMCMt1m49wWJfPtCBDiO0bAh3jvbl92d4bBKvdwc5uOWqdQs9g
         314sm1o5fnvlgCDiX6BDKItiUWbSvzoeMntlxOFLsN6zdAoGCQqAP4huKALZ1NWlYgt0
         voV27BxqsokfpK833bw6jBHn0ze2YSYlaI95Kx4f0GXEXFyMDvegfep4uNPoFTbmaSxV
         2JdQ==
X-Gm-Message-State: ABy/qLYSCICL16+fiu0rPZoUcNuIBD0ORe/2ah5XLARWdXQHGsTSOs61
	ZCeAqw2susB+EI3q1bpVkO/ljw==
X-Google-Smtp-Source: APBJJlGEkskLn7KheQI/2hh6B8RIJum6fk3h7Nk91C/s4cct7x2FxIqw26uj1lGmelJK6ucVYjt8Ng==
X-Received: by 2002:adf:e94f:0:b0:314:3611:3e54 with SMTP id m15-20020adfe94f000000b0031436113e54mr1907446wrn.9.1690543937250;
        Fri, 28 Jul 2023 04:32:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id m14-20020adffa0e000000b003177e9b2e64sm4508524wrr.90.2023.07.28.04.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:32:16 -0700 (PDT)
Message-ID: <c0792cfd-db4f-7153-0775-824912277908@linaro.org>
Date: Fri, 28 Jul 2023 13:32:12 +0200
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
X-CRM114-CacheID: sfid-20230728_043220_552940_512E2D75 
X-CRM114-Status: GOOD (  10.44  )
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

Your threading is absolutely broken making it difficult to review and apply.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
