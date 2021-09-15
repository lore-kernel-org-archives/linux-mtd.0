Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B05C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 07:22:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B9861164
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 07:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81B9861164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dV2SMl2VYh5nB6gDRQsES4P/+27NOCi+ParYkAmxhlw=; b=wUP6RNt2ACcXknABUg/kDh7zH3
	F3eV6dvGPQSGNOxfgcykGEv65PM56mFev1qkO+ofbDvYwu5QRobBdlqPyw7nHckHu/o+e6KbGKp9G
	Ku/A9SqBPqLYMzphfOzTBTkqDjR1S+DAqSCgGtXcVEopmiXi4FwQUt5RmrJQf0P0tHjgRlU9cKuZM
	OaWVu4LR+rkzeWUVcO6Dd7a4QYeoP+2aCCFOtiO189o1xD8DxXYY+CPAyV7IhmMsAgJd+h/7eKCAq
	f+g5X6Ib1mrsbDpsS5X3EF+4KBjmBbj+Sa5UvmvD3fGw0vBtPh/oWl9AD4aqFE+AGsmoCEfiIBvEE
	i1GSOrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQPEe-008I0j-Hc; Wed, 15 Sep 2021 07:21:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQPEZ-008HzE-AZ
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 07:21:34 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 974DA3FDC7
 for <linux-mtd@lists.infradead.org>; Wed, 15 Sep 2021 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631690488;
 bh=GwQ4Jy7q0zIw9abt/H/LYy4Ryr50PZmRcGEGHow4tpE=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=VsrSYEsv+X91eQ7Nwo1jmyIhlmMxlFVBvfaxtBiQU0OvZKfF9UBnA6/QDHWpPen6c
 KJQgEJzERhJUwc3LgBWhtJWbBu9phNYhaTqJmMoEmnOf+5q5e0dFSBMQ9RniWksoCH
 ndsBKIDliKFJQ1/nlu0Wc4idpzf+nSFHBa6rroplJIV/JH4JM4wn5Fn8hSs4WEpPyH
 mX6cg2vNclhPp/X6NOGB7L36ESdzMAKKbtwrE+0LpzN3+GL5fw5ppE3Ens+YVvrPQF
 CEbkKmOxCRdvR9zx8qcpBUFoXAMaYFnFU/HHBJvgXNZfDvqTtOARSHFdL/yPtl/bFg
 1Qdsn8rySR/4Q==
Received: by mail-ej1-f71.google.com with SMTP id
 ak17-20020a170906889100b005c5d1e5e707so1000566ejc.16
 for <linux-mtd@lists.infradead.org>; Wed, 15 Sep 2021 00:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GwQ4Jy7q0zIw9abt/H/LYy4Ryr50PZmRcGEGHow4tpE=;
 b=v36lwFTf3x2Oegq8S6P14RZLBrveeNdc7fvtzpZjIyF4LI94vAUoi6OsEOLCxcZHef
 sSmeD3gn5Eyfe8leh62Atut62Tf3L8n/U3D6R0UPNNykRStaGvMtYf/QLDuMtLXi95n4
 xWNWCZe7gL4ugjLCHOzvPhKlysMlcb84F1gmq10b1cvIpP5tI24o167m0Ed63TL6/7dU
 QVJiC4ePmifZqHi8wL6eJMkDUy+TpoPxZrqtVykgQDX8RxPXhomm6L+brHeujMAfqlKv
 8fFAfddFMcdzYejigSjmt0Es+5dkv86PM5QFLif2kDGjxzZIcRN5SM7L9wYpfKIcHYfx
 RHmQ==
X-Gm-Message-State: AOAM532fQOteVYW+11fbgtjlAscXxH5qIsqJZIQDFDJ3QOY0V+2jUfLM
 EjIsyfFYUGNJLd4bVox4njd22AYmJl689+QkrfqJVR/2obCnS70bTi/dknrA9YWJ06FOk0fAb+w
 XYx0wyVjbj/0BPygd6qSOS0F2F8qVDLgGIYifxBW8CMs=
X-Received: by 2002:a50:ae21:: with SMTP id c30mr24371704edd.120.1631690487960; 
 Wed, 15 Sep 2021 00:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM4RiKsqMPyRVhAeljiEl808jk5yb6jei8PvkuwDNsEvZYP9ewbn7mbuLwJ6R7TL4catg2CA==
X-Received: by 2002:a50:ae21:: with SMTP id c30mr24371676edd.120.1631690487538; 
 Wed, 15 Sep 2021 00:21:27 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id h2sm6729850edd.43.2021.09.15.00.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:20:57 -0700 (PDT)
