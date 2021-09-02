Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3F9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 19:58:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B9D610FD
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 19:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0B9D610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kQQVD+/o4fBARiS861U4ZVP43vjZDg2DY+viespVjg=; b=u+rq3q4pG48dE2
	OlgpYX6fndXd45MvROMErCxMqazOLmrsujQx6pIntIi01TaQ5pZUTRWduLP4xi6Gk2S8lp9hK4WSD
	Xs4C10Enh3XItVmaQ3djRIZqb/WOnOoVIxI8Dey/t9llEEaqyDHGTGdBIENQMNyXb479YASoqaTiE
	AS7jF1FFoEMrRjZaZhT6eKdllQZ5RRXIHl5WGI5Ej1O1wEI4ZBRrxMFZe9nqIwJnnPTr83NYKD6gq
	UHg/2dm3tXZBOWJqUVddtEdnmTDaRLMxS0Tazay9ytiJKSXjQIlNY8uratRtwM56qcWuugOE7RQwc
	+xCNKX5CaS++hyPF02OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLspc-00APRz-9i; Thu, 02 Sep 2021 19:57:04 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLspX-00APRP-S9
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 19:57:02 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so3993080otg.11
 for <linux-mtd@lists.infradead.org>; Thu, 02 Sep 2021 12:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=67uMxnPWs2pqPiAcoLp1W3bCHosm6s7LjIRc88lc44M=;
 b=TumZSnT6GgN8nPR+gLdsa6jpoOPDkTxv4BsmNHCriCHnaRHXt9JI7SmBa5DrySCEvo
 433ZupMb0I6KLkJ4o6jiBHhGQDaanCZT00QkJfNfYWhubOqVYzplISdH1V5hUoQdESyE
 FlgYv6jdWEcpRLk0iTkoL1c+10CJcHPCMjS3GX3f9tJe3c6O6Jr8udMSme5mysgNU2u4
 8TlAh0WQ4ezMlsrko4aBvDIzQq+Homyts/IxkEQsx5Z6lNqOgnl+0yycVyFH2vTUArOk
 zSvkTXksvKs3jsdk2j3w4p0+5OXnPKJUeVNNy/61ACYJzYjdJRK8epiKG2prWucym2Wo
 WMNQ==
X-Gm-Message-State: AOAM53267fk2dDwlLKd4zFUv7oKcpNv2NSna29r20m99/ZkZkzuRVLh+
 pWyNKs4ghHgM/KfW13BbzA==
X-Google-Smtp-Source: ABdhPJx3tfWtLy71AWCRhfoZWS9kWc46C/X77EzbXavd9F0D/PZDF4Sbsr6QbzNfT3IMJ4Utc0x06g==
X-Received: by 2002:a9d:331:: with SMTP id 46mr4182343otv.359.1630612618759;
 Thu, 02 Sep 2021 12:56:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i19sm581328ooe.44.2021.09.02.12.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 12:56:57 -0700 (PDT)
Received: (nullmailer pid 1286607 invoked by uid 1000);
 Thu, 02 Sep 2021 19:56:56 -0000
Date: Thu, 2 Sep 2021 14:56:56 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
Message-ID: <YTEsiJiLMRYon5s3@robh.at.kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210902095609.16583-3-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_125659_982449_C5351629 
X-CRM114-Status: GOOD (  38.03  )
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

On Thu, Sep 02, 2021 at 12:56:05PM +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>  6 files changed, 370 insertions(+), 163 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml

> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> new file mode 100644
> index 000000000000..b7d43370a95d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> @@ -0,0 +1,364 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments GPMC Memory Controller device-tree bindings
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +  - Roger Quadros <rogerq@kernel.org>
> +
> +description:
> +  The GPMC is a unified memory controller dedicated for interfacing
> +  with external memory devices like
> +  - Asynchronous SRAM-like memories and ASICs
> +  - Asynchronous, synchronous, and page mode burst NOR flash
> +  - NAND flash
> +  - Pseudo-SRAM devices
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,omap2420-gpmc
> +          - ti,omap2430-gpmc
> +          - ti,omap3430-gpmc
> +          - ti,omap4430-gpmc
> +          - ti,am3352-gpmc
> +
> +  reg:
> +    items:
> +      - description:
> +          Configuration registers for the controller.

