Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D3EC77B7A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 21:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPoPHXJu/fMBavV8fVdlMD1DSJ966kjZsv71zYJk2B4=; b=PAwM2gVyMCz2Ip
	NNPfFFdivtKnx8AaFWtO+sF/ycvtvtxyIJbRK5Q81O6I4K00sBGKKV6fsXNSf0EZlRf9T4JaySqYd
	TlC6inpsVgwIZf/G68iOsLvg6Bf/4yiE22Reo6bYjxUJ/qwopnBF7I1ktKH6dDK/ZtSjI9QyMlHxY
	pqFV8RKn+VsA7Gix1hG1zxTfwFtCwcHG8xzwgYYvviIvcy2QtpbUyeRUJvDS3wqGB5gpyUeV+8rPp
	zfM5p5Ykpfu3hXJWfCnq0NopTC89i82Eaf5PzdddjjbRaf6USMzn7017fXZb4OB5wEBukNzqz/g9L
	EUxDL+3/kh5CVlh5FfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pVr-004wla-20;
	Thu, 01 Jun 2023 21:07:15 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pVn-004wj0-0f
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 21:07:14 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DDBC22C0343;
	Fri,  2 Jun 2023 09:07:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685653623;
	bh=lagv8B0EktaO49mcN5rcRK+n+7a0oAGzTW3IlAZoyKk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=28VhZHWSXPmoizF87/VTbUd7qtCbFZk5RgUAKSdPn2iUIJgL73ao1/ID4TqV3xXKD
	 tsbzbqS1b9T90lChZpE7FWTRXksCXpWdSmd8NNTKVpmK7MV9mY/u+O0r9SsVErgeLn
	 5NzVjDDCa7nKPfpXUGUZ8M4kTIK99Ynb/+jytJ6WWTf9U+8OSfh6dho6RlUKe2374/
	 xNmWBg1pTpmeo6keQUpsLxSxRVDKEUd9/ZswMJTG1xBe/Qi33APUPsWvihgVrKVk1N
	 EX9hDStq4UMZOBjA1o81fWYbzO+fw20UziLGQSgCBBhYjTnz5iOIvIO3vImUd7avxT
	 MviYyqgdAumdA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B647908770000>; Fri, 02 Jun 2023 09:07:03 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 09:07:03 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Fri, 2 Jun 2023 09:07:03 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Fri, 2 Jun 2023 09:07:03 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
	"conor@kernel.org" <conor@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "enachman@marvell.com"
	<enachman@marvell.com>, Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Thread-Topic: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Thread-Index: AQHZlBqKdz5LnJY4bkmRhfo5eGePCq90vZuAgADrCwA=
Date: Thu, 1 Jun 2023 21:07:03 +0000
Message-ID: <043c67b6-6061-f683-f054-86d7c298e03a@alliedtelesis.co.nz>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
 <20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
 <a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
In-Reply-To: <a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <D3518A4F5BE4424DAD44AEAF1B6001AC@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CMhUoijD c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=of4jigFt-DYA:10 a=g8kJ_gb0AAAA:8 a=62ntRvTiAAAA:8 a=gEfo2CItAAAA:8 a=P-IC7800AAAA:8 a=0ubqMkb-OQRjDkv6lAAA:9 a=QEXdDO2ut3YA:10 a=ecSNLfPMzbq-p5zXJZOg:22 a=pToNdpNmrtiFLRE6bQ9Z:22 a=sptkURWiP4Gy88Gu7hUp:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_140711_883756_085F2EA2 
X-CRM114-Status: GOOD (  30.43  )
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


On 1/06/23 19:05, Krzysztof Kozlowski wrote:
> On 01/06/2023 01:49, Chris Packham wrote:
>> From: Vadym Kochan <vadym.kochan@plvision.eu>
>>
>> Switch the DT binding to a YAML schema to enable the DT validation.
>>
>> The text binding didn't mention it as a requirement but existing usage
>> has
>>
>>     compatible = "marvell,armada-8k-nand-controller",
>>                  "marvell,armada370-nand-controller";
>>
>> so the YAML allows this in addition to the individual compatible values.
>>
>> There was also an incorrect reference to dma-names being "rxtx" where
>> the driver and existing device trees actually use dma-names = "data" so
>> this is corrected in the conversion.
>>
>> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>
>> Notes:
>>      Changes in v8:
>>      - Mark deprecated compatible values as such
>>      - Allow "marvell,armada-8k-nand-controller" without
>>        "marvell,armada370-nand-controller"
>>      - Make dma-names usage reflect reality
>>      - Update commit message
>>      
>>      Changes in v7:
>>      - Restore "label" and "partitions" properties (should be picked up via
>>        nand-controller.yaml but aren't)
> What do you mean by "aren't"? They are not needed.

I mean I simply cannot make it work and I'm out of ideas (I'm also in an 
awkward timezone so it takes 24hrs for me to ask a question and get a 
response which leads to me making guesses instead of waiting).

nand-controller.yaml references nand-chip.yaml which references mtd.yaml 
which defines the "label" and "partitions" property.

I thought marvell,nand-controller.yaml could just say `$ref: 
nand-controller.yaml` and it would mean I'd get all the definitions down 
the chain but this doesn't seem to work the way I expect (or more likely 
I'm not doing it right). I thought it might have something to do with 
the different patternProperties pattern but even when I make that match 
what is used in nand-controller.yaml it doesn't seem to pick up those 
properties.

