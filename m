Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C81C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:40:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC6A205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mn0lW/z9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC6A205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1nAuVqYScEGrLpatx6vA6E8wIONvPIMus3C+HL7img=; b=mn0lW/z9yFZP7xdHEPTs+SilN
	O9etoCxF4tI8fmpYbm0ZL0fhG5kIJdTYTszZLoRVSPeZpv1gRArPfZHZiAGFPBwe1hkdvh/dTEksx
	L5DMLXxHEuqBOfwIFHqTxnt25+YFeIB16JNoW566gaKPY9HT6zvhVggvah3cSce0EraRsxk00wXuG
	qJg/W6fzL7QdDQmirAx2nCTzcVoJVJ45I4SDhUYK2XI02a7zAR2xDRhMFIt3uhSQyfEc7xciDbldi
	DSUblLajewq2i8/udIoNtJVKO4gSahX431BTA6JbI6M7vfiYNqSQcQxpaGLmoJI0ItIDnQm55Usk8
	ICIvrfoyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOs7-0006rC-Ha; Tue, 25 Aug 2020 02:39:39 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOrc-0006Zx-FF; Tue, 25 Aug 2020 02:39:10 +0000
Received: by mail-il1-f193.google.com with SMTP id c6so9113224ilo.13;
 Mon, 24 Aug 2020 19:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fL7pWD9A8RK0B1OZrOzwtZdS/77nrhwq1dxpG8mipBI=;
 b=DeZwpPBjNrB289f6F/w+dNlJjHXY6unq1gXNSHxgkAxNYxpAfWA1FNlqgF5w/akKVT
 CDSHJy5vlpyjgirdT/gIJgFuxqNI61Udoej6QaWi19YQMHNBCSJL4IXLjJ7PERgE24lV
 CO6cSOelWXY470hTohC1EyCOHoK2TRB8GuuHkqgWgsGTKFt7CXQEXQlZUCOSD9iwwnGS
 VP4fxHeRmz2wQxjRMTcz7cebMe0oz28vwO1Lrk9rk4Y6U4LiUW5WudzocLXDgh3XBSBd
 fGmXDvml2c2W/CTRKYxiprgKqx9rXLh/9OXS4iws+6VkAwYBcWGtDaqeR9tA4HIW6rCF
 u9zA==
X-Gm-Message-State: AOAM530AQ8Gf4zpcRdC09iNgAQ7B0FfRPoBPYqlp0OjLuOB5cRvTBshN
 bz3dvWOOohwp0VXjFPNvPg==
X-Google-Smtp-Source: ABdhPJzaBBWCv3karwrLTnFh+xW6JHFxPv6HuRRHM0izCtfP5onAJPkVfTMYNXVMmjyBAU8SvZKZrw==
X-Received: by 2002:a05:6e02:ef3:: with SMTP id
 j19mr7354144ilk.88.1598323146707; 
 Mon, 24 Aug 2020 19:39:06 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id u124sm7809640iod.20.2020.08.24.19.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:39:06 -0700 (PDT)
Received: (nullmailer pid 3838650 invoked by uid 1000);
 Tue, 25 Aug 2020 02:39:04 -0000
Date: Mon, 24 Aug 2020 20:39:04 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 13/19] dt-bindings: nvmem: imx-ocotp: Update i.MX 8M
 compatibles
Message-ID: <20200825023904.GA3837236@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-13-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-13-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223908_888390_FABE7075 
X-CRM114-Status: GOOD (  18.82  )
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
 linux-watchdog@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 06:26:46PM +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs use two compatibles so update the binding to
> fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000: compatible:1: 'syscon' was expected
>     From schema: Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
>     compatible: ['fsl,imx8mn-ocotp', 'fsl,imx8mm-ocotp', 'syscon'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
>     compatible: Additional items are not allowed ('syscon' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/nvmem/imx-ocotp.yaml  | 39 ++++++++++++-------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index 1c9d7f05f173..b5b250185afd 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -19,21 +19,30 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - fsl,imx6q-ocotp
> -          - fsl,imx6sl-ocotp
> -          - fsl,imx6sx-ocotp
> -          - fsl,imx6ul-ocotp
> -          - fsl,imx6ull-ocotp
> -          - fsl,imx7d-ocotp
> -          - fsl,imx6sll-ocotp
> -          - fsl,imx7ulp-ocotp
> -          - fsl,imx8mq-ocotp
> -          - fsl,imx8mm-ocotp
> -          - fsl,imx8mn-ocotp
> -          - fsl,imx8mp-ocotp
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx6q-ocotp
> +              - fsl,imx6sl-ocotp
> +              - fsl,imx6sx-ocotp
> +              - fsl,imx6ul-ocotp
> +              - fsl,imx6ull-ocotp
> +              - fsl,imx7d-ocotp
> +              - fsl,imx6sll-ocotp
> +              - fsl,imx7ulp-ocotp
> +              - fsl,imx8mq-ocotp
> +              - fsl,imx8mm-ocotp

> +              - fsl,imx8mn-ocotp
> +              - fsl,imx8mp-ocotp

Should be dropped.

> +          - const: syscon
> +      - items:
> +          # The devices are not really compatible with fsl,imx8mm-ocotp, however
> +          # the code for getting SoC revision depends on fsl,imx8mm-ocotp compatible.
> +          - enum:
> +              - fsl,imx8mn-ocotp
> +              - fsl,imx8mp-ocotp
> +          - const: fsl,imx8mm-ocotp
> +          - const: syscon
>  
>    reg:
>      maxItems: 1
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
