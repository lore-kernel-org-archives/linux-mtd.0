Return-Path: <SRS0=mTWN=RN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C152C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Mar 2019 10:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C3F207E0
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Mar 2019 10:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EIGzNONu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="KWk5mto/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C3F207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xFLPcKGjPOwnoE+n5fwAVkCc3z3115UekytHZvd2d5g=; b=EIGzNONubgwEYb15wzNSm08HS
	YpHU43QVGgh28TiyPQ+PraRta96Qu/IQv4EC28a0DCMMbk606j9uOzvo3D6FY15Tb3PRfS7XP22Lu
	zrgwUPet0yO5f0LFZpexmpzp1s4oh6j7OKD/q2YWWhfMc75jNAI2r2lD2VjrkkCcmfE7Uim2671TL
	29d3KGp6jyJYu4OGV5+jZnWzIXeQNprDfUybRcbUuf8/vFyCP8XZ82jol+gbl0ex4DV//yeAPDMeE
	lYBT6OBNlCOMWdB++vWVf+dMtUA9SXt4c5wKuqKRdoREq3Hh1OgkOfKTIi75z3d7YxefpuYy5n3rS
	UnjiviuBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2vux-0003w8-7d; Sun, 10 Mar 2019 10:42:55 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2vut-0003vj-8M
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2019 10:42:53 +0000
Received: by mail-lj1-x241.google.com with SMTP id a17so1552539ljd.4
 for <linux-mtd@lists.infradead.org>; Sun, 10 Mar 2019 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iFkNRdBHrJ9mSm74UHIzxCrdgTycNZnVfQD4a9WF7CE=;
 b=KWk5mto//+03J+ZK9o2JHrBku1rMTFkDKJBSpqKluswtAnv7Y+WOfI1eMOGKHC+tgi
 lFW/PSfdUhW8RBp6KykIrfO6hF1d4nxCV4hhINHM5lhSj7i4vptxgF5+Ew9d7qiiUpPV
 KfZaS3pk+NVcr023Tn42Z8PyriiGzhUaDzTgHrVTnqZUHoiAT3aX78BUkMATx+z/t+0Z
 mEfgWi0ick7ZIYxypMY5+azPRC40XH+hDDngiuIk5GvZCNZGT/fEQx7d3emzGZJCktll
 GZyml4i2clcmXSlb3vKDYFwLi2xzRztEUL4gyTgx8BkRuBQcHl+RghBMiPi5HweLZGuz
 tVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iFkNRdBHrJ9mSm74UHIzxCrdgTycNZnVfQD4a9WF7CE=;
 b=Xk4egNAmBtExt7jJc7w2E/AUNonNLTDzFF2RSlFeqUnYOycK7zNJmeQwJSOjPp51A6
 /6f/weym2Nr581ht35E+Oa8lht5mWn7RWdju51oXUdeYuFfUdzwlwoO0ksQUtzxqcm3U
 vqtxCNu8RfS7E/0gP+3gDu8A6FuYEwkJtZsh6gMiBZUgcT3KPddqQ5ZaPlXzWFTH5fR2
 wSS6BEJvLsUuu9gWVBsFxkGvP64no78TzlMl+y//pHBMR9QX5LTJNq7XPHOSitXMY81r
 dH0nNcCFVPmF80x8NnpR1G3yY3mgfT6XIk3ynGOaKncqRRbjNpIYdZs+DShJMjrzJiAN
 FNJA==
X-Gm-Message-State: APjAAAUkzEucn+Fqq2sCYgJaSsS/Px4mGyxVcW09oTaHvCawO3luJoBg
 FymErVzGY4a0LF7z/bLUaR75Ww==
