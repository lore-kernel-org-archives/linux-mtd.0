Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBBCC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927F260F21
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 927F260F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LT5yIdb1nFxFuL3aOrPu+bv4QOLA6pMqHCJrb0ZHiH4=; b=0AKla81celdl3R18pRRlkPceB2
	q6EVDqINQCMrStgV3a7cNo7NrgSCPMwD1WZApKybCCKvx4xbZsunG2H8RbZ46899Amh5WBU+uMvea
	CpSXMWjW1MmwqAWB2VPLm8NMIcmY02yIRxuUu2gJ3J/SdlTR/wGP0nZAR6KwGHcuFQD+Fe+z1z4G+
	iAna1arLlOUjoD85cjON0xxU8Psrj+tUsJySJGLPabVjtjN58ZRxcwsqZkZtKFU8X9SMqC7nb8z8W
	eY+2hjR2WFU1nZp53eCcwe/ztH0l72MRKMnjlo3ahpW0XOUu08I9vRt5v05fXr1bRvIVDpuyYF3Ag
	byFrZdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQQwi-008c7u-IU; Wed, 15 Sep 2021 09:11:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQQwf-008c6y-Br
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 09:11:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C946161242;
 Wed, 15 Sep 2021 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631697068;
 bh=bccyqd4Mgjh1Dt3QIgyk+eVgSktxwaJgdDXfU+Wh/RI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lJRVRJOC2nhd84Q1PWIANjsOBuCNPNTzZq8mnfjNtsfg0FVowkQlUWrBfID7BDhib
 noB8FLVfGwbSu84dj7RdMy7/PymTS1FB2VfqdQgxLLaQTbRHg+mHIdxXUY1/gxG4M/
 jLRaTE5cssIgWhCh6HEnEqZ9L38di6gWrkHPLz4nN7Q6pL+wALQ2ZokD+NcKTTTqij
 dYB1vKwji71Z79j0mwMflVoakx1mKJWYGCM6pvuniIrd4fcPE8k8iAOPfi5TfZ6r/D
 n1e6lTDpLqTekuBFUvrVOQq64OHZykrkdwIctYnpoZpJ5wH9jh5g0PKBDL04tzl4K8
 Mka+wiOnt6bAg==
Subject: Re: [PATCH v3 8/8] memory: gpmc-omap: "gpmc, device-width" DT property
 is optional
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-9-rogerq@kernel.org>
 <aa465bd9-b3d5-8d75-3e59-e86c2cd093cd@canonical.com>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <a881ac1f-2f00-e675-aea6-154b28ca6eff@kernel.org>
Date: Wed, 15 Sep 2021 12:11:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <aa465bd9-b3d5-8d75-3e59-e86c2cd093cd@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_021109_507724_8F864CD0 
X-CRM114-Status: GOOD (  30.12  )
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

Hi Krzysztof,

On 07/09/2021 15:36, Krzysztof Kozlowski wrote:
> On 07/09/2021 13:32, Roger Quadros wrote:
>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>> at one place. Default to 8-bit width if none present.
> 
> I don't understand the message in the context of the patch. The title
> says one property is optional - that's it. The message says you
> consolidate checks. How is this related to the title?
> 
> The patch itself moves around checking of properties and reads
> nand-bus-width *always*. It does not "check at one place" but rather
> "check always". In the same time, the patch does not remove
> gpmc,device-width check in other place.
> 
> All three elements - the title, message and patch - do different things.
> What did you want to achieve here? Can you help in clarifying it?
> 

OK I will explain it better in commit log in next revision. Let me explain here a bit.

Prior to this patch it was working like this

	/* in gpmc_read_settings_dt() */
	s->device_width = 0;	/* invalid width, should be 1 for 8-bit, 2 for 16-bit */
	of_property_read_u32(np, "gpmc,device-width", s->device_width);

	/* in gpmc_probe_generic_child () */
	if (of_device_is_compatible(child, "ti,omap2-nand")) {
		/* check for nand-bus-width, if absent set s->device_width to 1 (i.e. 8-bit) */
	} else {
		/* check for bank-width, if absent and s->device_width not set, error out */
	}

So that means if all three, "gpmc,device-width". "nand-bus-width" and "bank-width" are missing then
it would create an error situation.

The patch is doing 3 things.
1) Make sure all DT checks related to bus width are being done at one place for better readability.
2) even if all 3 width properties are absent, we will not treat it as error and default to 8-bit.
3) check for nand-bus-width regardless of whether compatible to "ti,omap2-nand" or not.

Hope this explains well.

cheers,
-roger

> 
> Best regards,
> Krzysztof
> 
> 
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>>  1 file changed, 26 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>> index f80c2ea39ca4..32d7c665f33c 100644
>> --- a/drivers/memory/omap-gpmc.c
>> +++ b/drivers/memory/omap-gpmc.c
>> @@ -2171,10 +2171,8 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>  		}
>>  	}
>>  
>> -	if (of_device_is_compatible(child, "ti,omap2-nand")) {
>> -		/* NAND specific setup */
>> -		val = 8;
>> -		of_property_read_u32(child, "nand-bus-width", &val);
>> +	/* DT node can have "nand-bus-width" or "bank-width" or "gpmc,device-width" */
>> +	if (!of_property_read_u32(child, "nand-bus-width", &val)) {
>>  		switch (val) {
>>  		case 8:
>>  			gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
>> @@ -2183,24 +2181,37 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>>  			gpmc_s.device_width = GPMC_DEVWIDTH_16BIT;
>>  			break;
>>  		default:
>> -			dev_err(&pdev->dev, "%pOFn: invalid 'nand-bus-width'\n",
>> -				child);
>> +			dev_err(&pdev->dev,
>> +				"%pOFn: invalid 'nand-bus-width':%d\n", child, val);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +	} else if (!of_property_read_u32(child, "bank-width", &val)) {
>> +		if (val != 1 && val != 2) {
>> +			dev_err(&pdev->dev,
>> +				"%pOFn: invalid 'bank-width':%d\n", child, val);
>>  			ret = -EINVAL;
>>  			goto err;
>>  		}
>> +		gpmc_s.device_width = val;
>> +	} else if (!of_property_read_u32(child, "gpmc,device-width", &val)) {
>> +		if (val != 1 && val != 2) {
>> +			dev_err(&pdev->dev,
>> +				"%pOFn: invalid 'gpmc,device-width':%d\n", child, val);
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +		gpmc_s.device_width = val;
>> +	} else {
>> +		/* default to 8-bit */
>> +		gpmc_s.device_width = GPMC_DEVWIDTH_8BIT;
>> +	}
>>  
>> +	if (of_device_is_compatible(child, "ti,omap2-nand")) {
>> +		/* NAND specific setup */
>>  		/* disable write protect */
>>  		gpmc_configure(GPMC_CONFIG_WP, 0);
>>  		gpmc_s.device_nand = true;
>> -	} else {
>> -		ret = of_property_read_u32(child, "bank-width",
>> -					   &gpmc_s.device_width);
>> -		if (ret < 0 && !gpmc_s.device_width) {
>> -			dev_err(&pdev->dev,
>> -				"%pOF has no 'gpmc,device-width' property\n",
>> -				child);
>> -			goto err;
>> -		}
>>  	}
>>  
>>  	/* Reserve wait pin if it is required and valid */
>>
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
