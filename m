Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715F2C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:37:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F97E205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 02:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MfMl8QY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F97E205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OY6jI7UJezjk/uFZaBpbqB2rZsO9iN9s5AbtTULzMkk=; b=MfMl8QY69rLEqBafapz9J6bed
	SIChXNG+w+LS4g77C/aPYJu5F7aZ/SfcQO7jQQPGrUUttwP59ArztwaFMHa8IJubBjDTiNWulUK8u
	nfFW0OY1oweNC1QpZOcyjngF/KuBv00TOpXyvPVYIZLkDg95huZvCJE7+SZtflv2Q+7i4hDx4bqTh
	DWz9aOVaWuy1NWpIOX1gT4zE+0ELadOi4SBAluZqUbup6FQT5RfBTBRaZqzXxl1WLrSaN8tOgHqrz
	CYxzKkcYpmA/JkKUMCRivLtnvH3VFwwRbM826pVJ80UJAcg/ayKdExKgzZQcURN3hNSza0gf6bcgJ
	pAG5kXRrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOpb-0005Sl-3V; Tue, 25 Aug 2020 02:37:03 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOpK-0005Kn-Lg; Tue, 25 Aug 2020 02:36:49 +0000
Received: by mail-il1-f195.google.com with SMTP id e11so9147911ils.10;
 Mon, 24 Aug 2020 19:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UlfbS2vnAzZ5sBtAV+WlmNk8b75VkidkfLid2dc/mRw=;
 b=iXMbKYE9r0sp5p7twvqPjvfsY8A2Zy8MkWEUDSWKNBRty1Msx6KtqqyETcgMNmTMq9
 f0lDmqcVreNtaNxHfypPauAPMOFtbZwPoRFzCB3Hrg0Pgtmwq9BCiVOVH/1rHFxnxper
 TU4CZK06rTmqAMRWTYLoQtKTYw84yHEMZTq5FPxTFODk/ImvKq7NxLsC8JKtzw/mVU2T
 R1JNWQ8l7GMo0SdwN1lB94ZFweR6EcK3l+0K+ifaX+sPaS452iNbBmrF+3FzTkQLgyu+
 3dBzItDWijQ3lXHCkkWPXmpxL+XLTY76Cx1SmrQHZEQfRH7jSW06CFyBaQADBXNgl9aO
 ciOw==
X-Gm-Message-State: AOAM530KU2tSo0YBR5odKqjxaIb/eBxgRgjwqa7IuEjImQFyFuNcryyO
 8+QThCjvGSQ8Ywo2WUSH/A==
X-Google-Smtp-Source: ABdhPJyluUdv6ckXt6NtvqqOIFO4WPBGXDDadSOzeYergi+1EGQ65T2QUKGU26Hbwt7hRt0m7fVACA==
X-Received: by 2002:a92:505:: with SMTP id q5mr6873789ile.15.1598323006078;
 Mon, 24 Aug 2020 19:36:46 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id h7sm8337940ilo.51.2020.08.24.19.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:36:45 -0700 (PDT)
Received: (nullmailer pid 3834766 invoked by uid 1000);
 Tue, 25 Aug 2020 02:36:42 -0000
Date: Mon, 24 Aug 2020 20:36:42 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 11/19] dt-bindings: thermal: imx8mm-thermal: Add i.MX
 8M Nano compatible
Message-ID: <20200825023642.GA3834715@bogus>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-11-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-11-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_223648_363436_E7A880A8 
X-CRM114-Status: GOOD (  13.01  )
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
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Fugang Duan <fugang.duan@nxp.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 18:26:44 +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
>     compatible:0: 'fsl,imx8mn-tmu' is not one of ['fsl,imx8mm-tmu', 'fsl,imx8mp-tmu']
>     From schema: Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
>     compatible: ['fsl,imx8mn-tmu', 'fsl,imx8mm-tmu'] is too long
> 
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
>     compatible: Additional items are not allowed ('fsl,imx8mm-tmu' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/thermal/imx8mm-thermal.yaml    | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