Just 'maxItems: 1' is sufficient.

> +
> +  interrupts: true

Need to define how many.

> +
> +  clocks:
> +    maxItems: 1
> +    description: |
> +      Functional clock. Used for bus timing calculations and
> +      GPMC configuration.
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +
> +  dmas:
> +    items:
> +      - description: DMA channel for GPMC NAND prefetch
> +
> +  dma-names:
> +    items:
> +      - const: rxtx
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  gpmc,num-cs:
> +    description: maximum number of supported chip-select lines.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  gpmc,num-waitpins:
> +    description: maximum number of supported wait pins.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  ranges:
> +    minItems: 1
> +    description: |
> +      Must be set up to reflect the memory layout with four
> +      integer values for each chip-select line in use,
> +      <cs-number> 0 <physical address of mapping> <size>
> +
> +    items:
> +      - description: NAND bank 0
> +      - description: NOR/SRAM bank 0
> +      - description: NOR/SRAM bank 1
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-controller:
> +    description: |
> +      The GPMC driver implements and interrupt controller for
> +      the NAND events "fifoevent" and "termcount" plus the
> +      rising/falling edges on the GPMC_WAIT pins.
> +      The interrupt number mapping is as follows
> +      0 - NAND_fifoevent
> +      1 - NAND_termcount
> +      2 - GPMC_WAIT0 pin edge
> +      3 - GPMC_WAIT1 pin edge, and so on.
> +
> +  '#gpio-cells':
> +     const: 2
> +
> +  gpio-controller:
> +    description: |
> +      The GPMC driver implements a GPIO controller for the
> +      GPMC WAIT pins that can be used as general purpose inputs.
> +      0 maps to GPMC_WAIT0 pin.
> +
> +  ti,hwmods:
> +    description:
> +      Name of the HWMOD associated with GPMC. This is for legacy
> +      omap2/3 platforms only.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    deprecated: true
> +
> +  ti,no-idle-on-init:
> +    description:
> +      Prevent idling the module at init. This is for legacy omap2/3
> +      platforms only.
> +    type: boolean
> +    deprecated: true
> +
> +patternProperties:
> +#  "@[0-3],[a-f0-9]+$":
> +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$":

Why the commented regex. There's no need for a full regex as we already 
do that elsewhere. You only need to define the unit-address format.

> +    type: object
> +    description: |
> +      The child device node represents the device connected to the GPMC
> +      bus. The device can be a NAND controller, SRAM device, NOR device
> +      or an ASIC.
> +
> +    properties:
> +      compatible:
> +        description:
> +          Compatible of attached device.

Duh. Drop.

> +
> +      reg:
> +        items:
> +        - description: Register access space for the device

A device with 2 register ranges isn't allowed?

> +
> +# GPMC Timing properties for child nodes. All are optional and default to 0.
> +
> +      gpmc,sync-clk-ps:
> +        description: Minimum clock period for synchronous mode, in picoseconds
> +        $ref: /schemas/types.yaml#/definitions/uint32
 
           default: 0

And elsewhere...

> +
> +# Chip-select signal timings (in nanoseconds) corresponding to GPMC_CONFIG2:
> +      gpmc,cs-on-ns:
> +        description: Assertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32

Blank line between DT properties.

Don't need a type ref with a standard unit suffix.

Is there a maximum value for all these?

