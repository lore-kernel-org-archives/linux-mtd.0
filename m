Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E57C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 07:07:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2ABE206B5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 07:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quoS3mmG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2ABE206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvIBVjcV3k9qK4QbsQBAvXTJE4Jul5ctzIWneHeh6as=; b=quoS3mmGHevYeSmawU0kGnNvt
	ISLjDCdo+nzrd9aIzQL9w6slkhnfIlOTV8Vud0U67knELFdroR8xHEQ1DXl/jT1honN3tiO9s6jEV
	cFfhrlTD3KoyL3SJCUq/e1NbDNtIYkyV+OQwtyH3FCMCdXuOJVHXl4J5ZdIQlwQeVjtOHQhwROih0
	gCGIC3vWhTghT0+oq3gZ5iZT2dXbbreO6D+7T1lUE4nKFKU+rQUTG79LvdStLc2CI3XbJDrQTm/4a
	bdSn0g701IC5JfmhSykgEgeSojGRwPSoC0Us913sZcoWfl1XVZz8PNzfgg6sr7Il7I4IqW5gZ0PGc
	iREBSZqPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA6ZV-0002WX-Bf; Mon, 24 Aug 2020 07:07:13 +0000
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA6ZQ-0002Vb-7p; Mon, 24 Aug 2020 07:07:09 +0000
Received: by mail-wm1-f66.google.com with SMTP id a65so3652385wme.5;
 Mon, 24 Aug 2020 00:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jMkESQ6/qDeh8yFOp5ut20DDKvKP8Egt8HrPQWgV3hI=;
 b=sWiG3JpgmQfiObQ1ccQfTJyM9jCqD+MkXGPpMQyVXwiJxKTZHBzx+ygTpgcXCA4neW
 9LFpbWBiVGj2Q5yEkjyoyIQFGUf8siieCjZZhN0CdNAr5ivG1H0jUunOlwlL+N4G/n07
 J2i/rFO6sB6sA/XYhlepNZ71J95u0ji0VVhveeHrSz3UyJbDJZx8AuM2Cvr2E2hKe7Zg
 TjT/ECbxkxJQ/NESWCLvIhJFBA7Sw7X1J8Gn3ybTS4rX5dDyfNMOuGshHFbUGKmY5rmo
 tF/I68wQfcl1az8aNaq87kr2dYVOmLcAqfvQAESjuoiNOVgBUSuYJGLhVuJ1vLcXDWRL
 UCvA==
X-Gm-Message-State: AOAM533/jsgMW2up9aUuQicri1Tvl5vwBxHUDH9JeJA4lxXEiO6NC+hb
 8KA2osSIizyvT39rY+i5dQo=
X-Google-Smtp-Source: ABdhPJyU61NszbES0k6p1PAHajV48Erw/hGcjANLVNAFBKqGCzpj1Y19Wb9rD9qlokEO4JMhFKYb8w==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr4297940wmj.137.1598252826663; 
 Mon, 24 Aug 2020 00:07:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id m1sm21788437wmc.28.2020.08.24.00.07.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Aug 2020 00:07:06 -0700 (PDT)
Date: Mon, 24 Aug 2020 09:07:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 02/22] dt-bindings: gpio: fsl-imx-gpio: Add gpio-ranges
 property
Message-ID: <20200824070703.GA5382@kozik-lap>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-2-krzk@kernel.org>
 <20200824052446.GE13023@pengutronix.de>
 <20200824063806.GA2497@kozik-lap>
 <20200824065801.GH13023@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824065801.GH13023@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_030708_364018_A9E93404 
X-CRM114-Status: GOOD (  23.68  )
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

On Mon, Aug 24, 2020 at 08:58:01AM +0200, Sascha Hauer wrote:
> On Mon, Aug 24, 2020 at 08:38:06AM +0200, Krzysztof Kozlowski wrote:
> > On Mon, Aug 24, 2020 at 07:24:46AM +0200, Sascha Hauer wrote:
> > > On Sun, Aug 23, 2020 at 06:15:30PM +0200, Krzysztof Kozlowski wrote:
> > > > The GPIO controller node can have gpio-ranges property.  This fixes
> > > > dtbs_check warnings like:
> > > > 
> > > >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > >     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > > 
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml    | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > > index 454db20c2d1a..1fac69573bb9 100644
> > > > --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > > +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > > @@ -51,6 +51,9 @@ properties:
> > > >  
> > > >    gpio-controller: true
> > > >  
> > > > +  gpio-ranges:
> > > > +    maxItems: 1
> > > > +
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > > @@ -62,6 +65,18 @@ required:
> > > >  
> > > >  additionalProperties: false
> > > >  
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: fsl,imx8mp-gpio
> > > > +    then:
> > > > +      properties:
> > > > +        gpio-ranges:
> > > > +          minItems: 1
> > > > +          maxItems: 2
> > > 
> > > Why do you limit this to fsl,imx8mp-gpio? The i.MX5,6,7 dtsi files use
> > > gpio-ranges as well and other i.MX dtsi files could also use it.
> > 
> > All other cases use maximum one element in gpio-ranges, so they are
> > covered so I assumed they are continuous. But if it not the case, I can
> > make all them maximum 2.
> 
> I misread this, I thought you allow gpio-ranges only for imx8mp, but
> it's only the maxItems you set differently for that SoC. Anyway,
> arch/arm/boot/dts/imx6dl.dtsi has this:
> 
> &gpio1 {
>         gpio-ranges = <&iomuxc  0 131 2>, <&iomuxc  2 137 8>, <&iomuxc 10 189 2>,
>                       <&iomuxc 12 194 1>, <&iomuxc 13 193 1>, <&iomuxc 14 192 1>,
>                       <&iomuxc 15 191 1>, <&iomuxc 16 185 2>, <&iomuxc 18 184 1>,
>                       <&iomuxc 19 187 1>, <&iomuxc 20 183 1>, <&iomuxc 21 188 1>,
>                       <&iomuxc 22 123 3>, <&iomuxc 25 121 1>, <&iomuxc 26 127 1>,
>                       <&iomuxc 27 126 1>, <&iomuxc 28 128 1>, <&iomuxc 29 130 1>,
>                       <&iomuxc 30 129 1>, <&iomuxc 31 122 1>;
> };
> 
> I don't think it makes sense to specify maxItems.

Indeed, I will skip the max limit.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
