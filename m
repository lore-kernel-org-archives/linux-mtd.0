Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D465DD41D67
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Dec 2025 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQsJg5nxVM5fNwTaLLZYZqin7D8TDIyguREVsvwNK6E=; b=sYFVGEBJlxDiNY
	CcEVWb9YAtyv0d5P5G4rc4KX72P5TK4zWNTAZmkHZHmJKkGgyoF8farFmtF0uGFIB1uPLu7aqk+KV
	zDSx0mkasE+tTViZC1PfIM+ynSpAXMd09nCMRirqaWZL7ayim3ORVIBBVJZBInEGNMbrOGkkzEBau
	Z33lhO+dZlHOe1dz2g8KiS3GeT5zGIg6zXNJ4O4wDBBq+CPeMaaZrQrwa3RTs0CJxeX98rbcAYbc4
	lnZR7CUukMcykfHsEbjH0Dn5/Po5ojZB3/mPiXAqq3XGRHDCeH+apzyKi2AW2M45W/dSvNFYOI6jw
	j6ghq1oIK25DSL7FXd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjY7-0000000Gufz-1Zq6;
	Thu, 11 Dec 2025 16:29:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjXz-0000000GuTh-39FH
	for linux-mtd@bombadil.infradead.org;
	Thu, 11 Dec 2025 16:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=awr8DF0rOP11yNcKK692Kf3EHuJbOE7t15SvXNPQdiU=; b=PodVv1jzOOlkJFmwDrjooxAqtF
	Lu7xNHXgM3KOeQpNKD0LmmY7ijD/d4WT8OMtirfBEpQV7erR2HT0P4dGmObDlkDK2cTLwtcUlh7Hg
	K9AHw2uyW5Z6YygjFOHSSmqpBxgpADDaG6sYE6fsPM33oDWx7wKAtyzhgKCTNEoaP5mswjty34fFu
	l9vJpQsRMX2CIgezwKCrpfJgyNfM1N75paWxdTeCnNqFvaa0+oTe0gS+jtIiK1PUlyTrf3wSi2BSZ
	slOdq7p+wjofYfcQpbuHEjNSRV03U/+Tgch1aZxln0QY7vM71ci/C49G+I5fLcee5vBkXSyhiy1XF
	Wzpm8zGA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjXu-0000000ETjE-1jgt
	for linux-mtd@lists.infradead.org;
	Thu, 11 Dec 2025 16:29:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so331219b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 11 Dec 2025 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765470575; x=1766075375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awr8DF0rOP11yNcKK692Kf3EHuJbOE7t15SvXNPQdiU=;
        b=l+co5ChNct8JQi8DrhN3d+2vuXe4H4yVXg4FShroYrYk+Gx3U1HhhyiCBCi/Gl9e0R
         cmYn9REQ/0QasBdcteRxZEsVT69FSy13mSq2YW+1dlCDptGvIQGUgjaI/r/Z+XxFoT23
         sHibwkBfjGI7THk1tUtGTznVe54t7QjAOvw/GutYsnUO39Tjewyxr17XIudueaXIwEUJ
         ZX0aF+QgUpKgLvpF8ao73m/c+I2+Gvgm3v0JyLtrmQvS4SMXpCgFsuueTbau+copxc23
         bqKWd45i/RAljfnlXPJO6wkh2+f0YlqXJZjStVbbWFm2+STAKcO7lvxgs6vKKERrnxGa
         z4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765470575; x=1766075375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awr8DF0rOP11yNcKK692Kf3EHuJbOE7t15SvXNPQdiU=;
        b=nm+U9kpLtb21T0EpCu91V8Z7deWJ2W6xk9q/MRNprC/KM3w3tT1CF52ITfrzb9y79h
         cpIu5ahfkIwIWtkhV+hBgaLqkpmHilag92r+eBHiVaqRavlV2bxzNJZBlj/SHa7LUGrt
         aW8aGevyQrO0G+u1omV+e/webuw7UDFkyGCzSl5UPNf/mtP5brXpHjs6R/3pnMqSmJH3
         hlleS+IKNLYqBt0iEn4C45OwWh4UIrh74zCB6Y3NaIQa4dDP1w7OySgnxWfgzin80Aap
         TxyoKEfyU0uvELhXsNCZEcFF4Z7/dGrT4HWOmGpsA2+MKcQGW5kOcovAZIf4/m5nfbdf
         4NZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnHRwufw3b5y88nSk0+nkzh1d3NFOt+DiXPu8EqOOVko/hINm0+H5Nk8v7GNw5kZV4A6LIEJXP40g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfVkdoV89MFAReWfj4H0Z8OaX+uoEiNhm8sJ9Gg4m3HL2GJmpy
	KlSXrh8w0GjSfaTKESp17oi8Q3uQWIobmNsRnvZYSwJtqzgXMe+NLTLo
