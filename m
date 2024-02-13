Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7780C4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKXRvJj5mA2d6CiRROiOtQl5Eg2wMLiOK95bgJ9dKEQ=; b=iLQCUB/GJXaBRk
	3/mvGzUCVQCyNFmq2wprFTTcjNU7XseAiLNhrTBW1DduUYnvjoZaVne0vfZzPEYLJ8cpv3lEoMc+8
	3+hipUcqmAXy/m+p1XtlTgxed9fGuJ2Az5hlS8/z7IIY3/hiiPsqrajjrHwuw7d6KqVVPq0Kpp5g2
	ALl4Al5QODNKQc45PHpnqHVjtr1kl2iz87reMD693tRE8DY+ZYoOIjGwJOXa3arbQeuuVNRvRvsJ2
	WAel7F9DHf7GfErEz1BsVgUQq8CEIwlpkMG81jWgiKMFt1pWcQ0K4ZS/oC3kCLYM+2yGW1Q6IiPAk
	J5cCaZ5z27a7PfW2nN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqUV-00000008v1T-3q5V;
	Tue, 13 Feb 2024 10:58:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqUT-00000008uxw-2exE
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 10:58:19 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41D93h83027449;
	Tue, 13 Feb 2024 11:58:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=MqVHf3uRw4/ojVWoHbhr1qq3qDu3EwZ3KJh63HDsAkU=; b=6Z
	PqJa+2AGymrJgQ8fCMvuFWqeUM7uxZIObcC2dPqmw83Oe16PRxMNol/NFikQJl/T
	Pj1LMkx0Ne0OCsY+fogCQN62ErJjf2F4Kjwyopu4X3WLPeYOkqMETaHsU+L9CZ2q
	x6QB0dVW4VmNFcra8cyIzSHrzYcNej2Bc5wLZOONyBpsJfS39fnuDWbiWwlO0HUF
	yXnQUbYSThWkvYnF1T1ajWnEC9gFUgFzV4tAaHgiLmBy9EcsBXvB39sqeGbTOJA8
	sJ1GxyO5l69DUudnfskvhZmYHZJb0DLZGkk/0YvNVVhRb8pGfcF4vOo92BGFIiC4
	cLPSj6AcygDje5LF7xPw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6mynfvk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 11:58:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0634C40047;
	Tue, 13 Feb 2024 11:57:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8704622AFEA;
	Tue, 13 Feb 2024 11:57:13 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 11:57:12 +0100
Message-ID: <d27fb238-ec05-4a6e-95e9-c236c0d4727f@foss.st.com>
Date: Tue, 13 Feb 2024 11:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] dt-bindings: memory-controller: st,stm32: add MP25
 support
To: Conor Dooley <conor@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-2-christophe.kerello@foss.st.com>
 <20240212-dial-strangle-0b6861b35ec9@spud>
Content-Language: en-US
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240212-dial-strangle-0b6861b35ec9@spud>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_05,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_025818_008001_2B0CA5FA 
X-CRM114-Status: GOOD (  15.64  )
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



On 2/12/24 19:30, Conor Dooley wrote:
> On Mon, Feb 12, 2024 at 06:48:11PM +0100, Christophe Kerello wrote:
>> Add a new compatible string to support MP25 SOC.
> 
> You're missing an explanation here as to why this mp25 is not compatible
> with the mp1.
> 
> Cheers,
> Conor.
> 

Hi Conor,

On MP1 SoC, RNB signal (NAND controller signal) and NWAIT signal (PSRAM
controler signal) have been integrated together in the SoC. That means
that the NAND controller and the PSRAM controller (if the signal is
used) can not be used at the same time. On MP25 SoC, the 2 signals can
be used outside the SoC, so there is no more restrictions.

MP1 SoC also embeds revision 1.1 of the FMC2 IP when MP25 SoC embeds 
revision 2.0 of the FMC2 IP.

I will add this explanation in the commit message.

Regards,
Christophe Kerello.

>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>>   .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> index 14f1833d37c9..12e6afeceffd 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
>> @@ -23,7 +23,9 @@ maintainers:
>>   
>>   properties:
>>     compatible:
>> -    const: st,stm32mp1-fmc2-ebi
>> +    enum:
>> +      - st,stm32mp1-fmc2-ebi
>> +      - st,stm32mp25-fmc2-ebi
>>   
>>     reg:
>>       maxItems: 1
>> -- 
>> 2.25.1
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
