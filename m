Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3D0C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:56:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476262071E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FpyqvRBm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 476262071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=noooLVpsVY1efezVcaKCaMTIkhVD3+d6Eb3LR+WSru4=; b=FpyqvRBmkn5SiAycR8Su4256y
	NsRXi75Vtm7UhekZG+tUn1SE9FXNJGUyxAm3kNJ+vkXmTub166QOhEdaHnTBzMNVcKynQYXtnoHit
	4JQE/FrVP0AqhS5qiEvkEMwsAVEbI+39KYKj5LejqXKIi9b8IxZWlrquJSBFY+nEkUMIew+N0MNMo
	u6c607Q8+jLd7SvLfD87tNb7lMYZC65PdhHXZzQKNjjVgWSaNhF4T28p1QixZhgA4hI6C6VRT7q/m
	OfWw2CFe6uSjITMBJjULgoe9heW+1xqgmGZHC3OV+HqWOza9FQRH10o1GsQA94gefNmjJRCl9eX0h
	FQBxa+kGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kATo9-0000qz-Ju; Tue, 25 Aug 2020 07:55:53 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kATo5-0000pk-6z; Tue, 25 Aug 2020 07:55:50 +0000
Received: by mail-wr1-f65.google.com with SMTP id b17so10916879wru.2;
 Tue, 25 Aug 2020 00:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aBjVw1JG0tpm4bk51wIknFht9NwTSZ65KB4U3gClblQ=;
 b=m2ndQp4kleZUnL8v+OilFbY3fL2eF/AemOHxDE3HJyZOTWf3mDtPAUx2d2Xw4ZuRYx
 tyyZoCUSeaiXFgGB6WykQLrPQBj2xqpwjGL2nzLeeRTiJBPXEVdqEUhCdOaptd7QF5b+
 3NkT2kzxkckhNAp+7OMVG3m1L0rGa69X8kZVt6K3g/UIFtaGT3gEamAsqVvLk2HFCq4t
 M4fvfrasZCMElh4FWGG7QUiIgBOE8pMe4ZkiSidbQLYuTf62NgrnY8axCDjx4aWNoOM0
 MnKczbMAf9rck1qT4U/NZQ1S117ohgD3vGUVjHZV7bRvoNEGrAGrm9b4h068fGdjHKM4
 L/4Q==
X-Gm-Message-State: AOAM531SelrfYq5bI2Qe6Qx+yUkqDvoiTc9W4dzvnYEnXWmD5pqBWjk/
 hFpQK5YbgZmRrux0CNiVO+U=
X-Google-Smtp-Source: ABdhPJy11J0dvtltETiMUmgoqOGY5vwRYKznzFSM+Jn9Jhy70mulHl9VGChcIKqtFo0jH3ClWuVjng==
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr9247503wrp.230.1598342147767; 
 Tue, 25 Aug 2020 00:55:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id f9sm8049134wrm.5.2020.08.25.00.55.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 00:55:47 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:55:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 17/19] dt-bindings: serial: fsl-lpuart: Fix compatible
 matching
Message-ID: <20200825075543.GA10369@kozik-lap>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-17-krzk@kernel.org>
 <20200825024226.GA3843643@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825024226.GA3843643@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_035549_298935_5A53C5F9 
X-CRM114-Status: GOOD (  19.97  )
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
 linux-watchdog@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 08:42:26PM -0600, Rob Herring wrote:
> On Mon, Aug 24, 2020 at 06:26:50PM +0200, Krzysztof Kozlowski wrote:
> > The i.MX 8QXP DTSes use two compatibles so update the binding to fix
> > dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
> >     compatible: ['fsl,imx8qxp-lpuart', 'fsl,imx7ulp-lpuart'] is too long
> >     From schema: Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > 
> >   arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
> >     compatible: Additional items are not allowed ('fsl,imx7ulp-lpuart' was unexpected)
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. New patch.
> > ---
> >  .../devicetree/bindings/serial/fsl-lpuart.yaml | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > index e82c2cf9fef7..8ee651f2ef0b 100644
> > --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> > @@ -14,13 +14,17 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - fsl,vf610-lpuart
> > -      - fsl,ls1021a-lpuart
> > -      - fsl,ls1028a-lpuart
> > -      - fsl,imx7ulp-lpuart
> > -      - fsl,imx8qxp-lpuart
> > -      - fsl,imx8qm-lpuart
> > +    oneOf:
> > +      - enum:
> > +          - fsl,vf610-lpuart
> > +          - fsl,ls1021a-lpuart
> > +          - fsl,ls1028a-lpuart
> > +          - fsl,imx7ulp-lpuart
> > +          - fsl,imx8qxp-lpuart
> 
> This should be dropped.

Right.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
