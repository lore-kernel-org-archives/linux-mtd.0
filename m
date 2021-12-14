Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71675C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJV6jr2yu9VOc/FkWpzIQ4ojrZpr+0s1cRG77V+aWHA=; b=XyVCl/Zrx8Uyow
	+RbNTD48mS3kKmGrIejOew/FK5YRu0XIIkpV53mY3ynoQs8u2+mvB4EVYLsn2OLQ2UPMJs64Wbkvf
	ECs7ZSswnB5y+7LwpE4FLwnEHJdJOSXtPLVFMBVyLJ2cYlAy6puaCYQhI4GG8b4TxujZX1V42o5Yv
	C/+ZsfAt35h3oiBlbCExOgv57YRgS2zgjMcEhKFkcMpklxkupw9YVYBMxRh2I8i9xKiWvmXYwldrj
	/HnqjoixqXOzoXE91IRJ+iGtvNJuAZoW+BaBLYs02IWJiN8VgzCmDPEaGAy0MrH0MlN+Kwtqm8Abr
	/7VKnNApOnMszXcz1PvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxDYy-00FcKr-33; Tue, 14 Dec 2021 19:34:12 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxDYt-00FcJX-Jw; Tue, 14 Dec 2021 19:34:11 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso22097809ota.5; 
 Tue, 14 Dec 2021 11:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vCREBi8MWAP3rMq+yvusV0B0Cmd5+72EQ4wkbwL8Qt8=;
 b=ZrbWwmFhWvY1I8glTo1zltnUh6K8sfLddyApoWVKRqMCdoGBeN/NaT1oehRoFxehvg
 glHoBpDZf8ThNvr0VmWhdIL0jCWlaEVfS+Vle055RCfppc2uY8oAzg1LF/SeHzBKUHmY
 Nwh/T40qTezsTVDsqRXPTwPfAjGEyzcJvNsH+RSca3lgKfeD9bBZbZegRET6+igA+gcF
 YI3k/AlWgiWlXqj6wlAbpUko2QLrMohE0OGBgfe/6lDgEuAaTwMCXIs0jsOoMkDtCGNI
 ZIK3/RyK1OVYWfU5q5iynWo+GqgkU9ToHgaxqr4CsSjZBB0bXh7g6jEv/hzhntQkoBFb
 ICEg==
X-Gm-Message-State: AOAM5315P97QmL4GSNaBT4Zz6pOWorJJQiacNX6GehqemZFLc+k8q23V
 iLXZgRF5Y5sNvcU8uRijAQ==
X-Google-Smtp-Source: ABdhPJzS445ppJ7YtxrZCmXQ4Ysb550vEy7U7/Nb5U0PvJN3zmwdkPgOLiU9JbdTLOoAxoh2Zn1rnQ==
X-Received: by 2002:a9d:12f2:: with SMTP id g105mr5873165otg.301.1639510446260; 
 Tue, 14 Dec 2021 11:34:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r23sm154596ooj.37.2021.12.14.11.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 11:34:05 -0800 (PST)
Received: (nullmailer pid 3776590 invoked by uid 1000);
 Tue, 14 Dec 2021 19:34:04 -0000
Date: Tue, 14 Dec 2021 13:34:04 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1
 NAND controller
Message-ID: <YbjxrFyfIz8Qydpb@robh.at.kernel.org>
References: <20211209143228.525234-1-miquel.raynal@bootlin.com>
 <20211209143228.525234-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209143228.525234-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_113407_685070_70B1CC39 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, Dec 09, 2021 at 03:32:25PM +0100, Miquel Raynal wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
> 
> Provide a family-specific "rzn1" compatible and a more specific
> "r9a06g032" one.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../mtd/renesas,rzn1-nand-controller.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> new file mode 100644
> index 000000000000..cc6a358e33d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas,rzn1-nand-controller.yaml#
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
> +    items:
> +      - enum:
> +          - renesas,r9a06g032-nand-controller
> +      - const: renesas,rzn1-nand-controller
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
> +      - const: nand_hclk
> +      - const: nand_eclk

'nand_' is redundant.

> +
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: true

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +
> +    nand-controller@40102000 {
> +        compatible = "renesas,r9a06g032-nand-controller",
> +                     "renesas,rzn1-nand-controller";
> +        reg = <0x40102000 0x2000>;
> +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
> +        clock-names = "nand_hclk", "nand_eclk";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };
> -- 
> 2.27.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
