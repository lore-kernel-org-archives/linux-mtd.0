Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4671EC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150AD20714
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="semmsChg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150AD20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QB/2nue858I1+iwCis3jA6jd8naiJUDjHZ2PHT6sMXc=; b=semmsChgzeGTm1
	xTjG6cZWnW2zY83FAOJ3mnbX59t+CYCKOkiN+uTo4kT2tw5uW6MaEzP/n3Znlhl6iYwlg7W6QiPoe
	FdDM/xv4dit8LexV/XysxmHUKc6Vpu2eJfr+vODMOgzcKN9jLkQQT7mPwniJGtTxApLCukLsxXwoa
	eX/NTueCJdxT1H/zJMgXeuRg+CgO246XBU20GaRZ80I6nL5JvoEFvekazwg/+jr1HzQVzOkcVbb5N
	Kq16Ymr22bvVSAV2EyhwY59UEJm6S3nSyI730p0fnTbkNMS9HzQSfwbX64V3wewgGpoRuYe2v69iM
	1Tvy5u+nmN4I5rbm0ICA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHTw-0002Hn-Cg; Mon, 11 May 2020 23:05:08 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHTs-0001QI-UG
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:05:06 +0000
Received: by mail-ot1-f65.google.com with SMTP id z25so8987742otq.13
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ITRYcPcWlonHrPE5qtDXeTHw7EP1LYK528y4/wZgsuU=;
 b=m3cDMvYzeSMXd6J19JVWvHaKNb6UvxZzMV6BgF+5rKFTXa0TItynMW19DiH8U5zWfs
 QzS2fdwcQ5kXz5+8hBGOYv+uU8TgxfXH4zvxtUllrAXCqcPWCEJI10C17grFHX0Pyi+M
 8nyjypESgrX2Bb4SD6hIgC73l6YaQ4mQOVZ0EavUphbbMWvsayRqjp5cCy9ittQYiw6j
 2AFmeHG0FlfFWcNGh5VFpbn1SPOQgE0hCMs95ySah1QCDu2IMyxHvyKTvx8Y/e8hDXgW
 GWrGxewnuPnVFGqGbtQnuqTBSG30EEYbUt/qcB4f7Y6v4rrw1yF6rTn8IkigT3zThX1B
 dUZQ==
X-Gm-Message-State: AGi0PubEJrisqHNO8Fe+Uu4XbdEngvn/fsh5wF80G7cx8whKfz/MJJ7P
 5P9bHyW1fjdGhBjg/L5SIA==
X-Google-Smtp-Source: APiQypIoY6kUC5CLLTgHsDsYf7d1b4AOMQ8Y25i9EikLDhE7xahbnoqgxdxYueOeAZkbPmnLTpOxvg==
X-Received: by 2002:a9d:7e7:: with SMTP id 94mr14201369oto.82.1589238304172;
 Mon, 11 May 2020 16:05:04 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 33sm2820423otx.31.2020.05.11.16.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:05:03 -0700 (PDT)
Received: (nullmailer pid 22115 invoked by uid 1000);
 Mon, 11 May 2020 23:05:02 -0000
Date: Mon, 11 May 2020 18:05:02 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 8/8] dt-bindings: display: Convert ingenic, lcd.txt to YAML
Message-ID: <20200511230502.GA21320@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-8-paul@crapouillou.net>
 <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LS4I9Q.A1ZGRSEVADNN1@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_160504_998353_2866CFB4 
