Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29A5C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:42:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F55F61994
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F55F61994
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kef/HQy2axDaglhioBys2HwiLi5VQ4gNNhVLT8wGmE=; b=FVGJRpEu4jn4S2
	TeA6WuegQFynEWGQNSYbSG/cqQ9915i1ZkN2hbtGvgHIvbexSDxIyXUtY7Fq1VD9Nmboj7DBdFLLc
	U30nhIs2B0oUq9Y2t5CnkMjhWhENAUTFOzGEvsFrjcUhjG2dXiQhY5aJLsdtRfS1fis51iCWHWolA
	g+089Lun7W39mcWSpaXs0Lie4Ktjq0Md7Xt6uhrachEVjgw1Ol4AW9kAeUOeb/pGgemn5aujGCO6B
	I7GHRu8bkwL+6B6qi0qEWDEYtQjqEpXP8xgVooal0OznnWldRmIr9TliLv1LSScMINxalbnJ78Pii
	V+bV5ObF8cB27TCoyvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnzSz-009nkq-0E; Fri, 19 Nov 2021 08:41:53 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnzSv-009nk7-W7; Fri, 19 Nov 2021 08:41:51 +0000
Received: by mail-ua1-f53.google.com with SMTP id ay21so19679889uab.12;
 Fri, 19 Nov 2021 00:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hbYdvHhEe2Uxe6rqTFYcB++vBPifwXHrniTsNrCDXE=;
 b=4/anjzJP0eVlU47Nzr9rTvWaMNcgkJE63kJRt2FmNBgq+BA/Pj63+eZT1zbau9VKH0
 V4dfqMwyzlbwePHiUz0ClddsQm1iWq3uo44W3eydeYMs6ztnCEarR1bETafPe9wTo0dk
 B5+b5DX0Y4qdFjoBK941zMVa3TVIVWysRlQIVfdBGqhYrevaDTTMmaHlISElnaZZrOQN
 dIfne6x/t5489mVU+9Ny6INxlrqe2SllnB9EYcRpicZTtCsHDRIu/fUwH0MVvancnXLc
 cicoQDJfaoFr4LmbDNKTvSzNnKrk6H0fF1J/niQOhXeA2NMrLMDcg4BpanHay6nCM7Ie
 DbqA==
X-Gm-Message-State: AOAM531rNUJ1oqrWhsAdYS8/GS/CM1O3x8cMqYg1Jp3cJOYf+h1M3Hsz
 Ius74WHCcfPP755S+w5w7ZDT8n8WXI2ckQ==
X-Google-Smtp-Source: ABdhPJz/s8IEAeqEbUt2nKzybtcTsipfBdRw62n0Y+dlzQ2nJr0iVEoFxf3gQTXQPk6aDurGJgw3ow==
X-Received: by 2002:a67:c79a:: with SMTP id t26mr81816094vsk.37.1637311308128; 
 Fri, 19 Nov 2021 00:41:48 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173])
 by smtp.gmail.com with ESMTPSA id w11sm1286340vkm.14.2021.11.19.00.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 00:41:47 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id d130so5506480vke.0;
 Fri, 19 Nov 2021 00:41:47 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id
 l20mr19232022vkr.26.1637311307063; 
 Fri, 19 Nov 2021 00:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-2-miquel.raynal@bootlin.com>
In-Reply-To: <20211118111940.1275351-2-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Nov 2021 09:41:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
Message-ID: <CAMuHMdXi0PPXjH_hHxO1-Lz9fupe4oo936ENe9DzMW8Sb1G6mg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211119_004150_056343_80D0C896 
X-CRM114-Status: GOOD (  23.66  )
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

CC Gareth

On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas,r9a06g032-nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1x NAND flash controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a06g032-nand-controller

As the NAND Flash Controller is present on all of RZ/N1D, RZ/N1S,
and RZ/N1L, I think you should add a family-specific compatible value
"renesas,rzn1-nand-controller" as a fallback.

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    nand-controller@40102000 {
> +        compatible = "renesas,r9a06g032-nand-controller";
> +        reg = <0x40102000 0x2000>;
> +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&hclk_nand>, <&clk_nand>;

This clocks property is not based on an actual .dtsi, right?

> +        clock-names = "hclk", "eclk";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };

The rest looks good to me.

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
