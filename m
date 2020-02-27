Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96F3C35677
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 17:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E4824697
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 17:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jNZICfvT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KssC0RY0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E4824697
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVLAxMbCFAdDvJGeKGauUAr+QUd7xkGusnmi4mI9GQk=; b=jNZICfvTrdv8vW
	yVBAlD0pmxGfvGRTKYaSFUgQ25nPmUiC7Yl/ichBvvzC86u9G4StVKbj5uBOhGgiH/vTdUU7Wh3Ca
	hkWv5bD1CsFRiCTDGOFPxpxjHpB6uALcvZYKcQUgz9WWqUX6yW6ZnsLALjiIaUaCRyVo8Y+p0u8zC
	ghHFMnnFgRHFOBp23I5nXdao6aphxYDEXUqG8FhZIOYGTPIafQXQImpNy6q0QitvTvnkuxXTrbmmS
	+TQGpkYTplrXIlTuGXiUZHLqPOaYijBeX+tDZ0eHgLr4w6YHy5/wjbaaE8YrBooTFHbFApjfKXMKM
	57Z+E3IqzKGN6u/bMs/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Mdl-0000yL-Mi; Thu, 27 Feb 2020 17:08:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Mdc-0000nu-5G
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 17:07:53 +0000
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 099E2246A8
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582823271;
 bh=DNqh6L9QvC79SAvYrsHQjJHxar3H8RKUkOoW0usqUyQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KssC0RY0wDcFK4NJrupa76eISYl81dF/3XcEksDI38Kgi1TODcqCH89Ql9XI5alZl
 tej9/O3aty3romAaVdCxyYBXk1CI80GaO/fBAkusNAiAqTSKfas0wLp/BrQiRHYFyy
 0eQU1mvgvhtwMVdM2oHbrIRWTlYCZgrmPm59qJVc=
Received: by mail-qk1-f178.google.com with SMTP id e16so28996qkl.6
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 09:07:50 -0800 (PST)
X-Gm-Message-State: APjAAAXvu7z0U69ygTFDnMoBHVjuzTC8qDHhwNb+B8gJ3rO/EmAZAraf
 lkcz0rYOk1xoCU96MWFc43ds+MSzQWX0OibISA==
X-Google-Smtp-Source: APXvYqwnZOcWOJuMDm0YTNO3aplwTY/+GlYlhK6mewr/OqMGIi0NWVXpGav6XctEP5HzJU4yxoQK/jP7qeeWht1L4Oo=
X-Received: by 2002:a05:620a:1237:: with SMTP id
 v23mr184684qkj.223.1582823270046; 
 Thu, 27 Feb 2020 09:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227062708.21544-2-vadivel.muruganx.ramuthevar@linux.intel.com>
