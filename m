Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E9CEE57E5
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Dec 2025 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjIRfY74tXZSkr39KtNKbqpSkovjgZ8eE0mBMj7pgUA=; b=ZiPzbjnULQT+fw
	XY1XwWf7flOlas+B/sKKgw7PrUTW84vPKa7RVykUk/BNovDf6dqowJHEmtJdgVJWZAwOmMbxA0h9r
	uxNI8urba0sHQADGVjPMdsNx4SjFP1v0FZd8DD41UYICAw5QFMy0qFyfGJCjuLBKOJzhas0BYJe78
	bZqiW1ewLeu6S4e7ygqwp5bh64bRRJU47WBFFLubrLDorPVcXVk0NiLRy/qo9jfpe7RDtnkT6ZTpz
	vTYBbb0opZeNAOD/GnE7VW/YJ4t28Q1uplhXZlc7SM9/2HREtcW6WdZYn9lHuf3C+CXbHbrN0CPUk
	Sth77lb5dfRUz9ixtY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varSv-00000005mtk-3G5t;
	Wed, 31 Dec 2025 08:21:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varSs-00000005mtJ-19se
	for linux-mtd@lists.infradead.org;
	Wed, 31 Dec 2025 08:21:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-29efd139227so140306345ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 31 Dec 2025 00:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767169313; x=1767774113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pM8EtERWnfRSuu67YWhPe5WAPfUUQdQHLM2qZyic10w=;
        b=WdtgwDGhpOAsWrjiQVdsYvQhnC7DD/uEuDU8EcldI7rXZCNceD1f6RfJq6yULiiKpA
         qMUoUbS4MvjiyyI0EISDHtThMSBNDDTDQdyW1WkuXqJShtLvgzTJcaYlHybLLo4S1j3r
         TLPJp6vUYu8vzy45Lda8/jbeFNXftveoIUvPnq+nlZdVCsDsSPu8/owwTzoMluwBce7P
         vgMY38uvxX3nnZBnfgzaqR1s7TH1AF7q6S1b8zPYvUnQz6AvwXwKLOBCJ21Fm1Oq+nWW
         xQ/JDimS5T98cmzrPjfNyzFjcro/1951HPEERS3N7SavookuZ5Yy8B2CkhfytdwaOPBL
         cegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767169313; x=1767774113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM8EtERWnfRSuu67YWhPe5WAPfUUQdQHLM2qZyic10w=;
        b=vpcBnxuhPAhgKp9Rv9VVibH1vFo+NhDofyZMocpLizCNmE+NDq864KEdgmQBtMpDwj
         9wV7LrKTNbS6UrQup23Y0nEbeWgwBVxRBcSsaTiQ9S9hS7ujKoeij3XYllYHnbhTYgbl
         HV86zeufv8DLw0IDScSJdCSCyMkVhNoBh1gNIAikSrkKEj/0HykmqJ7zGOXcnJtOM0dh
         h3/S+UQpzbWC+L12S3sP3WdPhpQ33bOUs1h39yY5emOamew207+k8t9W8z2J155FqtV5
         1DkckpCT3Owue9IrqDU+POfnqBjVjs4tN3clYV7j2zp6gb3xCflRkzrcTKdhEQSxFVeK
         lHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqC5xNcJD5MKAEzol/9iJpBVsOlPRer5ydXW43sJEF8A1sy9RSBXb8j/ZovGGIimTK+0iiYVQW8iY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPHp2V0e0NwPtXzSa87klhgTJYyxBsz47jLABmkz6Fk2MEDMTJ
	0voEDScob+w2iBtYESCKG4OgTdPaE+Uuhq7M/3XVGykLtD7YtdqiqPA0
