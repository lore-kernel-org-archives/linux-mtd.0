Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EDCC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:09:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFAE0207FB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lNL2nH7/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFAE0207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vmTIBGKeBK9u5wDLjVlSBQ2hjCup3FPYPdt+R25s4OE=; b=lNL2nH7/ZppgyY/04trdWxYTz
	tQGjYt0Uxc526Kce8xri/OgLHRUN8fijGyUKe/yR5banIXZ06aZFZUgHsgJuQtzVyF74zk5h+CdAC
	PLGAlfPxKNO9GBdUJbsCXDWeeXU8sim/NpxH7CtSs+z2jB/Y5xDLlysY6undqS3n600xcTe/KJA9j
	bHCxjkBIVXOj6MPXYINOjs2FSGn13ZTxqywQ/ReNMhtqsLWwizcI+a4GtU2MXYSAPLi5o1XCIyuQ9
	GEXx5wUe4NH5B5bDBg8/HyEDmaK4htLxxvmIgg/L54SErNfmTdEeF8eu23HallX1W5WBwr/RWyiVi
	mKxapw/4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAT4l-0001Hg-Ra; Tue, 25 Aug 2020 07:08:59 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAT4h-0001G8-JO; Tue, 25 Aug 2020 07:08:56 +0000
Received: by mail-wr1-f66.google.com with SMTP id 2so409089wrj.10;
 Tue, 25 Aug 2020 00:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l54b9M6lsfNgFjV5LriaXZxkCjRvfaXuheWXTmhA8H0=;
 b=AdjMaUT8D43OKK6bvN4m7wA0bXvtif8rcSSddePTz9ONbmiKsrzFA6iZ4MVTn0S/Mw
 XhWM2a0GSDHvIKadUu15RTrZOHHJ8O7Uv9U7gtX690XqCYlOxYfGDg9I5c8adoZoZdSL
 F95GHoErIjoiavrf9WotnH4+JQXdnuMRIWNNR8fNWvepyvPole8tPwfYDuHbUej0lV7N
 tT7FVgIhceok2EhwHLhqZRbPV7Aq7MC+lQ2JeGFmDd0eCjuCcR6HZmU4fwH+vPcvDf4c
 PgNKH6q95qHKaVzIG4L+/y5PA/A2oiTjvKlnIpjLw40ieabTmniuXMsaFrZzZxbAegRC
 i/aQ==
X-Gm-Message-State: AOAM530Bimscm+gs4B4fszCUerCeVE45Ysu1HB5hlZGvk3BsHkcGePm3
 Nhy1k7AAdFFKimaGDZs74kE=
X-Google-Smtp-Source: ABdhPJx6Y8Pp2Xu+VQIJdGvRDGKdAFvlXR7vDcNPN4yTT16XHARtlil/gzCAiQcAzCm0WH80KJ2xHQ==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr9680913wrs.419.1598339333020; 
 Tue, 25 Aug 2020 00:08:53 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id h11sm29004318wrb.68.2020.08.25.00.08.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 00:08:52 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:08:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 12/19] dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8
 compatible matching
Message-ID: <20200825070849.GC3458@kozik-lap>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-12-krzk@kernel.org>
 <20200825023801.GA3835035@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825023801.GA3835035@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_030855_653539_D4D6FEED 
X-CRM114-Status: GOOD (  20.08  )
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

On Mon, Aug 24, 2020 at 08:38:01PM -0600, Rob Herring wrote:
> On Mon, Aug 24, 2020 at 06:26:45PM +0200, Krzysztof Kozlowski wrote:
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
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Handle also fsl,imx8mm-usdhc and fsl,imx8qxp-usdhc
> > ---
> >  .../bindings/mmc/fsl-imx-esdhc.yaml           | 40 +++++++++++--------
> >  1 file changed, 23 insertions(+), 17 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > index 10b45966f1b8..54f05e2a4246 100644
> > --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > @@ -21,23 +21,29 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - fsl,imx25-esdhc
> > -      - fsl,imx35-esdhc
> > -      - fsl,imx51-esdhc
> > -      - fsl,imx53-esdhc
> > -      - fsl,imx6q-usdhc
> > -      - fsl,imx6sl-usdhc
> > -      - fsl,imx6sx-usdhc
> > -      - fsl,imx6ull-usdhc
> > -      - fsl,imx7d-usdhc
> > -      - fsl,imx7ulp-usdhc
> > -      - fsl,imx8mq-usdhc
> > -      - fsl,imx8mm-usdhc
> > -      - fsl,imx8mn-usdhc
> > -      - fsl,imx8mp-usdhc
> > -      - fsl,imx8qm-usdhc
> > -      - fsl,imx8qxp-usdhc
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx25-esdhc
> > +          - fsl,imx35-esdhc
> > +          - fsl,imx51-esdhc
> > +          - fsl,imx53-esdhc
> > +          - fsl,imx6q-usdhc
> > +          - fsl,imx6sl-usdhc
> > +          - fsl,imx6sx-usdhc
> > +          - fsl,imx6ull-usdhc
> > +          - fsl,imx7d-usdhc
> > +          - fsl,imx7ulp-usdhc
> 
> > +          - fsl,imx8mq-usdhc
> > +          - fsl,imx8mm-usdhc
> > +          - fsl,imx8qxp-usdhc
> 
> These should be dropped.

You're right, thanks.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
