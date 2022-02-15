Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F21C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 21:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvMVle7BP2k1rHMTNPNxclTCh4cAA0hF51nN/9K8qcI=; b=J4ypNK0HV7JtSt
	vjLgSHJL1LDdc0q8esamioe7x+PF/T165Bz3w1cs4GLyQWhB1DjkfhI3HFovSDrPQ0fMDfusB+Xhj
	S9NDrWi+Teof1/6vLZIHgWftVT5T1UYSmrKRmrkxyEaquuPVZQo/MgZiOaETEOUDe+5fhszZe/Y60
	pSkIjK1yZ1fuFwUHL9pqRBxu/b0d9jEBKArHyWUy98qIDjOgtkQytiSSL1SmJryiLsGckuQtpvlPk
	3GxplrSYHmSKcV6G0ESxUXkx7mOVcD6v2f0ml7VYTP2wzgO6vWwJPe4fPJRzEv+/rKuHGXvMHIXjP
	qXwe5LoZczw/7S6uj8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK52D-004duP-VZ; Tue, 15 Feb 2022 21:06:54 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK529-004dsh-Pl; Tue, 15 Feb 2022 21:06:51 +0000
Received: by mail-il1-f176.google.com with SMTP id p11so15846296ils.1;
 Tue, 15 Feb 2022 13:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B1+ZJcMtyBX3FqM5G6Lma2k2jOm6NmZZ5jVlCb7Pess=;
 b=ihh5mujFLArJmZlnK2qluyCvw2hqvyY1lpJO+q8iWLer7de/TdUGZ94fT/xeLKv+DT
 sA4uWQV+lJyT3xbUIlwUezKTDcDvyVQETWXSNarVwFd7d+X8jaybd0qrRekp5mxn3FzT
 ofzRaZa07DbNhLo0ruZfgiltfL7Oz9e+NPCnUV/lmtVT7P3LB0ZOTMG23xuyuA7+N8vD
 UvijjN8yRCSe9D5ZBg51OmyV7a2sKJBcrwCZl/0siNsYVBDPE/k+WDUOjpx25X19OmQS
 W/G4H4pleIcvdpNEk8KEAlIHXJL13CLAqf/2c7ZkIe5qltF2xMgUE2YN4fEJ+ZXQg0fy
 Wd7g==
X-Gm-Message-State: AOAM5301jcUiHSRiHZWllEHfWopSHxWVDy1avEa2o1kv+fj70wGweY/e
 srR6SAcKJi/v0NzuioN+hg==
X-Google-Smtp-Source: ABdhPJx/uzMzNSMXMusiikoo4Gc24MlhELBj8Wua6sRn0ptpOYyIhLnne+CKrcXbcNur4Z/7s9dxng==
X-Received: by 2002:a05:6e02:20c6:: with SMTP id
 6mr569254ilq.242.1644959208389; 
 Tue, 15 Feb 2022 13:06:48 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id y29sm3877610iox.46.2022.02.15.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 13:06:47 -0800 (PST)
Received: (nullmailer pid 3921594 invoked by uid 1000);
 Tue, 15 Feb 2022 21:06:45 -0000
Date: Tue, 15 Feb 2022 15:06:45 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Message-ID: <YgwV5ZGCbrNhlk0s@robh.at.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-3-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214094231.3753686-3-clg@kaod.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_130649_864840_9D81770D 
X-CRM114-Status: GOOD (  18.11  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 14, 2022 at 10:42:23AM +0100, C=E9dric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> =

> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-=
fmc.yaml
> =

> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yam=
l b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> new file mode 100644
> index 000000000000..ed71c4d86930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/aspeed,ast2600-fmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed SMC controllers bindings
> +
> +maintainers:
> +  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> +  - C=E9dric Le Goater <clg@kaod.org>
> +
> +description: |
> +  This binding describes the Aspeed Static Memory Controllers (FMC and
> +  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-fmc
> +      - aspeed,ast2600-spi
> +      - aspeed,ast2500-fmc
> +      - aspeed,ast2500-spi
> +      - aspeed,ast2400-fmc
> +      - aspeed,ast2400-spi
> +
> +  reg:
> +    items:
> +      - description: registers
> +      - description: memory mapping
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  "@[0-9a-f]+":
> +    type: object
> +
> +    properties:
> +      spi-rx-bus-width:
> +        enum: [1, 2, 4]
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    spi@1e620000 {
> +        reg =3D < 0x1e620000 0xc4
> +                0x20000000 0x10000000 >;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D "aspeed,ast2600-fmc";
> +        clocks =3D <&syscon ASPEED_CLK_AHB>;
> +        status =3D "disabled";

Why is your example disabled? Drop 'status'.

> +        interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +        flash@0 {
> +                reg =3D < 0 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                status =3D "disabled";

Ditto.

> +        };
> +        flash@1 {
> +                reg =3D < 1 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                status =3D "disabled";
> +        };
> +        flash@2 {
> +                reg =3D < 2 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                status =3D "disabled";
> +        };
> +    };
> -- =

> 2.34.1
> =

> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