X-Gm-Gg: AY/fxX41nY+5AeaOgRy/RDOemLcmwGw/967Gn1uphroWKk6tla21bGY9o06p+EvU6e0
	4KG9WslZ/Frljjc91OuCkWPJVPIGoNGqw5wfeoNCF+yDCACrMCwqrSJJvHWiVTMcpI+8OM1KIG+
	8H6qx2XD9UEgxnn8XG5IZADfeOQZkVGTKAFry5evfviOs3fp2fbrnRrq4Ka9Fle9V2s0BCpnGPN
	jYG9PE1dxsc9wwt/0pR8TvhnILomqvCInXqCAjN7BIi7ex2dWHaD78dtyyUjP2uAGW/GwcZLlva
	gbgS7nV5HroDyAo0TVuTo2fcf5ryrtOjEYUm3soU7GLYQog62+M/TSnfssZ/Btx9yJCSqO3olv7
	RG0rJdE9dsergskRMYFDjf1d59DCLcZDcnkOHLz9LK9cNxQOIfjLagQodROBdJXrYFkDrJ4NvAk
	t8xSfaSt7/g+yPvsuuANuVGYj65ZEzMeS67ac=
X-Google-Smtp-Source: AGHT+IGm8+dgYyRDv3gJ1XDI1aFNCRMzHlfROQeOfZxqRqUrkSy07arPhVguaQ6k7761nOnWCZjbgg==
X-Received: by 2002:a05:6a00:a0a:b0:7b8:758c:7e86 with SMTP id d2e1a72fcca58-7f22e0a1307mr7024548b3a.15.1765470574904;
        Thu, 11 Dec 2025 08:29:34 -0800 (PST)
Received: from [192.168.1.5] ([115.99.253.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c54812c5sm2952433b3a.59.2025.12.11.08.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 08:29:34 -0800 (PST)
Message-ID: <62b62814-29a5-4809-969c-a258da8eb415@gmail.com>
Date: Thu, 11 Dec 2025 21:59:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-nvidia-nand-v1-1-7614e1428292@gmail.com>
 <20251104-prompt-rampant-cat-30fd9a@kuoka>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20251104-prompt-rampant-cat-30fd9a@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_162938_484323_AF62FB32 
X-CRM114-Status: GOOD (  21.59  )
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



On 04-11-2025 15:33, Krzysztof Kozlowski wrote:
> On Thu, Oct 30, 2025 at 06:47:25PM +0000, Charan Pedumuru wrote:
>> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
>> Changes during Conversion:
>> - Define new properties `power-domains` and `operating-points-v2`
>>   to resolve errors generated by `dtb_check`.
> 
> instead - because existing in-tree DTS uses them.
> 
>> - Add the `#address-cells` and `#size-cells` properties to the parent
>>   node to fix errors reported by `dt_check`, and include these properties
> 
> What is dt_check? Aren't you adding them because other schema requires
> them? Then say that (and which schema...).

Sure, I will modify accordingly.

> 
> 
>>   in the `required` section, as they are not mentioned in the text binding.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 157 +++++++++++++++++++++
>>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ---------
>>  2 files changed, 157 insertions(+), 64 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> new file mode 100644
>> index 000000000000..67b3c45566db
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> @@ -0,0 +1,157 @@
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
>> +description:
>> +  Device tree bindings for the NVIDIA Tegra NAND Flash Controller (NFC).
> 
> Drop sentencem completely redundant. Title already said that.

Okay.

> 
>> +  The controller supports a single NAND chip with specific properties.
> 
> What is/are "specific properties"? Can properties be unspecific?

I will modify the description.

> 
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
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^nand@[0-5]$":
> 
> Keep consistent quotes, either ' or "

Sure.

> 
>> +    type: object
>> +    description: Individual NAND chip connected to the NAND controller
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      nand-ecc-mode:
>> +        description:
>> +          Operation mode of the NAND ECC, currently only hardware
>> +          mode supported
>> +        const: hw
>> +
>> +      nand-ecc-algo:
>> +        description: Algorithm for NAND ECC when using hw ECC mode
>> +        enum:
>> +          - rs
>> +          - bch
>> +
>> +      nand-bus-width:
>> +        description: Width of the NAND flash bus in bits
>> +        enum: [8, 16]
>> +        default: 8
>> +
>> +      nand-on-flash-bbt:
>> +        description: Use an on-flash bad block table to track bad blocks
>> +        type: boolean
>> +
>> +      nand-ecc-maximize:
> 
> Why are you duplicating all these properties from nand schema?

Sure, I will make nand-chip as ref and remove duplicate properties.

> 
>> +        description:
>> +          Maximize ECC strength for the NAND chip, overriding
>> +          default strength selection
>> +        type: boolean
>> +
>> +      nand-ecc-strength:
>> +        description: Number of bits to correct per ECC step (512 bytes)
>> +        enum: [4, 6, 8, 14, 16]
>> +
>> +      nand-is-boot-medium:
>> +        description: Ensures ECC strengths are compatible with the boot ROM
>> +        type: boolean
>> +
>> +      wp-gpios:
>> +        description: GPIO specifier for the write protect pin
>> +        maxItems: 1
>> +
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 1
>> +
>> +    patternProperties:
>> +      "^partition@[0-9a-f]+$":
>> +        $ref: /schemas/mtd/mtd.yaml#
>> +        description:
>> +          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
>> +
>> +    required:
>> +      - reg
>> +
>> +    unevaluatedProperties: false
> 
> So this should tell you that you miss proper ref
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +
>> +unevaluatedProperties: false
> 
> Same here. Why do you use unevaluatedProperties if there is no ref?
> Please open other bindings to understand how MTD binding should be
> written.

I will add appropriate common nand-controller ref to the schema.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
