Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3189C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 09:13:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A7F2071B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 09:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMyiVhSh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A7F2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NcFeylWu2SAV4ISRh2PiKD2ElmE9x1bQdCs0i4ZqCps=; b=YMyiVhShCCEA31qoIWLlcTvpP
	SUDCpRBVFndgK9+eQUVBva4qMGElTs5wnHV+xCp/SraOMC65XZqX+ZvKmeL9vGL+akZis282nWjV1
	Wn/4RZxGF+T0mHlt5woT8aorS4NOZrIdvh84b4u2wio9OQGXN5MJEkxxqliFd6AKTufP4GyfwiIKd
	wwb4SkyIOBWd+rCBtbPVJijY5Ilsc7uT1dDBaGnLfTWJYYeSBclSSklNiEJgoBwzppc0VLVujMV0p
	xJvfs2uWtFpthaSs5X2P1/z/T932HwNUGqV/ofKum+4M4tKFE2AH5hoSq+0iUt9enoZWahzIlkill
	ZtZux+/JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBaQc-0000rq-7r; Fri, 28 Aug 2020 09:12:10 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBaQX-0000q5-BH; Fri, 28 Aug 2020 09:12:06 +0000
Received: by mail-ej1-f65.google.com with SMTP id l2so593072eji.3;
 Fri, 28 Aug 2020 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RBT1OCzQ02U3NCjA6vShk0xXCvUozK7o2xDuaQszpRk=;
 b=PaNC+hcgcsr9roOYTPVdITLSHuwuMSErmLT9UQx308/GV0wGrdzPlORa2iKAdma3mq
 KqfHBesaREDVkNYrRlkqXIRFE8SGlcRQXmKovv4OaXKcNtO8/CUIF71vb7jAWXeK8SVC
 x3zUCZANXZ+9jdoQXWiGuhTtz9KPLk+G5OdkLw4M8MoMSlLFhEKgeHBX2umu7ctIH2L8
 jOYgNfWsBoFq3GO2JmidoE93bpK9pBV4yQMmBArVhjQBXVNwdRxzF/3sYMRjWZN4lhR9
 CJHIhDvCKmB4TbyPXJSgimelI+Q/34DInGDyf2uw7L9NryJ+DXWj4BOZOoTYUDAVVTjo
 movg==
X-Gm-Message-State: AOAM531MK6OM2gbyqkgzgEOkZQqvOe7ihssN5S/QfW3nJXmO4O9S0asR
 rj5hYKbbRT18lgGBpNcvtXU=
X-Google-Smtp-Source: ABdhPJw3xCQnxyK7qlNke96fwa8aWRja8fL7fhhy3QWYB7wgkOEFUlEEvMzYUPI2MkBVhFAa2/goAg==
X-Received: by 2002:a17:906:40e:: with SMTP id
 d14mr762072eja.455.1598605924082; 
 Fri, 28 Aug 2020 02:12:04 -0700 (PDT)
Received: from pi3 ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id bn14sm334810ejb.115.2020.08.28.02.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 02:12:03 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:12:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 12/19] dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8
 compatible matching
Message-ID: <20200828091200.GB17786@pi3>
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-13-krzk@kernel.org>
 <CAPDyKFp9m6xBJMGn2TgwD8VEUZ0JwzgowU32qUbL1qgEPua-GA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFp9m6xBJMGn2TgwD8VEUZ0JwzgowU32qUbL1qgEPua-GA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_051205_420955_AA51B75C 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Frank Li <frank.li@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 DTML <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Fugang Duan <fugang.duan@nxp.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 10:45:40AM +0200, Ulf Hansson wrote:
> On Tue, 25 Aug 2020 at 21:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > The i.MX 8 DTSes use two compatibles so update the binding to fix
> > dtbs_check warnings like:
> >
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
> >     compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long
> >     From schema: Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> >
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
> >     compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was unexpected)
> >
> >   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: mmc@30b40000:
> >     compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Rob, Krzysztof - do you want me to pick this one?

dt-bindings are independent so they can be applied individually.

I don't mind you taking it but still Rob's ack/review would be needed.

Other choice is that entire dt-bindings series go through Rob's tree.

Rob, what's your preference?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
