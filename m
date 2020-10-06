Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E8AC41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 09:14:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B4920866
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 09:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHLavwAX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMV78gRf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7B4920866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yklKxNxyjI3cvr9ztMQ/ieX+agpLxNB9407OpsDZTVU=; b=oHLavwAXppC/xXbauJkCeJBz6
	PRwHglqSj83TcdMzjB7vt6qdWZkSyiYuQOE6++isfpSKBSe9pcDp8U1XgGvK0hML2T+C9sMqSZ2UA
	3Jy2Zu0twwx5XGaQrtQMXRJTBNnULNOl9ALZuOlkJBrP8bEjij4dL71BadbALmItTqGICdbo9/zEH
	g00yNOIXiDvjoKAILmh87iGrdzUDJo30IVMvPFdbQVPLgbVpBVyzRBezpYAYJi3yzWjgc2QAs7mOr
	uQaXt6ENxC8bcOYoLeR/7w7ZFYeJY9Ir4CC3T5alXt+eu2Hkq0VMMPvHyLjPma1TXnRJOt5s8Fe8Q
	cmwRZxOGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPj2D-0004Hu-Eq; Tue, 06 Oct 2020 09:13:25 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPj27-0004FK-8m
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 09:13:22 +0000
Received: by mail-ua1-x944.google.com with SMTP id j21so1646022uak.5
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2020 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dDgYnCSpFzq6wD68V8dBs1dGtEohkus4tfFLo0MV6k=;
 b=mMV78gRfUiTX0Fhq7sbtPeAZE51FANqXe2ffb+yEjr5QoeawgMMwQ8XSrhilmLvHtx
 sEQF9fUq5Cmu8qOzxjbqa7RQXLkqpoqkoe++HcWkcaLYHbckkwjq/ue7xT3XAD7Uwx43
 V06RGxgjHInxMdw3DBkk+/9rjGYrV+FnbFAksujQ3/k0njBC0ztFm62WAFNts1zyT9yx
 oCohLIW+tNgNLvhP4H4CyiMr4WGBCs1Zex5WjzDVN9v47A0drQeaNuCYVRG5QCA6OMto
 TQSAPGix4TPbAEDvrfDxLrnk+h7EjMNps8LmL2KLypfVwnIUdvEC6slFmF9jTy6w85lq
 wAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dDgYnCSpFzq6wD68V8dBs1dGtEohkus4tfFLo0MV6k=;
 b=ViQA0z7uJ6NbGtfQoFh0Pjn14rCnj1PmrK/WkOOG/jrUzyoiZeJSL+RMveL4AJOZte
 dyrpi9ncWDpA8NMUs9ZpZ34Jr+7QdZ8fcRSh8HeXSP4mW3o/ptwEdzLDb9N05681Ual+
 8Xo+ca4KRwhHKtcT2UWRBNHSvNKwNy+hXCanYGE58mqS2jjvCTj3kz+nngDzvKVhMjW/
 Wqsdz7Ym2S72l5N5r3ZYEmkNgaMaqhv6foYuxGWxWGlrbNNyEnwLYLze/d2V6K0yfjOS
 yE2R65qrlKd3gIOfen77bsigwMnM0tITJqPn5Rc2/vXh235HCByEbZGEGDXJMUzYMTwX
 8CKA==
X-Gm-Message-State: AOAM530chqWsLOAT9pxHTZN+XfylBuMF7ODUrGRq5RYq6S9d8LUOVvCt
 Eq7htSixYRvFLaeVE1sfGTvZGVZo3fc1igbVUf+csA==
X-Google-Smtp-Source: ABdhPJyShwqC7yW6UgNo8q98koC+vDiOR29TMFNqADEMu067y863m4dqGu1r37N7vNMGC6BIcV2u4BNvWr4WQc/Y4R4=
X-Received: by 2002:ab0:130a:: with SMTP id g10mr2309765uae.100.1601975596602; 
 Tue, 06 Oct 2020 02:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Oct 2020 11:12:39 +0200
Message-ID: <CAPDyKFqMic9_3OBvSWrdrXonDjeC+8kjDobTunijxvL6gYDPjQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_051319_389291_EF312BF6 
X-CRM114-Status: GOOD (  19.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Linux USB List <linux-usb@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Linux PM <linux-pm@vger.kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Richard Weinberger <richard@nod.at>,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 at 20:38, Rob Herring <robh@kernel.org> wrote:
>
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.
>
> 'unevaluatedProperties' is appropriate when including another schema (via
> '$ref') and all possible properties and/or child nodes are not
> explicitly listed in the schema with the '$ref'.
>
> This is in preparation to add a meta-schema to check for missing
> 'unevaluatedProperties' or 'additionalProperties'. This has been a
> constant source of review issues.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  .../devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml        | 2 ++
>  Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/owl-mmc.yaml           | 2 ++
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml  | 2 ++
>  Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml         | 2 ++
>  .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml  | 2 ++

For mmc:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
