Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E05C83001
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 15:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1C220757
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 15:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dAYP1Rzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A1C220757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZgSX6GW1EUpnfpnYr9YBy1pJrhkZjvHf2eAeMlJ9nE=; b=dAYP1RzpqJvv5g
	WriiAx120zf81UMF4IN1kSqrsRyNGc3/O3zCFmF/6X7vLgsoJTHc8RMT5BuW7ev6JYku4NjZYC6Hx
	uvyXj8+IRxrLV+RH7ofIoeNdKSNUXQZk+iSV6iJrXu8tAlnn12Vnn9IM18f6J6BcbVWS3nljgQfHL
	YXD242cpPLlEQXZpbjrarOTBhZSohy2oPLaNTg81xw185QmQXhajucBqw8q7eR0BhOW61aMH+m1dM
	JTCCY/SIc0YVuUWzh7b1ihr5GFmmI9ByCuHt3XD2+N4YC1NA/GfYGZKGZe8pVUD8zxqLvWSAOK/C6
	ExNQHJ2zdkPzo5TbwNtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTSAD-0000NW-4Q; Tue, 28 Apr 2020 15:28:49 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTSA9-0000MN-Se
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 15:28:48 +0000
Received: by mail-ot1-f68.google.com with SMTP id e26so33332476otr.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Apr 2020 08:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PDx5jSzTsCF689zZbvPvqEwU7yEVo/oW97Fw3UfxxAY=;
 b=SYZ1hVdIF0JnrlVWxsdCv4JN9+D49JCAXPrA34mnn1NwK//0UzGfYd8Y9NHUsbRD5O
 U9KPynQdzRuumGKkhUF4JN25f//q6cnwZNOjwe1wDambDc9ZV9/E2S5K7UZvU3L42mTh
 yZbZuHLAVT+NpJaovWfHt/1tGZPtQcUYOz+44UzPSasK4MF0wEN3xPCnzJwd5zHyE1z/
 j0KKPB2dPr5ZGER/7NontaZAyntiPhBf/fWf41ogU1tzyp+paLwtwffbZzTcHMYpYPLm
 SciErzSCat3JHrI5IbBKVpNrFpoB86MUFJypRAnFAYMJ/+GYY18REoCPRWUnrwTazn5g
 b7cA==
X-Gm-Message-State: AGi0PuY9LZbbN/OdhCKWyxvrfEG+H+4rEqNCzQEfcXfgEz3mt+Rx+2LX
 WPai5Z6KLP3hw9y0aMZVjA==
X-Google-Smtp-Source: APiQypI1+V6ijrabaoJRFCeP9BSkzW0+lnNg3NiBmQRtiFLKcMQ63saeVwoR/e6u9BLbebXsQEUExA==
X-Received: by 2002:a9d:2dc1:: with SMTP id g59mr4199552otb.288.1588087724813; 
 Tue, 28 Apr 2020 08:28:44 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n184sm4890728oih.58.2020.04.28.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:28:44 -0700 (PDT)
Received: (nullmailer pid 25689 invoked by uid 1000);
 Tue, 28 Apr 2020 15:28:43 -0000
Date: Tue, 28 Apr 2020 10:28:43 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: mfd: stm32-fmc2: add STM32 FMC2
 controller documentation
Message-ID: <20200428152843.GA8088@bogus>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-2-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586966256-29548-2-git-send-email-christophe.kerello@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_082845_922668_D4DF51F9 
X-CRM114-Status: GOOD (  26.24  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 15, 2020 at 05:57:25PM +0200, Christophe Kerello wrote:
> This patch adds the documentation of the device tree bindings for the STM32
> FMC2 controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stm32-fmc2.yaml     | 370 +++++++++++++++++++++
>  1 file changed, 370 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
> new file mode 100644
> index 0000000..0ce1340
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
> @@ -0,0 +1,370 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/st,stm32-fmc2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
> +
> +description: |
> +  The FMC2 functional block makes the interface with: synchronous and
> +  asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
> +  peripherals) and NAND flash memories.
> +  Its main purposes are:
> +    - to translate AXI transactions into the appropriate external device
> +      protocol
> +    - to meet the access time requirements of the external devices
> +  All external devices share the addresses, data and control signals with the
> +  controller. Each external device is accessed by means of a unique Chip
> +  Select. The FMC2 performs only one access at a time to an external device.
> +
> +maintainers:
> +  - Christophe Kerello <christophe.kerello@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1-fmc2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^ebi(@.*)?":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: st,stm32mp1-fmc2-ebi
> +
> +      "#address-cells":
> +        const: 2
> +
> +      "#size-cells":
> +        const: 1
> +
> +      ranges: true
> +
> +    patternProperties:
> +      "^[a-zA-Z]*-ebi@[a-f0-9,]*$":

