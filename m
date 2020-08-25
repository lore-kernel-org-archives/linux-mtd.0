Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0B5C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:44:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40313205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NmF9h6sP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40313205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d3FgeJAHEzQYMZqiKDJCUcnPt7CoeigH1y6bnUcPDjo=; b=NmF9h6sP2FxmGOk8nlLEWbgxG
	xUWDDBQyMzFvjYnUt9oLphzGLr/Pt3g160Y2H9C04mg24hvqGZlEK1ZiU8iq6k4q3pW5iOxwBr1RX
	wTf2q2TgNlufi8HkDL0hkMrKBpQI6F0pttgwcXmeFueDfLBcIm4rjXypoGS/vJRg8Q4bRShUDQnrC
	YJ3Tr9aJ+zyNt2J6ACvZj5U21V764ufUaJTMIQP87VDQFvTfFnbRugE9HZPHLeEWWBtCPXooqt9AW
	zInDnyJOTF1kfM71NUj3yjX5GlHXMYCRdDwRY/gkC8cdpxaf+Uu2tgvcaSvsdeJTyNmp8BivPWGrC
	oL7OPVM4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOvr-0000Zs-Qu; Tue, 25 Aug 2020 02:43:31 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOuu-0008NG-Lh; Tue, 25 Aug 2020 02:42:33 +0000
Received: by mail-il1-f196.google.com with SMTP id t13so9132667ile.9;
 Mon, 24 Aug 2020 19:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/WdM/o7ZMD0IqugYhx8lyxEOEFTESZXMB5cmr4fyzog=;
 b=uUzQIgdtFBwaY2ubK1uduKDdWqdOYm0Ey/FKVQRLlC9PtgDtVcBkkmFzbdCf6jbljC
 /syD3AV7uaRcr7jreN5C0RA+kCfel0EgthUqdg0aCz0YFCmdgLa5/p/7GkhBy6sBbDQX
 Yj5okglqphoNZqufBQvY/CUqmF7JVaSImUHLSrMKNqmhhUHx7Ba1E5/g/D0W/9vJwXuL
 x6x6Bb5mEt2dqUxKVkSjnskyfRMhlB+Apl9yGz9KBwAcU4ILIWY2ddkI9zpEtQfyNrvI
 FEwI1q0QLxqr3MFkZar+Yy6xBZ+J3yHIoJBaRC6kgDx1G7aaOjSR0qKcTtYbMjUUK6aq
 E2iA==
X-Gm-Message-State: AOAM531IVWcj7wTGDdEVTWBi6TvpIa0aZE99ykFsIP6T+RaM8H9vtVMw
 /qxRg0e4nBCoiRoQ8mDDdA==
X-Google-Smtp-Source: ABdhPJwidQ7yo/gzPK50UABO+YMGeGvK85w0t85XXeOwlGQeq2eG79hrcePzshy++cECjBr5Fj4wfg==
X-Received: by 2002:a05:6e02:cb0:: with SMTP id
 16mr7178015ilg.147.1598323351719; 
 Mon, 24 Aug 2020 19:42:31 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id 79sm8642555ilc.9.2020.08.24.19.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:42:31 -0700 (PDT)
Received: (nullmailer pid 3844411 invoked by uid 1000);
 Tue, 25 Aug 2020 02:42:26 -0000
Date: Mon, 24 Aug 2020 20:42:26 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 17/19] dt-bindings: serial: fsl-lpuart: Fix compatible
 matching
Message-ID: <20200825024226.GA3843643@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-17-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-17-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_224232_844388_AD77E3DE 
X-CRM114-Status: GOOD (  18.21  )
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

On Mon, Aug 24, 2020 at 06:26:50PM +0200, Krzysztof Kozlowski wrote:
> The i.MX 8QXP DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
>     compatible: ['fsl,imx8qxp-lpuart', 'fsl,imx7ulp-lpuart'] is too long
>     From schema: Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
>     compatible: Additional items are not allowed ('fsl,imx7ulp-lpuart' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch.
> ---
>  .../devicetree/bindings/serial/fsl-lpuart.yaml | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> index e82c2cf9fef7..8ee651f2ef0b 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> @@ -14,13 +14,17 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,vf610-lpuart
> -      - fsl,ls1021a-lpuart
> -      - fsl,ls1028a-lpuart
> -      - fsl,imx7ulp-lpuart
> -      - fsl,imx8qxp-lpuart
> -      - fsl,imx8qm-lpuart
> +    oneOf:
> +      - enum:
> +          - fsl,vf610-lpuart
> +          - fsl,ls1021a-lpuart
> +          - fsl,ls1028a-lpuart
> +          - fsl,imx7ulp-lpuart
> +          - fsl,imx8qxp-lpuart

This should be dropped.

> +          - fsl,imx8qm-lpuart
> +      - items:
> +          - const: fsl,imx8qxp-lpuart
> +          - const: fsl,imx7ulp-lpuart
>  
>    reg:
>      maxItems: 1
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
