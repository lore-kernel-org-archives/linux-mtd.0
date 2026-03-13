Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2EA107BCD1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 23:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmKfwk6V7GZytu0f1U6DwC/DrqpQ7cr7g7ljQwZSu0w=; b=je+pA/T95JHYpb
	CuCI/WJuimmAmXl+GAJ7PuSl0IXmvo1cFWVh0Q6uiGWKm1e69UOWT64l25Q+kqewyfwrguAZKwrtb
	spSq4Kq4AhMJX1Rk3Nz8kxVfZ7yC0z7Q59xLOhc5oBmG4rJVQXbVtoDQKwz++t2hsnb3I12F+z+QO
	T8FEJjr+TWfkxIP/Yx6A2aIjY3YE6t2e1gzclv2xIxhXxHsgHy421rI/OGFCOzcIylo1VoVe9ZQOT
	BqgO4siUABW4uf9rVhAiscLEnISoHF2SaH5h2Kl7jbR4270MnLEleVOzWwkHrKsaiiJCjK1k4MEhP
	92vzTSZRUiV7V8MwS3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1C1v-00000001Jxy-1Ob1;
	Fri, 13 Mar 2026 23:34:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1C1s-00000001Jxc-2unf
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 23:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E994A43C6A;
	Fri, 13 Mar 2026 23:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896BEC19421;
	Fri, 13 Mar 2026 23:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773444891;
	bh=xaSxGGFhYUlWH8vJOVmWLXswJQ3dh306CESBcJhVyGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+oR1ffClrwEt9AgCFpOZ4DfJbiVH39Iife2WKITRvRsv5vim8y1Qg3Yco+GwjD6a
	 +WlOsBXYAUCGfxrH7XLD80eog1cnIkrViO0p60k2EV6jq5zLoxjvulSQxWDYthguc1
	 D3FJdtOM1kjw7mPLW/K55TTno9TOOSGGt6t5keO4v6qbn6t+2J10h45r6qEsDAQNNu
	 BSch2sC1id1JelENkLAGT0k8g3KLdpAHZAj7Qfk/eMTytWM5tG6AjzcSbw+8RzmnWZ
	 RbuJOm0WL3vA7A8K4/pCcf8B4gKqWB0AohOOPfGgdOFcgVk/l2WJo43bsL5cmc0NXt
	 C+1Smf/kxAGNQ==
Date: Fri, 13 Mar 2026 18:34:50 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: refactor NAND bindings and add
 nand-controller-legacy.yaml
Message-ID: <20260313233450.GA3632753-robh@kernel.org>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309200351.1791162-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_163452_787748_61F18573 
X-CRM114-Status: GOOD (  48.46  )
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

On Mon, Mar 09, 2026 at 04:03:42PM -0400, Frank Li wrote:
> The modern NAND controller binding requires NAND chips to be described as
> child nodes of the controller, for example:
> 
>   nand-controller {
>           ...
>           nand@0 {
>                   /* raw NAND chip properties */
>           };
>   };
> 
> However, many existing device trees place NAND chip properties directly
> under the controller node because those controllers support only a single

s/under/within/