These nodes should be named based on the device connected and we can be 
a bit more precise on the unit-address:

"@[0-9a-f],[0-9a-f]+$"

Adjust for how many chip selects there are. 15 seems unlikely.

> +        type: object
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +          st,fmc2_ebi_cs_transaction_type:

s/_/-/

And for the rest of the vendor properties...

> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0
> +                maximum: 11
> +            description: |
> +                         Select one of the transactions type supported
> +                           0: Asynchronous mode 1 SRAM/FRAM
> +                           1: Asynchronous mode 1 PSRAM.
> +                           2: Asynchronous mode A SRAM/FRAM.
> +                           3: Asynchronous mode A PSRAM.
> +                           4: Asynchronous mode 2 NOR.
> +                           5: Asynchronous mode B NOR.
> +                           6: Asynchronous mode C NOR.
> +                           7: Asynchronous mode D NOR.
> +                           8: Synchronous read synchronous write PSRAM.
> +                           9: Synchronous read asynchronous write PSRAM.
> +                           10: Synchronous read synchronous write NOR.
> +                           11: Synchronous read asynchronous write NOR.
> +
> +          st,fmc2_ebi_cs_cclk_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Continuous clock enable (first bank must be configured
> +                         in synchronous mode). The FMC_CLK is generated continuously
> +                         during asynchronous and synchronous access. By default, the
> +                         FMC_CLK is only generated during synchronous access.
> +
> +          st,fmc2_ebi_cs_mux_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Address/Data multiplexed on databus (valid only with
> +                         NOR and PSRAM transactions type). By default, Address/Data are
> +                         not multiplexed.
> +
> +          st,fmc2_ebi_cs_buswidth:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [ 8, 16 ]
> +              - default: 16
> +            description: Data bus width
> +
> +          st,fmc2_ebi_cs_waitpol_high:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Wait signal polarity (NWAIT signal active high).
> +                         By default, NWAIT is active low.
> +
> +          st,fmc2_ebi_cs_waitcfg_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: The NWAIT signal indicates wheither the data from the
> +                         device are valid or if a wait state must be inserted when
> +                         accessing the device in synchronous mode. By default, the NWAIT
> +                         signal is active one data cycle before wait state.
> +
> +          st,fmc2_ebi_cs_wait_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: The NWAIT signal is enabled (its level is taken into
> +                         account after the programmed latency period to insert wait states
> +                         if asserted). By default, the NWAIT signal is disabled.
> +
> +          st,fmc2_ebi_cs_asyncwait_enable:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: The NWAIT signal is taken into account during
> +                         asynchronous transactions. By default, the NWAIT signal is not
> +                         taken into account during asynchronous transactions.
> +
> +          st,fmc2_ebi_cs_cpsize:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [ 0, 128, 256, 512, 1024 ]
> +              - default: 0
> +            description: CRAM page size. The controller splits the burst access
> +                         when the memory page is reached. By default, no burst split when
> +                         crossing page boundary.
> +
> +          st,fmc2_ebi_cs_byte_lane_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property configures the byte lane setup timing
> +                         defined in ns from NBLx low to Chip Select NEx low.

If units are nsec, then use the standard unit suffixes. Then you don't 
need to define the type either.

