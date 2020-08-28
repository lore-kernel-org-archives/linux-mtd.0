Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97542C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 22:27:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA0D2086A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 22:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQm0EYvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA0D2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oacKtnHBaBCZwqT65UHmma4x66RPOA3SK5C1DlIN5tc=; b=ZQm0EYvS6QYOZe3e6ZrCImVKi
	26Hx+9jGRNCbSTgQmSSzxgC/VxaN/rx0zZlF/MTJnDau9YyQR1ttk4ByXdBYAIdgUH9WVeb9sQszZ
	F4fbGa8Hb1KIPSFqFftaYPLpoto+8saYJY2N78eIh37nPOBWZnww1M7QhFkiMujt0KFt1kVwlTP0N
	dMuHqjfmXF+R6bPVqt3ZthPNYEIge8eGntuNDnyM24GZd+A7NrN3PXzEbX7vHMhLc2FG+0qOQc65D
	TGRTVQ6fHsY9umyoXkV/ZRRc1bLPwtfr0+cLKdnFzRSXzBY1bop7wY6fqWh4kKORIIRSn68QZgtUx
	pNT2sVJPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBmpg-0006E8-3M; Fri, 28 Aug 2020 22:26:52 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBmpZ-0006BS-Lx; Fri, 28 Aug 2020 22:26:46 +0000
Received: by mail-io1-f68.google.com with SMTP id s1so587645iot.10;
 Fri, 28 Aug 2020 15:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=beCKEWR+2oQoP1iLca7XLO6xgI6N1F/W6UJQBTH3DqY=;
 b=EkC1YPigTIrpw9CGhmuHhz4Lp5ZM4ey9flikLw/5tj8Pt6voK7kXf8OvmZnIubQIrQ
 YvH1P/5w5RCnmZbjm58uZrIU+meCZ8Lbsl8262BruJy94NXZsvnsgd32ZDS4QhZqY7SS
 HjroAChQvJiJoKtVt9tzoTKuMutQi0dc/di5cygser9WoHw+LKIvkCS57jNtLykQk8es
 yXsIYG6Hwpl0ddh3lLm35bpSvodqw7g/f0nDpcilb/4vC1Ig8U6K7OhdCj8nF/++wQ3/
 KIhVukfPVAgojhQhFuzryYgcCemmexqQjFlC9omRZz64OxigEhDwaf2PndnVoMxSCW2I
 Xk+g==
X-Gm-Message-State: AOAM533T8L0WTuKy13UOnJfkT3fKdRjw2bL9v5me+J/6HLc+/A1OpKcj
 tFr5Y0omY7TOuAy61HbDFg==
X-Google-Smtp-Source: ABdhPJyDswgrN+BluIgdLCgk2oMwkfO3ihCsb+7kbjBf1nAUVnPwHEtq+pfxrTZ7lhQpsLVbL5AMYw==
X-Received: by 2002:a05:6602:1589:: with SMTP id
 e9mr701184iow.85.1598653604968; 
 Fri, 28 Aug 2020 15:26:44 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id b5sm317699ilr.58.2020.08.28.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 15:26:43 -0700 (PDT)
Received: (nullmailer pid 3515429 invoked by uid 1000);
 Fri, 28 Aug 2020 22:26:39 -0000
Date: Fri, 28 Aug 2020 16:26:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 17/19] dt-bindings: serial: fsl-lpuart: Fix compatible
 matching
Message-ID: <20200828222639.GA3515379@bogus>
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-18-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825193536.7332-18-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_182645_754289_131F3077 
X-CRM114-Status: GOOD (  13.04  )
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

On Tue, 25 Aug 2020 21:35:34 +0200, Krzysztof Kozlowski wrote:
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
> Changes since v2:
> 1. Remove moved compatibles.
> 
> Changes since v1:
> 1. New patch.
> ---
>  .../devicetree/bindings/serial/fsl-lpuart.yaml  | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
