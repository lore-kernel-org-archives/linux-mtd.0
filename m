Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47356C369A2
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Apr 2025 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEnpZGQtLyebfyPmREh2XyIA6Dh2SJC/JuFbCDimG7g=; b=u7iYmHMpZR8zGJ
	Z3Nj2aUq5ud1LIO1m2n/37RSvOZDqzAJMMFNBLQPQWny3WpKcfiJYPyvPaU+1jnEx7+SNiWOs+q33
	+IZLC8Gg1ikLAlWcuzC9Q4oi5QMN62t+VaE5TqpHzFMLS8ZX3mguTnk6uYWXRte5faC8KCFa9ErLV
	FBUZqSgphD6P8fezscHnbo1e6GAFxKzlIXD0khQiNyy6PO8l5GSuTIYOTt8GgI2XQLBsRTi0cjBH6
	CSsCUHtYbhOAAHlfPXW0xKsVs/Dp/9vVYm4StrvEKQDtihmkO0URwskhc/MJNyYZJKACNW3Zn6zZS
	PRZSCZWaPJMrGhg3xhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3K55-0000000EjYc-270i;
	Fri, 11 Apr 2025 19:30:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3K52-0000000EjXd-2UcO
	for linux-mtd@lists.infradead.org;
	Fri, 11 Apr 2025 19:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 509C3A482A8;
	Fri, 11 Apr 2025 19:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B1DC4CEE2;
	Fri, 11 Apr 2025 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744399823;
	bh=OsijeQ6Wv1y5t9DTr1GpVIB1AXtpK3LlVqMX294fdJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGdbWaPvFi983YWMKJrt104UEJw2tGk1dgLmoNxV3z3iUApRvvNcBfa8ygDPf9MwE
	 bOklRNXTe0nrmdNJtc8VE1ysAuekM8u8VxvOIcvovjyWHz3lchmKXNTp7NYXFxDNbk
	 mAm1A4DY9QnoEbK8mNJO6E9Q0g2Qin+ZqnVzutI3ir10UE6XgAPDaMq57cHZb+LuV9
	 V2MS9zjFJtky+rd4PM3aiwg6uG5eLG7JpmgSvs63jUEGtpRysjONx+o9A5Mci5IRoj
	 XjUyAIK6tpE8gTl/Y2nYF0SzkprXrhlpisSdiqvWBA5JFYLJ4QBacYPHVrnSxfb8Pl
	 47tce/GvQpeEw==
Date: Fri, 11 Apr 2025 14:30:22 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert vf610-nfc to yaml format
Message-ID: <20250411193022.GA3762102-robh@kernel.org>
References: <20250410210409.3234260-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410210409.3234260-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_123024_763451_785F42B4 
X-CRM114-Status: GOOD (  25.66  )
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

On Thu, Apr 10, 2025 at 05:04:09PM -0400, Frank Li wrote:
> Convert binding doc vf610-nfc to yaml format.
> 
> Additional changes:
> - ref to nand-controller.yaml.
> - include gic.h and clk.h in examples.
> - add clocks and clock-names description.
> - remove #address-cells, #size-cells assigned-clocks and
> assigned-clock-rates.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/mtd/fsl,vf610-nfc.yaml           | 84 +++++++++++++++++++
>  .../devicetree/bindings/mtd/vf610-nfc.txt     | 59 -------------
>  Makefile                                      |  2 +-
>  3 files changed, 85 insertions(+), 60 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml b/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
> new file mode 100644
> index 0000000000000..cffa621dbb022
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/fsl,vf610-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale's NAND flash controller (NFC)
> +
> +description:
> +  This variant of the Freescale NAND flash controller (NFC) can be found on
> +  Vybrid (vf610), MPC5125, MCF54418 and Kinetis K70.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,vf610-nfc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: nfc
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml

blank line

> +    properties:
> +      compatible:
> +        const: fsl,vf610-nfc-nandcs

blank line

