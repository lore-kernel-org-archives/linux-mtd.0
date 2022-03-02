Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOSqB8MnkLPSm5jODbCmp+edNbmEcH8zw6JxA3O4hH8=; b=mINnAorU7vnwzE
	O1W2/U6U8pbKCFDzjeRjNkjTQOOvhe8DBPoHG1wHQbyynk30UN0X8mBYltIMRS5cCuHc1p0g8qtDA
	OlRyrvhPBVttjAWJDcgFlqcG7F/rTWiTcsjXy4y13agwKi6wNV2NS5GzEynAQQlJWO81YDg9YN6F4
	fRUA5THXjT0f6LNT6iN4lnMsQeZGiRjWSSQV26VKckUds3gTeXtnMdYZ9vGP+VDCAjaob0jYdDIfG
	7mq67IM6ou78ySutuGrUNt8b1NvPrFjE24v94jaiOqcZjqgS4u6+BDIZ44CsLEKrEvEvDJ9tZNN40
	L57cCaXKBSB0HrOae2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPWdJ-004MWV-GM; Wed, 02 Mar 2022 21:35:42 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPWUi-004IrL-Qq; Wed, 02 Mar 2022 21:26:50 +0000
Received: by mail-oo1-f52.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso3471397ooc.7; 
 Wed, 02 Mar 2022 13:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hbPLIPVEhqYqHfs1Um9iAPDP4qWKQ+uSdm7/6sopBSs=;
 b=T62waAoQ5uKQT0yG7NVvjjro9dzUKVAkvbcSV0Wr92CU0MK6UX/n3n0yk9jFVXIE2U
 Lv+0id3ddhR79ATOIymEBQbu2c1QebZfNHtZMxK+Fd/t23U8aSrNbVZP1x6eJgRKdYdS
 rHBlomHHkzDCNPxos+0j6HfBjD7V7Glc4oSU6PwpspqWW99jfDqY0sLxPqImVskPzmC8
 0rAnq55c3K0X7mS77vEjfiEFdqg8yq6exq2KeYa+uoUYhUdmDBFL1y31TR0zFC7E2WXq
 nsaTidNUMbUSdi/SUNFc4haPf4czkQAMOyit9GQL2Ivq1ZHwzL94mpXDeHh5E+PmM17u
 n5eg==
X-Gm-Message-State: AOAM531sSrMYLC+LJTFEUdO8SJpHBUVvl3dzBySdHMQqNLowxUuUL5rH
 3j4/Ul59pByC+f+vvdUjuw==
X-Google-Smtp-Source: ABdhPJze+wINl7VQoz5UIFxIOi5ofrkD+iYOPHxAw6NzR+bGkT+e8/nTZouORjU+OMOwKXIhDU/5pA==
X-Received: by 2002:a05:6870:1242:b0:d3:6168:3191 with SMTP id
 2-20020a056870124200b000d361683191mr1471979oao.9.1646256407349; 
 Wed, 02 Mar 2022 13:26:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 p185-20020aca5bc2000000b002d97bda3871sm49303oib.54.2022.03.02.13.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 13:26:46 -0800 (PST)
Received: (nullmailer pid 79377 invoked by uid 1000);
 Wed, 02 Mar 2022 21:26:45 -0000
Date: Wed, 2 Mar 2022 15:26:45 -0600
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
Subject: Re: [PATCH v2 03/10] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Message-ID: <Yh/hFS2XW9SjK4Pl@robh.at.kernel.org>
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-4-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220302173114.927476-4-clg@kaod.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_132648_922240_D513C0AB 
X-CRM114-Status: GOOD (  20.15  )
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

On Wed, Mar 02, 2022 at 06:31:07PM +0100, C=E9dric Le Goater wrote:
> The "interrupt" property is optional because it is only necessary for
> controllers supporting DMAs (Not implemented yet in the new driver).
> =

> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      | 90 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-=
fmc.yaml
> =

> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yam=
l b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> new file mode 100644
> index 000000000000..0289a4f52196
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -0,0 +1,90 @@
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

No need for required here, spi-controller.yaml already enforces that.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

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
> +        flash@0 {
> +                reg =3D < 0 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +        flash@1 {
> +                reg =3D < 1 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +        flash@2 {
> +                reg =3D < 2 >;
> +                compatible =3D "jedec,spi-nor";
> +                spi-max-frequency =3D <50000000>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4175103e928d..f5ab77548ef6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2925,6 +2925,15 @@ S:	Maintained
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

> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