> +
> +          st,fmc2_ebi_cs_address_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address
> +                         setup phase in ns used for asynchronous read/write transactions.
> +
> +          st,fmc2_ebi_cs_address_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address
> +                         hold phase in ns used for asynchronous multiplexed
> +                         read/write transactions.
> +
> +          st,fmc2_ebi_cs_data_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data
> +                         setup phase in ns used for asynchronous read/write transactions.
> +
> +          st,fmc2_ebi_cs_bus_turnaround:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the delay between the end of
> +                         current read/write transaction and the next transaction.
> +
> +          st,fmc2_ebi_cs_data_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data
> +                         hold phase in ns used for asynchronous read/write transactions.
> +
> +          st,fmc2_ebi_cs_clk_period:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the FMC_CLK output signal period in ns.
> +
> +          st,fmc2_ebi_cs_data_latency:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the data latency before reading or writing
> +                         the first data. This timing is expressed in FMC_CLK periods.
> +
> +          st,fmc2_ebi_cs_write_address_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address
> +                         setup phase in ns used for asynchronous write transactions.
> +
> +          st,fmc2_ebi_cs_write_address_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the address hold phase in
> +                         ns used for asynchronous multiplexed write transactions.
> +
> +          st,fmc2_ebi_cs_write_data_setup:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data setup phase in
> +                         ns used for asynchronous write transactions.
> +
> +          st,fmc2_ebi_cs_write_bus_turnaround:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the delay between the end of current
> +                         write transaction and the next transaction.
> +
> +          st,fmc2_ebi_cs_write_data_hold:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the duration of the data hold phase
> +                         in ns used for asynchronous write transactions.
> +
> +          st,fmc2_ebi_cs_max_low_pulse:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +            description: This property defines the maximum chip select low pulse duration
> +                         in ns for synchronous transactions. When this timing reaches 0,
> +                         the controller splits the current access, toggles NE to allow
> +                         device refresh and restarts a new access.
> +
> +        required:
> +          - reg
> +          - st,fmc2_ebi_cs_transaction_type
> +
> +    additionalProperties: false
> +
> +    required:
> +      - compatible
> +      - "#address-cells"
> +      - "#size-cells"
> +      - ranges
> +
> +  nand-controller:
> +    allOf:
> +      - $ref: "../mtd/nand-controller.yaml#"
> +
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: st,stm32mp1-fmc2-nand
> +
> +      reg:
> +        items:
> +          - description: Chip select 0 data
> +          - description: Chip select 0 command
> +          - description: Chip select 0 address space
> +          - description: Chip select 1 data
> +          - description: Chip select 1 command
> +          - description: Chip select 1 address space
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      dmas:
> +        items:
> +          - description: tx DMA channel
> +          - description: rx DMA channel
> +          - description: ecc DMA channel
> +
> +      dma-names:
> +        items:
> +          - const: tx
> +          - const: rx
> +          - const: ecc
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^nand@[a-f0-9]$":
> +        type: object
> +
> +        properties:
> +          nand-ecc-step-size:
> +            const: 512
> +
> +          nand-ecc-strength:
> +            enum: [1, 4 ,8 ]
> +
> +    additionalProperties: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - compatible
> +      - reg
> +      - interrupts
> +
> +  additionalProperties: false

Wrong indentation. You are defining a DT property called 
'additionalProperties'. You need 2 of these at 0 and 4 spaces 
indentation. I have a check for this error in dt-schema pending.

> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - ranges
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    fmc@58002000 {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      compatible = "st,stm32mp1-fmc2";
> +      reg = <0x58002000 0x1000>;
> +      clocks = <&rcc FMC_K>;
> +      resets = <&rcc FMC_R>;
> +      ranges;
> +
> +      ebi@0 {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +        compatible = "st,stm32mp1-fmc2-ebi";
> +        ranges = <0 0 0x60000000 0x4000000>,
> +                 <1 0 0x64000000 0x4000000>,
> +                 <2 0 0x68000000 0x4000000>,
> +                 <3 0 0x6c000000 0x4000000>;
> +
> +        psram-ebi@0,0 {
> +          compatible = "mtd-ram";
> +          reg = <0 0x00000000 0x100000>;
> +          bank-width = <2>;
> +
> +          st,fmc2_ebi_cs_transaction_type = <1>;
> +          st,fmc2_ebi_cs_address_setup = <60>;
> +          st,fmc2_ebi_cs_data_setup = <30>;
> +          st,fmc2_ebi_cs_bus_turnaround = <5>;
> +        };
> +      };
> +
> +      nand-controller@1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "st,stm32mp1-fmc2-nand";
> +        reg = <0x80000000 0x1000>,
> +              <0x88010000 0x1000>,
> +              <0x88020000 0x1000>,
> +              <0x81000000 0x1000>,
> +              <0x89010000 0x1000>,
> +              <0x89020000 0x1000>;
> +        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
> +               <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
> +               <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
> +        dma-names = "tx", "rx", "ecc";
> +
> +        nand@0 {
> +          reg = <0>;
> +          nand-on-flash-bbt;
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 1.9.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
