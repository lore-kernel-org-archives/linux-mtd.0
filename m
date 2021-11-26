Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4AEC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXGquD998At+PQkhg8YUYBOkrFzCoZwaL8ovRovAxHg=; b=vOR1k4ounYe1W+
	k5VLLzHgbXnrNCj9Ely37FwEV2rjGe5AQuv+ENe/w5XpIMmrjhev4yubUukft7FkDd98iqKMk8rok
	c22LL3siQSW9bwNwv2krJcXOod6gADT4Bwdh7+LZwtwBORH7uXTd87TxeC+svsXnwcDZsI6Nad2VK
	cPfPM3B1FzoaFPWFPm9h2qn/OLpjqUq68J7oWneehJemiK0XwFAK6N+MDsN8NAOmXk4nTRkCW60zz
	25c5aZ3mct9/e+mzxNEwnswqD1ANVgzFh5r5HN5mD60oCwekZHbKNgAnZBc4iGvIsXQy0BetgeYQt
	596mD518cKkh4hlZh7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqa9l-00AJwS-Rr; Fri, 26 Nov 2021 12:16:46 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZnO-00AEx3-HM; Fri, 26 Nov 2021 11:53:40 +0000
Received: by mail-vk1-f176.google.com with SMTP id j1so5801506vkr.1;
 Fri, 26 Nov 2021 03:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Vr6LQRx/2btwNNMMTPm/WQ+WFiCgvUsdZ5S4F38wac=;
 b=AawbN6+JTu+hnaPdpLXdhRIkzyiyV5wwdFkPhoQ/N0/bknrq0ne48mlQb8NrW63MpL
 xNwLag1k8kU2uvFtrM++RVV8kCFLBSUklcWFhlnmv3/aCLFtwrCoxfqaV4RNMKEo0G1s
 7nWvjOnX5NfXJdENkMy+ZzZoMjQrpRbLeL7wabmZTo35hfqUzHNd4G7GqIBw4YdQWobU
 ThZzmtshQGXLjGwjcvFBVAdsVYxXkhHkzlWEEaJoeKP74DV4/NHTZkw8JBFDiceLwy8W
 JCGdpZ8iaGwIkuxZ+2tbkR5+ySZpeGKsnmMBQpPYC04UBhvbu3HL/nS2UvaeCjicWScM
 p7Fg==
X-Gm-Message-State: AOAM5317aVxgOwrJlt1pQLd4aRyY8VV1/gX3r4gVb4l0/D02+ewOqafI
 Es6xDann01w77tq6QQ/sS5RYJIHlvpHx2Q==
X-Google-Smtp-Source: ABdhPJxU8XMMiiI1Ts9CZeVQzulEsGUJpcCrAdnqBWKZ/6KcxRTaSaDcYqCOatO7dkaZFcDQIwXmFA==
X-Received: by 2002:a05:6122:2158:: with SMTP id
 m24mr18809027vkd.1.1637927617332; 
 Fri, 26 Nov 2021 03:53:37 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id c9sm3825539uaf.12.2021.11.26.03.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 03:53:35 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id l24so18111128uak.2;
 Fri, 26 Nov 2021 03:53:35 -0800 (PST)
X-Received: by 2002:a05:6102:3ed4:: with SMTP id
 n20mr16273698vsv.57.1637927615195; 
 Fri, 26 Nov 2021 03:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com>
 <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
 <20211119101907.2ce429e6@xps13>
 <CAMuHMdU_uJv2dUk21DKJnLSUErhvObOb1wJOZTqv_UXZ0edRBQ@mail.gmail.com>
 <20211126124649.498366ee@xps13>
In-Reply-To: <20211126124649.498366ee@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Nov 2021 12:53:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX74Lj4Jy8Wpmy3Qze36knV5btGEa0O8Y0BjH4m51_D8w@mail.gmail.com>
Message-ID: <CAMuHMdX74Lj4Jy8Wpmy3Qze36knV5btGEa0O8Y0BjH4m51_D8w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211126_035338_622398_8743A404 
X-CRM114-Status: GOOD (  35.13  )
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

On Fri, Nov 26, 2021 at 12:46 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 19 Nov 2021 10:36:16 +0100:
> > On Fri, Nov 19, 2021 at 10:19 AM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:41:35 +0100:
> > > > On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> > > > <miquel.raynal@bootlin.com> wrote:
> > > > > Add a Yaml description for this Renesas NAND controller bindings.
> > > > >
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> > > > > @@ -0,0 +1,60 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Renesas RZ/N1x NAND flash controller device tree bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: "nand-controller.yaml"
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: renesas,r9a06g032-nand-controller
> > > >
> > > > As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
> > > > and RZ/N1L, I think you should add a family-specific compatible value
> > > > "renesas,rzn1-nand-controller" as a fallback.
> > >
> > > I see, that's right, I should have added two compatibles.
> > >
> > > As there is currently only one 'specific' compatible (r9axxx), should I
> > > describe the two compatibles as being mandatory? Or should I set the
> > > most specific one as optional and the least specific one (rzn1)
> > > mandatory?
> >
> > Yes please.
>
> I am a little bit confused to which answered you said yes.

My apologies: yes to making both mandatory.

> >  Else you need to match on both in the driver, or we cannot
> > differentiate later if the need ever arises.
>
> I believe you meant "yes the two should be described as mandatory in the
> bindings" (at least for now) so that when the need arises, the most
> specific one can be replaced with a oneOf choice. Am I right?

Exactly.

You can already use "enum" for the most-specific one, so it's clear where
to add new lines, and to minimize future changes.

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