> chip. This layout is still widely used by older platforms and by other DT
> consumers such as U-Boot. Migrating all existing users to the new layout
> will take time.
> 
> Several kernel drivers, such as ams-delta.c, davinci_nand.c and
> fsmc_nand.c, still expect the legacy layout where raw NAND properties are
> defined in the controller node.
> 
> To support both layouts during the transition:
> 
> - Extract NAND chip-related properties into separate schemas
>   (nand-property.yaml and raw-nand-property.yaml) from
>   nand-chip.yaml and raw-nand-chip.yaml.
> - Introduce nand-controller-legacy.yaml to allow both the
>   legacy and modern layouts.
> - Add a select condition in nand-controller.yaml to prevent
>   node name pattern matching for fsl,* NAND controllers.
> 
> Keep compatibility with existing device trees while allowing gradual
> migration to the modern binding structure.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - none
> 
> change dts layout break boot
> https://lore.kernel.org/imx/177281063848.253518.12995342124719933118.b4-ty@nxp.com/T/#t
> ---
>  .../devicetree/bindings/mtd/nand-chip.yaml    | 46 +-----------
>  ...oller.yaml => nand-controller-legacy.yaml} | 46 +++++-------
>  .../bindings/mtd/nand-controller.yaml         | 11 +++
>  .../{nand-chip.yaml => nand-property.yaml}    | 14 +---
>  .../bindings/mtd/raw-nand-chip.yaml           | 74 +------------------
>  ...-nand-chip.yaml => raw-nand-property.yaml} | 15 +---
>  6 files changed, 36 insertions(+), 170 deletions(-)
>  copy Documentation/devicetree/bindings/mtd/{nand-controller.yaml => nand-controller-legacy.yaml} (69%)
>  copy Documentation/devicetree/bindings/mtd/{nand-chip.yaml => nand-property.yaml} (89%)
>  copy Documentation/devicetree/bindings/mtd/{raw-nand-chip.yaml => raw-nand-property.yaml} (94%)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> index 609d4a4ddd80e..8800d1d072665 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> @@ -11,6 +11,7 @@ maintainers:
>  
>  allOf:
>    - $ref: mtd.yaml#
> +  - $ref: nand-property.yaml
>  
>  description: |
>    This file covers the generic description of a NAND chip. It implies that the
> @@ -22,51 +23,6 @@ properties:
>      description:
>        Contains the chip-select IDs.
>  
> -  nand-ecc-engine:
> -    description: |
> -      A phandle on the hardware ECC engine if any. There are
> -      basically three possibilities:
> -      1/ The ECC engine is part of the NAND controller, in this
> -      case the phandle should reference the parent node.
> -      2/ The ECC engine is part of the NAND part (on-die), in this
> -      case the phandle should reference the node itself.
> -      3/ The ECC engine is external, in this case the phandle should
> -      reference the specific ECC engine node.
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -
> -  nand-use-soft-ecc-engine:
> -    description: Use a software ECC engine.
> -    type: boolean
> -
> -  nand-no-ecc-engine:
> -    description: Do not use any ECC correction.
> -    type: boolean
> -
> -  nand-ecc-algo:
> -    description:
> -      Desired ECC algorithm.
> -    $ref: /schemas/types.yaml#/definitions/string
> -    enum: [hamming, bch, rs]
> -
> -  nand-ecc-strength:
> -    description:
> -      Maximum number of bits that can be corrected per ECC step.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    minimum: 1
> -
> -  nand-ecc-step-size:
> -    description:
> -      Number of data bytes covered by a single ECC step.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    minimum: 1
> -
> -  secure-regions:
> -    description:
> -      Regions in the NAND chip which are protected using a secure element
> -      like Trustzone. This property contains the start address and size of
> -      the secure regions present.
> -    $ref: /schemas/types.yaml#/definitions/uint64-matrix
> -
>  required:
>    - reg
>  
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller-legacy.yaml
> similarity index 69%
> copy from Documentation/devicetree/bindings/mtd/nand-controller.yaml
> copy to Documentation/devicetree/bindings/mtd/nand-controller-legacy.yaml
> index 28167c0cf2719..d6e612413df19 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller-legacy.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> +$id: http://devicetree.org/schemas/mtd/nand-controller-legacy.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: NAND Controller Common Properties
> @@ -10,21 +10,22 @@ maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
>    - Richard Weinberger <richard@nod.at>
>  
> -description: |
> +description: >
>    The NAND controller should be represented with its own DT node, and
>    all NAND chips attached to this controller should be defined as
>    children nodes of the NAND controller. This representation should be
>    enforced even for simple controllers supporting only one chip.
>  
> +  This is only for legacy nand controller, new controller should use
> +  nand-controller.yaml
> +
>  properties:
> -  $nodename:
> -    pattern: "^nand-controller(@.*)?"
>  
>    "#address-cells":
>      const: 1
>  
>    "#size-cells":
> -    const: 0
> +    enum: [0, 1]
>  
>    ranges: true
>  
> @@ -39,33 +40,26 @@ properties:
>      minItems: 1
>      maxItems: 8
>  
> +  partitions:
> +    type: object
> +
> +    required:
> +      - compatible
> +
>  patternProperties:
>    "^nand@[a-f0-9]$":
>      type: object
>      $ref: raw-nand-chip.yaml#

