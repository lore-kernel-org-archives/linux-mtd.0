Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA558C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:33:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87072205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VW5BYejt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87072205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zcw4v441Poh0m+5m158kB5wLDDEE6v5zepsoLIKlMvo=; b=VW5BYejts5sr0RwuVVhXX/KCo
	DIcDXnDtJz0B4kj6QU/yCzN1ThpQePdnC662VHvRmCwct0+e2fZpSAPdUi+9qRyxycY6YMjEmKP9t
	MC6uzqpcTDd5N4dEmBzJaBQW4LY3Nu0cQW5ou6mtg06MskakUiHInjtEG5UogLBd+l2A9qRMe1iHk
	ygAguCUVuzDPqnFC4J4ZqaXVc5ZqGcg7VL4gIH+4u1mAUAmR0Lb7BxDQ7HCuw6G4J9LOmYqqRSV1J
	tRepygmHV9k6flJj2jNJUsBmYVAFQ1DyMQymefQVQYY9Q1S0T8oGQkWfr7JF3NQB7g0WOkeYRl7bM
	DKT/87pEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOlJ-0003Sc-NU; Tue, 25 Aug 2020 02:32:37 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOlE-0003Qo-Va; Tue, 25 Aug 2020 02:32:33 +0000
Received: by mail-io1-f67.google.com with SMTP id h4so10946284ioe.5;
 Mon, 24 Aug 2020 19:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S7KciK30hDT4IlL7lDKGSYcOlh8cg0x0DxyNMRO7d9s=;
 b=iWy9s1e472H+vZR4uJVTKRbO45MUCz9/EGbZBVHQP8dTiS4e5IZJLs9gDW2CxXfYCZ
 DSw0tOIVPnGUdsQ9jFU9fvtQKs7XATFXeLTaaP+hoMHFpUfKIntWXmQho+vjbtOL08dN
 eplQk8jhiJZXLptZyif6iAuWQin0PMm4pZB1iSjg53mQMYOzjIVw5WHV1BR4UzX4jfDM
 L5jR+l/kMJFOLzgpgS3qpT/yNEf5fke2EYFdSxzDBToZj87CBxjwSUWQ+wOpXuzHzul+
 BpM6SojrqmgEGXCN+8ZA5RswxmTeCQFMGK2jTn71npoh1s38E0WF3aKOdFaUuKuPAu4h
 pa2A==
X-Gm-Message-State: AOAM530txIK4jqbaHei+9D8g+nyCCb/M9eGWzGTJr1+asVr26LPOo/6v
 9TCiKm5FdIl8GhXUKseI3w==
X-Google-Smtp-Source: ABdhPJyfnrC4tnlsuKbCBqgnhoTbJuRG/yfQAT84rblWL1SmBAkv4OCRcUi6JkOfCOiyBjBdYvAh4g==
X-Received: by 2002:a05:6602:13d3:: with SMTP id
 o19mr7442287iov.32.1598322752468; 
 Mon, 24 Aug 2020 19:32:32 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id q133sm4299314iod.38.2020.08.24.19.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:32:31 -0700 (PDT)
Received: (nullmailer pid 3827162 invoked by uid 1000);
 Tue, 25 Aug 2020 02:32:26 -0000
Date: Mon, 24 Aug 2020 20:32:26 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 02/19] dt-bindings: gpio: fsl-imx-gpio: Add
 gpio-ranges property
Message-ID: <20200825023226.GA3827096@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-2-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223233_027574_A8156850 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Will Deacon <will@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:35 +0200, Krzysztof Kozlowski wrote:
> The GPIO controller node can have gpio-ranges property.  This fixes
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
>     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Remove maxItems
> ---
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