> +      gpmc,cs-rd-off-ns:
> +        description: Read deassertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,cs-wr-off-ns:
> +        description: Write deassertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +# ADV signal timings (in nanoseconds) corresponding to GPMC_CONFIG3:
> +      gpmc,adv-on-ns:
> +        description: Assertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,adv-rd-off-ns:
> +        description: Read deassertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,adv-wr-off-ns:
> +        description: Write deassertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,adv-aad-mux-on-ns:
> +        description: Assertion time for AAD
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,adv-aad-mux-rd-off-ns:
> +        description: Read deassertion time for AAD
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,adv-aad-mux-wr-off-ns:
> +        description: Write deassertion time for AAD
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +# WE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
> +      gpmc,we-on-ns:
> +        description: Assertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,we-off-ns:
> +        description: Deassertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +# OE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
> +      gpmc,oe-on-ns:
> +        description: Assertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,oe-off-ns:
> +        description: Deassertion time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,oe-aad-mux-on-ns:
> +        description:       Assertion time for AAD
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,oe-aad-mux-off-ns:
> +        description:      Deassertion time for AAD
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +# Access time and cycle time timings (in nanoseconds) corresponding to
> +# GPMC_CONFIG5:
> +      gpmc,page-burst-access-ns:
> +        description:   Multiple access word delay
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,access-ns:
> +        description:              Start-cycle to first data valid delay
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,rd-cycle-ns:
> +        description:            Total read cycle time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,wr-cycle-ns:
> +        description:            Total write cycle time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,bus-turnaround-ns:
> +        description:      Turn-around time between successive accesses
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,cycle2cycle-delay-ns:
> +        description:   Delay between chip-select pulses
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,clk-activation-ns:
> +        description:      GPMC clock activation time
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,wait-monitoring-ns:
> +        description:     Start of wait monitoring with regard to valid data
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +# Boolean timing parameters. If property is present, parameter is enabled
> +# otherwise disabled.
> +      gpmc,adv-extra-delay:
> +        description:        ADV signal is delayed by half GPMC clock
> +        type: boolean
> +      gpmc,cs-extra-delay:
> +        description:         CS signal is delayed by half GPMC clock
> +        type: boolean
> +      gpmc,cycle2cycle-diffcsen:
> +        description: |
> +          Add "cycle2cycle-delay" between successive accesses
> +          to a different CS
> +        type: boolean
> +      gpmc,cycle2cycle-samecsen:
> +        description: |
> +          Add "cycle2cycle-delay" between successive accesses
> +          to the same CS
> +        type: boolean
> +      gpmc,oe-extra-delay:
> +        description:         OE signal is delayed by half GPMC clock
> +        type: boolean
> +      gpmc,we-extra-delay:
> +        description:         WE signal is delayed by half GPMC clock
> +        type: boolean
> +      gpmc,time-para-granularity:
> +        description:  Multiply all access times by 2
> +        type: boolean
> +
> +# The following two properties are applicable only to OMAP3+ and AM335x:
> +      gpmc,wr-access-ns:
> +        description: |
> +          In synchronous write mode, for single or
> +          burst accesses, defines the number of
> +          GPMC_FCLK cycles from start access time
> +          to the GPMC_CLK rising edge used by the
> +          memory device for the first data capture.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,wr-data-mux-bus-ns:
> +        description: |
> +          In address-data multiplex mode, specifies
> +          the time when the first data is driven on
> +          the address-data bus.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +# GPMC chip-select settings properties for child nodes. All are optional.
> +
> +      gpmc,burst-length:
> +        description:     Page/burst length. Must be 4, 8 or 16.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [4, 8, 16]
> +      gpmc,burst-wrap:
> +        description:       Enables wrap bursting
> +        type: boolean
> +      gpmc,burst-read:
> +        description:       Enables read page/burst mode
> +        type: boolean
> +      gpmc,burst-write:
> +        description:      Enables write page/burst mode
> +        type: boolean
> +      gpmc,device-width:
> +        description: |
> +          Total width of device(s) connected to a GPMC
> +          chip-select in bytes. The GPMC supports 8-bit
> +          and 16-bit devices and so this property must be
> +          1 or 2.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2]
> +      gpmc,mux-add-data:
> +        description: |
> +          Address and data multiplexing configuration.
> +          Valid values are:
> +          0 for Non multiplexed mode
> +          1 for address-address-data multiplexing mode and
> +          2 for address-data multiplexing mode.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +      gpmc,sync-read:
> +        description: |
> +          Enables synchronous read. Defaults to asynchronous
> +          is this is not set.
> +        type: boolean
> +      gpmc,sync-write:
> +        description: |
> +          Enables synchronous writes. Defaults to asynchronous
> +          is this is not set.
> +        type: boolean
> +      gpmc,wait-pin:
> +        description: |
> +          Wait-pin used by client. Must be less than "gpmc,num-waitpins".
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      gpmc,wait-on-read:
> +        description:     Enables wait monitoring on reads.
> +        type: boolean
> +      gpmc,wait-on-write:
> +        description:    Enables wait monitoring on writes.
> +        type: boolean
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpmc,num-cs
> +  - gpmc,num-waitpins
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    gpmc: memory-controller@50000000 {
> +      compatible = "ti,am3352-gpmc";
> +      reg = <0x50000000 0x2000>;
> +      interrupts = <100>;
> +      clocks = <&l3s_clkctrl>;
> +      clock-names = "fck";
> +      dmas = <&edma 52 0>;
> +      dma-names = "rxtx";
> +      gpmc,num-cs = <8>;
> +      gpmc,num-waitpins = <2>;
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      ranges = <0 0 0x08000000 0x10000000>; /* CS0 @addr 0x8000000, size 0x10000000 */
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +
> +      nand@0,0 {
> +        compatible = "ti,omap2-nand";
> +        reg = <0 0 4>;
> +        interrupt-parent = <&gpmc>;
> +        interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
> +                     <1 IRQ_TYPE_NONE>; /* termcount */
> +        rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 pin */
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> index 44919d48d241..e439949d49e6 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> @@ -5,7 +5,7 @@ the GPMC controller with a name of "nand".
>  
>  All timing relevant properties as well as generic gpmc child properties are
>  explained in a separate documents - please refer to
> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> +Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>  
>  For NAND specific properties such as ECC modes or bus width, please refer to
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
> index c8567b40fe13..c9bea106ea65 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
> @@ -5,7 +5,7 @@ child nodes of the GPMC controller with a name of "nor".
>  
>  All timing relevant properties as well as generic GPMC child properties are
>  explained in a separate documents. Please refer to
> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> +Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>  
>  Required properties:
>  - bank-width: 		Width of NOR flash in bytes. GPMC supports 8-bit and
> @@ -28,7 +28,7 @@ Required properties:
>  
>  Optional properties:
>  - gpmc,XXX		Additional GPMC timings and settings parameters. See
> -			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> +			Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>  
>  Optional properties for partition table parsing:
>  - #address-cells: should be set to 1
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> index e9f01a963a0a..0da78cc4ccca 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> @@ -5,7 +5,7 @@ the GPMC controller with a name of "onenand".
>  
>  All timing relevant properties as well as generic gpmc child properties are
>  explained in a separate documents - please refer to
> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> +Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>  
>  Required properties:
>  
> diff --git a/Documentation/devicetree/bindings/net/gpmc-eth.txt b/Documentation/devicetree/bindings/net/gpmc-eth.txt
> index 32821066a85b..5e2f610455fa 100644
> --- a/Documentation/devicetree/bindings/net/gpmc-eth.txt
> +++ b/Documentation/devicetree/bindings/net/gpmc-eth.txt
> @@ -9,7 +9,7 @@ the GPMC controller with an "ethernet" name.
>  
>  All timing relevant properties as well as generic GPMC child properties are
>  explained in a separate documents. Please refer to
> -Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> +Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>  
>  For the properties relevant to the ethernet controller connected to the GPMC
>  refer to the binding documentation of the device. For example, the documentation
> @@ -43,7 +43,7 @@ Required properties:
>  
>  Optional properties:
>  - gpmc,XXX		Additional GPMC timings and settings parameters. See
> -			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> +			Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml

Perhaps delete this file first in the series so you don't have to 
update it.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