Shouldn't this be removed? The main thing is legacy bindings don't have 
these nand nodes.

>  
> -required:
> -  - "#address-cells"
> -  - "#size-cells"
> +  "^partition@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
> +    deprecated: true

Is there any .dts (in tree) with partition nodes not under 'partitions' 
node. Maybe this can be omitted.

Also, mtd.yaml covers alot of this. Can we just reference it?

> +
> +allOf:
> +  - $ref: raw-nand-property.yaml#
> +  - $ref: nand-property.yaml#
>  
>  # This is a generic file other binding inherit from and extend
>  additionalProperties: true
>  
> -examples:
> -  - |
> -    nand-controller {
> -      #address-cells = <1>;
> -      #size-cells = <0>;
> -      cs-gpios = <0>, <&gpioA 1>; /* A single native CS is available */
> -
> -      /* controller specific properties */
> -
> -      nand@0 {
> -        reg = <0>; /* Native CS */
> -        /* NAND chip specific properties */
> -      };
> -
> -      nand@1 {
> -        reg = <1>; /* GPIO CS */
> -      };
> -    };
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 28167c0cf2719..81d4ffc3fc1fa 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -16,6 +16,17 @@ description: |
>    children nodes of the NAND controller. This representation should be
>    enforced even for simple controllers supporting only one chip.
>  
> +select:
> +  allOf:
> +    - properties:
> +        $nodename:
> +          pattern: "^nand-controller(@.*)?"
> +    - not:
> +        properties:
> +          compatible:
> +            contains:
> +              pattern: "^fsl,"

I would just do 'select: false' and make sure all non-legacy 
controller bindings reference nand-controller.yaml. 

> +
>  properties:
>    $nodename:
>      pattern: "^nand-controller(@.*)?"
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-property.yaml
> similarity index 89%
> copy from Documentation/devicetree/bindings/mtd/nand-chip.yaml
> copy to Documentation/devicetree/bindings/mtd/nand-property.yaml
> index 609d4a4ddd80e..5bbc93e506fd8 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-property.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
> +$id: http://devicetree.org/schemas/mtd/nand-property.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: NAND Chip Common Properties
> @@ -9,19 +9,12 @@ title: NAND Chip Common Properties
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
>  
> -allOf:
> -  - $ref: mtd.yaml#
> -
>  description: |
> -  This file covers the generic description of a NAND chip. It implies that the
> +  This file covers the generic property of a NAND chip. It implies that the

s/property/properties/

