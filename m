Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0132CC83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B7D20731
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRJahyR4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="LP35zI4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B7D20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=54bgHa0To/+4LoouV3CEk3UFXqTtpMm1eiq/iA1xv/Y=; b=XRJahyR4bhXoWSXMk2dx236zM
	Bc/lILdYaY1SknOTI1Wk+Rzz3MvRCtpPVMeM9R9uMRyfXjv0686Ca0t0w1pMkVI//kLvGzfbym0F7
	052S4xZxtS+W+jr0H1/o1OSto3pC8g2Lth5Ecw8aEMhfOCR+cca636XBhAL2dhbrvjSESXct156qI
	jPhv+A7c+cwfR2CDGR0FH7jO2lEPJPvRqXT+8u8x/aPdseeXe6zxrM9yIwgTxrmXdKtqb6S1PznYq
	75fEjND09K4+kpy7WI4ZMUQ+LumZLlvgZfE0unV6rjGLdgH52YkOZrvA+r0TclLQ6jR55w6SH7wAf
	Obk24j1uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTj7u-0006tm-Me; Wed, 29 Apr 2020 09:35:34 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTj7q-0006se-BG
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 09:35:32 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T9SJi6013131; Wed, 29 Apr 2020 11:35:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=++zRpDiALeUxrxlFUi0Ix+YSc7jWQuWjbZ2z8MduMk8=;
 b=LP35zI4uQnpzhEXRjVaLAMph7uJ58A50TweS66v+F2mrZ7CnnNi3es7n25BA/aHuHdCK
 CGhbu6HwzqQoacDjp5d98vvfkXe6YDDXSFx2xO8brrD/xdOzCQE2KAdLVl2QjlCYiH41
 pNUDiLk7eSIps64zKhvxI1NlVoAP71eJRgo+XGUKrcp942x8azvmJicol3WpqoSKjUwz
 vwwnqnm1BnFDEW6cFUN7xBPI9M2UYllxKekSunmL7CCAk6B0PYgpplCDDp8eBTjngzu+
 4jX7tZOBFVvvtutus8MoIqygKkh4p46H43EndFOS7dFXK4yyInWF0fM0pn6yO9/IkXmg wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j61k4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:35:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0C0F100034;
 Wed, 29 Apr 2020 11:35:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77E3B207598;
 Wed, 29 Apr 2020 11:35:17 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 11:35:15 +0200
Subject: Re: [PATCH v2 01/12] dt-bindings: mfd: stm32-fmc2: add STM32 FMC2
 controller documentation
To: Rob Herring <robh@kernel.org>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-2-git-send-email-christophe.kerello@st.com>
 <20200428152843.GA8088@bogus>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <49372e0d-259c-a431-1f99-d40bd1aa5a99@st.com>
Date: Wed, 29 Apr 2020 11:35:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200428152843.GA8088@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-28,
 2020-04-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_023530_687322_26C880A9 
X-CRM114-Status: GOOD (  26.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi rob,

On 4/28/20 5:28 PM, Rob Herring wrote:
> On Wed, Apr 15, 2020 at 05:57:25PM +0200, Christophe Kerello wrote:
>> This patch adds the documentation of the device tree bindings for the STM32
>> FMC2 controller.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>>   .../devicetree/bindings/mfd/st,stm32-fmc2.yaml     | 370 +++++++++++++++++++++
>>   1 file changed, 370 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
>> new file mode 100644
>> index 0000000..0ce1340
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/st,stm32-fmc2.yaml
>> @@ -0,0 +1,370 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/st,stm32-fmc2.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
>> +
>> +description: |
>> +  The FMC2 functional block makes the interface with: synchronous and
>> +  asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
>> +  peripherals) and NAND flash memories.
>> +  Its main purposes are:
>> +    - to translate AXI transactions into the appropriate external device
>> +      protocol
>> +    - to meet the access time requirements of the external devices
>> +  All external devices share the addresses, data and control signals with the
>> +  controller. Each external device is accessed by means of a unique Chip
>> +  Select. The FMC2 performs only one access at a time to an external device.
>> +
>> +maintainers:
>> +  - Christophe Kerello <christophe.kerello@st.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp1-fmc2
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^ebi(@.*)?":
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: st,stm32mp1-fmc2-ebi
>> +
>> +      "#address-cells":
>> +        const: 2
>> +
>> +      "#size-cells":
>> +        const: 1
>> +
>> +      ranges: true
>> +
>> +    patternProperties:
>> +      "^[a-zA-Z]*-ebi@[a-f0-9,]*$":
> 
> These nodes should be named based on the device connected and we can be
> a bit more precise on the unit-address:
> 
> "@[0-9a-f],[0-9a-f]+$"
> 
> Adjust for how many chip selects there are. 15 seems unlikely.
> 

Ok. It will be modified in v3.

>> +        type: object
>> +
>> +        properties:
>> +          reg:
>> +            maxItems: 1
>> +
>> +          st,fmc2_ebi_cs_transaction_type:
> 
> s/_/-/
> 
> And for the rest of the vendor properties...
> 

