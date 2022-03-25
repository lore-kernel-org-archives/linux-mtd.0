Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AA9C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2pDbiKghMbSgQIWlOk/tCU591RC/ZE6J3p2WNGjm/A=; b=GhSOU0xGVFmfzq
	UO/TuVCf/xokg7nZBYZPtRvY/xMNVb/sMjg1hPiK2DMrRzn0m6bVXBuwMxPyYndOAiu7faqHRxdvn
	pNxQJRoYGieUX7UDh4lSVHlgZl4IT7Mrt5QiM0zEA1QYbZL74cgzicCYsuMXWf5w+D7uII3F2E8ft
	i37E5sToIrohB7VEKVbrxawfCQwwig4V1lR59dzeVFC1KmOX9yT8y6Aa7e53ErJ6UX1YjOOihhbWR
	x5qtxXO4uo62Mw8RNGJkCs2e3eB++jaTx9xGBk/0U+ZPnuHs7cDEIYSqZIq+syO8PE3CBUfBUbN+B
	RSZVRVA5W6Y7ZJqt5orQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXioe-0020W4-RF; Fri, 25 Mar 2022 12:13:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXioa-0020Ug-FM
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:13:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 013516191D;
 Fri, 25 Mar 2022 12:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24922C340E9;
 Fri, 25 Mar 2022 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648210391;
 bh=Y/4il5PTv0k7vOpnOaFfNmWG5EFpXpTVGlg4uy6R8oM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=umEavdpR9nMKXOqjv3UBfB2vpGE9EKXBmhSPOxFTRwnXBOE0faELQkmG2eYQA8pw6
 9b0UC2kikZnkN7IWjzUcjrFw5cGwWGl3uVzoIKwIlCE1pHKoTpCP+InrS/Pt0EMiKj
 OD/6SujYAQJyeQIgrFCfrxrxUDmQ2BPjyTZ/3QkStNC6+fYNM9jHuBNE7yxsG63S99
 m/u21mCwN8VDIkZvG/yAGjR22CD7WCk9dLJGDLj1LpEEJPuYoMTgWwVKCMj3dTGGSl
 Uom3yIklhUtNaKMNAvlTkkSLTVu9bgvURvqfdgWPH1m+4T2Q2qllHWoXDzegUObvtj
 g8SZrcHBGhoow==
Message-ID: <85022bd4-52fb-d15c-cc47-8d891ae3a968@kernel.org>
Date: Fri, 25 Mar 2022 14:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] dt-bindings: mtd: ti,elm: Add support for AM64 ELM
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220323111851.4699-1-rogerq@kernel.org>
 <20220323111851.4699-3-rogerq@kernel.org>
 <a222efb1-4f95-d65d-919b-ed55c5448c9a@kernel.org>
 <abcbe390-45a8-6183-56a8-f9f751e84f49@kernel.org>
 <597e4bfb-383d-0f3b-dce8-ffc12f543b46@kernel.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <597e4bfb-383d-0f3b-dce8-ffc12f543b46@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_051312_677264_0769A49E 
X-CRM114-Status: GOOD (  16.31  )
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



On 25/03/2022 14:08, Krzysztof Kozlowski wrote:
> On 25/03/2022 13:05, Roger Quadros wrote:
>>
>>
>> On 24/03/2022 20:26, Krzysztof Kozlowski wrote:
>>> On 23/03/2022 12:18, Roger Quadros wrote:
>>>> TI's AM64 SoC has the Error Locator Module. Add compatible and
>>>> related properties to support ELM on AM64 SoC.
>>>>
>>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>>> ---
>>>>  .../devicetree/bindings/mtd/ti,elm.yaml       | 27 ++++++++++++++++++-
>>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>>> index 24ed0fb84204..bc01d35ce605 100644
>>>> --- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>>> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>>>> @@ -17,7 +17,9 @@ description:
>>>>  properties:
>>>>    compatible:
>>>>      items:
>>>> -      - const: ti,am3352-elm
>>>> +      - enum:
>>>> +          - ti,am3352-elm
>>>> +          - ti,am64-elm
>>>>  
>>>>    reg:
>>>>      maxItems: 1
>>>> @@ -25,6 +27,17 @@ properties:
>>>>    interrupts:
>>>>      maxItems: 1
>>>>  
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description: Functional clock.
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: fck
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>>    ti,hwmods:
>>>>      description:
>>>>        Name of the HWMOD associated with ELM. This is for legacy
>>>> @@ -37,6 +50,18 @@ required:
>>>>    - reg
>>>>    - interrupts
>>>>  
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: ti,am64-elm
>>>> +    then:
>>>> +      required:
>>>> +        - clocks
>>>> +        - clock-names
>>>> +        - power-domains
>>>
>>> Are these new properties also valid for am3352?
>>
>> No they are not required for am3352-elm. Only required for K3 based platforms like AM64.
>>
> 
> I understand they are not required, but I asked if they are valid. IOW,
> whether ELM in am3352 also is part of power domain and has clock input?

Yes it does have power and clock domains but they are handled a bit differently
on AM335x platform. i.e. in the parent node

e.g.

               target-module@80000 {                   /* 0x48080000, ap 38 18.0 */
                        compatible = "ti,sysc-omap2", "ti,sysc";
                        reg = <0x80000 0x4>,
                              <0x80010 0x4>,
                              <0x80014 0x4>;
                        reg-names = "rev", "sysc", "syss";
                        ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
                                         SYSC_OMAP2_SOFTRESET |
                                         SYSC_OMAP2_AUTOIDLE)>;
                        ti,sysc-sidle = <SYSC_IDLE_FORCE>,
                                        <SYSC_IDLE_NO>,
                                        <SYSC_IDLE_SMART>;
                        ti,syss-mask = <1>;
                        /* Domains (P, C): per_pwrdm, l4ls_clkdm */
                        clocks = <&l4ls_clkctrl AM3_L4LS_ELM_CLKCTRL 0>;
                        clock-names = "fck";
                        #address-cells = <1>;
                        #size-cells = <1>;
                        ranges = <0x0 0x80000 0x10000>;

                        elm: elm@0 {
                                compatible = "ti,am3352-elm";
                                reg = <0x0 0x2000>;
                                interrupts = <4>;
                                status = "disabled";
                        };
                };

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
