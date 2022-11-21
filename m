Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993FCC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sonDFoybVjHDsAOK+UMcmM3pKYsWrucZvrBXif3ynpw=; b=HLxspd9EbLe8Dx
	acimIAQyCMLfkK+qKSdu/tfeu9XjVtE/4cEKfmAha5sy1aDd1FKWca9wEr42SPohASR9ij3drIxkJ
	VfIDdHU8VnJS8C7I9ho0xzsKB38yEjGSOcSmvJS4PXsr7E2+zc0nPEX+knklBrr+MgflpyOaofyUN
	9XYK/QcEjSwuc/vBcoigO1gx+m3uaJst6cxKk3ivT5LlNxaaDgb/x8Zqphyqb8SlmO+MUBENvIBo7
	4yfc0Kyg/ktYFxJKP7ikZPC9iSxs7ByR1PLXBcu/NmI5Y1OcbWR/x1ZT7ahZ+3S5Pog5xNve5n46v
	FI0mYcifH6ylS204BqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6ve-00Dyyb-Vp; Mon, 21 Nov 2022 13:33:43 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6vQ-00Dysc-LS; Mon, 21 Nov 2022 13:33:30 +0000
Received: by mail-qt1-f180.google.com with SMTP id h24so7196041qta.9;
        Mon, 21 Nov 2022 05:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W52hjy2XgXbLvoau/TZhYUdh0mFs9ky77EejBWrKJL0=;
        b=4seFYRiDw1h1n1Dr2TaTKoMV3ZQDjeoh4h1/JI+NV4oQSA4PG8pBojMvHAmCwZuXzC
         K5abSVdUQXsv8Mr1oJlo1EXLF866gp+J1Bvhe2i7CYb/McybAcElx5sSf/+ufEFahKJY
         UaM2YaT14vY1lkO8EvqCYiEq/bMWciJ7zlNbC/8lkSB4kXXWN+bIouwQQSv0cUCX/WDj
         jgUgt5HJp3CLNg84qDoYl9h0D6xwGQqEZ4iW4wIMrjrw6Cx/A34ZvkLQ7CGlCkMTLnSQ
         kHeXNmvaUNISHB4PIkZgoqziv6G5JhjvrqAKecG4QvTb+OfLwVCISpQXa6ipK4T7hByv
         Bo2w==
X-Gm-Message-State: ANoB5pkQ30Y9fG1NgFozLI1pUThAaT3048mhTg8QEvVAOCOujG4L7a++
	bHFL0U+SkFdNLyFoTedI5tC2HRQfyzmhVQ==
X-Google-Smtp-Source: AA0mqf5EjdBzSHxxXIOYOrGouDAMnsr55bUUz3sGc1uoaDYN6/m5ICXQh99yD25B8BJLsQbL62hYag==
X-Received: by 2002:ac8:5148:0:b0:35c:d017:2fd7 with SMTP id h8-20020ac85148000000b0035cd0172fd7mr17177071qtn.579.1669037605551;
        Mon, 21 Nov 2022 05:33:25 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id bi40-20020a05620a31a800b006f7ee901674sm8123082qkb.2.2022.11.21.05.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 05:33:23 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3938dc90ab0so94275407b3.4;
        Mon, 21 Nov 2022 05:33:23 -0800 (PST)
X-Received: by 2002:a81:4f4c:0:b0:357:66a5:bb25 with SMTP id
 d73-20020a814f4c000000b0035766a5bb25mr17212924ywb.383.1669037603130; Mon, 21
 Nov 2022 05:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2022 14:33:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtT3=F-3XLb604VUvKxNQBWK1y0rMnMn0kASKjQGw=3g@mail.gmail.com>
Message-ID: <CAMuHMdUtT3=F-3XLb604VUvKxNQBWK1y0rMnMn0kASKjQGw=3g@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: drop redundant part of title (beginning)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-watchdog@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Viresh Kumar <vireshk@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_053328_716785_83B15394 
X-CRM114-Status: GOOD (  18.51  )
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

On Mon, Nov 21, 2022 at 12:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
>
> Drop beginning "Devicetree bindings" in various forms:
>
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD]evice[ -]\?[tT]ree [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
>
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
>
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD][tT] [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml  | 2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