X-CRM114-Status: GOOD (  18.18  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 28, 2020 at 04:12:21PM +0200, Paul Cercueil wrote:
> This one patch will need a V2, I messed up with the clocks.

Looks fine otherwise.

> =

> -Paul
> =

> =

> Le dim. 26 avril 2020 =E0 20:58, Paul Cercueil <paul@crapouillou.net> a =
=E9crit
> :
> > Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.
> > =

> > In the process, the new ingenic,jz4780-lcd compatible string has been
> > added.
> > =

> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> >  .../bindings/display/ingenic,lcd.txt          |  45 -------
> >  .../bindings/display/ingenic,lcd.yaml         | 113 ++++++++++++++++++
> >  2 files changed, 113 insertions(+), 45 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/ingenic,lcd.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > =

> > diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > deleted file mode 100644
> > index 01e3261defb6..000000000000
> > --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -Ingenic JZ47xx LCD driver
> > -
> > -Required properties:
> > -- compatible: one of:
> > -  * ingenic,jz4740-lcd
> > -  * ingenic,jz4725b-lcd
> > -  * ingenic,jz4770-lcd
> > -- reg: LCD registers location and length
> > -- clocks: LCD pixclock and device clock specifiers.
> > -	   The device clock is only required on the JZ4740.
> > -- clock-names: "lcd_pclk" and "lcd"
> > -- interrupts: Specifies the interrupt line the LCD controller is
> > connected to.
> > -
> > -Example:
> > -
> > -panel {
> > -	compatible =3D "sharp,ls020b1dd01d";
> > -
> > -	backlight =3D <&backlight>;
> > -	power-supply =3D <&vcc>;
> > -
> > -	port {
> > -		panel_input: endpoint {
> > -			remote-endpoint =3D <&panel_output>;
> > -		};
> > -	};
> > -};
> > -
> > -
> > -lcd: lcd-controller@13050000 {
> > -	compatible =3D "ingenic,jz4725b-lcd";
> > -	reg =3D <0x13050000 0x1000>;
> > -
> > -	interrupt-parent =3D <&intc>;
> > -	interrupts =3D <31>;
> > -
> > -	clocks =3D <&cgu JZ4725B_CLK_LCD>;
> > -	clock-names =3D "lcd";
> > -
> > -	port {
> > -		panel_output: endpoint {
> > -			remote-endpoint =3D <&panel_input>;
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > new file mode 100644
> > index 000000000000..8e9c851dc7c5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ingenic SoCs LCD controller devicetree bindings
> > +
> > +maintainers:
> > +  - Paul Cercueil <paul@crapouillou.net>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^lcd-controller@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    enum:
> > +      - ingenic,jz4740-lcd
> > +      - ingenic,jz4725b-lcd
> > +      - ingenic,jz4770-lcd
> > +      - ingenic,jz4780-lcd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Module clock
> > +      - description: Pixel clock
> > +    minItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lcd
> > +      - const: lcd_pclk
> > +    minItems: 1
> > +
> > +  port:
> > +    type: object
> > +    description:
> > +      A port node with endpoint definitions as defined in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +required:
> > +    - compatible
> > +    - reg
> > +    - interrupts
> > +    - clocks
> > +    - clock-names
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - ingenic,jz4740-lcd
> > +          - ingenic,jz4780-lcd
> > +then:
> > +  properties:
> > +    clocks:
> > +      minItems: 2
> > +    clock-names:
> > +      minItems: 2
> > +else:
> > +  properties:
> > +    clocks:
> > +      maxItems: 1
> > +    clock-names:
> > +      maxItems: 1
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/jz4740-cgu.h>
> > +    lcd-controller@13050000 {
> > +      compatible =3D "ingenic,jz4740-lcd";
> > +      reg =3D <0x13050000 0x1000>;
> > +
> > +      interrupt-parent =3D <&intc>;
> > +      interrupts =3D <30>;
> > +
> > +      clocks =3D <&cgu JZ4740_CLK_LCD>, <&cgu JZ4740_CLK_LCD_PCLK>;
> > +      clock-names =3D "lcd", "lcd_pclk";
> > +
> > +      port {
> > +        endpoint {
> > +          remote-endpoint =3D <&panel_input>;
> > +        };
> > +      };
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/clock/jz4725b-cgu.h>
> > +    lcd-controller@13050000 {
> > +      compatible =3D "ingenic,jz4725b-lcd";
> > +      reg =3D <0x13050000 0x1000>;
> > +
> > +      interrupt-parent =3D <&intc>;
> > +      interrupts =3D <31>;
> > +
> > +      clocks =3D <&cgu JZ4725B_CLK_LCD>;
> > +      clock-names =3D "lcd";
> > +
> > +      port {
> > +        endpoint {
> > +          remote-endpoint =3D <&panel_input>;
> > +        };
> > +      };
> > +    };
> > --
> > 2.26.2
> > =

> =

> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
