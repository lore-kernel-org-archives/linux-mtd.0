Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A66DC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 06:16:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8575E64F7A
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 06:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8575E64F7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wkdqBKz7eRJbreD1bdDQj7GSSEVM1/wg5Jofs6GU5qM=; b=b/UIM48j66U5sksHKfkD37sZA
	j6LGJkLYbdGBHGE5UAtYke1DmKjb2zxn/Adpd03YekJSPjDoPvHwiJON+sQl0cUZfNISL6A1Nr6sP
	4nCyPy20FJQ5aX5OWRt0W6LBl39lhJrNDnCJVkI8HBVlzNaamTNNstn9dSo0m+iD1aUDKRcoiLgWW
	gRaQg5XjwA2q9s1p5K0lkgvU1rajm6VG/f87n5SNac6icJ98d9R0sPwp24ao8v7itWOU3ovKwe3LS
	tui45hTw8SWU60fSnHksRpmeCUxhp6bdAhYEryBfDeWF3qQpO0Mw9f+Tu3ExyWlBYUEvPA7I9B0tf
	34Utpdxtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKb5F-00Agd0-Fl; Fri, 12 Mar 2021 06:15:37 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKb57-00AgcI-O7
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 06:15:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id v2so30864945lft.9
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 22:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EZVWmwhX2pG+tDiCjTNSv6TN+QB8CeRqfB+asPGPHpI=;
 b=FS1kweP/WxtwR2yRIB6sIRz98PuNHYJzq8betUFzi2IJhZLgiA34Vc3I19Pl2xlSR0
 NRglMIRmu9r1XIZ1httHY881Lz63AvFB43yBaC6P3f9lrNUozSD6AZw7s00fAnkIQL5g
 ZKzYJf2oQF5JRDk60Seoovgp8YLkyiMo7ty/5mc+bNZrfjwTFQdKL5iwKNz7aZPf56Ht
 Fdz8XTwNcGT1p263hmPR7yy/oZVyRGJZ4hKxsDFE3FbT/Pfhv8Ak7hZRq84x8q1nPMjT
 2L+hz5EeQ0gxGKosRrYAkb4PcKFn5VqjHPSvqSFze0aRZoGo6GaDgxaHXoRupDOY71fh
 pm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EZVWmwhX2pG+tDiCjTNSv6TN+QB8CeRqfB+asPGPHpI=;
 b=bzEz51U3uHzAE7Y0IAD6UQkcOlQ8b0JVLJZV/3FA13dwcsEHQyrXe23N92LfhDqjVA
 6n/eoUpJ0G6QXRfg7mpk8RotznsoDHu6qrhhjM4LPmn27fuUIt7AoYDZe5inusN2hnu5
 PMETH/X/ZF9cWYGgTy/yIB6EgQy61hLtl2G7LyEJzRrBhWbK7sNdHO7H/MgzmPEPk762
 IgGs0PcJ52YzTz2jchqv8KzSjcE4fx0xOgXYtdmaol7KtvTYIxzAaiBivZRSELElZH4q
 SzVvzWPL6S42e++AqmGfMOfIFedcDQ+ZTignIk0iLLEmw0DvVi15tkAiQsIq3nLqzOfm
 H8DQ==
X-Gm-Message-State: AOAM530bf9w77+al8BjNogX1/C11SmcNfUiqWH1VL2uVQVBvQqCsFQtJ
 /Uj/a0zRP30llON/TI02b18=
X-Google-Smtp-Source: ABdhPJyLShGezzluEkyC5PoAcMfkzzEGVbIGxtXQ8xZ079G3DlAHzbk5sjy6bmxfbR7MVeaOUjkTUQ==
X-Received: by 2002:a19:c217:: with SMTP id l23mr4401836lfc.506.1615529724892; 
 Thu, 11 Mar 2021 22:15:24 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id m24sm1545384lfq.184.2021.03.11.22.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:15:24 -0800 (PST)
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210311051309.16789-1-ansuelsmth@gmail.com>
 <20210311051309.16789-2-ansuelsmth@gmail.com>
 <20210311173221.GB866234@robh.at.kernel.org>
 <YEn18b9m5mHX8eO7@Ansuel-xps.localdomain>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <734a5493-5d79-1b51-1f17-ad9f35cc50ca@gmail.com>
Date: Fri, 12 Mar 2021 07:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YEn18b9m5mHX8eO7@Ansuel-xps.localdomain>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_061529_953803_72F5555C 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11.03.2021 11:50, Ansuel Smith wrote:
> On Thu, Mar 11, 2021 at 10:32:21AM -0700, Rob Herring wrote:
>> On Thu, Mar 11, 2021 at 06:12:48AM +0100, Ansuel Smith wrote:
>>> Document nvmem-cells compatible used to treat mtd partitions as a
>>> nvmem provider.
>>>
>>> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
>>> ---
>>>   .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
>>>   1 file changed, 99 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
>>> new file mode 100644
>>> index 000000000000..b53faf87d4e4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
>>> @@ -0,0 +1,99 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Nvmem cells
>>> +
>>> +description: |
>>> +  Any partition containing the compatible "nvmem-cells" will register as a
>>> +  nvmem provider.
>>> +  Each direct subnodes represents a nvmem cell following the nvmem binding.
>>> +  Nvmem binding to declare nvmem-cells can be found in:
>>> +  Documentation/devicetree/bindings/nvmem/nvmem.yaml
>>> +
>>> +maintainers:
>>> +  - Ansuel Smith <ansuelsmth@gmail.com>
>>> +
>>> +allOf:
>>> +  - $ref: "../../nvmem/nvmem.yaml#"
>>
>> I'd rather have the 'absolute' path:
>>
>> /schemas/nvmem/nvmem.yaml
>>
>> Otherwise,
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
> 
> Should I send a v7?

Yes, please, let's make it the right way :)


When sending V7 please:

1. Include above "Reviewed-by" in the "dt-bindings: mtd: Document use of nvmem-cells compatible"

2. Include my "Tested-by" in the "mtd: core: add nvmem-cells compatible to parse mtd as nvmem cells"
Reference:
[PATCH v2 2/3] mtd: core: add nvmem-partitions compatible to parse mtd as nvmem cells
https://patchwork.ozlabs.org/project/linux-mtd/patch/20210216212638.28382-3-ansuelsmth@gmail.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