Subject: Re: [PATCH v4 7/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-8-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <654bb29d-5580-3035-fc43-546a7e88e224@canonical.com>
Date: Wed, 15 Sep 2021 09:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914122705.15421-8-rogerq@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_002131_712029_00D45FB1 
X-CRM114-Status: GOOD (  45.03  )
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

On 14/09/2021 14:27, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 ----------------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++++++++
>  2 files changed, 172 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> deleted file mode 100644
> index c1359f4d48d7..000000000000
> --- a/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -Device tree bindings for OMAP general purpose memory controllers (GPMC)
> -
> -The actual devices are instantiated from the child nodes of a GPMC node.
> -
> -Required properties:
> -
> - - compatible:		Should be set to one of the following:
> -
> -			ti,omap2420-gpmc (omap2420)
> -			ti,omap2430-gpmc (omap2430)
> -			ti,omap3430-gpmc (omap3430 & omap3630)
> -			ti,omap4430-gpmc (omap4430 & omap4460 & omap543x)
> -			ti,am3352-gpmc   (am335x devices)
> -
> - - reg:			A resource specifier for the register space
> -			(see the example below)
> - - ti,hwmods:		Should be set to "ti,gpmc" until the DT transition is
> -			completed.
> - - #address-cells:	Must be set to 2 to allow memory address translation
> - - #size-cells:		Must be set to 1 to allow CS address passing
> - - gpmc,num-cs:		The maximum number of chip-select lines that controller
> -			can support.
> - - gpmc,num-waitpins:	The maximum number of wait pins that controller can
> -			support.
> - - ranges:		Must be set up to reflect the memory layout with four
> -			integer values for each chip-select line in use:
> -
> -			   <cs-number> 0 <physical address of mapping> <size>
> -
> -			Currently, calculated values derived from the contents
> -			of the per-CS register GPMC_CONFIG7 (as set up by the
> -			bootloader) are used for the physical address decoding.
> -			As this will change in the future, filling correct
> -			values here is a requirement.
> - - interrupt-controller: The GPMC driver implements and interrupt controller for
> -			the NAND events "fifoevent" and "termcount" plus the
> -			rising/falling edges on the GPMC_WAIT pins.
> -			The interrupt number mapping is as follows
> -			0 - NAND_fifoevent
> -			1 - NAND_termcount
> -			2 - GPMC_WAIT0 pin edge
> -			3 - GPMC_WAIT1 pin edge, and so on.
> - - interrupt-cells:	Must be set to 2
> - - gpio-controller:	The GPMC driver implements a GPIO controller for the
> -			GPMC WAIT pins that can be used as general purpose inputs.
> -			0 maps to GPMC_WAIT0 pin.
> - - gpio-cells:		Must be set to 2
> -
> -Required properties when using NAND prefetch dma:
> - - dmas			GPMC NAND prefetch dma channel
> - - dma-names		Must be set to "rxtx"
> -
> -Timing properties for child nodes. All are optional and default to 0.
> -
> - - gpmc,sync-clk-ps:	Minimum clock period for synchronous mode, in picoseconds
> -
> - Chip-select signal timings (in nanoseconds) corresponding to GPMC_CONFIG2:
> - - gpmc,cs-on-ns:	Assertion time
> - - gpmc,cs-rd-off-ns:	Read deassertion time
> - - gpmc,cs-wr-off-ns:	Write deassertion time
> -
> - ADV signal timings (in nanoseconds) corresponding to GPMC_CONFIG3:
> - - gpmc,adv-on-ns:	Assertion time
> - - gpmc,adv-rd-off-ns:	Read deassertion time
> - - gpmc,adv-wr-off-ns:	Write deassertion time
> - - gpmc,adv-aad-mux-on-ns:	Assertion time for AAD
> - - gpmc,adv-aad-mux-rd-off-ns:	Read deassertion time for AAD
> - - gpmc,adv-aad-mux-wr-off-ns:	Write deassertion time for AAD
> -
> - WE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
> - - gpmc,we-on-ns	Assertion time
> - - gpmc,we-off-ns:	Deassertion time
> -
> - OE signals timings (in nanoseconds) corresponding to GPMC_CONFIG4:
> - - gpmc,oe-on-ns:	Assertion time
> - - gpmc,oe-off-ns:	Deassertion time
> - - gpmc,oe-aad-mux-on-ns:	Assertion time for AAD
> - - gpmc,oe-aad-mux-off-ns:	Deassertion time for AAD
> -
> - Access time and cycle time timings (in nanoseconds) corresponding to
> - GPMC_CONFIG5:
> - - gpmc,page-burst-access-ns: 	Multiple access word delay
> - - gpmc,access-ns:		Start-cycle to first data valid delay
> - - gpmc,rd-cycle-ns:		Total read cycle time
> - - gpmc,wr-cycle-ns:		Total write cycle time
> - - gpmc,bus-turnaround-ns:	Turn-around time between successive accesses
> - - gpmc,cycle2cycle-delay-ns:	Delay between chip-select pulses
> - - gpmc,clk-activation-ns: 	GPMC clock activation time
> - - gpmc,wait-monitoring-ns:	Start of wait monitoring with regard to valid
> -				data
> -
> -Boolean timing parameters. If property is present parameter enabled and
> -disabled if omitted:
> - - gpmc,adv-extra-delay:	ADV signal is delayed by half GPMC clock
> - - gpmc,cs-extra-delay:		CS signal is delayed by half GPMC clock
> - - gpmc,cycle2cycle-diffcsen:	Add "cycle2cycle-delay" between successive
> -				accesses to a different CS
> - - gpmc,cycle2cycle-samecsen:	Add "cycle2cycle-delay" between successive
> -				accesses to the same CS
> - - gpmc,oe-extra-delay:		OE signal is delayed by half GPMC clock
> - - gpmc,we-extra-delay:		WE signal is delayed by half GPMC clock
> - - gpmc,time-para-granularity:	Multiply all access times by 2
> -
> -The following are only applicable to OMAP3+ and AM335x:
> - - gpmc,wr-access-ns:		In synchronous write mode, for single or
> -				burst accesses, defines the number of
> -				GPMC_FCLK cycles from start access time
> -				to the GPMC_CLK rising edge used by the
> -				memory device for the first data capture.
> - - gpmc,wr-data-mux-bus-ns:	In address-data multiplex mode, specifies
> -				the time when the first data is driven on
> -				the address-data bus.
> -
> -GPMC chip-select settings properties for child nodes. All are optional.
> -
> -- gpmc,burst-length	Page/burst length. Must be 4, 8 or 16.
> -- gpmc,burst-wrap	Enables wrap bursting
> -- gpmc,burst-read	Enables read page/burst mode
> -- gpmc,burst-write	Enables write page/burst mode
> -- gpmc,device-width	Total width of device(s) connected to a GPMC
> -			chip-select in bytes. The GPMC supports 8-bit
> -			and 16-bit devices and so this property must be
> -			1 or 2.
> -- gpmc,mux-add-data	Address and data multiplexing configuration.
> -			Valid values are 1 for address-address-data
> -			multiplexing mode and 2 for address-data
> -			multiplexing mode.
> -- gpmc,sync-read	Enables synchronous read. Defaults to asynchronous
> -			is this is not set.
> -- gpmc,sync-write	Enables synchronous writes. Defaults to asynchronous
> -			is this is not set.
> -- gpmc,wait-pin		Wait-pin used by client. Must be less than
> -			"gpmc,num-waitpins".
> -- gpmc,wait-on-read	Enables wait monitoring on reads.
> -- gpmc,wait-on-write	Enables wait monitoring on writes.
> -
> -Example for an AM33xx board:
> -
> -	gpmc: gpmc@50000000 {
> -		compatible = "ti,am3352-gpmc";
> -		ti,hwmods = "gpmc";
> -		reg = <0x50000000 0x2000>;
> -		interrupts = <100>;
> -		dmas = <&edma 52 0>;
> -		dma-names = "rxtx";
> -		gpmc,num-cs = <8>;
> -		gpmc,num-waitpins = <2>;
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -		ranges = <0 0 0x08000000 0x10000000>; /* CS0 @addr 0x8000000, size 0x10000000 */
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -
> -		/* child nodes go here */
> -	};
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> new file mode 100644
> index 000000000000..d6cd39bd3940
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> @@ -0,0 +1,172 @@
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

How about putting them in alphabetical order?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
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
> +  "#address-cells": true
> +
> +  "#size-cells": true
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
> +    const: 2
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
> +  "@[0-7],[a-f0-9]+$":
> +    type: object
> +    description: |
> +      The child device node represents the device connected to the GPMC
> +      bus. The device can be a NAND chip, SRAM device, NOR device
> +      or an ASIC.
> +
> +    allOf:
> +      - $ref: "ti,gpmc-child.yaml"
> +
> +    unevaluatedProperties: false
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

Why these are interrupts of unspecified type (NONE)?

> +        ti,nand-xfer-type = "prefetch-dma";
> +        ti,nand-ecc-opt = "bch16";
> +        ti,elm-id = <&elm>;
> +        rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 pin */
> +      };
> +    };
> 


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
