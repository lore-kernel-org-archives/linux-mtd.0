Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42461C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnB4GbXABpgLHPwF0xXnstIcaF/ClxNYjFoFEQ4IKwU=; b=z6coK+sXlnyPRh
	952PapNofMzZ5iNlB13Ko6LZMeVWqbS1Z5O7CaR/mOjF803oT+ry/q+nLB+bOOW7smiUafFZY0YK9
	IHnad3emydST6ecsh5wRYlZc0b0bmibuaejAA48+5nrCvwmTPatZUNKvlArY307V82iaf31PEo9lx
	sA1NGfA3VD093Xi8VEdIpAEYNPlC5GaVkey+psWJKAGydfWPofV9G2nszMUhqRBcEVOiPaAREz4wB
	WDkDlW+nqEHSOrQCIR/hHFLbT8sLGPmE8wt3zeQl37378tRAd298CzPrzk2Va4f13WwLquxDcFXpx
	B8/54jloUMgBciuY6Iyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx4F-007jWm-3V; Mon, 06 Feb 2023 08:41:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx4C-007jVf-2X
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 08:41:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id j25so6059659wrc.4
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 00:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3VF3j3MRDdF8n8OyA+nQrmUxdMViUka5P0dDhKvF9Cs=;
        b=RZmvbBqJPu59NEcQKGTy+NuU00/pyxdiCciV3lY+ZJFkGWY6lOKgPO/3EBgdLcFsAs
         BJ2U0KiOrNWMTyU8NvdlStDETJowb2CVP0ZVeaVML1WknTuU+/NHEfxN/xRQZRINva9E
         EyBOnkYYlfkc1ZtjwD8QUmkV7YkZ5T6TMK3BnhVZe76K1R49T8YbUmvtx+lJ2vOMzkOr
         GiWbiuZGZhvnUsI0g0g4LjTXzQhH2HajjN/5ZZG7GqZy3QHa2SU0Kj5SKTBvuRYTsuIE
         zAXDGHc0E8cBDb5YtxEg4MIfQSZgVAHVdPol3O+QQz14huxaKG1/YvIBNVcOQmuzVemm
         yT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VF3j3MRDdF8n8OyA+nQrmUxdMViUka5P0dDhKvF9Cs=;
        b=AxbYjdUhQFf4k+3vLpOOawqqElHctQV88j//Qz844daK4QkuUciOx6N6PJ1iRoVUfe
         ZqZclgDf5yMlNfeUjgwhDkyTrSpy633l08R0Le2C1gf0V2J+HD/RdAqy9A2X0WK0W9UQ
         mFeRrzkLU/aaoyyGxGXPG0dJj0HfcT87lzoDAmlx5lvfwm89VvjtOC+ZaZdDqv8CVjGk
         bEkoJPzp2v8ffg3PmUt/UPBo+cUvdFQaVmGicNxIKSO+S9M2uzbY2Ak4wqDeDx7XM0gC
         ITv7KHpXgHZvsiTOmmLC2nydgvePsMHXKqyiWRrZUB7N7JkjfV4rX2D4efKOT6kPyvxw
         iN3w==
X-Gm-Message-State: AO0yUKVxZ5NwwwKiLfESePDD705UQYndplvxdTzCN2fGl2Hiy5KdFtjr
	oZhOQiPXPJ6e+2vp7YPgQRzTi5S/RBHsgxls
X-Google-Smtp-Source: AK7set+LmJWRqmstWTgtfJr2oiq1AohLOY1rh7Fjr5hdugHUF6tO0yD4dWs5rOvm8gyGxzUBtmE5nw==
X-Received: by 2002:a5d:66cc:0:b0:2c3:dafd:c729 with SMTP id k12-20020a5d66cc000000b002c3dafdc729mr8449746wrw.47.1675672894408;
        Mon, 06 Feb 2023 00:41:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d6085000000b0029100e8dedasm8198595wrt.28.2023.02.06.00.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 00:41:34 -0800 (PST)
Message-ID: <177cbf68-4e13-dabe-f14c-17a36c201e26@linaro.org>
Date: Mon, 6 Feb 2023 09:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/3] dt-bindings: intel,ixp4xx-expansion-bus: split out
 peripheral properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Marek Vasut <marex@denx.de>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
 <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
 <20230130191215.GA3125737-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130191215.GA3125737-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_004136_170849_5E02D032 
