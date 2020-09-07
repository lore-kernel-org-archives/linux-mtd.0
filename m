Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B3EC43461
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 06:11:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BCF921582
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 06:11:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZopIl4TB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BCF921582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D1Sa4QRUTdG9mZsE7KRawNG8oko8H6X+4g3ybc7RfOQ=; b=ZopIl4TBbQIdnqX58ZtTzhrqt
	NS7IPv7MmxqQP3QNV8zyUdFGDJNSEe9m2hmlDw/3hkYjB8I8K1UL1KIwT92abzh2je3pSSI6s7+Ev
	M+enLrIOMG1clRss2FoM/cM0LBaiRkTUEogq8svrabMIUedtFBFdzNuWPQqQYOPhbc2ueJuNDbJlo
	hX/Rp9gQAgig93K7xLGQsiTHHavpN6J9UkFQgtE8W1KjOMb1a7kAydYBT1w/xxrxnx12OKHh8pLZ6
	qSF3YHnp/1Aa3ArQL/otWOZ3qVdlBMixI1N3XoCzfajz7L0OB5eIulDyjtOPkRt7Karr64Outvf+/
	xMvbOoSRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAM0-0004vy-0q; Mon, 07 Sep 2020 06:10:12 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFALr-0004v2-AX; Mon, 07 Sep 2020 06:10:04 +0000
Received: by mail-ej1-f65.google.com with SMTP id q13so16580495ejo.9;
 Sun, 06 Sep 2020 23:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GVokwuwCaSVBc9Gyn7b0LOXpcqkbxNYOMN+1IZzWnZQ=;
 b=qx7EdHOlkoNl3PMuwj6eXhKlUTJGTKUIauI8nw/52ZiQLle6gwqf7kfyvkUaBm2a8N
 fANNfngKn/ETgpPwP49ZO6ZO+NKsUeyzwtFPfiQvEDWGO0Ow9FtdXrKTn0m5LBpUKUTK
 o/sQEEMIjZtemHkB+h3gidQgLX0sxIIZjn7IQnJ//XWplZJsLiq08Ew7clMhIYu+jBk5
 Ygi9URa+zIqojZL6sOraCFPWgLJzvvi/x5Poe28hUqZg18FOT2tX+VkBghP1c0XDS64W
 BEK7hIspoMRrplB8vx9RwdjdI/fkUIlDAGQNp2wnIdUPJZ77XBb5nysuv5x7KLOlaAjO
 yNLA==
X-Gm-Message-State: AOAM530enWvqjQbEhHXz2sYWScjq8sZOg9uLsJK/aPp5ONJSyl75R3KN
 ny7rHfvWcl/DZoaxmznmQDo=
X-Google-Smtp-Source: ABdhPJzM/GiqDDPUglZaYg3VUWUe0/dDHCWpXQ1+YwL2JZxA9p9bR+MKuStVCwG/XpSPy00N+WM4qQ==
X-Received: by 2002:a17:906:a00d:: with SMTP id
 p13mr20408792ejy.535.1599459001754; 
 Sun, 06 Sep 2020 23:10:01 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id
 r16sm14473271ejb.110.2020.09.06.23.09.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Sep 2020 23:10:00 -0700 (PDT)
Date: Mon, 7 Sep 2020 08:09:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 12/14] dt-bindings: mtd: gpmi-nand: Fix matching of
 clocks on different SoCs
Message-ID: <20200907060958.GA4525@kozik-lap>
References: <20200904152404.20636-1-krzk@kernel.org>
 <20200904152404.20636-13-krzk@kernel.org>
 <CAL_Jsq+tGQhkqtQszOx7nvr1PR=YFz2p1=OnWQ8JxmSg4qNkHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+tGQhkqtQszOx7nvr1PR=YFz2p1=OnWQ8JxmSg4qNkHA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_021003_376942_DF4B806B 
X-CRM114-Status: GOOD (  23.64  )
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 04:36:39PM -0600, Rob Herring wrote:
> On Fri, Sep 4, 2020 at 9:25 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Driver requires different amount of clocks for different SoCs.  Describe
> > these requirements properly to fix dtbs_check warnings like:
> >
> >     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. Do not require order of clocks (use pattern).
> 
> To the extent that you can, you should fix the order in dts files
> first. If we just adjust the schemas to match the dts files, then
> what's the point?

The DTSes do not have mixed order of clocks between each other, as fair
as I remember. It was fix after Sasha Hauer comment that order is not
necessarily good.

We have the clock-names property, why enforcing the order?

> 
> > ---
> >  .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
> >  1 file changed, 61 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> > index 28ff8c581837..e08e0a50929e 100644
> > --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> > @@ -9,9 +9,6 @@ title: Freescale General-Purpose Media Interface (GPMI) binding
> >  maintainers:
> >    - Han Xu <han.xu@nxp.com>
> >
> > -allOf:
> > -  - $ref: "nand-controller.yaml"
> > -
> >  description: |
> >    The GPMI nand controller provides an interface to control the NAND
> >    flash chips. The device tree may optionally contain sub-nodes
> > @@ -58,22 +55,10 @@ properties:
> >    clocks:
> >      minItems: 1
> >      maxItems: 5
> > -    items:
> > -      - description: SoC gpmi io clock
> > -      - description: SoC gpmi apb clock
> > -      - description: SoC gpmi bch clock
> > -      - description: SoC gpmi bch apb clock
> > -      - description: SoC per1 bch clock
> >
> >    clock-names:
> >      minItems: 1
> >      maxItems: 5
> > -    items:
> > -      - const: gpmi_io
> > -      - const: gpmi_apb
> > -      - const: gpmi_bch
> > -      - const: gpmi_bch_apb
> > -      - const: per1_bch
> >
> >    fsl,use-minimum-ecc:
> >      type: boolean
> > @@ -107,6 +92,67 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +allOf:
> > +  - $ref: "nand-controller.yaml"
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx23-gpmi-nand
> > +              - fsl,imx28-gpmi-nand
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: SoC gpmi io clock
> > +        clock-names:
> > +          items:
> > +            - const: gpmi_io
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx6q-gpmi-nand
> > +              - fsl,imx6sx-gpmi-nand
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: SoC gpmi io clock
> > +            - description: SoC gpmi apb clock
> > +            - description: SoC gpmi bch clock
> > +            - description: SoC gpmi bch apb clock
> > +            - description: SoC per1 bch clock
> > +        clock-names:
> > +          items:
> > +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> > +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> > +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> > +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> > +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> 
> BTW, you can make 'items' a schema rather than a list to apply a
> constraint to all entries:
> 
> maxItems: 5
> items:
>   pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"

Right, I forgot about such syntax.

> 
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx7d-gpmi-nand
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: SoC gpmi io clock
> > +            - description: SoC gpmi bch apb clock
> > +        clock-names:
> > +          minItems: 2
> > +          maxItems: 2
> 
> You can drop these. It's the default based on the size of 'items'.

Sure.

> 
> > +          items:
> > +            - pattern: "^gpmi_(io|bch_apb)$"
> > +            - pattern: "^gpmi_(io|bch_apb)$"
> 
> Surely here we can define the order.

Yes, but still the same question as before - do we want the order? Why
enforcing it?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