Ok. It will be modified in v3.

>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +              - minimum: 0
>> +                maximum: 11
>> +            description: |
>> +                         Select one of the transactions type supported
>> +                           0: Asynchronous mode 1 SRAM/FRAM
>> +                           1: Asynchronous mode 1 PSRAM.
>> +                           2: Asynchronous mode A SRAM/FRAM.
>> +                           3: Asynchronous mode A PSRAM.
>> +                           4: Asynchronous mode 2 NOR.
>> +                           5: Asynchronous mode B NOR.
>> +                           6: Asynchronous mode C NOR.
>> +                           7: Asynchronous mode D NOR.
>> +                           8: Synchronous read synchronous write PSRAM.
>> +                           9: Synchronous read asynchronous write PSRAM.
>> +                           10: Synchronous read synchronous write NOR.
>> +                           11: Synchronous read asynchronous write NOR.
>> +
>> +          st,fmc2_ebi_cs_cclk_enable:
>> +            $ref: /schemas/types.yaml#/definitions/flag
>> +            description: Continuous clock enable (first bank must be configured
>> +                         in synchronous mode). The FMC_CLK is generated continuously
>> +                         during asynchronous and synchronous access. By default, the
>> +                         FMC_CLK is only generated during synchronous access.
>> +
>> +          st,fmc2_ebi_cs_mux_enable:
>> +            $ref: /schemas/types.yaml#/definitions/flag
>> +            description: Address/Data multiplexed on databus (valid only with
>> +                         NOR and PSRAM transactions type). By default, Address/Data are
>> +                         not multiplexed.
>> +
>> +          st,fmc2_ebi_cs_buswidth:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +              - enum: [ 8, 16 ]
>> +              - default: 16
>> +            description: Data bus width
>> +
>> +          st,fmc2_ebi_cs_waitpol_high:
>> +            $ref: /schemas/types.yaml#/definitions/flag
>> +            description: Wait signal polarity (NWAIT signal active high).
>> +                         By default, NWAIT is active low.
>> +
>> +          st,fmc2_ebi_cs_waitcfg_enable:
>> +            $ref: /schemas/types.yaml#/definitions/flag
>> +            description: The NWAIT signal indicates wheither the data from the
>> +                         device are valid or if a wait state must be inserted when
>> +                         accessing the device in synchronous mode. By default, the NWAIT
>> +                         signal is active one data cycle before wait state.
>> +
>> +          st,fmc2_ebi_cs_wait_enable:
>> +            $ref: /schemas/types.yaml#/definitions/flag
>> +            description: The NWAIT signal is enabled (its level is taken into
>> +                         account after the programmed latency period to insert wait states
>> +                         if asserted). By default, the NWAIT signal is disabled.
>> +
>> +          st,fmc2_ebi_cs_asyncwait_enable:
>> +            $ref: /schemas/types.yaml#/definitions/flag
>> +            description: The NWAIT signal is taken into account during
>> +                         asynchronous transactions. By default, the NWAIT signal is not
>> +                         taken into account during asynchronous transactions.
>> +
>> +          st,fmc2_ebi_cs_cpsize:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +              - enum: [ 0, 128, 256, 512, 1024 ]
>> +              - default: 0
>> +            description: CRAM page size. The controller splits the burst access
>> +                         when the memory page is reached. By default, no burst split when
>> +                         crossing page boundary.
>> +
>> +          st,fmc2_ebi_cs_byte_lane_setup:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property configures the byte lane setup timing
>> +                         defined in ns from NBLx low to Chip Select NEx low.
> 
> If units are nsec, then use the standard unit suffixes. Then you don't
> need to define the type either.
> 

Ok. It will be modified in v3.

