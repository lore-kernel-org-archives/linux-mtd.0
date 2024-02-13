Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F313BC48BC1
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcAlGfQRmahsClvEmEZYttNBz37vimcjNWQ7ha7b68Q=; b=MowRQpSnICsDNx
	94Z6qTrb7QxabRS81jNgyOsFHT2laDdH3z7Tf3DYioJME3n1pJ6ny3bcW7P2l2kLzcHkFKFXiXVXC
	mj0P0/1Idm5h25jurJlly2bQcIao1fBv6ypraYwKVP0LOo7cKZo9JLiYgAd4LEkEfKu/8QThL/Les
	RZBSONRioKkIdC3GHQgBhMe6G71rTBiAG7uPOXH6tu4sqfDK0Q3OEHiE8joCEgpAyf+JLASO58rci
	b4Z6WmYabtWGjZqGGUPMD02YU2/vZ4jOZVlRhELKbKLMBpFrAqpQZtulotbHdaAwtbVlN1n0rhzpH
	FIamrj7klzbV98ymkvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqUY-00000008v2X-314B;
	Tue, 13 Feb 2024 10:58:22 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqUT-00000008uyS-3qrP
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 10:58:19 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41D7H0KQ028796;
	Tue, 13 Feb 2024 11:58:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=gUYosoA8j7mHWQIdEE+8Wty/qpa9vCO8sbMml7llxww=; b=TC
	W9CGgc23PaS5vqcWF3914GI2mhrnsbymvEmGJ6lEpav3eaqQTGezBUWbhhrPlFzZ
	jv6fv0j1bP+9B83xB/UKOPXqQweTBb5UVeQhLhCo9TSHJRhb2/g9UwGBfHWiOGEk
	bOkp0V+HpzeTFjQ3ieoBQ1Q+UUYxoi7l658at/PXI5e2gxKKVYYqwTIW3N5t5F/T
	vKLNcUSmorwU8+prkFyvJXyJCuYgzxWdGA1fYMR+k8i6MEuH+/qxqVLtMd/8icPT
	1zrFXSU2wjvVON+zCpNOB3DSloVC9L4atO209G6QE10YJwyckGDhqnzdux+aVmmG
	2mwJWbepWQiHokL+BI0w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62jsafxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 11:58:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4004440047;
	Tue, 13 Feb 2024 11:58:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B42D22D199;
	Tue, 13 Feb 2024 11:57:20 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 11:57:19 +0100
Message-ID: <c57b8094-be08-4ae4-ba85-f48522e5d2a8@foss.st.com>
Date: Tue, 13 Feb 2024 11:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] dt-bindings: memory-controller: st,stm32: add
 'power-domains' property
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-3-christophe.kerello@foss.st.com>
 <20240212-chemicals-skinny-18eda1cfe781@spud>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240212-chemicals-skinny-18eda1cfe781@spud>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_05,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_025818_319118_61594C3D 
X-CRM114-Status: GOOD (  16.64  )
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



On 2/12/24 19:33, Conor Dooley wrote:
> On Mon, Feb 12, 2024 at 06:48:12PM +0100, Christophe Kerello wrote:
>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>
>> On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
>> Allow a single 'power-domains' entry for STM32 FMC2.
> 
> This should be squashed with patch 1, since they both modify the same
> file and this power-domain is part of the addition of mp25 support.

Hi Conor,

Ok, I will squash this patch with patch 1.

> 
> If the mp1 doesn't have power domains, shouldn't you constrain the
> property to mp25 only?
> 

As this property is optional, I do not see the need to constrain the
property to MP25 only, but if you think that it should be the case, I
will do it.

Regards,
Christophe Kerello.

> Cheers,
> Conor.
> >>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>>   .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml         | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> index 12e6afeceffd..84ac6f50a6fc 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> @@ -36,6 +36,9 @@ properties:
>>     resets:
>>       maxItems: 1
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     "#address-cells":
>>       const: 2
>>   
>> -- 
>> 2.25.1
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
