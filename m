Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3894FC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 19:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LotFPXqeE5aZIxfJfV2d2qiazG9olpVcO4oKato6MpU=; b=hkKsg1dzcyG99K
	uNNB5KJErP0aiRhYEM0bYvY4b2Q+NR4D3MC2+qQYktCawRQftUvj1Mhj01aAfSSRF4sWR8Abg6llR
	OEnpqzTi5ytTGo4Ormij2Sf1G5rbjeA4ABzjihtiVFdTdkLbbVKVytebaV/LfvHwPO/0Jb0rxIMw3
	zwKUNmXLl0nah8w7D/DEdMqvcWZEiBCGwinjEjFyi4QLUZfVHrYoVq1KSaJtBR7wqSpW0UbAoKmaU
	jrfS+j3WPJcRpGoN96ifKKcVpOY8GCtrGAmlKMMGjkJXoPx36E4xhMfnwBcBFLypHNc/+3/ntgpbk
	e4xLSzEomt8VJtcycz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZdqz-00HHwC-TI; Wed, 30 Mar 2022 19:19:38 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZdqv-00HHu7-EY; Wed, 30 Mar 2022 19:19:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UJJ9pl115222;
 Wed, 30 Mar 2022 14:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648667949;
 bh=HXP0I68YYcbtnXwobfKnkky9m9FMx1koQq3CNDnNl/s=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=b0dOSS3TBcb/XaU+beH5EgUePch8ipiuqJc1igewV0Pxye9W5HprO2qYOuhIHwRk/
 epiXZ65HYC8iwP3u0uiNHN3KmCFiN6pvTFd7tFvE4+KOA4WnsRNzMpXTHtEy0Wy4pi
 27SK/+GWs9/gD0iLusC1GEna6+Li4O6jeKrI3xeo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UJJ9wk031699
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Mar 2022 14:19:09 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 14:19:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 14:19:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UJJ8cX013600;
 Wed, 30 Mar 2022 14:19:09 -0500
Date: Thu, 31 Mar 2022 00:49:08 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Tao Ren <rentao.bupt@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Message-ID: <20220330191908.nhg52a5ayzczpzai@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-3-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220325100849.2019209-3-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_121933_605500_1E15986B 
X-CRM114-Status: GOOD (  19.74  )
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

On 25/03/22 11:08AM, C=E9dric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> =

> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 87 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++
>  2 files changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-=
fmc.yaml
> =

> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yam=
l b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> new file mode 100644
> index 000000000000..e16bbcd38560
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -0,0 +1,87 @@
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

No need for this. It should already be taken care of by =

spi-peripheral-props.yaml

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
> +        reg =3D <0x1e620000 0xc4>, <0x20000000 0x10000000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        compatible =3D "aspeed,ast2600-fmc";
> +        clocks =3D <&syscon ASPEED_CLK_AHB>;
> +        interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;

Nitpick: Add a blank line here

> +        flash@0 {
> +                reg =3D < 0 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };

and here

> +        flash@1 {
> +                reg =3D < 1 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };

and here. Looks a bit nicer.

> +        flash@2 {
> +                reg =3D < 2 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea9d74b6236f..7d5f81dcd837 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3021,6 +3021,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
>  F:	drivers/mmc/host/sdhci-of-aspeed*
>  =

> +ASPEED SMC SPI DRIVER
> +M:	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> +M:	C=E9dric Le Goater <clg@kaod.org>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-spi@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> +
>  ASPEED VIDEO ENGINE DRIVER
>  M:	Eddie James <eajames@linux.ibm.com>
>  L:	linux-media@vger.kernel.org
> -- =

> 2.34.1
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