>>      - Add/restore nand-on-flash-bbt and nand-ecc-mode which aren't covered
>>        by nand-controller.yaml.
>>      - Use "unevalautedProperties: false"
>>      - Corrections for clock-names, dma-names, nand-rb and nand-ecc-strength
>>      - Add pxa3xx-nand-controller example
>>      
>>      Changes in v6:
>>      - remove properties covered by nand-controller.yaml
>>      - add example using armada-8k compatible
>>      
>>      earlier changes:
>>      
>>      v5:
>>         1) Get back "label" and "partitions" properties but without
>>            ref to the "partition.yaml" which was wrongly used.
>>      
>>         2) Add "additionalProperties: false" for nand@ because all possible
>>            properties are described.
>>      
>>      v4:
>>         1) Remove "label" and "partitions" properties
>>      
>>         2) Use 2 clocks for A7K/8K platform which is a requirement
>>      
>>      v3:
>>        1) Remove txt version from the MAINTAINERS list
>>      
>>        2) Use enum for some of compatible strings
>>      
>>        3) Drop:
>>              #address-cells
>>              #size-cells:
>>      
>>           as they are inherited from the nand-controller.yaml
>>      
>>        4) Add restriction to use 2 clocks for A8K SoC
>>      
>>        5) Dropped description for clock-names and extend it with
>>           minItems: 1
>>      
>>        6) Drop description for "dmas"
>>      
>>        7) Use "unevalautedProperties: false"
>>      
>>        8) Drop quites from yaml refs.
>>      
>>        9) Use 4-space indentation for the example section
>>      
>>      v2:
>>        1) Fixed warning by yamllint with incorrect indentation for compatible list
>>
>>   .../bindings/mtd/marvell,nand-controller.yaml | 223 ++++++++++++++++++
>>   .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
>>   MAINTAINERS                                   |   1 -
>>   3 files changed, 223 insertions(+), 127 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>> new file mode 100644
>> index 000000000000..433feb430555
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>> @@ -0,0 +1,223 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://scanmail.trustwave.com/?c=20988&d=18P45NWaR4V6pXt_kuivNCiVAXCm3C7MEF-_8xrP2A&u=http%3a%2f%2fdevicetree%2eorg%2fschemas%2fmtd%2fmarvell%2cnand-controller%2eyaml%23
>> +$schema: http://scanmail.trustwave.com/?c=20988&d=18P45NWaR4V6pXt_kuivNCiVAXCm3C7MEFvq8B-ZjQ&u=http%3a%2f%2fdevicetree%2eorg%2fmeta-schemas%2fcore%2eyaml%23
>> +
>> +title: Marvell NAND Flash Controller (NFC)
>> +
>> +maintainers:
>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: marvell,armada-8k-nand-controller
>> +          - const: marvell,armada370-nand-controller
>> +      - enum:
>> +          - marvell,armada-8k-nand-controller
>> +          - marvell,armada370-nand-controller
>> +          - marvell,pxa3xx-nand-controller
>> +      - description: legacy bindings
>> +        deprecated: true
>> +        enum:
>> +          - marvell,armada-8k-nand
>> +          - marvell,armada370-nand
>> +          - marvell,pxa3xx-nand
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description:
>> +      Shall reference the NAND controller clocks, the second one is
>> +      is only needed for the Armada 7K/8K SoCs
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: core
>> +      - const: reg
>> +
>> +  dmas:
>> +    maxItems: 1
>> +
>> +  dma-names:
>> +    items:
>> +      - const: data
>> +
>> +  marvell,system-controller:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Syscon node that handles NAND controller related registers
>> +
>> +patternProperties:
>> +  "^nand@[0-3]$":
>> +    type: object
>> +    unevaluatedProperties: false
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 3
>> +
>> +      nand-rb:
>> +        minItems: 1
> Drop minItems.
>
>> +        maxItems: 1
> Didn't you have here minimum and maximum? I think I did not ask to
> remove them.
>
>> +
>> +      nand-ecc-step-size:
>> +        const: 512
>> +
>> +      nand-ecc-strength:
>> +        enum: [1, 4, 8, 12, 16]
>> +
>> +      nand-on-flash-bbt:
>> +        $ref: /schemas/types.yaml#/definitions/flag
>> +
>> +      nand-ecc-mode:
>> +        const: hw
>> +
>> +      label:
>> +        $ref: /schemas/types.yaml#/definitions/string
> Drop label
>
>> +
>> +      partitions:
>> +        type: object
> Drop partitions.
>
>> +
>> +      marvell,nand-keep-config:
>> +        description: |
>> +          Orders the driver not to take the timings from the core and
>> +          leaving them completely untouched. Bootloader timings will then
>> +          be used.
>> +        $ref: /schemas/types.yaml#/definitions/flag
>> +
>> +      marvell,nand-enable-arbiter:
>> +        description: |
>> +          To enable the arbiter, all boards blindly used it,
>> +          this bit was set by the bootloader for many boards and even if
>> +          it is marked reserved in several datasheets, it might be needed to set
>> +          it (otherwise it is harmless).
>> +        $ref: /schemas/types.yaml#/definitions/flag
>> +        deprecated: true
>> +
>> +    additionalProperties: false
> unevaluatedProperties: false
>
>> +
>> +    required:
>> +      - reg
>> +      - nand-rb
>> +
> required: block goes here
>
>> +allOf:
>> +  - $ref: nand-controller.yaml
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: marvell,pxa3xx-nand-controller
>> +    then:
>> +      required:
>> +        - dmas
>> +        - dma-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: marvell,armada-8k-nand-controller
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +
>> +        clock-names:
>> +          minItems: 2
>> +
>> +      required:
>> +        - marvell,system-controller
>> +
>
> Best regards,
> Krzysztof
>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
