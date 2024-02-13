Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30E0C48260
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zE/LK18dPlg+xcgDoSR3G5U5V7abLNz0Vv+BJyBmbYg=; b=2Pz6zOjylna5N9
	PGIoEfiH4XQHHAWwKlL7pEX7krKU/04MkYdQIyYHPnJsTRd0bkh9RwV/APYdToF8gSuvtwms3BkKE
	7DN7BbObnNtUWceS17+mfIAKSBotKK+yIVSD6Sh7NgEpO/x95g+daKvP0C8n8pIMIkP2oWhuB5dIq
	YjiAHBGLUEP1np5HlyI2OYuiCPSB6DBFnuNE7B5XyJQz58f5LhaGLSqJ+ws+WYZXLoH9hKhOo9QJe
	KDysEdjdbWUHy6zzHSac6mCEYjsUaH/pKDB7WUA+e2P6pKkPL4LStqSQL30mZ9cZd4Z+gAuozcccV
	MSEXZ0FpNu5QS5dju3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZstZ-00000009MKF-1DxM;
	Tue, 13 Feb 2024 13:32:21 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZstW-00000009MJc-2KDV
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 13:32:20 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41DCB8wv021006;
	Tue, 13 Feb 2024 14:32:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=34e9c7UGprBPKQ0+1IALD+tum6v0BgoVmf0mxf39HAE=; b=zd
	uP417cKD+QCfrJIkj2xjU71gUsE+mehTeZLO0zW/cWOd2vg38YC6jS1TYQPIXPPl
	Jg+aZFFkZ+WXIiIDnL99vuYDMktpeWeVTwVdXj0CoRZ/zdp1IvZymrT4NLwRp8CO
	fXnrSzEwejIG+FdZeLIAzvRcKw0ZdYfyG6V6auRh00T1JlXCJUZEdWc/Ieo/WhEI
	iRLYIVtlkvQOKtdz+lsPdY6gf56JzAQx/xpTRxjahcQfB1++RpLJn21j2t44Xjj0
	Yc/nbvHVT/5kzjtTkAR4Mg5Um1QNAnv3vWvQKSphNOpGtXQZaMEof6UwWya7VG6p
	AjcOr02kfxoTWJ+04asw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62ktjwbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 14:32:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D4E3A40044;
	Tue, 13 Feb 2024 14:32:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 315FC257ABA;
	Tue, 13 Feb 2024 14:31:24 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 14:31:23 +0100
Message-ID: <ebd4b93a-80c5-4f22-974b-eb91e896e510@foss.st.com>
Date: Tue, 13 Feb 2024 14:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] memory: stm32-fmc2-ebi: add runtime PM support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-8-christophe.kerello@foss.st.com>
 <7cb51fed-66fc-4ab1-be09-85a00d94514b@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <7cb51fed-66fc-4ab1-be09-85a00d94514b@linaro.org>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_07,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_053218_910815_14B5B7A3 
X-CRM114-Status: GOOD (  16.84  )
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



On 2/13/24 08:59, Krzysztof Kozlowski wrote:
> On 12/02/2024 18:48, Christophe Kerello wrote:
>> Add runtime PM support in FMC2 ebi driver to be able to manage GENPD
>> support when it will be enabled.
> 

Hi Krzysztof,

> You don't do any real runtime PM here (turning on PM domain on probe is
> not real PM), so please explain what is the goal of it and say that it
> is basic RPM for keeping domain on.
> 

Yes, you are true, I will modify the commit message.

>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>>   drivers/memory/stm32-fmc2-ebi.c | 40 ++++++++++++++++++++++++++-------
>>   1 file changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
>> index 04248c15832f..8c30e56be3b0 100644
>> --- a/drivers/memory/stm32-fmc2-ebi.c
>> +++ b/drivers/memory/stm32-fmc2-ebi.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/of_platform.h>
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>>   #include <linux/reset.h>
>>   
>> @@ -1381,6 +1382,7 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   
>>   	ebi->dev = dev;
>> +	platform_set_drvdata(pdev, ebi);
> 
> Does not look related.
> 

With pm_runtime_resume_and_get API now called, 
stm32_fmc2_ebi_runtime_resume needs ebi data to enable the clock. It
means that the platform data has to be set before this call.

Regards,
Christophe Kerello.

> 
> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
