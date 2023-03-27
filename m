Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221B0C76195
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CN9u1MIM0Nky5S5ii5Vz0rivcN9RP37CjLycgrsqRhQ=; b=YH30KHHfciVtwy
	wV+jCzyK2ktA8vo8vM1Crbj6zFGCsfjFAWqCmdMUteSXPCOJrWgKUalAa6Mek8qC7YQf4JIVGmTd/
	HJd51A5Og8yTQhv9+Ydk8WyDUocBmf/MQi66MGxCbW2EUZtvHXtnQUgJeboKAW9iMPEUdyDW0wGnA
	MuxZBaFGZCTKPIwxMzXPuR3uGpzXcCRBEuTL91Xw3AygqY7G1OtlFzE3QCOMMYQIZ8C4x8qG/u+Ge
	ULn4aFOKHeHhoD2ojGMUh0SF27OwFAm4ruecQlJYAobojnrZdUO+XaaQCuTcAgkA+Eq3Z1UU8bdER
	lnzdXCejAA8hO7AFyF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjAA-00ATD8-0W;
	Mon, 27 Mar 2023 09:29:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjA6-00ATBF-0G
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 09:29:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id i9so7972552wrp.3
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679909345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WakzKlq0zhiR2kGfuhbg0OJRZ9vK+K27tkK+aXZITVs=;
        b=hOBsoe5j1T0WCmh5PDpWp2SDy6cg7JepZXgb+aPXfQPwmAdeYTYSTWH6g4x9y03mNK
         Ue67l70B5RMY06zP1xdIKmR/RiNmjFSvMtyFzjRzNu6nMxl+BzpUXOTKnTAsssZ6OXmi
         qVjI/U2Nfy4brNcVl2nsJK1U9XITePZEV+uFh6OXPdudA6DOsxs3scnn+KGumRqAZFBP
         NiGUe7BWSzT/OKemaV8AMq/3yKy90kSU7yR7zc/8GwPhhswaYdUTh3cFfwHaD4KlM99a
         TJ6hVrWA+Bglx5SqAYYjsEO2g9rTm9epAM40W6phwtMDRCUlsbRnrY/vmbJVFDfWtaC5
         YcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679909345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WakzKlq0zhiR2kGfuhbg0OJRZ9vK+K27tkK+aXZITVs=;
        b=giS8RQgvSpCJBG2f1SKg3WK57DlIH4gFU3bKH4ixzM/f8iaWSfmTeMqG15w2p7rztx
         5C16ElccygQ8NAwyY62CuSpRXQJPRUqAtB8l6KMlvUzYnMcGX5WZYPIsfQ0amoCX7Uz/
         AKvHy0sZtJ+JcwxrflBcBITxETrPnbP2kdVRGIK2vnZ+uWNOOzHQsNVR3o/3xuLUe/Sd
         OkVqkKO6XwcRAuAH9gaEBqYFvN/cP445TqA7V0unlcYxrf6WOLYs9VP0d7D1C6rFIFyN
         2CxsXAWTOilKPliqJfZbKXRDycxyJnphNrn4C+uxMcCTFDZlvitBGnsiMb1AaFRSNxNl
         kFHw==
X-Gm-Message-State: AAQBX9dIz42IT0YGA8iHkjqllSMHajZh0B6QU27+9baJmtvjybhnbJVp
	FMNxZZ4Jp0+/TR++eB3wmSphTg==
X-Google-Smtp-Source: AKy350a0j936hg24fP6nC6LrjjgT+yehNsjf0UZZaYjFpKrMRERi0niLd4d9fctYKJxOTXSkFQB4Qg==
X-Received: by 2002:a5d:4fce:0:b0:2d0:354e:dc77 with SMTP id h14-20020a5d4fce000000b002d0354edc77mr8372277wrw.66.1679909345115;
        Mon, 27 Mar 2023 02:29:05 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id n16-20020adffe10000000b002cfe63ded49sm24606778wrr.26.2023.03.27.02.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 02:29:04 -0700 (PDT)
Message-ID: <ebe01832-96c3-449a-462e-342ed706ef8a@linaro.org>
Date: Mon, 27 Mar 2023 10:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 7/8] mtd: spi-nor: Enhance locking to support reads
 while writes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-8-miquel.raynal@bootlin.com>
 <c76eb1cf-3555-d042-a18f-93f240e1cd64@linaro.org>
 <20230324184112.2090f4a7@xps-13>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230324184112.2090f4a7@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_022910_127537_E74E4DC7 