In-Reply-To: <20200227062708.21544-2-vadivel.muruganx.ramuthevar@linux.intel.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 27 Feb 2020 11:07:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJno0gmUnGnsWFYdHY_3CHNijtksAmRhuEudimip0aK4w@mail.gmail.com>
Message-ID: <CAL_JsqJno0gmUnGnsWFYdHY_3CHNijtksAmRhuEudimip0aK4w@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_090752_241213_321EB644 
X-CRM114-Status: GOOD (  23.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, devicetree@vger.kernel.org,
 tien.fong.chee@intel.com, tudor.ambarus@gmail.com, Vignesh R <vigneshr@ti.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, david.oberhollenzer@sigma-star.at,
 simon.k.r.goldschmidt@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>, qi-ming.wu@intel.com,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 cheol.yong.kim@intel.com, Mark Rutland <mark.rutland@arm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2020 at 12:27 AM Ramuthevar,Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>
> Add dt-bindings documentation for Cadence-QSPI controller to support
> spi based flash memories.

You need to run 'make dt_binding_check' because this doesn't pass.

>
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 ----------
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 142 +++++++++++++++++++++
>  2 files changed, 142 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml


> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> new file mode 100644
> index 000000000000..3ad2850c412e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence QSPI Flash Controller support
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +description: |
> +  Binding Documentation for Cadence QSPI controller,This controller is
> +  present in the Intel LGM, Altera SoCFPGA and TI SoCs and this driver
> +  has been tested On Intel's LGM SoC.
> +

> +  - compatible : should be one of the following:
> +        Generic default - "cdns,qspi-nor".
> +        For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
> +        For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
> +        For Intel LGM SoC - "intel,lgm-qspi", "cdns,qspi-nor".

The schema below says all this, so drop this part.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +           - ti,k2g-qspi
> +        - const: cdns,qspi-nor
> +
> +      - items:
> +        - enum:
> +           - ti,am654-ospi
> +        - const: cdns,qspi-nor
> +
> +      - items:
> +        - enum:
> +           - intel,lgm-qspi
> +        - const: cdns,qspi-nor

These 3 items can be 1 entry (combine the enums).

> +
> +      - items:
> +        - const: cdns,qspi-nor
> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  cdns,fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      128 or 256 bytes size of the data FIFO in words.

Sounds like constraints. Make them a schema.

> +
> +  cdns,fifo-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      4 byte bus width of the data FIFO in bytes.

That's not very clear. It should be schema constraints anyways:

enum: [ 4, 8, 12, 16, ...??? ]

or:

multipleOf: 4
minimum: 4
maximum: ?

> +
> +  cdns,trigger-address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      32-bit indirect AHB trigger address.
> +
> +  cdns,rclk-en:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Wrong type if this is a 'flag' aka boolean.

> +    description: |
> +      Flag to indicate that QSPI return clock is used to latch the read data
> +      rather than the QSPI clock. Make sure that QSPI return clock is populated
> +      on the board before using this property.
> +
> +# subnode's properties
> +patternProperties:
> +  "^.*@[0-9a-fA-F]+$":
> +    type: object
> +    description:
> +      flash device uses the subnodes below defined properties.
> +
> +  cdns,read-delay:
> +    description:
> +      Delay in 4 microseconds, read capture logic, in clock cycles.

Huh? Is it in time or clocks?

No unit suffix here, so this needs a type ref. That's what 'make
dt_binding_check' fails on.

> +
> +  cdns,tshsl-ns:
> +    description: |
> +      Delay in 50 nanoseconds, for the length that the master mode chip select
> +      outputs are de-asserted between transactions.

multipleOf: 50

And so on for the rest.

> +
> +  cdns,tsd2d-ns:
> +    description: |
> +      Delay in 50 nanoseconds, between one chip select being de-activated
> +      and the activation of another.
> +
> +  cdns,tchsh-ns:
> +    description: |
> +      Delay in 4 nanoseconds, between last bit of current transaction and
> +      deasserting the device chip select (qspi_n_ss_out).
> +
> +  cdns,tslch-ns:
> +    description: |
> +      Delay in 4 nanoseconds, between setting qspi_n_ss_out low and
> +      first bit transfer.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - cdns,fifo-depth
> +  - cdns,fifo-width
> +  - cdns,trigger-address
> +
> +examples:
> +  - |
> +    qspi: spi@ff705000 {
> +          compatible = "cdns,qspi-nor";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          reg = <0xff705000 0x1000>,
> +                <0xffa00000 0x1000>;
> +          interrupts = <0 151 4>;
> +          clocks = <&qspi_clk>;
> +          cdns,fifo-depth = <128>;
> +          cdns,fifo-width = <4>;
> +          cdns,trigger-address = <0x00000000>;
> +
> +          flash0: n25q00@0 {
> +              compatible = "jedec,spi-nor";
> +              reg = <0x0>;
> +              cdns,read-delay = <4>;
> +              cdns,tshsl-ns = <50>;
> +              cdns,tsd2d-ns = <50>;
> +              cdns,tchsh-ns = <4>;
> +              cdns,tslch-ns = <4>;
> +          };
> +    };
> +
> --
> 2.11.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
