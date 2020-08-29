Return-Path: <SRS0=KXyU=CH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AFCC433E2
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2020 06:25:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48B5620936
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2020 06:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fvj5xa+v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlJAZyqS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48B5620936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H9dJGZL8R0vfikoh6O9gTNwoQEsUVknt9OSSk1FPTrg=; b=fvj5xa+vavF2q0nq8vZyZ3pIM
	GRHvc0A2HTnDQj1edXYv5VehofBIald5pK1mBHM1vOP+52GPo67rl1ZnVfvLjjB1Qk6FC+Aaiv8IY
	5CffJilUXUQb4JhUwS3HOWO8+NxDYrvILKYWnC/4jB/IREXgVxWJrpDqEVsHDh7KRHNIEuWOx6wLC
	iA3L5Xt+8XYWGJ6AIk7OsKKzy3bwg1e5MTJ1DWv/ecQhEp+wgJYKnWeFBb6AYfvsfqqcbeCZdbged
	+bBObKItu9P6HKtCH0uKk5cDMCNiLkD2jNvoQP3hW6RR9NlN+UdGmU1yuA3MNJpMi/5jVYUq9e+9B
	XAKzYbblg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBuI2-0000vM-FL; Sat, 29 Aug 2020 06:24:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBuHy-0000uE-C8; Sat, 29 Aug 2020 06:24:35 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32B482145D;
 Sat, 29 Aug 2020 06:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598682273;
 bh=rO56MVIvVtBfpXUiJzwAJauYsn+0k3epFv4DZf0v930=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QlJAZyqSAmECnl4bbQSHcum5VHSkJCTsozVueyferoSttjlBPB/FITNMUinzNR1BP
 5xEy1WY8WdAAqz+oR5fUnewT/d2Jrxy4VwXsfln3ZXy7B0hLk/iwFmCmwHnYd+3zn6
 ALHbwBKZkLSF2l/4sgXjHvhaGv2AGyHDtZdZk/UA=
Received: by mail-ej1-f44.google.com with SMTP id nw23so515258ejb.4;
 Fri, 28 Aug 2020 23:24:33 -0700 (PDT)
X-Gm-Message-State: AOAM531QOglXF6uRPRrti7E1rXXHbgzF0rQ2OqCD2GJ435XSFVkJ9TFR
 QaVYtdwPDXUhYzpwsaLUieAhoddgVID57kMyg+E=
X-Google-Smtp-Source: ABdhPJxPqtl25Mm9VQlnooxEKiADTie13uCG9BQK2ZeTNWjK59f8umoolhx1AO7I9ld//ckn9tNf3hs4c0nADZ6+a0Y=
X-Received: by 2002:a17:906:3b4b:: with SMTP id
 h11mr2194097ejf.381.1598682271779; 
 Fri, 28 Aug 2020 23:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-13-krzk@kernel.org>
 <20200828213850.GA3444012@bogus>
In-Reply-To: <20200828213850.GA3444012@bogus>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 29 Aug 2020 08:24:20 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcMApvGpVAy4HSrNXu+LAdQS83FqHy+cfu3bdMBYE3jnA@mail.gmail.com>
Message-ID: <CAJKOXPcMApvGpVAy4HSrNXu+LAdQS83FqHy+cfu3bdMBYE3jnA@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8
 compatible matching
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_022434_561942_5D093743 
X-CRM114-Status: GOOD (  17.12  )
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
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 28 Aug 2020 at 23:38, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 25 Aug 2020 21:35:29 +0200, Krzysztof Kozlowski wrote:
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
> > Changes since v2:
> > 1. Remove moved compatibles.
> >
> > Changes since v1:
> > 1. Handle also fsl,imx8mm-usdhc and fsl,imx8qxp-usdhc
> > ---
> >  .../bindings/mmc/fsl-imx-esdhc.yaml           | 37 ++++++++++---------
> >  1 file changed, 20 insertions(+), 17 deletions(-)
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: compatible: ['fsl,imx8qxp-usdhc'] is not valid under any of the given schemas (Possible causes of the failure):
>         /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: compatible: ['fsl,imx8qxp-usdhc'] is too short

I will send a v4 just for this one patch. All others seem to be good.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