X-CRM114-Status: GOOD (  55.70  )
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



On 3/24/23 17:41, Miquel Raynal wrote:
> Hi Tudor,
> 

Hi!

> tudor.ambarus@linaro.org wrote on Fri, 17 Mar 2023 05:59:08 +0000:
> 
>> Hi, Miquel,
>>
>> I find the overall idea good.
> 
> Thanks a lot for the detailed review!
> 
>> On 2/1/23 11:36, Miquel Raynal wrote:
>>> On devices featuring several banks, the Read While Write (RWW) feature
>>> is here to improve the overall performance when performing parallel
>>> reads and writes at different locations (different banks). The following
>>> constraints have to be taken into account:
>>> 1#: A single operation can be performed in a given bank.
>>> 2#: Only a single program or erase operation can happen on the entire
>>>     chip (common hardware limitation to limit costs)
>>> 3#: Reads must remain serialized even though reads on different banks
>>>     might occur at the same time.  
>>
>> 3# is unclear if one limits just at reading the commit message. Are the
>> reads serialized per bank or per flash?
> 
> Per flash.
> 
>> After reading the code, it looks like all the reads are serialized per
>> flash regardless if it reads registers or memory. I assume you meant
>> that crossing a bank boundary with a single read is fine.
> 
> Yes, I will update that item to clarify.

thanks!

> 
>> But can you
>> really read from bank 1 and bank 3 at the same time? The code doesn't
>> take this into consideration.
> 
> Yes this is taken into account and supported, a read can cross a bank
> boundary.

No, I meant that you can't do a read from bank 1 and while the first
read is in progress, to start a second read from the 3rd bank and
process both reads in parallel, reading from both banks at the same
time. At least not with the current code, because you set
rww.{ongoing_io, ongoing_rd} to true and the second read will wait.
Cross boundary reads on successive banks should work with current code,
yes. So what does the hw support?

