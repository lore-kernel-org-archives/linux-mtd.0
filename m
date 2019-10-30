Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5AECA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587BF205C9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 15:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mXmMncqr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sWc4FmqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587BF205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9bt5GOPUwAhbXpndIAB0hnixf8+5R40I8s9CnLmPqA8=; b=mXmMncqrGSiVZjDRzARbBLiLk6
	lH4VG3+nC3rFbN5A0T9s2GeSszHKa6HX5bXKLQX4d/tiQ1DTDRvAKMzNQ8h30CO4sctVzYN1hVG3i
	Qy1Kr8G/UWOYqlKAo5Et77AZIg9eD1HmXnTQ2l3806LVvvE+ZWJVhzFl970izhcPreRHm1IuV9vT1
	uN2ejP4SdFdR3z8QthtRXZRSu9JLcheUAlc+uHtopZubE9m+905ChdNqLC4d4nmUAxJuStDMKCjKg
	TiL9FSTvNaa0q1GqiFhmLCjlZiHM7At7nwfoPmqh5JK7CP0k2XrDVv2UIEGea7oK9l83RAlGm2IqQ
	wEuMU+nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPq18-0004QO-Jq; Wed, 30 Oct 2019 15:36:14 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPq15-0004Pp-Oa
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 15:36:13 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UFZsU3129133;
 Wed, 30 Oct 2019 10:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1572449754;
 bh=itDVqGsRHL9c9qnyUP4W+rF3TW1drLds6zfsQHp+0Wk=;
 h=From:Subject:To:References:Date:In-Reply-To;
 b=sWc4FmqFuOagyOLcmfTABJRPsRd90Uamk9lYW7o/H1h80De4gfDFORU27FD0okaq7
 6Seei0imcw3HnscDBa8/7FEi2IgwEtwUvyUBcsusRQZtSXRJ1dIMBGWuTQ3dF3KftB
 3ENuWNJsMpkp6ijLpaBQ74rXgZeKOCnrovGma4ug=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UFZsxL037267
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Oct 2019 10:35:54 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 10:35:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 10:35:41 -0500
Received: from [10.250.147.141] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UFZpte038864;
 Wed, 30 Oct 2019 10:35:52 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 2/2] mtd: cfi_cmdset_0002: fix delayed error detection on
 HyperFlash
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <b93bf510-8812-3f82-29f3-43f41d08550a@cogentembedded.com>
 <b146c469-6cc3-885e-3e8e-ff7a5fa8dcd4@cogentembedded.com>
 <e5124cbf-c9bd-ec0e-b68f-1882646eb264@ti.com>
 <0526aa49-0649-b0d1-e72f-9b5bb8f284a5@cogentembedded.com>
Message-ID: <72d8c09d-6f8b-e8b2-459d-85c3674abdf5@ti.com>
Date: Wed, 30 Oct 2019 16:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0526aa49-0649-b0d1-e72f-9b5bb8f284a5@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_083611_908207_DE9442E2 
X-CRM114-Status: GOOD (  24.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi,

On 28/10/19 8:15 PM, Sergei Shtylyov wrote:
> Hello!
> 
> On 10/16/2019 09:33 AM, Vignesh Raghavendra wrote:
> 
>>> The commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling
>>> status register") added checking for the status register error bits into
>>> chip_good() to only return 1 if these bits are zero. Unfortunately, this
>>> means that polling using chip_good() always reaches a time-out condition
>>> when erase or program failure bits are set. I think the status register
>>> error checking should be fully delegated to cfi_check_err_status() that
>>> should return whether any error bits were set or not...
>>>
>>
>> Please reword last sentence to drop "I think". Something like:
>>
>> Lets fully delegate the function of determining error condition to
>> cfi_check_err_status() and make chip_good() only look for Device
>> Ready/Busy condition.
> 
>    OK. :-)
> 
>>> Fixes: 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>>  drivers/mtd/chips/cfi_cmdset_0002.c |   55 +++++++++++++++++++-----------------
>>>  1 file changed, 30 insertions(+), 25 deletions(-)
>>>
>>> Index: linux/drivers/mtd/chips/cfi_cmdset_0002.c
>>> ===================================================================
>>> --- linux.orig/drivers/mtd/chips/cfi_cmdset_0002.c
>>> +++ linux/drivers/mtd/chips/cfi_cmdset_0002.c
>>> @@ -123,14 +123,14 @@ static int cfi_use_status_reg(struct cfi
>>>  		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
>>>  }
>>>  
>>> -static void cfi_check_err_status(struct map_info *map, struct flchip *chip,
>>> -				 unsigned long adr)
>>> +static int cfi_check_err_status(struct map_info *map, struct flchip *chip,
>>> +				unsigned long adr)
>>>  {
>>>  	struct cfi_private *cfi = map->fldrv_priv;
>>>  	map_word status;
>>>  
>>>  	if (!cfi_use_status_reg(cfi))
>>> -		return;
>>> +		return 0;
>>>  
>>>  	cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
>>>  			 cfi->device_type, NULL);
>>> @@ -138,7 +138,7 @@ static void cfi_check_err_status(struct
>>>  
>>>  	/* The error bits are invalid while the chip's busy */
>>>  	if (!map_word_bitsset(map, status, CMD(CFI_SR_DRB)))
>>> -		return;
>>> +		return 0;
>>>  
>>>  	if (map_word_bitsset(map, status, CMD(0x3a))) {
>>>  		unsigned long chipstatus = MERGESTATUS(status);
>>> @@ -155,7 +155,9 @@ static void cfi_check_err_status(struct
>>>  		if (chipstatus & CFI_SR_SLSB)
>>>  			pr_err("%s sector write protected, status %lx\n",
>>>  			       map->name, chipstatus);
>>> +		return 1;
> 
>    So are you OK with extending the set of the error signalling bits I
> did here, or I should really have accounted only for ESB and PSB bits
> being error signals?
> 

I am fine either way. Because as per HyperFlash datasheet, PSB or ESB
will always be set if either of WASB or SLSB is set. So it does not
really matter if we are checking for just ESB and PSB or otherwise.

Regards
Vignesh

>>>  	}
>>> +	return 0;
>>>  }
>>>  
>>>  /* #define DEBUG_CFI_FEATURES */
> [...]
>>> @@ -1703,8 +1701,11 @@ static int __xipram do_write_oneword_onc
>>
>> Nit: for some reason, your diff has function names truncated abruptly
>> which makes its slightly harder to locate the context. I use git
>> format-patch that produces better readable contexts.
> 
>    I use quilt for development, not a big fan of git in this role. :-)
> 
> [...]
>>> @@ -1974,12 +1974,17 @@ static int __xipram do_write_buffer_wait
>>>  		 */
>>>  		if (time_after(jiffies, timeo) &&
>>>  		    !chip_good(map, chip, adr, datum)) {
>>> +			pr_warn("MTD %s(): software timeout, address:0x%.8lx.\n",
>>> +				__func__, adr);
>>
>> Since we are returning an error condition, this should be pr_err() (I
>> know that rest of the file does not follow this convention, but lets
>> make sure new code does)
> 
>    OK, I was looking at the other timeout code and failed to notice
> that this printk() was converted to pr_err() by Ikegami-san... 
> 
>> Rest looks fine to me. Thanks for the patch!
> 
>    TY for the review.
> 
> MBR, Sergei
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
