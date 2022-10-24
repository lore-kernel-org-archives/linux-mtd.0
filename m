Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB39C67871
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBKB84PLXAOkJVxS9hq10XZ3kWrWVjIxQDku0g2WIaM=; b=hLP3++4iXzOvMZ
	XPXfAjMMns/7YYmDgsrG3BgOVUWam+DcL7fwsYNRv/vCX1tBrTrTh35R/0aXZ0XQTJMDbQQGSTeEX
	UKwcBTf3u914hKTjxQSMjjj6YyMJnvDRbZFQ6NF+9AGFCVI80ybckBZ8OxiCBjJGgOqOXg0U3G+CJ
	N7e4ajKe7YwKHBzHL2i4lfhWb/LY2sB9ugvHBju9gC3Wl5EODpG4H8nx2gXtChBgZG+87Xo5Tbi7W
	l0tOmEf6Ai8H0hFpuFqvFqfqcdQqdrCnxCV57AvnUhtY1eSXSi4HM16ooLj7qvLRhSr4rGVwS5+ZD
	or7dUaMPo2rHJ7QqXg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on4Pq-0030vB-5t; Mon, 24 Oct 2022 20:51:22 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on4Pn-0030uF-EX
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2022 20:51:21 +0000
Received: by mail-qv1-xf31.google.com with SMTP id j6so2822319qvn.12
        for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2022 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqFLMg6uRhRQRmXJ9QneA5/Qult4cQee1Mbf8jF2WyE=;
        b=AdkZFHvuiAP4xkerquOcpqZB3+k+FtH0/4XwqqQpZmxk6GgrLYTmb8gzshooljZSE6
         jdakcuD8Alctrf4B+M4qnhgUAmiADrcwssfH9wNCEX70M2rzC1PUY7a5dVzkdK05jPGn
         WgFiZsHIuvVuH4NXBSxghwPD5G9/lUsqL08n6/5t+tDTFdOICOi5Ri+B/aDy1f2kfqRl
         q5iDubrjWedxmj6aMtR7hhuABT5Cr9oCqwbguV+mDbs1fsBlBIdDWDSx1p5Gon6qWv+F
         qzRw2bzab9nF8uGnUqezDODBMBl8chfdELzmvA5uPBYJ0RJ62Ps/eIe13CO5ufgQG1nK
         p1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqFLMg6uRhRQRmXJ9QneA5/Qult4cQee1Mbf8jF2WyE=;
        b=wQ5j+QPkRYogKlzkcRCHJKjo5LkfhL3I444gW6bO4utbPhLQhhSOZtM0AA6CIqVPCz
         jca3616Em6qqK/DWJguknwCYePm0wPGirqQVXWBbUzrZgk1u97qx6ivHKGIwgkoA78KS
         osDXGCKjKfxn3fIMExuq4aaAbfFL206khHg5EXtol7+iqMfxr19a04/YzXfb3Ol1T89d
         AiaVOx8HifBAPok72/q+eUkYTwRxkFLx7RMRz44pMj8hnTfQYgc7rce+uRClq3Va+Z05
         F7I0UJdF5czOssq/gX2hXgrwzwvUd17/Ku4Q/kXqtHXGycBFs55+1cMBIEbs2YSpJiKF
         nL8Q==
X-Gm-Message-State: ACrzQf3F4QhSv6rZViRgeteUm0ddiTbGiFYvGQW4n3QnhqdzjTjESbCW
	IKn65muqSxQsNvwduUqnZAe11g==
X-Google-Smtp-Source: AMsMyM51AifgSKGMphjiFZJRB5CThD2CylgJtsOaKsmO5Ikm7TvSu2+4uhdwYMMfpDLmjyFWp8prVw==
X-Received: by 2002:a05:6214:e62:b0:4b3:ff39:7aef with SMTP id jz2-20020a0562140e6200b004b3ff397aefmr29749239qvb.31.1666644677366;
        Mon, 24 Oct 2022 13:51:17 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id l11-20020a37f90b000000b006ee79bb1f8asm622386qkj.68.2022.10.24.13.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 13:51:16 -0700 (PDT)
Message-ID: <8cc7a8b6-0ca9-bc61-77e3-abf24cfbc909@linaro.org>
Date: Mon, 24 Oct 2022 16:51:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Vadym Kochan <vadym.kochan@plvision.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Elad Nachman <enachman@marvell.com>
References: <20221021194552.683-1-vadym.kochan@plvision.eu>
 <20221021194552.683-2-vadym.kochan@plvision.eu>
 <a46c6a18-903d-2120-4876-509ce8ad19d5@linaro.org>
 <VI1P190MB03170416FB2C521103B8EE1A952E9@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1P190MB03170416FB2C521103B8EE1A952E9@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_135119_549018_A4778F61 