> +      reg:
> +        const: 0

blank line

> +      nand-ecc-strength:
> +        enum: [24, 32]

blank line
> +      nand-ecc-step-size:
> +        const: 2048

blank line

> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/vf610-clock.h>
> +
> +    nand-controller@400e0000 {
> +        compatible = "fsl,vf610-nfc";
> +        reg = <0x400e0000 0x4000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks VF610_CLK_NFC>;
> +        clock-names = "nfc";
> +        assigned-clocks = <&clks VF610_CLK_NFC>;
> +        assigned-clock-rates = <33000000>;
> +
> +        nand@0 {
> +            compatible = "fsl,vf610-nfc-nandcs";
> +            reg = <0>;
> +            nand-bus-width = <8>;
> +            nand-ecc-mode = "hw";
> +            nand-ecc-strength = <32>;
> +            nand-ecc-step-size = <2048>;
> +            nand-on-flash-bbt;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> deleted file mode 100644
> index 7db5e6e609df6..0000000000000
> --- a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -Freescale's NAND flash controller (NFC)
> -
> -This variant of the Freescale NAND flash controller (NFC) can be found on
> -Vybrid (vf610), MPC5125, MCF54418 and Kinetis K70.
> -
> -Required properties:
> -- compatible: Should be set to "fsl,vf610-nfc".
> -- reg: address range of the NFC.
> -- interrupts: interrupt of the NFC.
> -- #address-cells: shall be set to 1. Encode the nand CS.
> -- #size-cells : shall be set to 0.
> -- assigned-clocks: main clock from the SoC, for Vybrid <&clks VF610_CLK_NFC>;
> -- assigned-clock-rates: The NAND bus timing is derived from this clock
> -    rate and should not exceed maximum timing for any NAND memory chip
> -    in a board stuffing. Typical NAND memory timings derived from this
> -    clock are found in the SoC hardware reference manual. Furthermore,
> -    there might be restrictions on maximum rates when using hardware ECC.
> -
> -- #address-cells, #size-cells : Must be present if the device has sub-nodes
> -  representing partitions.
> -
> -Required children nodes:
> -Children nodes represent the available nand chips. Currently the driver can
> -only handle one NAND chip.
> -
> -Required properties:
> -- compatible: Should be set to "fsl,vf610-nfc-cs".
> -- nand-bus-width: see nand-controller.yaml
> -- nand-ecc-mode: see nand-controller.yaml
> -
> -Required properties for hardware ECC:
> -- nand-ecc-strength: supported strengths are 24 and 32 bit (see nand-controller.yaml)
> -- nand-ecc-step-size: step size equals page size, currently only 2k pages are
> -    supported
> -- nand-on-flash-bbt: see nand-controller.yaml
> -
> -Example:
> -
> -	nfc: nand@400e0000 {
> -		compatible = "fsl,vf610-nfc";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		reg = <0x400e0000 0x4000>;
> -		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&clks VF610_CLK_NFC>;
> -		clock-names = "nfc";
> -		assigned-clocks = <&clks VF610_CLK_NFC>;
> -		assigned-clock-rates = <33000000>;
> -
> -		nand@0 {
> -			compatible = "fsl,vf610-nfc-nandcs";
> -			reg = <0>;
> -			nand-bus-width = <8>;
> -			nand-ecc-mode = "hw";
> -			nand-ecc-strength = <32>;
> -			nand-ecc-step-size = <2048>;
> -			nand-on-flash-bbt;
> -		};
> -	};
> diff --git a/Makefile b/Makefile
> index 38689a0c36052..b38f91696c567 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1466,7 +1466,7 @@ kselftest-merge:
>  # Devicetree files
>  
>  ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/boot/dts/),)
> -dtstree := arch/$(SRCARCH)/boot/dts
> +dtstree := arch/$(SRCARCH)/boot/dts/nxp

Don't think you wanted this...

>  endif
>  
>  ifneq ($(dtstree),)
> -- 
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
