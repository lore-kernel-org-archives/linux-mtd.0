Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B5BD7877A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJpSvCLUYVTnz8t03RK02BO4gcJtBqreQdIhg0Njlno=; b=lZ7EgGlZbO2ggg
	u8rTIJYk9/oAOxt+DJljrf0yXVgdqHTbA0itbE8pFPRrt6SQA3F9Nu6QbyWHU5O8BO8rDR4AqJHPy
	Ggeeg7wg4pjcm6F51ntbszaMLTV1NCnbea3bjNT0lc+wXZY0Xwonf/XJi1gUR4tUUSvM2D8tW0vKS
	rTBPF+FJwxnUO+/rDQi3t/B+HmHqa269lAUrEouAjVwuXpEjsCyS9tE0xMuFZ81VtFSoG+q+KNC5V
	qRrDNFuonfrAmzLThGu0q/FMJYFbn5Ql1ukSS9UJRpHam4YIZ8uxpg7+8FNczbYLTu/xcy7iV+qqE
	lxm0HCrDgx4cq1zmdVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8bj-00000000HLP-1aev;
	Thu, 21 Nov 2024 14:56:35 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8bg-00000000HK4-0RV5
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 14:56:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2279840005;
	Thu, 21 Nov 2024 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732200987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLDouZPklZzpGMTdyZtvlWDtrmgpTgU58+RznhI2QS4=;
	b=ArWbtJLVVW6rfFcHFOeFRswAtedzNXlMo41TC47senVzpgr3xMwGfNzCF1GFA4nYAbyGhR
	urpbEhaHh1oL2xUnbLsUaw3GybYbJxAz5ZIy8TM3iGlF2EPAzh2woT6GEEOiQz29krRTLM
	MPdzi3V1h1OL9Kva/DrrvDR9JCVh64pjG44OnDE86xfR/gqJakQEI1TpRLs9byDVrG9+cN
	t8iNdc9R6k23Zk0+aslqpr9ItwWLxNknmgd8beZOzSJ6r9ncutKDD8uQFkmP30PSnIRcQM
	CIzukUgyYVF51bIoBmGc80dTgiFXszT9OzpOCSO6ba+1KI6Dh2ZVOCDYolBjDg==
Message-ID: <e6381bb3-70ae-4aa5-83a0-1e226a5efdfd@bootlin.com>
Date: Thu, 21 Nov 2024 15:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] memory: ti-aemif: Create
 aemif_check_cs_timings()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
 <20241115132631.264609-5-bastien.curutchet@bootlin.com>
 <e3b8366d-b365-43a3-8f40-c2374ff9e8bf@kernel.org>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <e3b8366d-b365-43a3-8f40-c2374ff9e8bf@kernel.org>
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_065632_446315_34AF9F8D 
X-CRM114-Status: GOOD (  23.54  )
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

On 11/21/24 11:28 AM, Krzysztof Kozlowski wrote:
> On 15/11/2024 14:26, Bastien Curutchet wrote:
>> aemif_calc_rate() check the validity of a new computed timing against a
>> 'max' value given as input. This isn't convenient if we want to check
>> the CS timing configuration somewhere else in the code.
>>
>> Wrap the verification of all the chip select's timing configuration into a
>> single function to ease its exportation in upcoming patches.
>> Remove the 'max' input from aemif_calc_rate() as it's no longer used.
>>
>> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
>> ---
>>   drivers/memory/ti-aemif.c | 107 +++++++++++++++++---------------------
>>   1 file changed, 49 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
>> index aec6d6464efa..5c1c6f95185f 100644
>> --- a/drivers/memory/ti-aemif.c
>> +++ b/drivers/memory/ti-aemif.c
>> @@ -132,18 +132,48 @@ struct aemif_device {
>>   	struct aemif_cs_data cs_data[NUM_CS];
>>   };
>>   
>> +/**
>> + * aemif_check_cs_timings - Check the validity of a CS timing configuration.
>> + * @timings: timings configuration
>> + *
>> + * @return: 0 if the timing configuration is valid, negative error number otherwise.
>> + */
>> +static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
>> +{
>> +	if (timings->ta > TA_MAX)
>> +		return -EINVAL;
>> +
>> +	if (timings->rhold > RHOLD_MAX)
>> +		return -EINVAL;
>> +
>> +	if (timings->rstrobe > RSTROBE_MAX)
>> +		return -EINVAL;
>> +
>> +	if (timings->rsetup > RSETUP_MAX)
>> +		return -EINVAL;
>> +
>> +	if (timings->whold > WHOLD_MAX)
>> +		return -EINVAL;
>> +
>> +	if (timings->wstrobe > WSTROBE_MAX)
>> +		return -EINVAL;
>> +
>> +	if (timings->wsetup > WSETUP_MAX)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * aemif_calc_rate - calculate timing data.
>>    * @pdev: platform device to calculate for
>>    * @wanted: The cycle time needed in nanoseconds.
>>    * @clk: The input clock rate in kHz.
>> - * @max: The maximum divider value that can be programmed.
>>    *
>>    * On success, returns the calculated timing value minus 1 for easy
>>    * programming into AEMIF timing registers, else negative errno.
>>    */
>> -static int aemif_calc_rate(struct platform_device *pdev, int wanted,
>> -			   unsigned long clk, int max)
>> +static int aemif_calc_rate(struct platform_device *pdev, int wanted, unsigned long clk)
>>   {
>>   	int result;
>>   
>> @@ -156,10 +186,6 @@ static int aemif_calc_rate(struct platform_device *pdev, int wanted,
>>   	if (result < 0)
>>   		result = 0;
>>   
>> -	/* ... But configuring tighter timings is not an option. */
>> -	else if (result > max)
>> -		result = -EINVAL;
>> -
>>   	return result;
>>   }
>>   
>> @@ -249,7 +275,6 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
>>   	struct aemif_device *aemif = platform_get_drvdata(pdev);
>>   	unsigned long clk_rate = aemif->clk_rate;
>>   	struct aemif_cs_data *data;
>> -	int ret;
>>   	u32 cs;
>>   	u32 val;
>>   
>> @@ -275,68 +300,34 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
>>   	aemif_get_hw_params(pdev, aemif->num_cs++);
>>   
>>   	/* override the values from device node */
>> -	if (!of_property_read_u32(np, "ti,cs-min-turnaround-ns", &val)) {
>> -		ret = aemif_calc_rate(pdev, val, clk_rate, TA_MAX);
>> -		if (ret < 0)
>> -			return ret;
>> -
>> -		data->timings.ta = ret;
>> -	}
>> +	if (!of_property_read_u32(np, "ti,cs-min-turnaround-ns", &val))
>> +		data->timings.ta = aemif_calc_rate(pdev, val, clk_rate);
>>   
> 
> You just changed these lines in patch #1. Basically this is partial
> revert of #1.
> 

IMHO this isn't a partial revert of patch #1. Patch #1 moved the call of 
aemif_calc_rate() from aemif_config_abus() to here. Then, this patch 
removes the check of the aemif_calc_rate() as it no longer returns 
negative values. Maybe I should change the aemif_calc_rate() return type 
to u32 by the way.


Best regards,
Bastien


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
