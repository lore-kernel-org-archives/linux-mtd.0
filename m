Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2605106FD85
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 06:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNf8XCEGCp8z9ptSIgVV5ebGXHsn6Ase5vp0JbbSSyw=; b=uYYMxIiS8InpRU
	aPfBs7H/fOlLREJtZz4qOG+vsM75Zt2ZJFdYBwI2Y9bmDoB55VDxs1hjKZ7VKwIZkyey8vE/ctBgj
	45ntkGgLavEHfRV9R2gs+px4LlM94Ix5WTfbC1c6ld6V7GWe5nFf8Lx7A7VEQ8BgquFghqKFSfgwL
	ktZlGwye37vN1RGmnXxytfVAyL7WbBSzZeVTSHo7i5F2OO5iqQJ5DeUe3HpX4P3EBry1s4FRp84ff
	KJF4TmILgEnJ7ys4A5rfDyDsixsecRC7j3cpqw8YYEInOo5x+mneZqZIWtcNb/VyQe8k2grgFMfrf
	mdk0DUlBT7TSaoV9J8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vqh-0000000Gp2a-1PDP;
	Fri, 13 Mar 2026 06:18:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vqd-0000000Gp1E-22Jw
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 06:18:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so1155707b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2026 23:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773382690; x=1773987490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmh5HzaCjwFFl1hth5ZY2QU6iyHPHYjmE5iTWZ5JFAE=;
        b=WxY8L3jE7NpBNKgyYHvCaRwElqEnTrf/OFXVgdVVxjGGvFt0ogIMG/bEZpPx7Ntvtz
         RIbcwKiUPYnzmMtbRJjswk7siukuUAwGKFYEHLrfmqZ0CVQAd4ubJkWtgvlQcJSt+J4y
         0j3p3h5yibCh7kSMQFPo2OEqI1CTpGQBNcGTi9JhPbFst5koK8jzGfuOqwGCM6q1rWjE
         U5VXdn1bs1owV/p7W4tPcne53RZFVt7ocn24P9CcXRjF2j7Ii4rWkFMSCI3lThRSrYVe
         /mjGUEW4LL6/ZAJYGom9XvXjXW63WTrwKHMve4Kh3T+juTC0ynzhWW2SgcLH4/zxKkyp
         ox/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382690; x=1773987490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmh5HzaCjwFFl1hth5ZY2QU6iyHPHYjmE5iTWZ5JFAE=;
        b=tQZ3n1j8GHS2xQtWV2Uxu6OIcfl/vJ4IQ8g7bSiz21ajeMPWww9eyHV9oCYBofZS0C
         rmIhozUI91SBi0X2b2LV3FC0Cttc7GLmIfuVOI5qXRYtDXrOO71uiHI4Ea13RSMIjCAL
         +HnMDBK8IpsR61XMH4Yf2ZTW241RW5Q58qPf+FU/Lg5QtXVMcSQH9P+awRQ8GVcDnQXk
         TmpvE1ZHEF6dgeNGIflwO5UAphP6q+8Q5tiaBD0Bdu8dauMJlKIDyYHww7xLlZ9DSEGx
         WnmQKKY9n2s+JqaVMHf0sZEKI9MpWK3ec54mg9xBsKbgP1+hPfLuAg4USa8CW3V4eHK8
         nnFA==
X-Forwarded-Encrypted: i=1; AJvYcCWXbF9/ci4dvm1Udg5+ZzRi/+OjzscXfD9ACg3jUMSnKRfiQANMcqkqwWYtlFw+0aEzOG/YvVrA+gE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf6CAa8PuqT19xDQkhuglvE+2mlwR/U9+jr/PBBCZN6DX8zb3a
	xOr0OTrVlkaFHZ5vjtxoisNBmX3HPizM3HM/Jt9d/eK8nyg+JCF/dyg4
X-Gm-Gg: ATEYQzzM845/QtunBgUq4xgCwWWgBUsbwyhgVbbAM9fjPaeWQCrIhlezCJ1BDjb8Y5p
	xyBI7B32sCSOtQruiyktbHYogVvCFzQmsMcrYTaCcnpxMm32xhwMuHA0VRRcu6LppVbe2VlDqju
	4a0NyHLBOBMP/knBl9VoWJvxXOleA3FCGz1U0zHm6zw9wN16JbzPq61ixOS5uD4OC7boOhV0nVc
	Bct8dmQ9XXx0Ew8kUqB0Rk1LzJjY0S4JSB7WBprYAoQeLqC3YDQb1HaAkp4iWOA36mo3kzl3Ziv
	N3/4TAKoSB1MX54kFyIqjdvuTLSqROgF+Nq++Yq5EDGNwD3n7gqzJ5fnP7OVndKye3ZIx6i++Jp
	0iGGZ4iRMj4PLiLt56SQIVCIghDktBnstdclrAGf/VXoc3EGq2vCEPTd4RIZa6ACh91DCqMoBe6
	jYL41iClE3XRcQnjZH9vgShQuSBTDS688czl5+MQyUWTM7PglfNpeHwQufF6bP9cemNs1SCyzX3
	tuBSJaHFA1oqbFeh/k=