X-Google-Smtp-Source: APXvYqx5tXVXD8L7ZzZ5tbYglR9XNrbQFsHHE0GuvH8BzRrNkuoqHB+7G89B9E9YMlvICOXcShxLSA==
X-Received: by 2002:a2e:7e0f:: with SMTP id z15mr12518569ljc.145.1552214568398; 
 Sun, 10 Mar 2019 03:42:48 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id
 h137sm579146lfg.74.2019.03.10.03.42.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Mar 2019 03:42:47 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 James.Tomasetta@cypress.com, Yong.Qin@cypress.com
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
Date: Sun, 10 Mar 2019 11:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_034251_339537_935FE344 
X-CRM114-Status: GOOD (  25.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, bbrezillon@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 10/03/2019 10:58, Tudor.Ambarus@microchip.com wrote:
> + James and Yong from Cypress.
> 
> Hi, Jonas, James, Yong,
> 
> On 01/30/2019 12:07 AM, Jonas Bonn wrote:
>> The status register bit SRWD (status register write disable) is
>> described in many words in the datasheets but effectively boils down to:
>>
>> i) if set, respect WP# when trying to change protection bits;
>> ii) if unset, ignore WP# when trying to change protection bits
>>
>> In short, the bit determines whether the WP# signal is honored or not.
>>
>> It's difficult to imagine the use-case where the WP# is connected and
>> asserted but the user doesn't want to respect its setting.  As such,
>> this patch sets the SRWD bit unconditionally so that the WP# is _always_
>> respected; hardware that doesn't care about WP# normally won't even have
>> it connected.
>>
> 
> Always setting SRWD to 1, dismisses the need of a SRWD bit in the first place.
> Do you know why Cypress made this bit configurable and didn't enable it by default?

I suspect it has some historical relevance; as things currently stand, I 
don't see how it's useful in its current form.

We initially thought that the WP# signal turned on/off block protection 
but that's not the case; the block protection bits BP0-BP2 turn on/off 
block protection and the WP# signal only protects the BP[0-2] bits from 
being modified.  Turning off the WP# functionality via the SRWD bits 
means that the BP[0-2] bits are always modifiable and therefore the 
flash device is never really protected from writes by a malicious actor.

The key question here is:  if the WP# signal is connected, why would you 
ever want its state to be ignored by the device?  De-asserting the 
signal has the same effect as setting the SRWD bit.  And the default 
state is un-asserted if the signal is not connected, so that case is 
covered, too.  I see no reason not to just always set SRWD and thereby 
make the WP# signal do what one expects of it, always.

/Jonas


> 
> Cheers,
> ta
> 
>> Tested on a Cypress s25fl512s.  With this patch, the WP# is always
>> respected, irregardless of whether any flash protection bits are set.
>>
>> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
>> CC: Marek Vasut <marek.vasut@gmail.com>
>> CC: David Woodhouse <dwmw2@infradead.org>
>> CC: Brian Norris <computersforpeace@gmail.com>
>> CC: Boris Brezillon <bbrezillon@kernel.org>
>> CC: Richard Weinberger <richard@nod.at>
>> CC: linux-mtd@lists.infradead.org
>> ---
>>   drivers/mtd/spi-nor/spi-nor.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 13a5055e5f3f..4c8ce2b90838 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1231,9 +1231,6 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>>   
>>   	status_new = (status_old & ~mask & ~SR_TB) | val;
>>   
>> -	/* Disallow further writes if WP pin is asserted */
>> -	status_new |= SR_SRWD;
>> -
>>   	if (!use_top)
>>   		status_new |= SR_TB;
>>   
>> @@ -1313,10 +1310,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>>   
>>   	status_new = (status_old & ~mask & ~SR_TB) | val;
>>   
>> -	/* Don't protect status register if we're fully unlocked */
>> -	if (lock_len == 0)
>> -		status_new &= ~SR_SRWD;
>> -
>>   	if (!use_top)
>>   		status_new |= SR_TB;
>>   
>> @@ -3898,6 +3891,7 @@ static int spi_nor_setup(struct spi_nor *nor,
>>   static int spi_nor_init(struct spi_nor *nor)
>>   {
>>   	int err;
>> +	int sr;
>>   
>>   	/*
>>   	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
>> @@ -3933,7 +3927,14 @@ static int spi_nor_init(struct spi_nor *nor)
>>   		set_4byte(nor, true);
>>   	}
>>   
>> -	return 0;
>> +	/* Always respect the WP# (write-protect) input */
>> +	sr = read_sr(nor);
>> +	if (sr < 0) {
>> +		dev_err(nor->dev, "error while reading status register\n");
>> +		return -EINVAL;
>> +	}
>> +	sr |= SR_SRWD;
>> +	return write_sr_and_check(nor, sr, SR_SRWD);
>>   }
>>   
>>   /* mtd resume handler */
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
