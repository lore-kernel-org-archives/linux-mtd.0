Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6BCC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:39:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F374420578
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sxzz2Yfb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F374420578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oGG33H/vqEpnByZ2okyOhHD24t+HAN5GON9t5jrKcoA=; b=Sxzz2YfbPWey08NlJwdmxbcqS
	rXB3Zz4wjkGcQfaBBvSeedZQdKlRflyPo9CttF1D9CVaIFFFB9RsgQvXhqZPjkYxOfGybOu/Zcr3T
	Ze/+FjYpgP3AFdoadXDlHah81/BcSRfFKrLBHj5++17d1Jao6lPoFEmWqpUnr6D/UV9nrlclM3Iig
	+BFX0q6vCu8RmL8dq1hsbbU3n/rrnJ4zYfWa/MeoD5mtVfkvT8w2aYQ/OdhaOHFlBoRs2OSoh2WHR
	kNFWwGutlW3Lc8Xwq4aZRKS/dZfWK/wxIV/wMb0dBJCpq8W2kWsU3APHFvqqII6GBOCZxrYg80W5I
	aNJUjHkoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA67Z-0007Yv-8q; Mon, 24 Aug 2020 06:38:21 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA67Q-0007Xb-Se; Mon, 24 Aug 2020 06:38:13 +0000
Received: by mail-wr1-f65.google.com with SMTP id a15so7454904wrh.10;
 Sun, 23 Aug 2020 23:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VYlUOue9weg8rDgB4bx9HK1Y20q59ca+iyWSSQFRXYI=;
 b=DULVq/YIOVDZtwcKSTziGUDMt9kntNWIC855oUfvVfMZL4TmjrNrThOwyboaP9MEOe
 sq4qGcqRn8Gv3mPUdq9EN2OKE7SC165rTRPqTlRt+Yb5OUjmokinoZKRiYFEsVr1J2N4
 IIl+NW77i/+lJKKiOaGUbH9RxJ5KhayIT1bNNfKW/3trWpKMFqh58Ok+ZMhZZAGEbtw0
 okc/OWHzVi+WnVdQ9TrGlxNdCnStpcLAQfiykvhye3mNFMd5yv7JJbB/6JwOsH+uWR22
 AvIWm9D8aGORRb1mdkxTcXfc2ceNPePEoOtfta1l9K66pgV0gd8QzTBYXnNaoGH8hVQh
 4NDQ==
X-Gm-Message-State: AOAM5311TjEVJSjBqsS67apU5dgooj9hd7vuxkQ3n/hZSCUbHfAovqdX
 0Gc/OpUCLqk+Ze9W/av50D8=
X-Google-Smtp-Source: ABdhPJzG3N510Tf3V6Srikm+MUxu5X19cpEEmIR9h3dkveK++/7ys8cBoVMBBR1Rfun7Ww4TZ4WnsQ==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr4571409wro.164.1598251090024; 
 Sun, 23 Aug 2020 23:38:10 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id 126sm22956165wme.42.2020.08.23.23.38.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 Aug 2020 23:38:09 -0700 (PDT)
Date: Mon, 24 Aug 2020 08:38:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 02/22] dt-bindings: gpio: fsl-imx-gpio: Add gpio-ranges
 property
Message-ID: <20200824063806.GA2497@kozik-lap>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-2-krzk@kernel.org>
 <20200824052446.GE13023@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824052446.GE13023@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_023812_981542_E93E153C 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Anson Huang <Anson.Huang@nxp.com>, linux-gpio@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 07:24:46AM +0200, Sascha Hauer wrote:
> On Sun, Aug 23, 2020 at 06:15:30PM +0200, Krzysztof Kozlowski wrote:
> > The GPIO controller node can have gpio-ranges property.  This fixes
> > dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml    | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > index 454db20c2d1a..1fac69573bb9 100644
> > --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > @@ -51,6 +51,9 @@ properties:
> >  
> >    gpio-controller: true
> >  
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -62,6 +65,18 @@ required:
> >  
> >  additionalProperties: false
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8mp-gpio
> > +    then:
> > +      properties:
> > +        gpio-ranges:
> > +          minItems: 1
> > +          maxItems: 2
> 
> Why do you limit this to fsl,imx8mp-gpio? The i.MX5,6,7 dtsi files use
> gpio-ranges as well and other i.MX dtsi files could also use it.

All other cases use maximum one element in gpio-ranges, so they are
covered so I assumed they are continuous. But if it not the case, I can
make all them maximum 2.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
