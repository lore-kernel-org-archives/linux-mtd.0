Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E34BD7877F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuZCMvmv4I2OoHkXLDIuT8MBEETPnhQ8HxNsBIho6CQ=; b=Ifnd/ZXJ3Mowcc
	dx88Ebh30/yngC/KjzOm7g6K1K99CCoVcRi9NIQVwbeswgGLU+fd3lEdVkB1pdJOZD3vXWFqQoIWS
	KrcArAzyjQCGp4hnMRCR1Ln6Fnjth8GgdCrEVh0O9Zj1bQzAMuwJalX1W7RuMOxryIvjIu/Vqj8hG
	PzQKfwOZwlLcoTJo5mecjGUy3bG5WHLJX8yfKNU08tkc66lKpqMeiL7PzafK4z6Fc7HwTnciOq+o6
	hvg//m2R/o6mu5L7J6US4+56vNERsu9J8dUuocn5/dz/So4NljHPtnDb4jbVYUrhzUDr4Aqq85CaQ
	qTPqsyuQzugrA0Lmw+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9BT-00000000KyX-373k;
	Thu, 21 Nov 2024 15:33:31 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9BQ-00000000Ky5-1uSq
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 15:33:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 164F5C000C;
	Thu, 21 Nov 2024 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732203205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HeqMavKGwgye1TgBIsi5L0jmrwRdZqWwsFG5j64fJeI=;
	b=h4Q+kSb+rO4qRXec+md7kBJiZpRjvkVkmoqmznGVIQ1WlpthHPEW0PMWUckVBov9OiXCQe
	NHSDjyzs2bYuM07OY5ustSGxIOeSOmNMkf/IxbvniNI0oZZ2HQM3gZc+9hg4E1jDCXMv9B
	CU1TSgkR10DuU5JT+JGA/Rt8frbzZH4UCUP/dHFDFTDQCw0vTkpkYKp6I0r0SCtAnqmjXm
	mKrmLhbvyoMZHtMJV7gSJvZbe7In9L4G/1OkcQ2eHBDtX1cWvHTpfBq3TWsCww/1jrBm/2
	JE+WRv5fU+bK2NmIt7b6Vp0DBEWAI29OJauCrq6pvs9GELDgt12X1J4wdsGUOg==
Message-ID: <972898b2-e59b-4d6d-b1a0-47f1c5a3153f@bootlin.com>
Date: Thu, 21 Nov 2024 16:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] memory: ti-aemif: Export aemif_*_cs_timings()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
 <20241115132631.264609-7-bastien.curutchet@bootlin.com>
 <3a74b938-072e-443c-bf48-d97aff969a17@kernel.org>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <3a74b938-072e-443c-bf48-d97aff969a17@kernel.org>
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_073328_895827_582A085F 
X-CRM114-Status: GOOD (  16.45  )
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

Hi Krzysztof,

On 11/21/24 11:33 AM, Krzysztof Kozlowski wrote:
> On 15/11/2024 14:26, Bastien Curutchet wrote:
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL(aemif_check_cs_timings);
>>   
>>   /**
>>    * aemif_set_cs_timings - Set the timing configuration of a given chip select.
>> @@ -173,7 +158,7 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
>>    *
>>    * @return: 0 on success, else negative errno.
>>    */
>> -static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
>> +int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
>>   {
>>   	unsigned int offset;
>>   	u32 val, set;
>> @@ -195,13 +180,16 @@ static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_
>>   
>>   	offset = A1CR_OFFSET + cs * 4;
>>   
>> +	mutex_lock(&aemif->config_cs_lock);
>>   	val = readl(aemif->base + offset);
>>   	val &= ~TIMINGS_MASK;
>>   	val |= set;
>>   	writel(val, aemif->base + offset);
>> +	mutex_unlock(&aemif->config_cs_lock);
>>   
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL(aemif_set_cs_timings);
> 
> 
> EXPORT_SYMBOL_GPL everywhere, these are quite specific to driver's
> internals, so internal implementation.

Ok, I'll use EXPORT_SYMBOL_GPL in next iteration.

> 
> Also, all of exported functions need to have correct kerneldoc but I
> think they don't. At least missing(), so maybe rest also did not conform
> to kernel doc style.
> 

Do you know a tool that could help me checking the kernel doc style ? I 
have no warning when running ```make W=1n drivers/memory/ti-aemif.o```. 
The warnings I get when running ```make W=2 drivers/memory/ti-aemif.o``` 
aren't linked to these comments. And the output I get with 
```./scripts/kernel-doc -export  drivers/memory/ti-aemif.c``` seems fine 
to me.

>>   
>>   /**
>>    * aemif_calc_rate - calculate timing data.
>> @@ -257,10 +245,12 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
>>   	if (data->enable_ss)
>>   		set |= ACR_SSTROBE_MASK;
>>   
>> +	mutex_lock(&aemif->config_cs_lock);
>>   	val = readl(aemif->base + offset);
>>   	val &= ~CONFIG_MASK;
>>   	val |= set;
>>   	writel(val, aemif->base + offset);
>> +	mutex_unlock(&aemif->config_cs_lock);
>>   
>>   	return aemif_set_cs_timings(aemif, data->cs - aemif->cs_offset, &data->timings);
>>   }
>> @@ -399,6 +389,7 @@ static int aemif_probe(struct platform_device *pdev)
>>   	if (IS_ERR(aemif->base))
>>   		return PTR_ERR(aemif->base);
>>   
>> +	mutex_init(&aemif->config_cs_lock);
>>   	if (np) {
>>   		/*
>>   		 * For every controller device node, there is a cs device node
>> diff --git a/include/linux/memory/ti-aemif.h b/include/linux/memory/ti-aemif.h
>> new file mode 100644
>> index 000000000000..0640d30f6321
>> --- /dev/null
>> +++ b/include/linux/memory/ti-aemif.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __TI_AEMIF_H
>> +#define __TI_AEMIF_H
> 
> 
> Use some longer header guard, e.g. __MEMORY_TI_AEMIF_H
> 

Ok, I'll do it in next iteration.


Best regards,
Bastien

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
