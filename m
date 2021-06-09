Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04597C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B245C613AE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B245C613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AHEwOt6iAz+MkWDMwk2IgB/lkNC0ps5UQUJtsNvNEtc=; b=FbHE7ff3zopeDuB1RlRvTjsAma
	0ALmJpgliOfKHqI7lXVk2zHpdy8EyLLk2sPDYtSWCkrGxru+rwVZUhh0X3e4tTEi9IIFYM3KUQ6oq
	Qs7TI98H/d9qCyLGNdflFmPmOQp7QmbOgge8nrgK6VUR1e3BO6pyldNfqraR5EO2eIBqhaWxZCr0Q
	7ua1m2k9t56QZuKSAe4Cae6yDpik0yZeC6VD0Kcbw3N2MKuMDbO+ySyYdYr4noh21DO+mDqHH3bgt
	OEI/Gl+1yMD+b9VHBARZmdp8SBLdHVuR3ow3F128TB7t3wNWfLSB/6AIy8qhrJlzrIoceSFrC2w1/
	UbycpCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqzBz-00EJPB-Fk; Wed, 09 Jun 2021 14:28:27 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyf1-00E8dJ-7O
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 13:54:25 +0000
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqyez-0001SE-IK
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 13:54:21 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 f186-20020a1c1fc30000b02901aaa08ad8f4so2566004wmf.8
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 06:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L3rkvmwfjekUneRXRJ0aT40FD356LXKwvvVxwz5Hwvk=;
 b=NrO15m8C0x94uUVd1PY41czh9OP4GRgNqaAA4gROilvyQq3uEUNdJQ6Cr6Nzx/ItKc
 57FA+TQeFOKUazTYSDakMQguPgnWBgyF7BQItNbzxmFVQb5j1VJ95K2umMgz9vOACBU3
 uVIuId1XYd1JLQEuRNuUH3EA5f1l8fTlV03FqvGRgTs7Oqn0QIfbuNoPrejeiTZTdgjA
 6vH2m/t/89Hbu9RAlAohiaR1kQfLIRlOG0ohlDYBtVB9mB08zTW0jg4Ngyin/YTJUZbU
 ESEwuj1UilgT0BPD95glap9dLo08Z74285zNVlOHj4mSc7FlDEA/UyVMTwlg0gt86iMb
 /SQw==
X-Gm-Message-State: AOAM531hO+ynNINWMP9XpEGE20EAi/iZVZEOJPu6TG2+oMpsCAZx1sC1
 YqMpVy7HqKvqD0VxVmRrf2uk4rKHzawayHa+Kx9qvFMx6d8mmd05DNbFyVf+2W7eAd67Ji7YB3B
 E3/RcvQKPpd/jHoPE2yvfcbwCOrg7FjLGjm3J4NxdZb8=
X-Received: by 2002:a5d:414e:: with SMTP id c14mr27402377wrq.81.1623246861234; 
 Wed, 09 Jun 2021 06:54:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlqcTaglLFNTCB9cqtEDwTG5hLmt3Tt8ieHLTfWxVwsWTke/amqvrV4zq/JlmWDecShdF3mQ==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr27402352wrq.81.1623246861068; 
 Wed, 09 Jun 2021 06:54:21 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id z19sm6151400wmf.31.2021.06.09.06.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:54:20 -0700 (PDT)
Subject: Re: [PATCH v22 09/18] dt-binding: memory: pl353-smc: Convert to yaml
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-10-miquel.raynal@bootlin.com>
 <e431d594-05cd-27b8-fcbe-11c310b99cd3@canonical.com>
 <20210609153410.53eadf8e@xps13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <77db74d3-c44a-6aa3-1b61-f6bed565fa04@canonical.com>
Date: Wed, 9 Jun 2021 15:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609153410.53eadf8e@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_065423_531699_472BE47C 
X-CRM114-Status: GOOD (  34.08  )
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

On 09/06/2021 15:34, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote on Wed, 9
> Jun 2021 14:12:40 +0200:
> 
>> On 09/06/2021 10:01, Miquel Raynal wrote:
>>> Convert this binding file to yaml schema.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  .../memory-controllers/arm,pl353-smc.yaml     | 133 ++++++++++++++++++
>>>  .../bindings/memory-controllers/pl353-smc.txt |  45 ------
>>>  2 files changed, 133 insertions(+), 45 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>>> new file mode 100644
>>> index 000000000000..1de6f87d4986
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>>> @@ -0,0 +1,133 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/memory-controllers/arm,pl353-smc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ARM PL353 Static Memory Controller (SMC) device-tree bindings
>>> +
>>> +maintainers:
>>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>>> +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
>>> +
>>> +description:
>>> +  The PL353 Static Memory Controller is a bus where you can connect two kinds
>>> +  of memory interfaces, which are NAND and memory mapped interfaces (such as
>>> +  SRAM or NOR).
>>> +
>>> +# We need a select here so we don't match all nodes with 'arm,primecell'
>>> +select:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        enum:
>>> +          - arm,pl353-smc-r2p1  
>>
>> That's a const... but also I don't get the need for select.
> 
> I think this is needed to ensure this binding is not enforced against
> arm,primecell compatible nodes which are not featuring the
> arm,pl353-smc-r2p1 compatible.

Which seems to be result of unusual compatible match, so once you
convert to regular match, this select is not needed.

> 
>>
>>> +  required:
>>> +    - compatible
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^memory-controller@[0-9a-f]+$"
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - arm,pl353-smc-r2p1
>>> +          - enum:
>>> +              - arm,primecell  
>>
>> This looks unusual. Basically you change the bindings, because before
>> they required "arm,pl353-smc-r2p1", "arm,primecell".
> 
> That is precisely what I try to match and I think it works. Perhaps
> this version is easier to extend when a new compatible comes in.
> However, I am fine using an alternative formula, like below if you
> think it's better:
> 
> compatible:
>   items:
>     - const: arm,pl353-smc-r2p1
>     - const: arm,primecell

That's the common, easiest and actually expected.

> 
>> Don't you want here items:
>>  - const: ...
>>  - const: ...
>> ?
>>
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: configuration registers for the host and sub-controllers  
>>
>> Just maxItems. Description is obvious.
> 
> I don't think it is that obvious because there are actually 4 areas
> and, because of the yaml language, we only describe one in the reg
> property while the others and defined in the ranges property, but
> that's fine by me, I'll drop the description and stick to a
> maxItems entry.

The explanation of all four areas could have sense, but now it states
the obvious - these are configuration registers :)

> 
>>
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: the clock for the memory device bus
>>> +      - description: the main clock of the controller  
>>
>> Isn't apb_pclk the bus clock (so second item below)?
> 
> The SMC has two clock domains referred as aclk and mclk. In the TRM,
> aclk is described as "Clock for the AXI domain". The AXI interface is
> used to trigger CMD/ADDR/DATA cycles on the memory bus. There is also
> an APB interface used to reach the SMC registers. I *think* that
> both APB and AXI domains are fed by the same apb_pclk source but I
> might be wrong. Hence memclk would just feed the memory bus that bonds
> the memory device (eg. the NAND flash) to the host controller.
> 
> This is my current understanding but if you think it works differently
> I'm all ears because this part is not 100% clear to me.

I was just wondering... your explanation is fine to me, thanks!


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
