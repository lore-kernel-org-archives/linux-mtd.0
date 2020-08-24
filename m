Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955A8C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:12:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D8B206F0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="emT7vmhV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66D8B206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QkqNshQiCk83sf/MNusly8uLhL8HKaR8Hn83g76PHlw=; b=emT7vmhVSVddtDRUYZEIeK+2G
	hPdZQDwt/Gcc/pTq3ODDhxI9iQ7uZuaB9nkHf5r58PlpUsJqiET1SKsIw5PLal7ZlAVRWFjmGCLvn
	CHTDrJWxVbO0Ev4pjGqZnZNN3A49amHzOcDYm9oaVbXqGZjhVaZHScgDsYo4sX2SU1YZ4NOpiQSpL
	VJqXG1e0bEyXVxJpAGgZCMqQpoBTyBd50fAGtbu19XQzHV1Wp1tc26ODW4s6x7smUXilOj13Y8QO5
	8CU77BX9T10X63GZ7LsCxSa2JiGaUt1AqOcpreQLqpEmA4RdVo9DAEykZn1QhRDmlWN9iKEZ2Ca/a
	pugpAbhmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA8VW-00077X-2P; Mon, 24 Aug 2020 09:11:14 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA8VP-00074c-KM; Mon, 24 Aug 2020 09:11:08 +0000
Received: by mail-wr1-f67.google.com with SMTP id a15so7874145wrh.10;
 Mon, 24 Aug 2020 02:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pUF3QN5qpBvG5fN8G2Ybjf+ixCnkDOi3rCaIBYZPN7k=;
 b=FYgNPMRObWuMT6UG2AhAauPa4BIovwrhvlzfDU+NGCd5p4BIrT7y8ETmH4gvK0nJzc
 BJ8TFW4wGOz7bjY3gcWYq7ZKA8ILbk9PXCiRwtp1e2/V26eSsw3FeNTyY0yyo6gXb5Ri
 SN3rEFgnAI4BbSqlL+d09pNn0coTmRGd0xCyOBrd9xI6LlTASrfn+UC0YhwPnXSHO92q
 oqdrn7gWqCX/cWXfAgzb6xOpqZ94a/v8Y+5F5DnhYvbunKaxpN6wXKsZ+EPLf1lpFPA2
 D3hYbSpJDarE4S0z2Hu0n7Zw5Sa5vl25IQeaQqNWPlyWc31N97FqIsQsSQiPlKXOZ0yU
 +ShQ==
X-Gm-Message-State: AOAM531LsJJ9e4t1bFprNPkU/e2uJgwX5QRqfWZoGyqdQo+8hYeEcvk1
 E8NdXtMOREynCWZaoXMbL4Q=
X-Google-Smtp-Source: ABdhPJwE3kGFDhN1s/hoJjFR2sSwbpKpOgvJl8AK3ZwbGzN+OM9ankAAiOzMdDiYIc2qELP19gLoww==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr4845334wrn.253.1598260266068; 
 Mon, 24 Aug 2020 02:11:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id y24sm21368601wmi.17.2020.08.24.02.11.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Aug 2020 02:11:05 -0700 (PDT)
Date: Mon, 24 Aug 2020 11:11:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aisheng Dong <aisheng.dong@nxp.com>
Subject: Re: [PATCH 21/22] arm64: dts: imx8qxp: Remove i.MX7 compatible from
 USDHC
Message-ID: <20200824091102.GA20819@kozik-lap>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-21-krzk@kernel.org>
 <AM6PR04MB49668B0F67B02B2A33603B4880560@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM6PR04MB49668B0F67B02B2A33603B4880560@AM6PR04MB4966.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_051107_747434_55DF9E4D 
X-CRM114-Status: GOOD (  22.48  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Anson Huang <anson.huang@nxp.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 09:00:19AM +0000, Aisheng Dong wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Monday, August 24, 2020 12:16 AM
> > 
> > The USDHC on i.MX 8QXP has its own compatible described in bindings and
> > used in the driver (with its own quirks).  Remove additional fsl,imx7d-usdhc
> > compatible to fix dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: mmc@5b010000:
> >     compatible: ['fsl,imx8qxp-usdhc', 'fsl,imx7d-usdhc'] is too long
> >     From schema:
> > /ocumentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > 
> >   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: mmc@5b010000:
> >     compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was
> > unexpected)
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> For Patch 19-22, I think we should fix dt binding doc.

Are you sure that these USDHC controllers are compatible with i.MX 7D?
Could they really run with fsl,imx7d-usdhc compatible?

The implementation (Linux kernel driver) is different, I guess on
purpose...

Best regards,
Krzysztof

> 
> Regards
> Aisheng
> 
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 61bccb69f09e..26c4fcdfe290 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -362,7 +362,7 @@
> >  		};
> > 
> >  		usdhc1: mmc@5b010000 {
> > -			compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> > +			compatible = "fsl,imx8qxp-usdhc";
> >  			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
> >  			reg = <0x5b010000 0x10000>;
> >  			clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC0_IPG_CLK>, @@
> > -374,7 +374,7 @@
> >  		};
> > 
> >  		usdhc2: mmc@5b020000 {
> > -			compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> > +			compatible = "fsl,imx8qxp-usdhc";
> >  			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
> >  			reg = <0x5b020000 0x10000>;
> >  			clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC1_IPG_CLK>, @@
> > -388,7 +388,7 @@
> >  		};
> > 
> >  		usdhc3: mmc@5b030000 {
> > -			compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> > +			compatible = "fsl,imx8qxp-usdhc";
> >  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
> >  			reg = <0x5b030000 0x10000>;
> >  			clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC2_IPG_CLK>,
> > --
> > 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