X-Gm-Gg: AY/fxX5aKYxO7X5ZhnYcUNFBwOIPtWmOLaymZga9R+3E3xCHeHGRRE+jiSlUt2w+lUV
	w3ikenPByGiyL/q2ak03TIyDkVf1P4dL3dL+6oxNVRg9dObUX6fMqINl3/CCx9sz/1hJPmRqvqh
	Q/dkFIfYHCONAbBNdLRqwASAdq9X1azmT4rhMrp9u0qMcdsb/g2LYHXkIO8f9vifTGvlB0Pn+bz
	rfxhieuN8u9mTd0BNwYLjyU9jHnLU/P4nEjpIfXuE5i5WeDnMcM0hH04ar0sgBjY0faGkZRXfye
	DjWg/0GLS5k17RJK2pnrCIaOWE+4ZmJLb/AVtQ2ExEAQ/XSrcvZfiuo7jmbXTSV01v1nXimsbb+
	t8UdD83zVkav13UU35wMilJMOIaICrI3fV+gDPf/Mhrm53H8/EIqBbNOSy0nHxBLvP4QEfXTztp
	TM9EKdi9Ss/pp4loxe7VfXHaTAZZenDVvinWqzfA==
X-Google-Smtp-Source: AGHT+IGwWF/osE+HYmoH/fZSSrPCaaGpDZsI4LlTPJyRcz8V/TsbQniUgWS0cU9t4dihgXmLeP2mQQ==
X-Received: by 2002:a17:902:ce82:b0:2a0:f469:1f56 with SMTP id d9443c01a7336-2a2f272b393mr394966645ad.31.1767169312819;
        Wed, 31 Dec 2025 00:21:52 -0800 (PST)