>    bus interface should not be taken into account: both raw NAND devices and
>    SPI-NAND devices are concerned by this description.
>  
>  properties:
> -  reg:
> -    description:
> -      Contains the chip-select IDs.
> -
>    nand-ecc-engine:
>      description: |
>        A phandle on the hardware ECC engine if any. There are
> @@ -67,8 +60,5 @@ properties:
>        the secure regions present.
>      $ref: /schemas/types.yaml#/definitions/uint64-matrix
>  
> -required:
> -  - reg
> -
>  # This file can be referenced by more specific devices (like spi-nands)
>  additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> index 092448d7bfc5c..792de3e3c6eee 100644
> --- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> @@ -11,6 +11,7 @@ maintainers:
>  
>  allOf:
>    - $ref: nand-chip.yaml#
> +  - $ref: raw-nand-property.yaml#
>  
>  description: |
>    The ECC strength and ECC step size properties define the user
> @@ -31,79 +32,6 @@ properties:
>      description:
>        Contains the chip-select IDs.
>  
> -  nand-ecc-placement:
> -    description:
> -      Location of the ECC bytes. This location is unknown by default
> -      but can be explicitly set to "oob", if all ECC bytes are
> -      known to be stored in the OOB area, or "interleaved" if ECC
> -      bytes will be interleaved with regular data in the main area.
> -    $ref: /schemas/types.yaml#/definitions/string
> -    enum: [ oob, interleaved ]
> -    deprecated: true
> -
> -  nand-ecc-mode:
> -    description:
> -      Legacy ECC configuration mixing the ECC engine choice and
> -      configuration.
> -    $ref: /schemas/types.yaml#/definitions/string
> -    enum: [none, soft, soft_bch, hw, hw_syndrome, on-die]
> -    deprecated: true
> -
> -  nand-bus-width:
> -    description:
> -      Bus width to the NAND chip
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [8, 16]
> -    default: 8
> -
> -  nand-on-flash-bbt:
> -    description:
> -      With this property, the OS will search the device for a Bad
> -      Block Table (BBT). If not found, it will create one, reserve
> -      a few blocks at the end of the device to store it and update
> -      it as the device ages. Otherwise, the out-of-band area of a
> -      few pages of all the blocks will be scanned at boot time to
> -      find Bad Block Markers (BBM). These markers will help to
> -      build a volatile BBT in RAM.
> -    $ref: /schemas/types.yaml#/definitions/flag
> -
> -  nand-ecc-maximize:
> -    description:
> -      Whether or not the ECC strength should be maximized. The
> -      maximum ECC strength is both controller and chip
> -      dependent. The ECC engine has to select the ECC config
> -      providing the best strength and taking the OOB area size
> -      constraint into account. This is particularly useful when
> -      only the in-band area is used by the upper layers, and you
> -      want to make your NAND as reliable as possible.
> -    $ref: /schemas/types.yaml#/definitions/flag
> -
> -  nand-is-boot-medium:
> -    description:
> -      Whether or not the NAND chip is a boot medium. Drivers might
> -      use this information to select ECC algorithms supported by
> -      the boot ROM or similar restrictions.
> -    $ref: /schemas/types.yaml#/definitions/flag
> -
> -  nand-rb:
> -    description:
> -      Contains the native Ready/Busy IDs.
> -    $ref: /schemas/types.yaml#/definitions/uint32-array
> -
> -  rb-gpios:
> -    description:
> -      Contains one or more GPIO descriptor (the numper of descriptor
> -      depends on the number of R/B pins exposed by the flash) for the
> -      Ready/Busy pins. Active state refers to the NAND ready state and
> -      should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
> -
> -  wp-gpios:
> -    description:
> -      Contains one GPIO descriptor for the Write Protect pin.
> -      Active state refers to the NAND Write Protect state and should be
> -      set to GPIOD_ACTIVE_LOW unless the signal is inverted.
> -    maxItems: 1
> -
>  required:
>    - reg
>  
> diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-property.yaml
> similarity index 94%
> copy from Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> copy to Documentation/devicetree/bindings/mtd/raw-nand-property.yaml
> index 092448d7bfc5c..f853b72426c43 100644
> --- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/raw-nand-property.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
> +$id: http://devicetree.org/schemas/mtd/raw-nand-property.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Raw NAND Chip Common Properties
> @@ -9,9 +9,6 @@ title: Raw NAND Chip Common Properties
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
>  
> -allOf:
> -  - $ref: nand-chip.yaml#
> -
>  description: |
>    The ECC strength and ECC step size properties define the user
>    desires in terms of correction capability of a controller. Together,
> @@ -24,13 +21,6 @@ description: |
>    specify the value(s) they support.
>  
>  properties:
> -  $nodename:
> -    pattern: "^nand@[a-f0-9]$"
> -
> -  reg:
> -    description:
> -      Contains the chip-select IDs.
> -
>    nand-ecc-placement:
>      description:
>        Location of the ECC bytes. This location is unknown by default
> @@ -104,8 +94,5 @@ properties:
>        set to GPIOD_ACTIVE_LOW unless the signal is inverted.
>      maxItems: 1
>  
> -required:
> -  - reg
> -
>  # This is a generic file other binding inherit from and extend
>  additionalProperties: true
> -- 
> 2.43.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
