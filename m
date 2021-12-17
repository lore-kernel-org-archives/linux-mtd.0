Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97F4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9Y6/YOJeTE2vW0MXK3VPrlMsBlA+XswA6/tAnTvl7s=; b=Up64z6xCqDuIFk
	owPUZ9JFJDZOCAbwBvaPRW7f4zyJl6MyZOQ2saVKXBdeToZuksbnQK0HB0D/ajmXalbEOMNIa7pSI
	VZC1phXM+ZGzu7YqjWaUZXMml81RjdAMVwCdmrUlbs/skTlTUibCgwuHYYBHYAwZ4fHAx2heYrMcA
	Yw9rFcVwU+JN3Shku91d9T8QEvrLPpa7xsVETkukX+AhdCWjCbJ4REo/bQk91XPnhkMwC/3UER9Ym
	JpL1xUjQrND31jpWwHlboTlX6JS+2keVMU0cb+/koQDSsppzP0BEhnb4Rg1hefpg5tfMJNRqPA6m4
	5L9OvzpLeicynn0A+nPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFX1-00B0AE-Ly; Fri, 17 Dec 2021 15:52:27 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFWy-00B08p-DO
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:52:26 +0000
Received: by mail-ua1-f47.google.com with SMTP id a14so5254543uak.0
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:52:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SB2NWsmLTsepxyoQU9H+PL596jXArbv3qXU+p+X0c80=;
 b=PjNtJmBsPrz2no3HQ6b6VX1aJHgaE73aTOw5JVkrzXbCREYTcPOpLqnlsC9XZX5L2q
 Gyy2ej0C9T3V7TXgyJ9L1n+xe0KEty/kfbmd8zDJmwCu9NTVVtUVbQQyrcHeHsp4adYh
 Q9+KRL0her79B3Q/04sDxn5ApWp/rpEETZthNrEcSIwZD+xITD+zCfmr7lW9ntrtOIEi
 Eqce5jeMgpR1CWEV3ZxCXBCcOW4Uxqlp53aT9lGxZhrw279y6FCugQFWiM+vCI/UKGI6
 a7eokTmjpc+OuIvU4du0sUN+d5hFXO3EQ//xIHWLpPdmfgJOPKLSTPfmDrWqOdXnV3C4
 xnLQ==
X-Gm-Message-State: AOAM532ik+jtnq0Ron7PxvHCsogI8LKYitl0AdQuk0NiWXK2m1pIlhMk
 wQGZN5ALIzaatcjYT61IbybTQEA73NSpbw==
X-Google-Smtp-Source: ABdhPJy4dr0BfBcRHaarbOgSAzC4sw33pTOHhDMW8xONwqyuYdyF6gG8bgxZpMdeJsvDRzyyaHiwPg==
X-Received: by 2002:a9f:3649:: with SMTP id s9mr1224604uad.123.1639756342641; 
 Fri, 17 Dec 2021 07:52:22 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id q141sm1192640vke.12.2021.12.17.07.52.21
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:52:22 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id u198so1794287vkb.13
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:52:21 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr1456326vke.33.1639756341701;
 Fri, 17 Dec 2021 07:52:21 -0800 (PST)
MIME-Version: 1.0
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-2-miquel.raynal@bootlin.com>
 <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
 <20211217165102.6950cf40@xps13>
In-Reply-To: <20211217165102.6950cf40@xps13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 16:52:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbusN_wdLYPP4DuVJ+E+OAw7_v-9o9sY-t=YdiM7271g@mail.gmail.com>
Message-ID: <CAMuHMdVbusN_wdLYPP4DuVJ+E+OAw7_v-9o9sY-t=YdiM7271g@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car
 Gen3 & RZ/N1 NAND controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Wolfram Sang <wsa@kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>, 
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075224_503220_D68553C1 
X-CRM114-Status: GOOD (  32.65  )
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

On Fri, Dec 17, 2021 at 4:51 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 17 Dec 2021 16:44:59 +0100:
> > On Fri, Dec 17, 2021 at 3:20 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > Add a Yaml description for this Renesas NAND controller.
> > >
> > > As this controller is embedded on different SoC families, provide:
> > > * a family-specific "r-car-gen3" compatible and a more specific
> > >   "r8a77951" one
> > > * a family-specific "rzn1" compatible and a more specific "r9a06g032"
> > >   one
> > >
> > > More compatibles can be added later if new SoCs with this controller
> > > must be supported.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Thanks for the update!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> > > @@ -0,0 +1,66 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/renesas-nandc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas R-Car Gen3 & RZ/N1x NAND flash controller device tree bindings
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +
> > > +allOf:
> > > +  - $ref: "nand-controller.yaml"
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,r8a77951-nandc
> > > +          - const: renesas,rcar-gen3-nandc
> >
> > Might be a bit premature to add these before they have been tested,
> > and because there are small differences in integration, cfr. below.
> >
> > > +
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,r9a06g032-nandc
> > > +          - const: renesas,rzn1-nandc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: APB host controller clock
> > > +      - description: External NAND bus clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: hclk
> > > +      - const: eclk
> >
> > On R-Car Gen3, there's a single module clock.
> > Plus a power-domain to manage that.
> >
> > Actually the RZ/N1 clock driver also registers a PM Domain, so letting
> > Runtime PM manage the clocks may work on RZ/N1, too...
> >
> > On R-Car Gen3, there's also a module reset.
>
> Ok, I didn't know. I propose to drop the r-car-gen3 compatible entirely
> from the driver and the binding when I'll apply the series. Is it fine
> for you?

Yes, that's fine for me. Thanks!

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
