Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B2BC433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 21:40:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871992080C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 21:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2vJ9aClX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871992080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=66Z099wMXYNcKzq01QpzSPiW+IYD3RU13lLWlXdXMPM=; b=2vJ9aClXm/gBQevH+46AzQV2w
	0wNRCMEhBImZ4IrlOLy2iCQF4OpuVr6y/Wpu2QQN962EGkZdydr4WFKcp7hGooVJHEZvj/6fPGhX9
	JpVavDwMAN2QgkSqEcrdgB9rvzWJPeVnptpuF9LJni4rnwE6quiCCio7drXS7K6hHLglBINvsPNm1
	4kvUN2nbQPxwsun4pk01i/PXWUv53pwXN2WtpM+Vq2JMBNiTGl+oqIvwl5ywxxm9Sedy1Pnbg7H35
	we5AuHjMZ3qMRyDs1O4b/cATurCHqhYBlLDktKgQ+t+BjUqcL6gk9eIoe6YYEC+Hx0yRx7qtuz+bo
	N/6hEDtSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBm5K-00075S-Q5; Fri, 28 Aug 2020 21:38:58 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBm5G-00073i-S8; Fri, 28 Aug 2020 21:38:55 +0000
Received: by mail-il1-f195.google.com with SMTP id k4so1881345ilr.12;
 Fri, 28 Aug 2020 14:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z9aNuFEY8MHLzwmbgIdHHAKZXLe3aQgkptJsyFL+HWw=;
 b=JzSewrKskixMoomG+EDX9GM8FzqTDy0C0ZtO9xbXNGk0T5rufPbe6zBW1Ec9tM3giR
 tmBvLUlVHAgvULSnrGwWuQg3a1WcNPID8LwKf0NFUnyhYWpiVzyuhLvRI3DCYDSwk8Ta
 mF+UGK3AMToa87vf/qSZR/uqFOUKHYPCHBnecyJk6W5VLfVc/2CJpCqKEB0opaoGSugu
 YUW4JKtYz1mxq/AetbqYNzaYgqbeFLz5YZ7SmwnaQKRZ+6Egmh5t5oy/yy9B2/9sdZK+
 AjZJ7P3KAFtgwuaZd0mUkeMasFrESr7QyQGzJ21RXDeS5W3FCKZ0uvcHZeXQvlBhY7ou
 +tCQ==
X-Gm-Message-State: AOAM532B4J/zbCWrSAhSAW4Lnx/lSe5RYmLQ7zt0rO+9NHPbJUpFYjNJ
 mg2ZrYepGjFPyIAbVDNHaQ==
X-Google-Smtp-Source: ABdhPJzS3P2Iz0zwjThn5mGNinrojy9M8UeF8yi+ZuR6dvHqFhATIGtKUGFyG79NQ/sI23b+DIN6qw==
X-Received: by 2002:a92:79ca:: with SMTP id u193mr669859ilc.185.1598650734133; 
 Fri, 28 Aug 2020 14:38:54 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id a9sm224951iol.9.2020.08.28.14.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 14:38:53 -0700 (PDT)
Received: (nullmailer pid 3445893 invoked by uid 1000);
 Fri, 28 Aug 2020 21:38:50 -0000
Date: Fri, 28 Aug 2020 15:38:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 12/19] dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8
 compatible matching
Message-ID: <20200828213850.GA3444012@bogus>
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-13-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825193536.7332-13-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_173854_984451_7004B7A7 
X-CRM114-Status: GOOD (  13.79  )
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
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 21:35:29 +0200, Krzysztof Kozlowski wrote:
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
> Changes since v2:
> 1. Remove moved compatibles.
> 
> Changes since v1:
> 1. Handle also fsl,imx8mm-usdhc and fsl,imx8qxp-usdhc
> ---
>  .../bindings/mmc/fsl-imx-esdhc.yaml           | 37 ++++++++++---------
>  1 file changed, 20 insertions(+), 17 deletions(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: compatible: ['fsl,imx8qxp-usdhc'] is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: compatible: ['fsl,imx8qxp-usdhc'] is too short
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: compatible:0: 'fsl,imx8qxp-usdhc' is not one of ['fsl,imx25-esdhc', 'fsl,imx35-esdhc', 'fsl,imx51-esdhc', 'fsl,imx53-esdhc', 'fsl,imx6q-usdhc', 'fsl,imx6sl-usdhc', 'fsl,imx6sx-usdhc', 'fsl,imx6ull-usdhc', 'fsl,imx7d-usdhc', 'fsl,imx7ulp-usdhc']

	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml


See https://patchwork.ozlabs.org/patch/1351360

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
