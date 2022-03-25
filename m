Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0BFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg1BtDfJfFukiv1RxVsaZxJL2N0M/wTzWF61Dw2nKqc=; b=v87cIvgDn2dzc5
	IGDOXGhVBGY2TnVi+4q2yzT0pTM9BSzA6OTRr73D4LzHWtnnZ7XjOjfYnYrjsi4LK+QOa0wdIbfTP
	3OQJl9EEQtA6i+iEc+PCsmnk2PNIc3dvdyYlmn7nbm26XIMr8ZBEQJ6IbB7/y/WntwUNjDAV/irL8
	NTHudURBCpP5Nuk3Vx4d7nkuewR79gTH/wvtZQr9LHPsh2r2qkCojIlo8BE1nNM9j8nNmsHxLcPJl
	uSktv3z3OBzjz01qePEAGVcWypErJuW+gEBMgR1IY1RIWZT+xeD4xwCU9OvmNFR5vWmAhW7S3yd0r
	S+CGNpvpkWSmnmPBKH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXijj-001z5l-81; Fri, 25 Mar 2022 12:08:11 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXijf-001z4Q-Qq
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:08:09 +0000
Received: by mail-ed1-f54.google.com with SMTP id k10so9008988edj.2
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2022 05:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b6iLhHro7kUOfY74FDg49eYd66M0VSueSP9JBgp7E0o=;
 b=d6fir2sejx5cPtBR/3g8U4oT9sITCKqcF7XpeMVl9Wg8QEL5HJaNGpSqg3gtBcBIOA
 nNC0XWcNlwl9okdwZgdDuMi0o38cOreHK/lKq4YP5JMpfVfq0JQEwikqAmn65Q2OeQni
 LLU6zOio7tRM8mADIQVq/JRa417X335HZhD3Z/42QfsYWVh98w8N7nkr9mAfZeoxKL9R
 rHxwWJx5guOavg9ilJfkJIC+/x+hxkCLD5N2P/D4WRpYLUb6IvG5983FkQSBNA19Lwpy
 PkcmAmaKoyRh4zppXXJGgGJDDqJlz6+x7EfHkB08+2fquAMYniT0Il1hu5XE2CazvXIr
 faQg==
X-Gm-Message-State: AOAM533UJ7bL3A0k/qK/7y4VoDDkpADyoMgMNVdQtXPkWvBLUy8vp9m6
 hpQnS+EifVx74adHe6xLDi4=
X-Google-Smtp-Source: ABdhPJwKOAzzNPCen4oyPlN4ID736q0SuL/B1Zy1q8K8/75AKeWUd3gS6TR2tal50ctRSPp/hCPxEg==
X-Received: by 2002:a05:6402:2707:b0:419:5b7d:fd21 with SMTP id
 y7-20020a056402270700b004195b7dfd21mr12872378edd.51.1648210085836; 
 Fri, 25 Mar 2022 05:08:05 -0700 (PDT)
Received: from [192.168.0.159] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm2239691ejd.133.2022.03.25.05.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 05:08:05 -0700 (PDT)
Message-ID: <597e4bfb-383d-0f3b-dce8-ffc12f543b46@kernel.org>
Date: Fri, 25 Mar 2022 13:08:04 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <abcbe390-45a8-6183-56a8-f9f751e84f49@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_050807_916697_CF7CCF99 
X-CRM114-Status: GOOD (  13.90  )
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

On 25/03/2022 13:05, Roger Quadros wrote:
> 
> 
> On 24/03/2022 20:26, Krzysztof Kozlowski wrote:
>> On 23/03/2022 12:18, Roger Quadros wrote:
>>> TI's AM64 SoC has the Error Locator Module. Add compatible and
>>> related properties to support ELM on AM64 SoC.
>>>
>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>> ---
>>>  .../devicetree/bindings/mtd/ti,elm.yaml       | 27 ++++++++++++++++++-
>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>> index 24ed0fb84204..bc01d35ce605 100644
>>> --- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>> @@ -17,7 +17,9 @@ description:
>>>  properties:
>>>    compatible:
>>>      items:
>>> -      - const: ti,am3352-elm
>>> +      - enum:
>>> +          - ti,am3352-elm
>>> +          - ti,am64-elm
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -25,6 +27,17 @@ properties:
>>>    interrupts:
>>>      maxItems: 1
>>>  
>>> +  clocks:
>>> +    maxItems: 1
>>> +    description: Functional clock.
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: fck
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>>    ti,hwmods:
>>>      description:
>>>        Name of the HWMOD associated with ELM. This is for legacy
>>> @@ -37,6 +50,18 @@ required:
>>>    - reg
>>>    - interrupts
>>>  
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: ti,am64-elm
>>> +    then:
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>> +        - power-domains
>>
>> Are these new properties also valid for am3352?
> 
> No they are not required for am3352-elm. Only required for K3 based platforms like AM64.
> 

I understand they are not required, but I asked if they are valid. IOW,
whether ELM in am3352 also is part of power domain and has clock input?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
