Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7B0C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:42:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 354BF205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6nxC/Id"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 354BF205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4KgNbagu6NzH1YOhQJGWNOJLDsvD+QKNllDFeCFyIIc=; b=c6nxC/IdX4hOKiWGSKYdnHWJ7
	oRq2yp+3ZxRJ7361woyvgEbelKr+rY5qns7Dfqak12JopyJZa0YPDqqKbm27RKIMpYPd5XG2ZXHx3
	+9nfHAFHKY7gcllZzXAWCvW/k6LmuKbpM6rK7DUj/Vc9p9XmKcHtamfPxVT0n5wlo8WSJUTnZ8rO6
	lT9Fv+uakvbNhpPfVnUDiUbgailrvEPYqaipf6OuoqwzOXNrdn1ihTiUKbPjKuRj5i0cAnsv39Mvd
	0jpemDWhJPsyuBAR+DouYkFU8N1FRNCDDHOxN6DxQ/P+/jYAW6xkuHOGopJmj8frmBK2Y9xbhBXye
	u1d7oOKdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOu6-0007vU-6I; Tue, 25 Aug 2020 02:41:42 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOt5-0007NW-Ca; Tue, 25 Aug 2020 02:40:41 +0000
Received: by mail-io1-f67.google.com with SMTP id s2so10979481ioo.2;
 Mon, 24 Aug 2020 19:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UQ2hLW6/XM8wAoxs0O7Nm1znUzzf1rrbvS6JihVkfWQ=;
 b=J7uH+TL9rxRWO3IRdtI6n48uy/v3XqYq1BjQOZEzfR+2dWJpaEn3K+bQBikz3+zX6I
 8vLcegSIeJeUmM2Y2bG/f45zJXwLqefZybO6GGzkAUDJCqhx+tobNq2VP2Xv31nc7jxK
 NSXeQfO4kY6FJU0Q1YBrEvWyV3NcX+2wwdujxa+L7qt5ajFShixLQG3HTF7XsO57/Bhg
 jgVqPFnyCwC4orxlNm+jCWtTIQOpmRL+7u0IEcw2JtuP98g1+tsvjP8BMQltj09PDqAb
 /Wh0n8zvqHj6tex0HNVppzWt8KrEWWvpB0LpTuGh/SSUXCGQe7ROCFidfJE+Q2FVCcl9
 EfrA==
X-Gm-Message-State: AOAM533/YAOK3PuxJXz1zK07xHgV0rLa6EGlxvKpgYkj0uKfTMt29065
 LWGezrzdTClLFGLw0xZY9g==
X-Google-Smtp-Source: ABdhPJxcHhPUemDUv3L0K4zuzSRRqDBK2CcHIo0/ucbYHbJd48+24WJeszkwdFAw2ND+cRYclyTSJQ==
X-Received: by 2002:a5d:91d4:: with SMTP id k20mr7667901ior.9.1598323237476;
 Mon, 24 Aug 2020 19:40:37 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id i11sm8194712ilr.47.2020.08.24.19.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:40:36 -0700 (PDT)
Received: (nullmailer pid 3841340 invoked by uid 1000);
 Tue, 25 Aug 2020 02:40:35 -0000
Date: Mon, 24 Aug 2020 20:40:35 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 16/19] dt-bindings: interrupt-controller: fsl,
 irqsteer: Fix compatible matching
Message-ID: <20200825024035.GA3841215@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-16-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-16-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_224039_591363_4598B366 
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
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Will Deacon <will@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
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

On Mon, 24 Aug 2020 18:26:49 +0200, Krzysztof Kozlowski wrote:
> The i.MX 8M DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-thor96.dt.yaml: interrupt-controller@32e2d000:
>     compatible: ['fsl,imx8m-irqsteer', 'fsl,imx-irqsteer'] is too long
>     From schema: Domentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mq-thor96.dt.yaml: interrupt-controller@32e2d000:
>     compatible: Additional items are not allowed ('fsl,imx-irqsteer' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/interrupt-controller/fsl,irqsteer.yaml       | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
