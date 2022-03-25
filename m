Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B23C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IS8edW9c7GQuTVXHwmpexNzBiQQnDcHRP2qpFwLZ9Zo=; b=yg8Tgan6xpNOAc
	uxJugJ3ZnlRidNzRfP74YGNNDMsI3hZgeUaI+R4ZxP1PZloFvH4Poabd2cPDj3LZHeVbYSduI93JM
	qzLbZvv/GFYYFiFB7PWgZI6Vb3XT9gjO3nAuG8vqsPxvZxNsJ3PR7fNe7Vr8HYrSM8Y38p5zVApdy
	n87HH/iBjkw8HJgI674QkwYH7C8ceaissH3y5VfZBmWBZQLCbosvKejINKo04qq9uIjjEGuwKj+K8
	wFqeEYMukRoUQ1f1bC+xqrxrI87l/+BYjq5OQfJTgU0raAtIkxyI9eHTI5DkoYkAoNSQGDqGep50/
	xuc9xROEi6ns2VW3J8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXif2-001xrs-Os; Fri, 25 Mar 2022 12:03:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXif0-001xqm-7P
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:03:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E5CA618FA;
 Fri, 25 Mar 2022 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B302CC340E9;
 Fri, 25 Mar 2022 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648209796;
 bh=78i4ZvBr8mrRT5MUgR6xw5y5tehZmMaII08aMDCZ7AE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ERALGrRKHbXizKJCwQCwZw7DZyp1WG7jt1b9yK2/NE1whQ3GOpMlzCPbeEuAdX/Cn
 R+tVOElt43CDEqUQxJ45LR3RmXBwGl1CXmsuSHyeu+T0FDOww7DwZLs1Y6PutL2VfO
 99JEDyFhRTQxIDjBlzgdB1eDcexod2uMETtrx1p5M7SLo/oe7FdXp2iBn0wb7GzAeX
 26ul/MVQ3o2Pnsq2q35n24Hhe2F9QJw0b0Qan/LomJdYI4MLlXXK002VdAuGNAExxz
 /yvT8HtHSx2S8sJ54WSSWL4Kutb7nRRadJ+yNr+yBxpRnvRv24NGYzCL4+X/qjAnrv
 7Lj0RrnYltn6Q==
Message-ID: <55ecfc8a-a3e5-e0b5-6e6d-bf9ad93d141f@kernel.org>
Date: Fri, 25 Mar 2022 14:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220323111851.4699-1-rogerq@kernel.org>
 <20220323111851.4699-2-rogerq@kernel.org>
 <622e5de3-12b3-0f5f-1c1b-6e062c39a626@kernel.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <622e5de3-12b3-0f5f-1c1b-6e062c39a626@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_050318_400724_FF0B3947 
X-CRM114-Status: GOOD (  21.36  )
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

Hi Krzysztof,

On 24/03/2022 20:24, Krzysztof Kozlowski wrote:
> On 23/03/2022 12:18, Roger Quadros wrote:
>> Convert elm.txt to ti,elm.yaml.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/elm.txt | 16 -------
>>  .../devicetree/bindings/mtd/ti,elm.yaml       | 48 +++++++++++++++++++
>>  2 files changed, 48 insertions(+), 16 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/elm.txt b/Documentation/devicetree/bindings/mtd/elm.txt
>> deleted file mode 100644
>> index 59ddc61c1076..000000000000
>> --- a/Documentation/devicetree/bindings/mtd/elm.txt
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Error location module
>> -
>> -Required properties:
>> -- compatible: Must be "ti,am3352-elm"
>> -- reg: physical base address and size of the registers map.
>> -- interrupts: Interrupt number for the elm.
>> -
>> -Optional properties:
>> -- ti,hwmods: Name of the hwmod associated to the elm
>> -
>> -Example:
>> -elm: elm@0 {
>> -	compatible = "ti,am3352-elm";
>> -	reg = <0x48080000 0x2000>;
>> -	interrupts = <4>;
>> -};
>> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>> new file mode 100644
>> index 000000000000..24ed0fb84204
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/ti,elm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments Error Location Module (ELM).
>> +
>> +maintainers:
>> +  - Roger Quadros <rogerq@kernel.org>
>> +
>> +description:
>> +  ELM module is used together with GPMC and NAND Flash to detect
>> +  errors and the location of the error based on BCH algorithms
>> +  so they can be corrected if possible.
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> No items, just const.

OK.

> 
>> +      - const: ti,am3352-elm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  ti,hwmods:
>> +    description:
>> +      Name of the HWMOD associated with ELM. This is for legacy
>> +      platforms only.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    deprecated: true
> 
> It was not deprecated before. Could you explain it in commit msg because
> it is not a conversion only.

OK I will mention that hwmod usage is not recommended for new platforms.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    elm: elm@0 {
> 
> This is error correction, right? So generic node name "ecc"?
> 
>> +        compatible = "ti,am3352-elm";
>> +        reg = <0x0 0x2000>;
>> +        interrupts = <4>;
>> +    };
> 
> 
> Best regards,
> Krzysztof

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