X-CRM114-Status: GOOD (  21.90  )
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

On 30/01/2023 20:12, Rob Herring wrote:
> On Fri, Jan 27, 2023 at 10:32:15AM +0100, Krzysztof Kozlowski wrote:
>> The properties of devices in IXP4xx expansion bus need to be also
>> applied to actual devices' bindings.  Prepare for this by splitting them
>> to separate intel,ixp4xx-expansion-peripheral-props binding, just like
>> other memory-controller peripheral properties.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  ...intel,ixp4xx-expansion-bus-controller.yaml | 64 +--------------
>>  ...tel,ixp4xx-expansion-peripheral-props.yaml | 80 +++++++++++++++++++
> 
> Kind of odd to have these in 2 directories. Can we move 
> intel,ixp4xx-expansion-bus-controller.yaml to 
> bindings/memory-controllers/?

Indeed mostly we kept them so far in memory-controllers. Some of these
buses are used for attaching some type of memory, but I don't know if
ixp4xx can work like this.

> 
> Or maybe all the external/parallel bus interfaces need their own 
> directory?

Except the IXP4xx, I wouldn't know which one goes where... Example is
exynos-srom which can work with memory (SRAM, ROM, flash) or devices.

I'll move it to memory-controllers.


> 
>>  .../mc-peripheral-props.yaml                  |  1 +
>>  3 files changed, 82 insertions(+), 63 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
>> index 5fb4e7bfa4da..a771796ec499 100644
>> --- a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
>> +++ b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
>> @@ -56,69 +56,7 @@ patternProperties:
>>      description: Devices attached to chip selects are represented as
>>        subnodes.
>>      type: object
>> -
>> -    properties:
>> -      intel,ixp4xx-eb-t1:
>> -        description: Address timing, extend address phase with n cycles.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        maximum: 3
>> -
>> -      intel,ixp4xx-eb-t2:
>> -        description: Setup chip select timing, extend setup phase with n cycles.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        maximum: 3
>> -
>> -      intel,ixp4xx-eb-t3:
>> -        description: Strobe timing, extend strobe phase with n cycles.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        maximum: 15
>> -
>> -      intel,ixp4xx-eb-t4:
>> -        description: Hold timing, extend hold phase with n cycles.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        maximum: 3
>> -
>> -      intel,ixp4xx-eb-t5:
>> -        description: Recovery timing, extend recovery phase with n cycles.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        maximum: 15
>> -
>> -      intel,ixp4xx-eb-cycle-type:
>> -        description: The type of cycles to use on the expansion bus for this
>> -          chip select. 0 = Intel cycles, 1 = Motorola cycles, 2 = HPI cycles.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        enum: [0, 1, 2]
>> -
>> -      intel,ixp4xx-eb-byte-access-on-halfword:
>> -        description: Allow byte read access on half word devices.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        enum: [0, 1]
>> -
>> -      intel,ixp4xx-eb-hpi-hrdy-pol-high:
>> -        description: Set HPI HRDY polarity to active high when using HPI.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        enum: [0, 1]
>> -
>> -      intel,ixp4xx-eb-mux-address-and-data:
>> -        description: Multiplex address and data on the data bus.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        enum: [0, 1]
>> -
>> -      intel,ixp4xx-eb-ahb-split-transfers:
>> -        description: Enable AHB split transfers.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        enum: [0, 1]
>> -
>> -      intel,ixp4xx-eb-write-enable:
>> -        description: Enable write cycles.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        enum: [0, 1]
>> -
>> -      intel,ixp4xx-eb-byte-access:
>> -        description: Expansion bus uses only 8 bits. The default is to use
>> -          16 bits.
>> -        $ref: /schemas/types.yaml#/definitions/uint32
>> -        enum: [0, 1]
>> +    $ref: /schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
>>  
>>  required:
>>    - compatible
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
>> new file mode 100644
>> index 000000000000..8f782c80e88b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
>> @@ -0,0 +1,80 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Peripheral properties for Intel IXP4xx Expansion Bus
>> +
>> +description: |
> 
> Don't need '|'.

Right.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
