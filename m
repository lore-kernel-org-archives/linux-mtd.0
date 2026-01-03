Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8030CFC6160
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jan 2026 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owa2Cwcft5LOJt0qrNQdwapaoe7f3XFMtroaxpUwtck=; b=Y/6GSPJdQJEVXl
	9iVhHeEBX8DxOO4g4i75Y8c5qaeJXL42k59sf9d/8yxGMXSkGYHl01ismcOfKx/PemoWIaKlaKEZM
	C48MM8kV4vAcwL0BvhHz/rx3aJJT4MdouXAzgcRQk4RkAuG/v7KGf27PNkPKZlDmSY7ERggnFZuJD
	N9SiMwsxMtqDRFoVYfX4cCKVXPqN6pJ5PDYPAbhCumeNYWWO5iNTXHiZKFoLcTVfHSfGvFAaTA3Mf
	60eF0yNDjSChWQYox/NT4hD5yRhBdKE247xbWityXjiSZ8PjueF5D7K8ZbSUwzKKBEeYBBLRO20Qe
	PyyW0BDGZRAhfUjtIlwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbtax-00000008yZH-3Jsv;
	Sat, 03 Jan 2026 04:50:31 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbtas-00000008yYm-1wdD
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jan 2026 04:50:30 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo14008047b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 20:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767415825; x=1768020625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsHYW0GcvEr1wxZPwcWK3GbPG5TTUN++8f/TrGKFv8c=;
        b=X84gtQjPx0/9W8rCygnAvI6/1omdBunr40td+n2+O9BsFWdctTXSw9jxO5okr3SyR9
         jUEz42ngQxiSCNHTKrw8wZkPcEtXy5YNbErP0JCk132LaK3oBRuvN2Zx++dnat5CEpi/
         nfZhqIR5gimntE4Gb58Y2ARFIrej/Nsri17qwfJI95CK0vYEBnKDi+q7WdNP+wrLU0fX
         gvpO05UTJ7PZscqAPuwSB0hnKXTyMi4XT9pXHO8FC3+9jREKNmKyHqSUsMtNYyEVsU3v
         EjXYOOXgcLepJqiW1+z24mMVz60nQvTflexDBvyVH1N0dwxA+azT9sxQ2TDG4QF+Wpdi
         wRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767415825; x=1768020625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsHYW0GcvEr1wxZPwcWK3GbPG5TTUN++8f/TrGKFv8c=;
        b=nF7fr/d6K93SxjwFKQllgQWyI57wV99PcknIXKG53pKmpum8DGiIoJitMTybLSwzQH
         4s4FR7Qy0eEfafxnIP5D1zIYeczvu4vDIx8g5SL99u9jcFkLDQvgixxa7a0Bn76GYQTp
         q2UzOQ2LKod4vyxOSoMx9SFuXn29CgbBJ/1JLV7p+JjSapcr1+8YL8tQHVnjLnf4RbH/
         sCSSV4YWYXUUTeLXKItXskNCAy9UK9ktzHqrCxKVBpjPBkmkFNh2R7fmnQbzW8dQr/bj
         Tm3f47boXZfr4jatK6PtoSkHvv2b6BpuFKNuxs2MRdTYfNTyTDAynOKDfGgQ3eAAEnWW
         r+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjK4dgtOnjESotbrXa0GthhTJOcN0LOW5eXRdeIywD5BaouagCvijA7xMgOg4oLkDvL+/BKUBSpq4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4A5plV+OJuPghDtPYy/xbWjYrr+0gEq+qY+qCWwh+cfWTgY0i
	7dLbKQMKjc74sfVdYeuwEiW6yluZUNYrpg8Jaaw8gIsVj5s1R7goXArv
X-Gm-Gg: AY/fxX6vyqIBiPbKQBTlKlnp1fzyHsNKQ18l5kekO75hr5r6IwB0Xjz13ITDx9KQ/hL
	Mkf37N0UD7XW9egE4BMUQDwR1DZsfDlfrjM7AQFbIVW/LGbfKRkwG9TrHQ64A5KlXiqE+RZSbpO
	UnnwVhDPf4G4xQq38N4DceiXHNKGiq7KSFfAeJGpJgr4R3q26FeOv090yTsSxzuZcc8IIM2LH1j
	yxS6ITIfG3HevFpbrWgiFUehq1AsrMDH0SlBWKg5nAbeNzXR9FJ/oCW5btyQO6SFhAjI1tuuJ4R
	QkDvIn9rwx1Lcpx3+54t6YKSc+p1dpKbKOeMhEMa0/U13rfWJEYEU1tAShIBOTT3FAW7BGef2zi
	ccCK6U7D/kHIfjKT4vdW9cUZ1VqK///Pcs0qKQUZUPcNLbCj79NSELTbDDJnQBg91eS5DCUp/vt
	G++HCqjjEPdaQoddHzdDMNjfNfJbuTH/b9YjQ=
X-Google-Smtp-Source: AGHT+IF90F2fmF2eDjyjEfoyNC/ZcIHn8WEhhBEdVO3NdOHkunZm7QOXXUBNNdZq4w6luowRDJ47oA==
X-Received: by 2002:a05:6a20:9389:b0:371:5a31:e477 with SMTP id adf61e73a8af0-376a8eb7dfamr41941867637.25.1767415825019;
        Fri, 02 Jan 2026 20:50:25 -0800 (PST)
Received: from [192.168.1.4] ([122.181.60.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b40sm36952261a12.23.2026.01.02.20.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 20:50:24 -0800 (PST)
Message-ID: <180afaec-c9fb-4845-a1b9-6adc7b9c7434@gmail.com>
Date: Sat, 3 Jan 2026 10:20:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
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
References: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>
 <20260102155837.GA3840725-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260102155837.GA3840725-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_205026_544748_7DB0739E 
X-CRM114-Status: GOOD (  19.22  )
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



On 02-01-2026 21:28, Rob Herring wrote:
> On Wed, Dec 31, 2025 at 09:29:32AM +0000, Charan Pedumuru wrote:
>> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
>> Changes during Conversion:
>> - Define new properties `power-domains` and `operating-points-v2`
>>   because the existing in tree DTS uses them.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>> Changes in v3:
>> - Removed pattern properties for partition.
>> - Used single quotes for nand string in pattern properties.
>> - Modified maxItems value and added minItems to reg property under nand child node.
>> - Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com
>>
>> Changes in v2:
>> - Edited the commit description to match the updated changes.
>> - Modified the description for the YAML.
>> - Removed all the duplicated properties, defined a proper ref for both parent
>>   and child nodes.
>> - Removed unnecessary properties from the required following the old
>>   text binding.
>> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
>> ---
>>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 103 +++++++++++++++++++++
>>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
>>  2 files changed, 103 insertions(+), 64 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> new file mode 100644
>> index 000000000000..632cfd7dc5e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> @@ -0,0 +1,103 @@
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
>> +patternProperties:
>> +  '^nand@':
>> +    type: object
>> +    description: Individual NAND chip connected to the NAND controller
>> +    $ref: raw-nand-chip.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        minItems: 1
>> +        maxItems: 5
> 
> Sigh. I gave you the exact schema to use. How is 5 address ENTRIES 
> valid? Again:
> 
> reg:
>   maximum: 5

Okay, I thought it's an invalid syntax as I never used it to represent reg property before, I will fix it in the next revision. Thanks.

> 
> Rob

-- 
Best Regards,
Charan.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
