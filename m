Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBEFC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:20:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 515FE2071E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LW1fOyN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 515FE2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9SpoaazmISmNbJvYBW7ASDTUcLRHzLBTR4EEHj9FvWk=; b=LW1fOyN2375bz57aCcQ7Bd4mT
	eC81cdG1FW/stfm6NwRNgR5NGn5EudzMHMrhtvDsyiJ8WwHQC/uGGa0ijF6fzwYOqt7VvuV5r97jb
	jqannkfLinvTh5IxonU9Q4/etCds2kdolD5+Ul0xFf1ck/Kf94MRL34LQJki2VgH4PBl9b0UDSFnd
	fxHOvFJmEo/99/vVsGrcXrV4Lmd9GpwWOoSnDDvZNUCK1RQcJiSfbj9QFJnF05B9yZOYWWhnkxtRC
	3I+pPQTU5eVBiQBcScz06/79AoFWB3ijkEKFRoeuC9B0zHO41dMQPfeX8ahYTeSA3/p/yCnTvv1rG
	5r80QdYkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kATEi-0004Ql-5A; Tue, 25 Aug 2020 07:19:16 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kATEb-0004Lu-TM; Tue, 25 Aug 2020 07:19:10 +0000
Received: by mail-wr1-f66.google.com with SMTP id 2so436971wrj.10;
 Tue, 25 Aug 2020 00:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WzjocZ6AbgdZxSRavuClgS3bWv6X8HTLysz12xiMgeg=;
 b=cel0dkp5fa1xUjhknDD12hBLegO4ltvRvTmm6gCEkS3eC4274jSq+Zus5J+chpLxYF
 bj7JE+2f6jX44audsqel3vVbdYN/rqaDFxA6DCbg5AVYRJPUJ+7umlmz9Hzm9DjxIq4/
 SMMVOm0YhImEkJRKQVlLevw6AdGNN1H2bTvaF1SKIQDnxQJHfXMV46q8PqSf+D4818p6
 pZ5IX26zEyPY5WgKV+7VDNf7tx0uQYv83G4CRtm+1h0+CTixi43tfRc5tOth9qZTnAhS
 +1gniSx/yNywV+yeUweK0G7wTA8B9CkqW5E7DS64vPhqB7jon6pKRncu46CfjctENM2h
 X5Eg==
X-Gm-Message-State: AOAM532K5BnaVJFdlCEqDKGG9SDu8eqKTT/wktpV6+hG+NHeIx1NPvuG
 HQns7OJ7vold4UfV5bGABTjzm+tg8SRb4Q==
X-Google-Smtp-Source: ABdhPJwkhdWQGkLwZ00kAqnPEmqc8N+HVtkEdsjRUBu5ZaCv9oCeqT0wAbIggVlRGDIzjGcy8OFy8Q==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr9451383wrv.104.1598339948999; 
 Tue, 25 Aug 2020 00:19:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id c6sm1611593wrr.15.2020.08.25.00.19.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 00:19:08 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:19:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 13/19] dt-bindings: nvmem: imx-ocotp: Update i.MX 8M
 compatibles
Message-ID: <20200825071905.GE3458@kozik-lap>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-13-krzk@kernel.org>
 <20200825023904.GA3837236@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825023904.GA3837236@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_031909_970428_FD0477E6 
X-CRM114-Status: GOOD (  19.41  )
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

On Mon, Aug 24, 2020 at 08:39:04PM -0600, Rob Herring wrote:
> On Mon, Aug 24, 2020 at 06:26:46PM +0200, Krzysztof Kozlowski wrote:
> > DTSes with new i.MX 8M SoCs use two compatibles so update the binding to
> > fix dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000: compatible:1: 'syscon' was expected
> >     From schema: Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> > 
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
> >     compatible: ['fsl,imx8mn-ocotp', 'fsl,imx8mm-ocotp', 'syscon'] is too long
> > 
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
> >     compatible: Additional items are not allowed ('syscon' was unexpected)
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/nvmem/imx-ocotp.yaml  | 39 ++++++++++++-------
> >  1 file changed, 24 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> > index 1c9d7f05f173..b5b250185afd 100644
> > --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> > @@ -19,21 +19,30 @@ allOf:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - fsl,imx6q-ocotp
> > -          - fsl,imx6sl-ocotp
> > -          - fsl,imx6sx-ocotp
> > -          - fsl,imx6ul-ocotp
> > -          - fsl,imx6ull-ocotp
> > -          - fsl,imx7d-ocotp
> > -          - fsl,imx6sll-ocotp
> > -          - fsl,imx7ulp-ocotp
> > -          - fsl,imx8mq-ocotp
> > -          - fsl,imx8mm-ocotp
> > -          - fsl,imx8mn-ocotp
> > -          - fsl,imx8mp-ocotp
> > -      - const: syscon
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx6q-ocotp
> > +              - fsl,imx6sl-ocotp
> > +              - fsl,imx6sx-ocotp
> > +              - fsl,imx6ul-ocotp
> > +              - fsl,imx6ull-ocotp
> > +              - fsl,imx7d-ocotp
> > +              - fsl,imx6sll-ocotp
> > +              - fsl,imx7ulp-ocotp
> > +              - fsl,imx8mq-ocotp
> > +              - fsl,imx8mm-ocotp
> 
> > +              - fsl,imx8mn-ocotp
> > +              - fsl,imx8mp-ocotp
> 
> Should be dropped.

OK

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
