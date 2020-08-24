Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8C9C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 10:01:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465342071E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 10:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KYZvv8lx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGImFIW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465342071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HFxqMIFPb/gcCR6WgDYwcTR2dAj7+TTtNrvAu+dUf18=; b=KYZvv8lxM8hURU/YssbYxJUd+
	9VhGEa+f3+UvdMfoz1MZjymdL/nhQ0I1jFllfG9K1xZmW4EVMaKx2NmKr0GDhSpXu29YULfjTHDQY
	lrDL8kai118QoNHojxKLu82kW6WZpEoctR04WW56E8HekmDRqmk8Kag9dMLzO1QPEZg/bJ6SUR8Oh
	zO7e+yJt29puscge4K9GnflV0X5d8utfcI6/9UHwZzTX4/6HAWd55PF2TkiWlVRUzygIWYqgzfJs9
	/YfOvzFzzncKGHVvTAR0Wjul6M8hB1rJOE/IvX5mI2ai+M7UenbndSHGhrApkwTgGlu0+8S0vUxgC
	s8Q3sggIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA9HL-0007d0-KF; Mon, 24 Aug 2020 10:00:39 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA9HI-0007c5-QF; Mon, 24 Aug 2020 10:00:37 +0000
Received: by mail-ej1-x644.google.com with SMTP id o18so11085812eje.7;
 Mon, 24 Aug 2020 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wq5i4qHfu7yzPAz7g/0D7Mody4FjfdyYHDZ2FJMtb1k=;
 b=YGImFIW/QqX0VtY2y4IDgqNs/BJmalIZ2Dd4Q8hxUYJX9TionAEYCxGa69uT6kkf48
 TtSTxS+qTYcJ/LFw/HZ86cykFD5QUfQsfYqd4zh4PKnt+E3aE2PcFbZgWUVpoKhPwMc1
 rG7997c0kwrNKfBs+Bw+mvkEyMBknFfy/N4Mt0vM6oDYstNNzD5sEbDnV0zWkwUmnnT5
 tgDtCJ/n9a9KX9S7zoDtBD/LC08UM1do9LpviaCIHMt12QByNBcReKmph2KZGE0R7Yk9
 oMOV3MwC0P9DvjXablSGFfZGU5zr4NqQDNevFgTvgUlapw32d9ImZKwG6QzusIpNptjv
 vgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wq5i4qHfu7yzPAz7g/0D7Mody4FjfdyYHDZ2FJMtb1k=;
 b=bnrWLqg7S1Ibxpm6bItg8iKZkUwoiGWxEMPuSuiZicCYIEWGTogVC8XcOYfQd54vYn
 HNFTIVv8Y8LtzdXCYnPmVJFyAnDQ6DGBM5NQl80/6bwamKogr7iilX03QcSdbdccHVtG
 WqFwuC4UgV1QzIsJkYhowDo/2OJAmtMvs8jG/q3Eo5ZchME3Bo6ilTZugNfdSbj9XQM+
 VUSUnz9T195OBILIZWgXr3GHKvXZH8shqRKTbI1qUED6bNpg5bhev6fzPKiOMJcTfcVk
 o+y8lejkiwz/3lb553kteLNDum9znzC4XIdMXrYw0awlm8MipjEoC71E35C19hxwexqE
 7M5A==
X-Gm-Message-State: AOAM530TuOItEjnnBqoBcbtS6PN+cyLlFABQYPMbEukQzY4g5VInYrk+
 jQ+OCeKt1U7NW4nd6mcWWm3/DPNxDM9sbvkz3ORxROrQdWA=
X-Google-Smtp-Source: ABdhPJy4bHtBJhH+rU55qeWIWBpWq4c03JJngRVDXW3+ekGgoPQyxrRrrRmtsXz+xOF8t2CfIYckZu3WLWEfMjEgf5s=
X-Received: by 2002:a17:906:4dd4:: with SMTP id
 f20mr5077416ejw.170.1598263234026; 
 Mon, 24 Aug 2020 03:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-21-krzk@kernel.org>
 <AM6PR04MB49668B0F67B02B2A33603B4880560@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200824091102.GA20819@kozik-lap>
In-Reply-To: <20200824091102.GA20819@kozik-lap>
From: Dong Aisheng <dongas86@gmail.com>
Date: Mon, 24 Aug 2020 17:45:19 +0800
Message-ID: <CAA+hA=S=2SoF8egOq8h-eB9wZGDqrAw66VtW-bU9oBmzFSj9Bw@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: imx8qxp: Remove i.MX7 compatible from
 USDHC
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_060036_953422_98A18CB4 
X-CRM114-Status: GOOD (  24.85  )
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 5:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Aug 24, 2020 at 09:00:19AM +0000, Aisheng Dong wrote:
> > > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > Sent: Monday, August 24, 2020 12:16 AM
> > >
> > > The USDHC on i.MX 8QXP has its own compatible described in bindings and
> > > used in the driver (with its own quirks).  Remove additional fsl,imx7d-usdhc
> > > compatible to fix dtbs_check warnings like:
> > >
> > >   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: mmc@5b010000:
> > >     compatible: ['fsl,imx8qxp-usdhc', 'fsl,imx7d-usdhc'] is too long
> > >     From schema:
> > > /ocumentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > >
> > >   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: mmc@5b010000:
> > >     compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was
> > > unexpected)
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > For Patch 19-22, I think we should fix dt binding doc.
>
> Are you sure that these USDHC controllers are compatible with i.MX 7D?
> Could they really run with fsl,imx7d-usdhc compatible?

AFAIK uSDHC on QXP is derived from the former platforms with adding a few
more new features. e.g. HS400ES/CMDQ.
Let me loop in uSDHC driver owner Haibo Chen to double confirm.

Regards
Aisheng

> The implementation (Linux kernel driver) is different, I guess on
> purpose...
>
> Best regards,
> Krzysztof
>
> >
> > Regards
> > Aisheng
> >
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > index 61bccb69f09e..26c4fcdfe290 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > @@ -362,7 +362,7 @@
> > >             };
> > >
> > >             usdhc1: mmc@5b010000 {
> > > -                   compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> > > +                   compatible = "fsl,imx8qxp-usdhc";
> > >                     interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
> > >                     reg = <0x5b010000 0x10000>;
> > >                     clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC0_IPG_CLK>, @@
> > > -374,7 +374,7 @@
> > >             };
> > >
> > >             usdhc2: mmc@5b020000 {
> > > -                   compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> > > +                   compatible = "fsl,imx8qxp-usdhc";
> > >                     interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
> > >                     reg = <0x5b020000 0x10000>;
> > >                     clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC1_IPG_CLK>, @@
> > > -388,7 +388,7 @@
> > >             };
> > >
> > >             usdhc3: mmc@5b030000 {
> > > -                   compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> > > +                   compatible = "fsl,imx8qxp-usdhc";
> > >                     interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
> > >                     reg = <0x5b030000 0x10000>;
> > >                     clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC2_IPG_CLK>,
> > > --
> > > 2.17.1
> >
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