X-Received: by 2002:a05:6a21:618e:b0:398:8dbb:d2b with SMTP id adf61e73a8af0-398ecdd56bamr1753374637.58.1773382690097;
        Thu, 12 Mar 2026 23:18:10 -0700 (PDT)
Received: from ?IPV6:2401:4900:892e:1f2a:440a:1550:d03:380c? ([2401:4900:892e:1f2a:440a:1550:d03:380c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb76f04sm915634a12.26.2026.03.12.23.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:18:09 -0700 (PDT)
Message-ID: <cf3adca8-adf1-4163-89a2-e00cafdc2973@gmail.com>
Date: Fri, 13 Mar 2026 11:48:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: hisilicon,504-nfc: convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260307-hisi504-1-v1-1-8bf9a186faf2@gmail.com>
 <20260312152851.GA3190071-robh@kernel.org>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260312152851.GA3190071-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_231811_555497_848D46A9 
X-CRM114-Status: GOOD (  18.86  )
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


On 12-03-2026 20:58, Rob Herring wrote:
> On Sat, Mar 07, 2026 at 04:43:56PM +0000, Akhila YS wrote:
>> Convert Hisilicon Hip04 Soc NAND controller DT binding to YAML format.
>>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>  .../devicetree/bindings/mtd/hisilicon,504-nfc.yaml | 90 ++++++++++++++++++++++
>>  1 file changed, 90 insertions(+)
> Convert implies the removal of the .txt binding. Where is that? Could be 
> missing? If so, say that.


Hi rob, yeah the removed .txt binding is not added in this commit, i
will add it and send that in a v2.

>> diff --git a/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml b/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml
>> new file mode 100644
>> index 000000000000..805ef0af0e04
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/hisilicon,504-nfc.yaml
>> @@ -0,0 +1,90 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/hisilicon,504-nfc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: HiSilicon Hip04 NAND Flash Controller
>> +
>> +maintainers:
>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>> +  - Richard Weinberger <richard@nod.at>
> This should be someone with the h/w. I would use the HiSilicon 
> maintainer from MAINTAINERS.


Okay, sure.

>
>> +
>> +description:
>> +  The HiSilicon 504 NFC is a NAND flash memory controller used in the
>> +  Hip04 SoC. It supports hardware ECC for NAND devices and provides
>> +  register and buffer regions for NAND operations.
>> +
>> +allOf:
>> +  - $ref: nand-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: hisilicon,504-nfc
>> +
>> +  reg:
>> +    minItems: 2
>> +    maxItems: 2
> Need to define what each entry is.


Okay.

>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  nand-bus-width:
>> +    enum: [8, 16]
>> +
>> +  nand-ecc-mode:
>> +    enum:
>> +      - none
>> +      - hw
>> +
>> +  nand-ecc-strength:
>> +    const: 16
>> +
>> +  nand-ecc-step-size:
>> +    const: 1024
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> These can be dropped as the child (partitions) doesn't have an address.


Okay.

>
>> +
>> +  partitions:
>> +    $ref: /schemas/mtd/partitions/fixed-partitions.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - nand-bus-width
>> +  - nand-ecc-mode
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    nand-controller@4020000 {
>> +        compatible = "hisilicon,504-nfc";
>> +        reg = <0x04020000 0x10000>, <0x05000000 0x1000>;
>> +        interrupts = <0 379 4>;
>> +        nand-bus-width = <8>;
>> +        nand-ecc-mode = "hw";
>> +        nand-ecc-strength = <16>;
>> +        nand-ecc-step-size = <1024>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        partitions {
>> +             compatible = "fixed-partitions";
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +
>> +             partition@0 {
>> +                 label = "nand_text";
>> +                 reg = <0x0 0x400000>;
>> +            };
>> +        };
>> +    };
>> +...
>>
>> ---
>> base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
>> change-id: 20260306-hisi504-1-d7aa09c70d93
>>
>> Best regards,
>> -- 
>> Akhila YS <akhilayalmati@gmail.com>
>>
-- 
Best Regards,
Akhila.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
