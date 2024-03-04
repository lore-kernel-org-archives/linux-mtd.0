Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBE0C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 08:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1z/44WMV5NZ6iY2J/poAdPTmGyCqHIVpJdirHuDWqg=; b=KgPqXotN/n2I7y
	fBTBQD4WSYYwQu7COmU/dJTbcGWCwBlfIhyAuTFB71oKXv6QM6sLYJtQ+Z+1jCWUYiRKieA5GzRVq
	3dHnYE/SDKh8bJFGEJkZyGXtyTEJ/HVgqrLAyoFLAJ2NzJ6NU1l8couXgaAeCTk687U1ZMmDgJLXW
	whqJx6Zy+hcaj7Cx/7jGDQTbKPuMpX5gZBVHOM3/yoRtIHWrXVw3EiOfHUtIiRNQ1ux/OF10rvBHa
	vkqQnpYRbiBh1qs0FuMDpjgysXz8z9AEUCQhl1IzlbYYccwL/wg/+ok6IW4OR/l3KDFvdf2jHLgTM
	qGh39+L46sBX3+wcbO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3xm-00000008CGu-1U4O;
	Mon, 04 Mar 2024 08:46:22 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3xe-00000008CD1-3ryR
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 08:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709541968;
	bh=gkCW8KsdIC7ZfO49SVRDYAdSUC2Z8gW9XivfLoDvYPs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=bbmqj9CuuzAWYhrZ5GlKYRmjhAFMpkAQSXihWxkuAw6Xt6xEjpWNGjS8alQ8AVNlb
	 Sl89lqht6JSrxxUKbQ+FPcdZbySuTM/umAkmsLzkVd2CPrBWDTBGU3ldQdw671eIPX
	 UbwhgLdluWM/7K9fHlmzY3wSmK5sH38TZFdfAJi8pl72U6hpDJDwdTNiB9UgHcCt/H
	 RhnzD9omeD6JR7mBD+TrSxKZ5TNpnjUj8tV2uMZujmLRrL+F9UexbaBj4scHusIWbw
	 qaCkIp8zMplisVsa0tA8fGrUqwUpJpB9dRtjJQUEImoG/1jdKa1gv/7RTslQzbhbOu
	 v4GhYuV6mHkjA==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E127B3781FE9;
	Mon,  4 Mar 2024 08:45:50 +0000 (UTC)
Message-ID: <d6596dd7-4d80-4024-af2b-c4f6c9da1084@collabora.com>
Date: Mon, 4 Mar 2024 13:46:21 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
 <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
 <713393d5-13ef-4891-bf7c-d835edacef8a@linaro.org>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <713393d5-13ef-4891-bf7c-d835edacef8a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_004615_163060_02B7543B 
X-CRM114-Status: GOOD (  16.36  )
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

On 3/4/24 12:51 PM, Tudor Ambarus wrote:
> 
> 
> On 3/1/24 15:04, Michael Walle wrote:
>> Hi,
>>
>> On Fri Mar 1, 2024 at 3:45 PM CET, Muhammad Usama Anjum wrote:
>>> The i should be signed to find out the end of the loop. Otherwise,
>>> i >= 0 is always true and loop becomes infinite.
>>>
>>> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 65b32ea59afc6..46bc45b80883f 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -3373,7 +3373,7 @@ static u32
>>>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>>>  			     const struct spi_nor_erase_type *erase_type)
>>>  {
>>> -	u8 i;
>>> +	s8 i;
>>
>> Can we just have an "int" here. So we don't shoot ourselves in the
> 
> Muhammad, do you care to resubmit using int? Would be better indeed.
I'm sending a v2 with int.

> 
>> foot again. I'm really no friend of these kind of micro
>> optimizations, it should have been int in the first place IMHO.
>>
>> -michael
>>
>>>  
>>>  	if (region->overlaid)
>>>  		return region->size;
>>
> 

-- 
BR,
Muhammad Usama Anjum

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