X-CRM114-Status: GOOD (  26.56  )
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

On 24/10/2022 15:48, Vadym Kochan wrote:
> Hi Krzysztof,
> 
> On Sat, 22 Oct 2022 12:18:49 -0400, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> On 21/10/2022 15:45, Vadym Kochan wrote:
>>> Switch the DT binding to a YAML schema to enable the DT validation.
>>>
>>> Dropped deprecated compatibles and properties described in txt file.
>>>
>>> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
>>> ---
>>>  .../bindings/mtd/marvell,nand-controller.yaml | 199 ++++++++++++++++++
>>>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 -----------
>>>  2 files changed, 199 insertions(+), 126 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>>> new file mode 100644
>>> index 000000000000..535b7f8903c8
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>>> @@ -0,0 +1,199 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Marvell NAND Flash Controller (NFC)
>>> +
>>> +maintainers:
>>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> This should be someone responsible for hardware, not subsystem
>> maintainer. Unless by coincidence Miquel matches both. :)
>>
>>> +
>>> +properties:
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +        - const: marvell,armada-8k-nand-controller
>>> +        - const: marvell,armada370-nand-controller
>>
>> Does not look like you tested the bindings. Please run `make
>> dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> 
> Yes, on v1 I did not use yamllint, but installed after Rob pointed
> on some lint warnings.

I did not say about yamllint.

> 
>>
>>> +      - const: marvell,armada370-nand-controller
>>> +      - const: marvell,pxa3xx-nand-controller
>>
>> These two are just enum.
>>
> 
> OK.
> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>
>> Drop, comes with nand-controller.yaml
>>
> 
> OK.
> 
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>
>> Ditto
>>
> 
> OK.
> 
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    description: |
>>
>> No need for |
>>
>>> +     Shall reference the NAND controller clocks, the second one is
>>> +     is only needed for the Armada 7K/8K SoCs
>>
>> You need allOf:if:then restricting it further per variant.
>>
> 
> OK, added.
> 
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: core
>>> +      - const: reg
>>> +    description: |
>>> +      Mandatory if there is a second clock, in this case there
>>> +      should be one clock named "core" and another one named "reg"
>>
>> The message is confusing. What is mandatory if there is a second clock?
>> Plus, the binding requires two clocks.
>>
>> Drop entire description.
>>
>> minItems: 1
>>
> 
> OK, droped (I used from the txt version).
> Added minItems.
> 
>>
>>> +
>>> +  dmas:
>>> +    maxItems: 1
>>> +    description: rxtx DMA channel
>>
>> Drop description.
>>
> 
> OK.
> 
>>> +
>>> +  dma-names:
>>> +    items:
>>> +      - const: rxtx
>>> +
>>> +  marvell,system-controller:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Syscon node that handles NAND controller related registers
>>> +
>>> +patternProperties:
>>> +  "^nand@[0-3]$":
>>> +    type: object
>>> +    properties:
>>> +
>>
>> Drop blank line.
>>
> 
> OK.
> 
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 3
>>> +
>>> +      nand-rb:
>>> +        minimum: 0
>>> +        maximum: 1
>>> +
>>> +      nand-ecc-strength:
>>> +        enum: [1, 4, 8]
>>> +
>>> +      nand-on-flash-bbt: true
>>> +
>>> +      nand-ecc-mode: true
>>> +
>>> +      nand-ecc-algo:
>>> +        description: |
>>> +          This property is essentially useful when not using hardware ECC.
>>> +          Howerver, it may be added when using hardware ECC for clarification
>>> +          but will be ignored by the driver because ECC mode is chosen depending
>>> +          on the page size and the strength required by the NAND chip.
>>> +          This value may be overwritten with nand-ecc-strength property.
>>> +
>>> +      nand-ecc-step-size:
>>> +        const: 512
>>
>> Why this is const?
>>
> 
> Removed const.
> 
>>> +        description: |
>>> +          Marvell's NAND flash controller does use fixed strength
>>> +          (1-bit for Hamming, 16-bit for BCH), so the actual step size
>>> +          will shrink or grow in order to fit the required strength.
>>> +          Step sizes are not completely random for all and follow certain
>>> +          patterns described in AN-379, "Marvell SoC NFC ECC".
>>> +
>>> +      label:
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +
>>> +      partitions:
>>> +        type: object
>>> +        $ref: "/schemas/mtd/partitions/partition.yaml"
>>
>> Drop quotes
>>
> 
> OK.
> 
>>         unevalautedProperties: false
>>
>> and then you will see errors, because you referenced schema for one
>> partition.
>>
> 
> Hm, I did not see errors with partitions with- or without "unevaluatedProperties".

As pointed before and here - I am not sure if you tested the bindings,
so of course then will be no warnings...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
