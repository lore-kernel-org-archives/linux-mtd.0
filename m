Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57B2C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E5261B04
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88E5261B04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hxqTpKaX/BKKBjAowNgqy0sMq8wweQq/hWJbd8NUX4=; b=ROcjfWpIxyAfyg
	s+cnNElYWqtdtsa8iQ03qNLqdxqRPbGpxy+H48BMLcuxrvB5IGsHJXSeL5IOa9QZSMTBVi+mdytgb
	gAe2EuCCwhkuKbXpFdLOGJZl8vINd3p3hzC37OiKYn7+p4h1HiWt4Y37i+1k9Z052mpbBM6UykYip
	seRq23fjcQ1HtLaWmVzecGwinUKHN/TT77WmOgF+tnPLsdnLFP6Pjlm9fitPcX3RMXzmlPQwKfFZ2
	tSbfOQiiyp9yWQM1GBXML2B6eNYkYd/tw2i5y+mng6EBmFmgpb5RDMMtQQbsYr7tWvhQ6n1VKwbS/
	gBOXN14eN1x0yZwxvYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo0Js-009zw5-AX; Fri, 19 Nov 2021 09:36:32 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo0Jq-009zvi-7U; Fri, 19 Nov 2021 09:36:31 +0000
Received: by mail-vk1-f182.google.com with SMTP id k83so5523586vke.7;
 Fri, 19 Nov 2021 01:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6pUQJ8pyQkzbHxZwmUeymcTJqi29mxOuyrl7ESyUNI=;
 b=vlxLkbMWyTtFGA9NBN8/FOPyH5gwm6gX1TjFpuBNJmKaqb8kuAcve7KwhbsG5WJypk
 0+9DPB0O8DDvfgmk5cMTvqu6ZaVbBxLkVKQBjhHhb2gEvYkChjlCSPcFw8exrOZpwd/S
 s4WbhHTsMxI8Js6xlT1WcAVFbENRNDO8yyub4E2WS4KgsgV3skeiIQHtnvdMQrz/ji24
 QTSYCpf8qeP0/ZNFLeDYaDiYUeYHbcVwk/YkcBsFq5YO/SBve0E3EzWVJiv3TrUMTmYn
 diP+WUtB8CgW2Kjwh70irB0t/5i0sd9fHJjhmNgxVoFJoAnkGKQIUXhKrcZI8D06rQyH
 WaOw==
X-Gm-Message-State: AOAM530cBF8oZV2k4fOueviJiiVbzMmDl3XVbStJm9R2kwHRuofr1ymh
 v1+mm8dA73qOfengBcsIwkr3jM/0ud3M4Q==
X-Google-Smtp-Source: ABdhPJwlIl8eSmntmu2QAsqCUlts47d4KQPQX1hIUOhYXZO9oGBJDHPk6ko/LvXGeKcNLE7gmUTmnQ==
X-Received: by 2002:a05:6122:1cf:: with SMTP id
 h15mr114465591vko.22.1637314589119; 
 Fri, 19 Nov 2021 01:36:29 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id f132sm1407153vkf.18.2021.11.19.01.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:36:28 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id m19so5519706vko.12;
 Fri, 19 Nov 2021 01:36:27 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id
 x14mr115833208vko.7.1637314587611; 
 Fri, 19 Nov 2021 01:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com>
 <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
 <20211119101907.2ce429e6@xps13>
In-Reply-To: <20211119101907.2ce429e6@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Nov 2021 10:36:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
Message-ID: <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1 NAND
 controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, 
 Milan Stevanovic <milan.stevanovic@se.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Gareth Williams <gareth.williams.jx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_013630_297253_5D7549FF 
X-CRM114-Status: GOOD (  28.15  )
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

Hi Miquel,

On Fri, Nov 19, 2021 at 10:19 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:41:35 +0100:
> > On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > Add a Yaml description for this Renesas NAND controller bindings.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas RZ/N1x NAND flash controller device tree bindings
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +
> > > +allOf:
> > > +  - $ref: "nand-controller.yaml"
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: renesas,r9a06g032-nand-controller
> >
> > As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
> > and RZ/N1L, I think you should add a family-specific compatible value
> > "renesas,rzn1-nand-controller" as a fallback.
>
> I see, that's right, I should have added two compatibles.
>
> As there is currently only one 'specific' compatible (r9axxx), should I
> describe the two compatibles as being mandatory? Or should I set the
> most specific one as optional and the least specific one (rzn1)
> mandatory?

Yes please.  Else you need to match on both in the driver, or we cannot
differentiate later if the need ever arises.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
