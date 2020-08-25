Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E588FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:40:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC7020706
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHCkXWu2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC7020706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Wc5Uqig4CKF2m6pufCiGyJS3lYOCGRBCZ/aLdlvUlM=; b=hHCkXWu2F89N6t2F+fDNszo/A
	qi+uAV68uqNbBykrIBoURDOUqqd8ZIk4chOewQswzV9DQPnTbhyW1fnZ6goifwkWJ5XHgeRNKQVlX
	X9gyUGKa4a9V9Thi3gcm6ISLVe9a4FteA41MvOwTaz4BwvHvYvfsgi6Yfx0mVQZHQ00cE0r+cKR17
	Gagna8gKxBDOLgh2hH/BPiI7riKdlueNLChs84psqnAJx+YHjOoki3MF0iI/tdYurDok4tiFU42Es
	E8VHaGdczf4wi15hR1Btc+5+6FSg7GAOSmm45jsgf38KVVr+lJ0SRvjYivnNoTLA9gB+5JfC8Hmf+
	jopkgTeNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOrN-0006Sh-IO; Tue, 25 Aug 2020 02:38:53 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOqe-00066C-BM; Tue, 25 Aug 2020 02:38:12 +0000
Received: by mail-il1-f193.google.com with SMTP id q14so9159025ilm.2;
 Mon, 24 Aug 2020 19:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vHuWCZoFM8KEH9OXdGLnKVh8KdDE2ghgJSP6XVVfi1k=;
 b=TSv/A7GHfA3gNfz7VSs/NNw6y5cHjDL+TdTm1OyVMu8mE40qNfUIUdmhRh21eRhyL3
 WWVGwWNj8VxVdnZBmu2wwuLsoSXi7Bt03PwWssvaa0vre6i72QxGO4PIQhjua7OZB1ZM
 jHgm5w4U08zxeqWFCcZLT6crBcii3wmr7fv+wPZ3F9FxKUwhC2qEUOEVd5jqPJd1ML5g
 IIltnojOAmADgen2oaWAExQZAFmMlsZyGdOrMwwbqH8YC1FsWx3Xwd/RnG9a7xAYshHN
 ThSkPYTZKB2ED/KSNfrkoeGXjVEoVIkUOE/z5jGclXlJSC4v30ulG5VB4KsZMpNUdAGK
 /aKw==
X-Gm-Message-State: AOAM531dSjHHPqN7JGc78Th6dVXY+pb92ALWAAvVp0Hx2AWXuUMzeE1M
 A2P38BV4WFaFuG1e6kiM0Q==
X-Google-Smtp-Source: ABdhPJxyDT616uQdPaHejXQOiu9bcoPn9AkiEkg6Sluynt9CbmKjrnrd75RY7Yu+d7MHI+Z/K1B02Q==
X-Received: by 2002:a92:5209:: with SMTP id g9mr7627159ilb.72.1598323085959;
 Mon, 24 Aug 2020 19:38:05 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id c12sm8217104ilq.79.2020.08.24.19.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:38:05 -0700 (PDT)
Received: (nullmailer pid 3836883 invoked by uid 1000);
 Tue, 25 Aug 2020 02:38:01 -0000
Date: Mon, 24 Aug 2020 20:38:01 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 12/19] dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8
 compatible matching
Message-ID: <20200825023801.GA3835035@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-12-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-12-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223808_612604_7C984D93 
X-CRM114-Status: GOOD (  18.91  )
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

On Mon, Aug 24, 2020 at 06:26:45PM +0200, Krzysztof Kozlowski wrote:
> The i.MX 8 DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
>     compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long
>     From schema: Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
>     compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was unexpected)
> 
>   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: mmc@30b40000:
>     compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Handle also fsl,imx8mm-usdhc and fsl,imx8qxp-usdhc
> ---
>  .../bindings/mmc/fsl-imx-esdhc.yaml           | 40 +++++++++++--------
>  1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index 10b45966f1b8..54f05e2a4246 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -21,23 +21,29 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx25-esdhc
> -      - fsl,imx35-esdhc
> -      - fsl,imx51-esdhc
> -      - fsl,imx53-esdhc
> -      - fsl,imx6q-usdhc
> -      - fsl,imx6sl-usdhc
> -      - fsl,imx6sx-usdhc
> -      - fsl,imx6ull-usdhc
> -      - fsl,imx7d-usdhc
> -      - fsl,imx7ulp-usdhc
> -      - fsl,imx8mq-usdhc
> -      - fsl,imx8mm-usdhc
> -      - fsl,imx8mn-usdhc
> -      - fsl,imx8mp-usdhc
> -      - fsl,imx8qm-usdhc
> -      - fsl,imx8qxp-usdhc
> +    oneOf:
> +      - enum:
> +          - fsl,imx25-esdhc
> +          - fsl,imx35-esdhc
> +          - fsl,imx51-esdhc
> +          - fsl,imx53-esdhc
> +          - fsl,imx6q-usdhc
> +          - fsl,imx6sl-usdhc
> +          - fsl,imx6sx-usdhc
> +          - fsl,imx6ull-usdhc
> +          - fsl,imx7d-usdhc
> +          - fsl,imx7ulp-usdhc

> +          - fsl,imx8mq-usdhc
> +          - fsl,imx8mm-usdhc
> +          - fsl,imx8qxp-usdhc

These should be dropped.

> +      - items:
> +          - enum:
> +              - fsl,imx8mm-usdhc
> +              - fsl,imx8mn-usdhc
> +              - fsl,imx8mp-usdhc
> +              - fsl,imx8mq-usdhc
> +              - fsl,imx8qxp-usdhc
> +          - const: fsl,imx7d-usdhc
>  
>    reg:
>      maxItems: 1
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