Received: from [192.168.1.10] ([122.162.204.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018586sm30029763a12.15.2025.12.31.00.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 00:21:52 -0800 (PST)
Message-ID: <c711c06b-ff32-4606-8d98-9195f20de38a@gmail.com>
Date: Wed, 31 Dec 2025 13:51:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
 <20251230172313.GA505571-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20251230172313.GA505571-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_002154_351779_3DC8F5E5 
X-CRM114-Status: GOOD (  25.47  )
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



On 30-12-2025 22:53, Rob Herring wrote:
> On Mon, Dec 29, 2025 at 02:31:12PM +0000, Charan Pedumuru wrote:
>> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
>> Changes during Conversion:
>> - Define new properties `power-domains` and `operating-points-v2`
>>   because the existing in tree DTS uses them.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>> Changes in v2:
>> - Edited the commit description to match the updated changes.
>> - Modified the description for the YAML.
>> - Removed all the duplicated properties, defined a proper ref for both parent
>>   and child nodes.
>> - Removed unnecessary properties from the required following the old
>>   text binding.
>> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
>> ---
>>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 107 +++++++++++++++++++++
>>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ------------
>>  2 files changed, 107 insertions(+), 64 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> new file mode 100644
>> index 000000000000..f34eaad67e11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/nvidia,tegra20-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVIDIA Tegra NAND Flash Controller
>> +
>> +maintainers:
>> +  - Jonathan Hunter <jonathanh@nvidia.com>
>> +
>> +allOf:
>> +  - $ref: nand-controller.yaml
>> +
>> +description:
>> +  The NVIDIA NAND controller provides an interface between NVIDIA SoCs
>> +  and raw NAND flash devices. It supports standard NAND operations,
>> +  hardware-assisted ECC, OOB data access, and DMA transfers, and
>> +  integrates with the Linux MTD NAND subsystem for reliable flash management.
>> +
>> +properties:
>> +  compatible:
>> +    const: nvidia,tegra20-nand
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: nand
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: nand
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
> 
>> +patternProperties:
>> +  "^nand@[0-5]$":
> 
> '^nand@':
> 
> The unit-address restriction here doesn't restrict anything.
> 
> Single quotes are preferred over double quotes.

Sure, I will use single quotes.

> 
>> +    type: object
>> +    description: Individual NAND chip connected to the NAND controller
>> +    $ref: raw-nand-chip.yaml#
>> +
> 
> properties:
>   reg:
>     maximum: 5

Okay.

> 
>> +    patternProperties:
>> +      "^partition@[0-9a-f]+$":
>> +        description:
>> +          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
>> +        $ref: mtd.yaml#
> 
> Drop. All of this is handled by raw-nand-chip.yaml.
> 
>> +
>> +    required:
>> +      - reg
> 
> Drop. Already required by nand-chip.yaml.

Okay, I will remove the partition child node and required for nand node.

> 
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/tegra20-car.h>
>> +    #include <dt-bindings/gpio/tegra-gpio.h>
>> +
>> +    nand-controller@70008000 {
>> +        compatible = "nvidia,tegra20-nand";
>> +        reg = <0x70008000 0x100>;
>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
>> +        clock-names = "nand";
>> +        resets = <&tegra_car 13>;
>> +        reset-names = "nand";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        nand@0 {
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            nand-bus-width = <8>;
>> +            nand-on-flash-bbt;
>> +            nand-ecc-algo = "bch";
>> +            nand-ecc-strength = <8>;
>> +            wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
>> deleted file mode 100644
>> index 4a00ec2b2540..000000000000
>> --- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -NVIDIA Tegra NAND Flash controller
>> -
>> -Required properties:
>> -- compatible: Must be one of:
>> -  - "nvidia,tegra20-nand"
>> -- reg: MMIO address range
>> -- interrupts: interrupt output of the NFC controller
>> -- clocks: Must contain an entry for each entry in clock-names.
>> -  See ../clocks/clock-bindings.txt for details.
>> -- clock-names: Must include the following entries:
>> -  - nand
>> -- resets: Must contain an entry for each entry in reset-names.
>> -  See ../reset/reset.txt for details.
>> -- reset-names: Must include the following entries:
>> -  - nand
>> -
>> -Optional children nodes:
>> -Individual NAND chips are children of the NAND controller node. Currently
>> -only one NAND chip supported.
>> -
>> -Required children node properties:
>> -- reg: An integer ranging from 1 to 6 representing the CS line to use.
>> -
>> -Optional children node properties:
>> -- nand-ecc-mode: String, operation mode of the NAND ecc mode. Currently only
>> -		 "hw" is supported.
>> -- nand-ecc-algo: string, algorithm of NAND ECC.
>> -		 Supported values with "hw" ECC mode are: "rs", "bch".
>> -- nand-bus-width : See nand-controller.yaml
>> -- nand-on-flash-bbt: See nand-controller.yaml
>> -- nand-ecc-strength: integer representing the number of bits to correct
>> -		     per ECC step (always 512). Supported strength using HW ECC
>> -		     modes are:
>> -		     - RS: 4, 6, 8
>> -		     - BCH: 4, 8, 14, 16
>> -- nand-ecc-maximize: See nand-controller.yaml
>> -- nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
>> -		       are chosen.
>> -- wp-gpios: GPIO specifier for the write protect pin.
>> -
>> -Optional child node of NAND chip nodes:
>> -Partitions: see mtd.yaml
>> -
>> -  Example:
>> -	nand-controller@70008000 {
>> -		compatible = "nvidia,tegra20-nand";
>> -		reg = <0x70008000 0x100>;
>> -		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> -		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
>> -		clock-names = "nand";
>> -		resets = <&tegra_car 13>;
>> -		reset-names = "nand";
>> -
>> -		nand@0 {
>> -			reg = <0>;
>> -			#address-cells = <1>;
>> -			#size-cells = <1>;
>> -			nand-bus-width = <8>;
>> -			nand-on-flash-bbt;
>> -			nand-ecc-algo = "bch";
>> -			nand-ecc-strength = <8>;
>> -			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
>> -		};
>> -	};
>>
>> ---
>> base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
>> change-id: 20251011-nvidia-nand-024cc7ae8b0a
>>
>> Best regards,
>> -- 
>> Charan Pedumuru <charan.pedumuru@gmail.com>
>>

-- 
Best Regards,
Charan.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
