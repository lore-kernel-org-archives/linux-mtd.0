Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D3EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odTI/TNOmTNQaNfP6VzzX5IvRKAaNdoTocvScboQkZA=; b=sO+Mp/UjdgpT4z
	i1AW4gh/TZw8W4Zlo7M8YCGLfsSd7vXnlyWeMO97P+2RMz0U5ewuXO0+nRXNjF6EFT8HK8/W7vByB
	0tfdElRVMk5qQbkTIcGaefBrl9OHlEt6gWoc0EIH2lxm8+Thpzt03+vKOM5tdAAcP9mJ2u5VZ1aOj
	y1FjTpN/KkOgYF4MUYx0tw4vvdkrs9p2BTzLkIEPR/P4kJ/tGPQCp2Bd91nHZkXAkqJMztIqPAu3Y
	zkTVho38VbXxkFKxmvM6WuGYmsCyi61Bcb8Zw0TdDnAj18mdF46nO8xvHR/08hDxeMzJIicfh9iGF
	tDD4Te/GyLlpqDtjA2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXihX-001yQv-I3; Fri, 25 Mar 2022 12:05:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXihS-001yP9-Tl
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:05:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 689A5618F3;
 Fri, 25 Mar 2022 12:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902E7C340E9;
 Fri, 25 Mar 2022 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648209949;
 bh=8biOsG1UjYHozi8trXJdFkrk1DRVUtsbnVzo/j5Fz10=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KYIuJRJzKiofL6B2kt+ucSk6KAxvgbwPsyrAQGM/NEZFbjXmtVRIp0/qf/bvdo1qU
 B8BNDUWZrVVCFIQ0/PYORpx2UiLpHGnnu2mX+snvw+gP5Vuyg17ubiP79Mx5ejXpmp
 Ha3TZrbp7gqoXO1K1fxMqJGhmdjfEWYFfeDsQ17kFZAejdITSVhDezagbiM0fYz1lG
 jQLNar8ZrW2j70mu7nZFjN6ZM6wilmS5ujwQbMx6BlesyXc07vRNlZn1tDc8kdS339
 mx2AfOJrzrtjmKOxXZJjGzG/TMi3FXoH7aCKQRPnPaFEwMoXbCbDA/d9fGRG+UkFUd
 sfD+p35QEKSuA==
Message-ID: <abcbe390-45a8-6183-56a8-f9f751e84f49@kernel.org>
Date: Fri, 25 Mar 2022 14:05:45 +0200
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
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <a222efb1-4f95-d65d-919b-ed55c5448c9a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_050551_035988_2F030511 
X-CRM114-Status: GOOD (  15.28  )
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



On 24/03/2022 20:26, Krzysztof Kozlowski wrote:
> On 23/03/2022 12:18, Roger Quadros wrote:
>> TI's AM64 SoC has the Error Locator Module. Add compatible and
>> related properties to support ELM on AM64 SoC.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../devicetree/bindings/mtd/ti,elm.yaml       | 27 ++++++++++++++++++-
>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>> index 24ed0fb84204..bc01d35ce605 100644
>> --- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
>> @@ -17,7 +17,9 @@ description:
>>  properties:
>>    compatible:
>>      items:
>> -      - const: ti,am3352-elm
>> +      - enum:
>> +          - ti,am3352-elm
>> +          - ti,am64-elm
>>  
>>    reg:
>>      maxItems: 1
>> @@ -25,6 +27,17 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  clocks:
>> +    maxItems: 1
>> +    description: Functional clock.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: fck
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>>    ti,hwmods:
>>      description:
>>        Name of the HWMOD associated with ELM. This is for legacy
>> @@ -37,6 +50,18 @@ required:
>>    - reg
>>    - interrupts
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,am64-elm
>> +    then:
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - power-domains
> 
> Are these new properties also valid for am3352?

No they are not required for am3352-elm. Only required for K3 based platforms like AM64.

> 
>> +
>>  additionalProperties: false
>>  
>>  examples:
> 
> 
> Best regards,
> Krzysztof

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
