Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9579C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:37:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87099205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Io+yHDvf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87099205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FfY0ujXhA7SZZdh360DxcaAICHYrcXM8jaygyiSj/Yk=; b=Io+yHDvfXyfIzRulE7t9cpvMq
	S39cNBHGNH6Wl1UhleS0sWDZKbHvDQf/pTcn8CV3ga/4KPkkFCbAhdppVmwFsmp4IBStc/PekUthd
	bZy/sJTHT6OfIeQlQms9h1RdjV2ZLnVmVztHOaQfBzndBatGNcq1q3A6/IBHTEGFxcSMcvv0r/GqE
	AvP73fScc9fc8NY/0zKp2OXQP/imOedBwyMrUw0eFHd7fy9zqTqyXlXU6sxD13MiDiAH6ebPSDc6U
	Hv/crZ+I8mRbvQ/0pGETvrWHx/XHV7y9RfsI+NcJJ9vYRKN7HceS1cQK7nCIDa2Cs6nQJjr/wNG5z
	fdnvixUBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOpR-0005NV-08; Tue, 25 Aug 2020 02:36:53 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOp4-0005CC-Tl; Tue, 25 Aug 2020 02:36:31 +0000
Received: by mail-il1-f194.google.com with SMTP id j9so9124737ilc.11;
 Mon, 24 Aug 2020 19:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K8h9Jb3PzDvqOlcr8sfXes3SPhzFbbE8GYhtrBX5VUM=;
 b=BSw7mVXuyJk5LKl7SW1dU1iPc5dTcxA+qkxdM5iLfoZDWoOqT7+RM3ctlrxw7m9n4l
 /549x6gtgjHLhv42umJeNJmrHNyMLqEA2/IywNNYQgidJng5sWwiEcm6rkSMYCyRDruM
 +Ad4U9S4LmDUyppQUgdR0qzjbGyTUNEK4n2hV5a6iJaK/7o0hZThSPp5lMNZl7lTedzq
 i8Yi8qQeOqJnt8nCO81649z0mqV5OIWlsNqcYKHbizG/44T40IvlDooW3P1aAQJk8XFC
 U9WBkRimDeyMaE2oDYlU3smQhQtMDrb52t/U/1elpOgyAx4SpfqqeAjfPndIuQV3S46Q
 GVIQ==
X-Gm-Message-State: AOAM530fUat/pRt9bgv8nrakRVhUM8fBx84bdVADuqCnZGztgKfQ4LxO
 JgAsiRdj0KxSuLYSfPOdGWZZCgWktNpU
X-Google-Smtp-Source: ABdhPJwcjroqKXf1mi5GXNQHjQ9HKA/7zcSadHqkGKotN9/NZ4WfMuEmphCyPvhsBmU9PpaSyJzjrQ==
X-Received: by 2002:a92:c50e:: with SMTP id r14mr7619717ilg.161.1598322990324; 
 Mon, 24 Aug 2020 19:36:30 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id d1sm8157228ila.67.2020.08.24.19.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:36:29 -0700 (PDT)
Received: (nullmailer pid 3834261 invoked by uid 1000);
 Tue, 25 Aug 2020 02:36:26 -0000
Date: Mon, 24 Aug 2020 20:36:26 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 10/19] dt-bindings: reset: fsl, imx7-src: Add i.MX 8M
 compatibles
Message-ID: <20200825023626.GA3834231@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-10-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-10-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223631_066799_B4315ED8 
X-CRM114-Status: GOOD (  13.23  )
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
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Will Deacon <will@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:43 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
>     compatible:0: 'fsl,imx8mm-src' is not one of ['fsl,imx7d-src', 'fsl,imx8mq-src', 'fsl,imx8mp-src']
>     From schema: Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
>     compatible:1: 'syscon' was expected
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
>     compatible: ['fsl,imx8mm-src', 'fsl,imx8mq-src', 'syscon'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/reset/fsl,imx7-src.yaml          | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
