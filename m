Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D53C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqY3eZHwtP7oo+aR6dnjwUXyST7ns2f+a4l+grEl1Oo=; b=ITL2gePlK58Vsp
	byk1zSjOdn6NT9Nz6rew4JMGVCAhZG9vrUNTY81sxpoJ37J0m6jAdMGvKZPesqqhDIed6yX7VpVKL
	KGOpIYMMAB0/Xo8vYxra5Hza9rWlPc6PBWz7fJpKSMTtPJE4Awb+QhPKsLsMuoyF287aaGjrgf8AQ
	uXhFc0wDbPOBV6/MwB/7ZJAeXkCRhXiQ4XfLaQG/TMCHZGoRKKBiqdZltiFRWRgbO/0K+3cOZNE2j
	0BqUJf8F9SFbB5vu7LLV9Zq2puMCZPZGVHIBhrm8exrPhxaeow0Z97Y7ZWQ40Lerl3iNc5n+Vmqp8
	xMW7vRl0utVobEK5GPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXj30-0023t8-BJ; Fri, 25 Mar 2022 12:28:06 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXj2x-0023ru-6P
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:28:04 +0000
Received: by mail-ej1-f42.google.com with SMTP id p15so15027965ejc.7
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2022 05:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PcH2id7e3RzV4DA+fDI2YdpFNqalBTclxR9S6QfqEqw=;
 b=YDm2EyoyqvVfTjKBgi0jC1gzC5/5LJpSGOtC9nsgO/85BkJMN636OtJmre1xZcX69N
 O+tznmkQwj60BuuVDD+hA+eOFYn8JWstNTnlvAuUbhe/fDp+uGAySbL+oENSgTcv+So/
 LNSA3YSOG9adRS0svyvN0+CoCWgd4cZRaKDzZkrGHU6znVJxeNX7T+1AhlYjEi6x2sBm
 7jkizc3WnZ+FP1Co0xEnAmndmK0igoYHpjMs4I0S46AZPOBut9mXu1DhX7h7K8+IpH7N
 CreSMh2hS/EpoZB4EluMBVlC8E9Cgcm4qP//WQR6ySorPoVTpbYw/cG9RfDxXjRlOdx6
 qs3Q==
X-Gm-Message-State: AOAM533Q6nwYHjuvu6dIircUS2TNpSMNF3oVnSQix7HRN81djgPmG95C
 AjH7ItsxNbh69WHb0ICk97E=
X-Google-Smtp-Source: ABdhPJwksDpAoMEkvuK3Mq+z+58lVXdP0JP6yQ5NAosjOqB4r6xZT/YCxttfSJIWseOiCQHQO0WKsA==
X-Received: by 2002:a17:906:3042:b0:6cd:20ed:7c5c with SMTP id
 d2-20020a170906304200b006cd20ed7c5cmr11122565ejd.241.1648211281236; 
 Fri, 25 Mar 2022 05:28:01 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm2845067edt.80.2022.03.25.05.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 05:28:00 -0700 (PDT)
Message-ID: <b328549b-fc0a-a5b6-586e-bf5e8d8513b6@kernel.org>
Date: Fri, 25 Mar 2022 13:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] dt-bindings: mtd: ti,elm: Add support for AM64 ELM
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220323111851.4699-1-rogerq@kernel.org>
 <20220323111851.4699-3-rogerq@kernel.org>
 <a222efb1-4f95-d65d-919b-ed55c5448c9a@kernel.org>
 <abcbe390-45a8-6183-56a8-f9f751e84f49@kernel.org>
 <597e4bfb-383d-0f3b-dce8-ffc12f543b46@kernel.org>
 <85022bd4-52fb-d15c-cc47-8d891ae3a968@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <85022bd4-52fb-d15c-cc47-8d891ae3a968@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_052803_277367_EC979451 
X-CRM114-Status: GOOD (  15.17  )
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

On 25/03/2022 13:13, Roger Quadros wrote:
> 
> 
> On 25/03/2022 14:08, Krzysztof Kozlowski wrote:
>> On 25/03/2022 13:05, Roger Quadros wrote:
>>>
>>>
>>> On 24/03/2022 20:26, Krzysztof Kozlowski wrote:
>>>> On 23/03/2022 12:18, Roger Quadros wrote:
>>>>> TI's AM64 SoC has the Error Locator Module. Add compatible and
>>>>> related properties to support ELM on AM64 SoC.
>>>>>
>>>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>>>> ---
>>>>>  .../devicetree/bindings/mtd/ti,elm.yaml       | 27 ++++++++++++++++++-
>>>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>>>> index 24ed0fb84204..bc01d35ce605 100644
>>>>> --- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>>>> @@ -17,7 +17,9 @@ description:
>>>>>  properties:
>>>>>    compatible:
>>>>>      items:
>>>>> -      - const: ti,am3352-elm
>>>>> +      - enum:
>>>>> +          - ti,am3352-elm
>>>>> +          - ti,am64-elm
>>>>>  
>>>>>    reg:
>>>>>      maxItems: 1
>>>>> @@ -25,6 +27,17 @@ properties:
>>>>>    interrupts:
>>>>>      maxItems: 1
>>>>>  
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +    description: Functional clock.
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: fck
>>>>> +
>>>>> +  power-domains:
>>>>> +    maxItems: 1
>>>>> +
>>>>>    ti,hwmods:
>>>>>      description:
>>>>>        Name of the HWMOD associated with ELM. This is for legacy
>>>>> @@ -37,6 +50,18 @@ required:
>>>>>    - reg
>>>>>    - interrupts
>>>>>  
>>>>> +allOf:
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: ti,am64-elm
>>>>> +    then:
>>>>> +      required:
>>>>> +        - clocks
>>>>> +        - clock-names
>>>>> +        - power-domains
>>>>
>>>> Are these new properties also valid for am3352?
>>>
>>> No they are not required for am3352-elm. Only required for K3 based platforms like AM64.
>>>
>>
>> I understand they are not required, but I asked if they are valid. IOW,
>> whether ELM in am3352 also is part of power domain and has clock input?
> 
> Yes it does have power and clock domains but they are handled a bit differently
> on AM335x platform. i.e. in the parent node

Then I guess it can stay like this. Otherwise (if there is no clock
input) "else:" with "clocks:false" would be expected.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
