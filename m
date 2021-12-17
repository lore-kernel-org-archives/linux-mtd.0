Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EEBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uobFHf9VoxgR1jiVBvcCDdwWhO5pBFFlpc1xDhS8WRk=; b=OXLYWqrkijWkDw
	1SLBn7j8DilSFPwpNvYoYpw8urSZlcfHBg1LW/pStdbWki+AL9KsYnQ9tAcusjEoBmLU8z1HvaaE4
	Qhp/Lma3f8syD8dRtsfxxPaah3//2mtvZMMDWmi5smf7Om9qTtp1MBlNrGuqBCLG2ABW2nfyH8uMW
	kEnt+ul327ecPogxn9U/d5FlEyaq5T0NmHsJwyNdVT4OX1wtl+JN7yQRZavHHPVtWVnRmiyZMSc6c
	C3bhwZTuZHbr67i5CZIFFDbh2+Cf1LDvKON4JLnySc/qjmkxFt6SFmQ7bkRKKK4auDTlJoe19UwqD
	AfMhymfXv0oGIsE3at0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFQ6-00AwhB-2a; Fri, 17 Dec 2021 15:45:18 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFQ2-00AwgM-Qq
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:45:16 +0000
Received: by mail-ua1-f45.google.com with SMTP id y22so5154220uap.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nMMzdvtpdWB9OZVCj46gQtFtuOfodcP8PtHfwWBR+Qw=;
 b=rlJtKU0Kgg2x36sOSnjTqEIMoBM5/CWDm6329Vvx/D6QAfLua9dEfuGpy5+OZt/fi1
 JSmtfxkCKMaduVuVPgcED9Xuq/2htV+WH6jjfniq5RmS8jxFFXmvBf2nIG280KsjdqTE
 9+PX82d1iKDoOFNomBSlfKkQnxSek736P2/lyAedLCbzg93YbyAZU2zteo6SnnP6Q9mc
 8IKq5rRsHtN6/l4OeTQH/5bdAoKFpj9v/rJUzNWBNzH1D+7vxSFwXJO3kp4UfXrtI/lf
 hR5vs8C1sdSbCoarPBO2kLefLwq/2n4tck4+vxECWOua/MO3PHMkmFxNeQhoOsDZAU5m
 tSog==
X-Gm-Message-State: AOAM530Jp3+EkeC0vRv9lT0HadaefF9e0TQkK0U9/+ECgAt17e9RqYy1
 374ClrSGKKc6Yj/mafCkbrVGdb1CbB6YQg==
X-Google-Smtp-Source: ABdhPJwleH1AuOffy9yopzpQQ9/Gvf4s2aGqrD2iIZPbTOcmSrxjSJrlkccE8qZe2ExGpFUkwnog3Q==
X-Received: by 2002:ab0:61d9:: with SMTP id m25mr1413014uan.114.1639755913045; 
 Fri, 17 Dec 2021 07:45:13 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id y7sm1769716uac.3.2021.12.17.07.45.12
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:45:12 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id 107so5059714uaj.10
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 07:45:12 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr1251114vsg.57.1639755911970; 
 Fri, 17 Dec 2021 07:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-2-miquel.raynal@bootlin.com>
In-Reply-To: <20211217142033.353599-2-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 16:44:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
Message-ID: <CAMuHMdWnyLjzDf0oC1ttTarY4kaJD+xcrnkvug-i+8GHgRWmyg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211217_074514_896984_9AA17310 
X-CRM114-Status: GOOD (  26.05  )
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

On Fri, Dec 17, 2021 at 3:20 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Add a Yaml description for this Renesas NAND controller.
>
> As this controller is embedded on different SoC families, provide:
> * a family-specific "r-car-gen3" compatible and a more specific
>   "r8a77951" one
> * a family-specific "rzn1" compatible and a more specific "r9a06g032"
>   one
>
> More compatibles can be added later if new SoCs with this controller
> must be supported.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas-nandc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Gen3 & RZ/N1x NAND flash controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a77951-nandc
> +          - const: renesas,rcar-gen3-nandc

Might be a bit premature to add these before they have been tested,
and because there are small differences in integration, cfr. below.

> +
> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-nandc
> +          - const: renesas,rzn1-nandc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB host controller clock
> +      - description: External NAND bus clock
> +
> +  clock-names:
> +    items:
> +      - const: hclk
> +      - const: eclk

On R-Car Gen3, there's a single module clock.
Plus a power-domain to manage that.

Actually the RZ/N1 clock driver also registers a PM Domain, so letting
Runtime PM manage the clocks may work on RZ/N1, too...

On R-Car Gen3, there's also a module reset.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +
> +    nand-controller@40102000 {
> +        compatible = "renesas,r9a06g032-nandc", "renesas,rzn1-nandc";
> +        reg = <0x40102000 0x2000>;
> +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
> +        clock-names = "hclk", "eclk";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };

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