>> +
>> +          st,fmc2_ebi_cs_address_setup:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the address
>> +                         setup phase in ns used for asynchronous read/write transactions.
>> +
>> +          st,fmc2_ebi_cs_address_hold:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the address
>> +                         hold phase in ns used for asynchronous multiplexed
>> +                         read/write transactions.
>> +
>> +          st,fmc2_ebi_cs_data_setup:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the data
>> +                         setup phase in ns used for asynchronous read/write transactions.
>> +
>> +          st,fmc2_ebi_cs_bus_turnaround:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the delay between the end of
>> +                         current read/write transaction and the next transaction.
>> +
>> +          st,fmc2_ebi_cs_data_hold:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the data
>> +                         hold phase in ns used for asynchronous read/write transactions.
>> +
>> +          st,fmc2_ebi_cs_clk_period:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the FMC_CLK output signal period in ns.
>> +
>> +          st,fmc2_ebi_cs_data_latency:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the data latency before reading or writing
>> +                         the first data. This timing is expressed in FMC_CLK periods.
>> +
>> +          st,fmc2_ebi_cs_write_address_setup:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the address
>> +                         setup phase in ns used for asynchronous write transactions.
>> +
>> +          st,fmc2_ebi_cs_write_address_hold:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the address hold phase in
>> +                         ns used for asynchronous multiplexed write transactions.
>> +
>> +          st,fmc2_ebi_cs_write_data_setup:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the data setup phase in
>> +                         ns used for asynchronous write transactions.
>> +
>> +          st,fmc2_ebi_cs_write_bus_turnaround:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the delay between the end of current
>> +                         write transaction and the next transaction.
>> +
>> +          st,fmc2_ebi_cs_write_data_hold:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the duration of the data hold phase
>> +                         in ns used for asynchronous write transactions.
>> +
>> +          st,fmc2_ebi_cs_max_low_pulse:
>> +            allOf:
>> +              - $ref: /schemas/types.yaml#/definitions/uint32
>> +            description: This property defines the maximum chip select low pulse duration
>> +                         in ns for synchronous transactions. When this timing reaches 0,
>> +                         the controller splits the current access, toggles NE to allow
>> +                         device refresh and restarts a new access.
>> +
>> +        required:
>> +          - reg
>> +          - st,fmc2_ebi_cs_transaction_type
>> +
>> +    additionalProperties: false
>> +
>> +    required:
>> +      - compatible
>> +      - "#address-cells"
>> +      - "#size-cells"
>> +      - ranges
>> +
>> +  nand-controller:
>> +    allOf:
>> +      - $ref: "../mtd/nand-controller.yaml#"
>> +
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: st,stm32mp1-fmc2-nand
>> +
>> +      reg:
>> +        items:
>> +          - description: Chip select 0 data
>> +          - description: Chip select 0 command
>> +          - description: Chip select 0 address space
>> +          - description: Chip select 1 data
>> +          - description: Chip select 1 command
>> +          - description: Chip select 1 address space
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +      dmas:
>> +        items:
>> +          - description: tx DMA channel
>> +          - description: rx DMA channel
>> +          - description: ecc DMA channel
>> +
>> +      dma-names:
>> +        items:
>> +          - const: tx
>> +          - const: rx
>> +          - const: ecc
>> +
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^nand@[a-f0-9]$":
>> +        type: object
>> +
>> +        properties:
>> +          nand-ecc-step-size:
>> +            const: 512
>> +
>> +          nand-ecc-strength:
>> +            enum: [1, 4 ,8 ]
>> +
>> +    additionalProperties: false
>> +
>> +    required:
>> +      - "#address-cells"
>> +      - "#size-cells"
>> +      - compatible
>> +      - reg
>> +      - interrupts
>> +
>> +  additionalProperties: false
> 
> Wrong indentation. You are defining a DT property called
> 'additionalProperties'. You need 2 of these at 0 and 4 spaces
> indentation. I have a check for this error in dt-schema pending.
> 

Ok. It will be modified in v3.

Regards,
Christophe Kerello.

>> +
>> +required:
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - ranges
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +    #include <dt-bindings/reset/stm32mp1-resets.h>
>> +    fmc@58002000 {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      compatible = "st,stm32mp1-fmc2";
>> +      reg = <0x58002000 0x1000>;
>> +      clocks = <&rcc FMC_K>;
>> +      resets = <&rcc FMC_R>;
>> +      ranges;
>> +
>> +      ebi@0 {
>> +        #address-cells = <2>;
>> +        #size-cells = <1>;
>> +        compatible = "st,stm32mp1-fmc2-ebi";
>> +        ranges = <0 0 0x60000000 0x4000000>,
>> +                 <1 0 0x64000000 0x4000000>,
>> +                 <2 0 0x68000000 0x4000000>,
>> +                 <3 0 0x6c000000 0x4000000>;
>> +
>> +        psram-ebi@0,0 {
>> +          compatible = "mtd-ram";
>> +          reg = <0 0x00000000 0x100000>;
>> +          bank-width = <2>;
>> +
>> +          st,fmc2_ebi_cs_transaction_type = <1>;
>> +          st,fmc2_ebi_cs_address_setup = <60>;
>> +          st,fmc2_ebi_cs_data_setup = <30>;
>> +          st,fmc2_ebi_cs_bus_turnaround = <5>;
>> +        };
>> +      };
>> +
>> +      nand-controller@1 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        compatible = "st,stm32mp1-fmc2-nand";
>> +        reg = <0x80000000 0x1000>,
>> +              <0x88010000 0x1000>,
>> +              <0x88020000 0x1000>,
>> +              <0x81000000 0x1000>,
>> +              <0x89010000 0x1000>,
>> +              <0x89020000 0x1000>;
>> +        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>> +        dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
>> +               <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
>> +               <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
>> +        dma-names = "tx", "rx", "ecc";
>> +
>> +        nand@0 {
>> +          reg = <0>;
>> +          nand-on-flash-bbt;
>> +          #address-cells = <1>;
>> +          #size-cells = <1>;
>> +        };
>> +      };
>> +    };
>> +
>> +...
>> -- 
>> 1.9.1
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