> 
>>
>>> 4#: The I/O bus is unique and thus is the most constrained resource, all
>>>     spi-nor operations requiring access to the spi bus (through the spi
>>>     controller) must be serialized until the bus exchanges are over. So
>>>     we must ensure a single operation can be "sent" at a time.
>>> 5#: Any other operation that would not be either a read or a write or an
>>>     erase is considered requiring access to the full chip and cannot be
>>>     parallelized, we then need to ensure the full chip is in the idle
>>>     state when this occurs.
>>>
>>> All these constraints can easily be managed with a proper locking model:
>>> 1#: Is enforced by a bitfield of the in-use banks, so that only a single
>>>     operation can happen in a specific bank at any time.
>>> 2#: Is handled by the ongoing_pe boolean which is set before any write
>>>     or erase, and is released only at the very end of the
>>>     operation. This way, no other destructive operation on the chip can
>>>     start during this time frame.
>>> 3#: An ongoing_rd boolean allows to track the ongoing reads, so that
>>>     only one can be performed at a time.
>>> 4#: An ongoing_io boolean is introduced in order to capture and serialize
>>>     bus accessed. This is the one being released "sooner" than before,
>>>     because we only need to protect the chip against other SPI accesses
>>>     during the I/O phase, which for the destructive operations is the
>>>     beginning of the operation (when we send the command cycles and
>>>     possibly the data), while the second part of the operation (the
>>>     erase delay or the programmation delay) is when we can do something
>>>     else in another bank.
>>> 5#: Is handled by the three booleans presented above, if any of them is
>>>     set, the chip is not yet ready for the operation and must wait.
>>>
>>> All these internal variables are protected by the existing lock, so that
>>> changes in this structure are atomic. The serialization is handled with
>>> a wait queue.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  drivers/mtd/spi-nor/core.c  | 319 ++++++++++++++++++++++++++++++++++--
>>>  include/linux/mtd/spi-nor.h |  13 ++
>>>  2 files changed, 317 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index ac4627e0d6c2..ad2436e3688f 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -589,6 +589,66 @@ int spi_nor_sr_ready(struct spi_nor *nor)
>>>  	return !(nor->bouncebuf[0] & SR_WIP);
>>>  }
>>>  
>>> +/**
>>> + * spi_nor_parallel_locking() - Checks if the RWW locking scheme shall be used
>>> + * @nor:	pointer to 'struct spi_nor'.
>>> + *
>>> + * Return: true if parallel locking is enabled, false otherwise.
>>> + */
>>> +static bool spi_nor_parallel_locking(struct spi_nor *nor)
>>> +{
>>> +	if (nor->controller_ops &&
>>> +	    (nor->controller_ops->prepare || nor->controller_ops->unprepare))
>>> +		return false;  
>>
>> We won't allow controller drivers in spi-nor/controllers to benefit of
>> this feature, just do:
>> 	if (nor->controller_ops)
>> 		return false;
> 
> That is also checked in the spi-nor init helper, where SNOR_F_RWW is
> now set, so no need to check it again and again.
> 
>>> +	return nor->info->n_banks > 1 && nor->info->no_sfdp_flags & SPI_NOR_RWW;  
>>
>> we don't play with flash info flags throughout the core. Introduce a
>> SNOR_F equivalent flag, see how they're used. You'll be able to get rid
>> of the n_banks check as well.
> 
> Thanks for the clear pointers, looks much nicer now!
> 
>>> +}
>>> +
>>> +/* Locking helpers for status read operations */
>>> +static int spi_nor_rww_start_rdst(struct spi_nor *nor)
>>> +{
>>> +	int ret = -EAGAIN;  
>>
>> you can have a pointer to rww here, you'll avoid all those dereferences
>> from nor. I would add such a pointer wherever there is more than one
>> dereference, so the comment is for the entire patch.
> 
> haha, I guess this is a matter of taste, I'm not bothered by those, but
> ok, I'll make the change here and after :-)>
>>> +
>>> +	mutex_lock(&nor->lock);
>>> +
>>> +	if (nor->rww.ongoing_io || nor->rww.ongoing_rd)
>>> +		goto busy;
>>> +
>>> +	nor->rww.ongoing_io = true;
>>> +	nor->rww.ongoing_rd = true;
>>> +	ret = 0;
>>> +
>>> +busy:
>>> +	mutex_unlock(&nor->lock);
>>> +	return ret;
>>> +}
>>> +
>>> +static void spi_nor_rww_end_rdst(struct spi_nor *nor)
>>> +{
>>> +	mutex_lock(&nor->lock);
>>> +
>>> +	nor->rww.ongoing_io = false;
>>> +	nor->rww.ongoing_rd = false;
>>> +
>>> +	mutex_unlock(&nor->lock);
>>> +}
>>> +
>>> +static int spi_nor_lock_rdst(struct spi_nor *nor)
>>> +{
>>> +	if (spi_nor_parallel_locking(nor))
>>> +		return spi_nor_rww_start_rdst(nor);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void spi_nor_unlock_rdst(struct spi_nor *nor)
>>> +{
>>> +	if (spi_nor_parallel_locking(nor)) {
>>> +		spi_nor_rww_end_rdst(nor);
>>> +		wake_up(&nor->rww.wait);
>>> +	}
>>> +}
>>> +
>>>  /**
>>>   * spi_nor_ready() - Query the flash to see if it is ready for new commands.
>>>   * @nor:	pointer to 'struct spi_nor'.
>>> @@ -597,11 +657,21 @@ int spi_nor_sr_ready(struct spi_nor *nor)
>>>   */
>>>  static int spi_nor_ready(struct spi_nor *nor)
>>>  {
>>> +	int ret;
>>> +
>>> +	ret = spi_nor_lock_rdst(nor);
>>> +	if (ret)
>>> +		return 0;
>>> +
>>>  	/* Flashes might override the standard routine. */
>>>  	if (nor->params->ready)
>>> -		return nor->params->ready(nor);
>>> +		ret = nor->params->ready(nor);
>>> +	else
>>> +		ret = spi_nor_sr_ready(nor);
>>>  
>>> -	return spi_nor_sr_ready(nor);
>>> +	spi_nor_unlock_rdst(nor);
>>> +
>>> +	return ret;
>>>  }
>>>  
>>>  /**
>>> @@ -1087,7 +1157,81 @@ static void spi_nor_unprep(struct spi_nor *nor)
>>>  		nor->controller_ops->unprepare(nor);
>>>  }
>>>  
>>> +static void spi_nor_offset_to_banks(struct spi_nor *nor, loff_t start, size_t len,  
>>
>> pass directly the bank_size instead of the pointer to nor, you'll avoid
>> the double dereference.
> 
> Done
> 
>>
>>> +				    unsigned int *first, unsigned int *last)  
>>
>> unsigned long long *first, *last ?
> 
> Actually I want these to remain unsigned int, the ULL suffix just mean
> the input might be a 64-bit value, but it is quite common to treat the
> output as 32-bit. Here we do not expect values greater than 4.

Ok. Then maybe we should match how we define nbanks in NOR. Was it a u8?

> 
>>> +{
>>> +	*first = DIV_ROUND_DOWN_ULL(start, nor->params->bank_size);
>>> +	*last = DIV_ROUND_DOWN_ULL(start + len - 1, nor->params->bank_size);
>>> +}
>>> +
>>>  /* Generic helpers for internal locking and serialization */
>>> +static bool spi_nor_rww_start_io(struct spi_nor *nor)
>>> +{
>>> +	bool start = false;
>>> +
>>> +	mutex_lock(&nor->lock);
>>> +
>>> +	if (nor->rww.ongoing_io)
>>> +		goto busy;
>>> +
>>> +	nor->rww.ongoing_io = true;
>>> +	start = true;
>>> +
>>> +busy:
>>> +	mutex_unlock(&nor->lock);
>>> +	return start;
>>> +}
>>> +
>>> +static void spi_nor_rww_end_io(struct spi_nor *nor)
>>> +{
>>> +	mutex_lock(&nor->lock);
>>> +	nor->rww.ongoing_io = false;
>>> +	mutex_unlock(&nor->lock);
>>> +}
>>> +
>>> +static int spi_nor_lock_device(struct spi_nor *nor)
>>> +{
>>> +	if (!spi_nor_parallel_locking(nor))
>>> +		return 0;
>>> +
>>> +	return wait_event_killable(nor->rww.wait, spi_nor_rww_start_io(nor));
>>> +}
>>> +
>>> +static void spi_nor_unlock_device(struct spi_nor *nor)
>>> +{
>>> +	if (spi_nor_parallel_locking(nor))
>>> +		spi_nor_rww_end_io(nor);  
>>
>> shall we wake_up here too?
> 
> True
> 
>>
>>> +}
>>> +
>>> +/* Generic helpers for internal locking and serialization */
>>> +static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
>>> +{
>>> +	bool start = false;
>>> +
>>> +	mutex_lock(&nor->lock);
>>> +
>>> +	if (nor->rww.ongoing_io || nor->rww.ongoing_rd || nor->rww.ongoing_pe)
>>> +		goto busy;
>>> +
>>> +	nor->rww.ongoing_io = true;
>>> +	nor->rww.ongoing_rd = true;
>>> +	nor->rww.ongoing_pe = true;
>>> +	start = true;
>>> +
>>> +busy:
>>> +	mutex_unlock(&nor->lock);
>>> +	return start;
>>> +}
>>> +
>>> +static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
>>> +{
>>> +	mutex_lock(&nor->lock);
>>> +	nor->rww.ongoing_io = false;
>>> +	nor->rww.ongoing_rd = false;
>>> +	nor->rww.ongoing_pe = false;
>>> +	mutex_unlock(&nor->lock);
>>> +}
>>> +
>>>  int spi_nor_prep_and_lock(struct spi_nor *nor)
>>>  {
>>>  	int ret;
>>> @@ -1096,19 +1240,71 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	mutex_lock(&nor->lock);
>>> +	if (!spi_nor_parallel_locking(nor))
>>> +		mutex_lock(&nor->lock);
>>> +	else
>>> +		ret = wait_event_killable(nor->rww.wait,
>>> +					  spi_nor_rww_start_exclusive(nor));
>>>  
>>
>> No, don't touch spi_nor_prep_and_lock() and spi_nor_unlock_and_unprep(),
>> you're giving the impresion that users of it (OTP, SWP) are safe to use
>> them while reads or PE are in progress, which is not the case, because
>> you don't guard the ops that they're using. You'll also have to document
>> the flash info RWW flag ands say it is mutual exclusive with SWP and OTP
>> features.
> 
> Actually I'm not getting what you mean here. Any access that is not
> a pure read, write or erase (like register accesses, otp and swp
> accesses) are automatically treated as needing full and exclusive
> access to the chip. So everything works as before with these, even
> if RWW is enabled, because that's not where we want performance

oh, yes, all SWP and OTP ops are guarded with spi_nor_prep_and_lock()
and spi_nor_unlock_and_unprep(), you should be good to go.

> improvements. So I need to implement a dedicated "parallel_locking"
> path inside these helpers to clearly enforcing an exclusive access to
> the chip.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
