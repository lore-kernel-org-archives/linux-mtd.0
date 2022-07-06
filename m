Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6815AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jul 2022 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TdtLwSGvpxFs90qAS2H6Xy2EeDXBnEuOllLO8mV2AE=; b=w8yo297snBzOEZ
	08mFXVMfLvtJZxyPE7o8BlBBHJJEEvMu4IkXAVZP4RE0GdVoDtrNzQyLkOIPWcWJp3Cllz0foQoWg
	R0lsL0hnVjNxlCDhNQpuQ5LtYj3jlYErGa87G8Gd+ncQ82Dr5927zibCXGjGvHJIBc4ryxwbJxota
	R8tcGxmHTkFJ/ixp2b4bNtocdhHt7CxWsUKy9JVWuJRPFC+4PcYUsKaMx6e1r3+Iqm/40/sX0r2CB
	DXwEOJBjbZMsoZWMtpYc4QYMlWC8S6wduulPDI2gyrmAtcG7ZclA3WuanCQnPGvU4YyOYflDqCCTJ
	QJ3Xh/WDiB0sUU0R92LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97cV-00BFA2-5d; Wed, 06 Jul 2022 16:11:19 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o97cS-00BF7O-1A; Wed, 06 Jul 2022 16:11:17 +0000
Received: by mail-il1-f180.google.com with SMTP id v1so6250175ilg.11;
        Wed, 06 Jul 2022 09:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xqvCFaRmeZZtgaYKxSb/zDtrg0BtbPrZr498xClMHoA=;
        b=hsadigSO55CEkmhqNzf8BxFu2cXafJORt5Q9lTNBSNUYm83bUgi7S2LL5N0AqZ8BhR
         9ldn7ghpB71x+fVgNNq1bzFo2WY1uymySFLHvBNsD10+mhUHGevRjdvW5JQuPkXWIq4v
         VYj0sv0TeYqfMlGulKnPQpl8gbfyU4eOk+qSwb+I1OqWf3N5vZWfAqJ+e6SPDxQUGVeD
         jN/SX9dWcf+TzvHESut+w5dyNUfascaNPvk+IS89CfsgjFIGDXxFPHMIb0w7evtN8/r+
         MfiszuodW4mDZMx9K9acyX3DaJIcr6AhvYZKgpelQma+/aQ9+TP/2H1EHBMqZcwID03x
         s9ag==
X-Gm-Message-State: AJIora9jeiXpwE6wDvYUZm3vH/PuCaR2S07+OQyGcm+eYJhGDH6zE4LY
	JLwyDb/mSXjS3UjS1keCSw==
X-Google-Smtp-Source: AGRyM1v8pCXB40SvhaQJFc1zm1w3F8CrTtVMAwVoNHW1OCBQIOXWP1i4ozkxVqIm7YI18B7NPIxp6A==
X-Received: by 2002:a92:cd8f:0:b0:2d9:5d44:6a53 with SMTP id r15-20020a92cd8f000000b002d95d446a53mr24555148ilb.226.1657123872876;
        Wed, 06 Jul 2022 09:11:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q25-20020a05663810d900b0032e1a07228asm16164339jad.26.2022.07.06.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:11:12 -0700 (PDT)
Received: (nullmailer pid 136692 invoked by uid 1000);
	Wed, 06 Jul 2022 16:11:10 -0000
Date: Wed, 6 Jul 2022 10:11:10 -0600
From: Rob Herring <robh@kernel.org>
To: Han Xu <han.xu@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Walle <michael@walle.cc>, Bough Chen <haibo.chen@nxp.com>, ashish.kumar@nxp.com, yogeshgaur.83@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, singh.kuldeep87k@gmail.com, tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, festevam@gmail.com, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
Message-ID: <20220706161110.GA123915-robh@kernel.org>
References: <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <62f113a0cdb0d58bf04ab0b274912eb7@walle.cc>
 <be521f90-97ce-c61d-d7d6-8f2bde24d824@linaro.org>
 <20220705145226.tarpvub6bh67tj63@umbrella>
 <0bd271e9-8d9b-7388-2d9b-65cc39a54f8c@linaro.org>
 <20220705155031.zk36jsq4q2ac2ow4@umbrella>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705155031.zk36jsq4q2ac2ow4@umbrella>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_091116_128117_6BF97886 
X-CRM114-Status: GOOD (  34.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 05, 2022 at 10:50:31AM -0500, Han Xu wrote:
> On 22/07/05 05:38PM, Krzysztof Kozlowski wrote:
> > On 05/07/2022 16:52, Han Xu wrote:
> > > On 22/07/05 04:12PM, Krzysztof Kozlowski wrote:
> > >> On 05/07/2022 16:06, Michael Walle wrote:
> > >>>
> > >>>>>
> > >>>>> I think you could use here clock cycles or clock phase, but then it 
> > >>>>> has to be obvious
> > >>>>> it is that unit.
> > >>>>
> > >>>> Hi Krzysztof,
> > >>>>
> > >>>> Let me clarify it, in the document a term "delay cell" was used to
> > >>>> descript this register bit. Each delay cell equals "1/32 clock phase",
> > >>>> so the unit of delay cell is clock phase. The value user need set in
> > >>>> DT just number to define how many delay cells needed.
> > >>>
> > >>> Then should the unit be "-degrees" and the possible range 0-180?
> > >>
> > >> Thanks. We don't have it documented currently, but the unit seems
> > >> reasonable.
> > > 
> > > IMO, use the unit "-degrees" makes it more complicate. Personaly I would
> > > calculate how many clock cycle delay needed, such as 1/4 clock cycle or half
> > > clock cycle. Using degree brings extra calculation.
> > 
> > And what if the next device uses a bit different divider? Like 1/16?
> > This is why we have standard units so people won't push register values
> > into the bindings.
> > 
> > > 
> > > The granularity of the clock phase change is 1/32 of 180 degree, but the range
> > > 0-180 make people feel it can be set in any degree in range.
> > 
> > Yes, because that's how the bindings are being written - allowing any
> > reasonable value, not register-specific value, to be used because it is
> > the most flexible, hardware-independent and allows further customization
> > of bindings (e.g. new devices). Embedding device programming model into
> > the bindings contradicts it.
> > 
> > Second, nothing stops you from narrowing the acceptable values with an
> > enum. This still allows extension. Your 1/32 does not.
> > 
> > > 
> > > If I describe all details of the relation between "nxp,fspi-dll-slvdly" and
> > > "delay cell" in patch v2, do you think it's clear for users?

What's a cell?

> > 
> > 1/32 could be a nice unit, but degrees is better. Just like uV is better
> > than 1/32 of V. Like 1 us is better than 1/32 of ms.
> > 
> > Do you see  in the bindings many other values like time, potential,
> > current or power described in 1/32 units?
> 
> That make sense. I will use degree as the unit and round to register proper
> value in driver as Michael suggested. Thanks for all comments.

I'm still wondering what this is delaying? From what to what? We already 
have numerous common delay properties for SPI. If one of those doesn't 
work, then should this be a new common property? And if common, I think 
time units is better to use than degrees.

If this is vendor specific, then I'd just use the register value. 
There's not much point in using common units unless it is a common 
property.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
