Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB94C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:56:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F6F20706
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XiMHB80+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F6F20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IPKoQASjHaF3DkHIRgbtwBdYGUY58fRDaXIwe6wWk8w=; b=XiMHB80+zOiR8dZziMhfj4l8d
	5gBDfL3OhoIn81cJlVxxztP2QotJ1Th4krZ91SdD9yHnw8xTo2jpwlQv16ogWjsaCn5nqfEjG/zbt
	9glwUAx1zwxSsEXvmoR17nX0VEMbMekOXCCBn1yH2oOnNT7rYt/weN8iXUuv0eJYFZiFp/eI3cvr7
	kYiOj8FXBMEpahLLGgrt5QiY4zae6l+VaJ/Nax49mMmUdCuBe9eSx5fgWKMXEnYtQ7rhWpd1mFR3k
	ma5caEhE3lPkxIOp1DNHUGGXqpuXlhHKDbr/7aJT24xrsNYZPPkqs2itnsSyehZD0+Ry2QfoTAc1Q
	oDh5Qacxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kASru-0007bN-FG; Tue, 25 Aug 2020 06:55:42 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kASrr-0007ai-Gg; Tue, 25 Aug 2020 06:55:40 +0000
Received: by mail-wm1-f65.google.com with SMTP id y8so437836wma.0;
 Mon, 24 Aug 2020 23:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1/BMEK5hdF0iweITjCzRL7tnq3hV766kEY/n/gaXN14=;
 b=lD4Xc7jRkh2ca9/t3s114Hda6kO6qKEmlyFVbPoF8/FcSVJ+zqYRanRkGuMSePp2W1
 +RMxMER9/rvOOe3cnMi9mZKTVQmZazdoSIngYP/5ft212y9h++PkwERswVBbkIWn89dD
 0zHPm91204hF1zt2QNundn+kRwchoi4GVPNdhZrtn/s5uA1iVoNTUfJYdka0Zjknet2U
 V8pugb8lnaEXECiCrNtntFLkVLILPLfqTztcu+Jg7yIj0Oucu2FtbJ2ak2Zu6OdlZbzA
 B388atR0pK6eyPc9LO3n6bsgkWRcCnKVZozYAj2ZcPpTsQsKQubZARBOKTVd/U+SW+za
 ueUw==
X-Gm-Message-State: AOAM533UtQLbrAFbhOTcdBAiv4F1uptMpQ7y6cHhT0tcSOmstiBdiHhH
 K9tIuL6FWfxOqSz4/H6h/iaIT9t0La1BcQ==
X-Google-Smtp-Source: ABdhPJzVthOSQHuBCkTElEnSeTuy6N11zAwWgCV1RLWESAC/VoowTAPU7THZp0e1uMR0gy8Ohekb8Q==
X-Received: by 2002:a1c:7fd3:: with SMTP id a202mr547797wmd.67.1598338538029; 
 Mon, 24 Aug 2020 23:55:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id z1sm11576477wru.6.2020.08.24.23.55.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Aug 2020 23:55:37 -0700 (PDT)
Date: Tue, 25 Aug 2020 08:55:34 +0200
From: "krzk@kernel.org" <krzk@kernel.org>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 01/16] dt-bindings: mfd: rohm, bd71847-pmic: Correct clock
 properties requirements
Message-ID: <20200825065534.GB3458@kozik-lap>
References: <20200824190701.8447-1-krzk@kernel.org>
 <b75867fd1c662a83d933ae8f0c4373ba017eb808.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b75867fd1c662a83d933ae8f0c4373ba017eb808.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_025539_775563_C523A7F3 
X-CRM114-Status: GOOD (  30.20  )
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
Cc: "daniel.baluta@nxp.com" <daniel.baluta@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>,
 "aford173@gmail.com" <aford173@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "han.xu@nxp.com" <han.xu@nxp.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "yibin.gong@nxp.com" <yibin.gong@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jun.li@nxp.com" <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 06:23:36AM +0000, Vaittinen, Matti wrote:
> 
> Hello Krzysztof,
> 
> On Mon, 2020-08-24 at 21:06 +0200, Krzysztof Kozlowski wrote:
> > The input clock and number of clock provider cells are not required
> > for
> > the PMIC to operate.  They are needed only for the optional bd718x7
> > clock driver.
> 
> I have always found the DT bindings hard to do. I quite often end up
> having a different view with Rob so I probably could just shut-up and
> watch how this evolves :)
> 
> But as keeping my mouth is so difficult...
> 
> ...All of the drivers are optional. The PMIC can power-on without any
> drivers. Drivers are mostly used just for disabling the voltage from
> graphics accelerator block when it is not needed (optional). Or some
> DVS (optional). But yes, maybe the clk driver is "more optional" than
> the rest. XD So, I am not against this.

Each regulator node is optional, it can be skipped. And device will
work and regulator driver will bind. The difference here is that without
clocks the clock driver won't even bind... but if we keep clocks as
required, then multiple DTSes do not pass the bindings check.

I don't have strong feelings about dropping requirement for clocks, just
this looks easier to implement and logical to me (this is a PMIC so
clock is a secondary feature).

> 
> > Add also clock-output-names as driver takes use of it.
> > 
> > This fixes dtbs_check warnings like:
> > 
> >     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b:
> > 'clocks' is a required property
> >     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b:
> > '#clock-cells' is a required property
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/mfd/rohm,bd71847-pmic.yaml       | 9
> > +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71847-
> > pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71847-
> > pmic.yaml
> > index 77bcca2d414f..5d531051a153 100644
> > --- a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
> > @@ -38,6 +38,9 @@ properties:
> >    "#clock-cells":
> >      const: 0
> >  
> > +  clock-output-names:
> > +    maxItems: 1
> 
> I had this in original binding (text) document patch series. For some
> reason it was later dropped. Unfortunately I didn't easily find a
> reason as to why. Adding it back now is absolutely fine for me though.
> 
> > +
> >  # The BD71847 abd BD71850 support two different HW states as reset
> > target
> >  # states. States are called as SNVS and READY. At READY state all
> > the PMIC
> >  # power outputs go down and OTP is reload. At the SNVS state all
> > other logic
> > @@ -116,12 +119,14 @@ required:
> >    - compatible
> >    - reg
> >    - interrupts
> > -  - clocks
> > -  - "#clock-cells"
> >    - regulators
> >  
> >  additionalProperties: false
> >  
> > +dependencies:
> > +  '#clock-cells': [clocks]
> > +  clocks: ['#clock-cells']
> 
> This is new to me. Please educate me - does this simply mean that if
> '#clock-cells' is given, then also the 'clocks' must be given - and the
> other way around?

Yes, because the clocks do not have sense without clock-cells and vice versa.

> 
> If so, then:
> Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> 

Thanks.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
