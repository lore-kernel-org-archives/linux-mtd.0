Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B2CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=In4okb5/WZpOlAa2gs8vAKeyfop5ZWVrEDDv4385Fao=; b=PP7//SY6mOjSb8
	tW4gU6C0pa4EifrEHP8Oc8KW+UbX1lLqv1ySqrS1DRf+HHCXYr2LXzp5gz26ezb/mTP91Hpl2a9Zj
	WkLC7J/fzDEvyGOJ4hKPrTAsQfF2TY7QQJR4C6c8UyvZdSPt6dj2jUqshUnT5W5GmIAivqrcPHXOK
	BG+KtG802mIKxrJ3TSyeSDIkBC4su3eVSzOnBjvgSGG2gem4p1B1HaWmcy/tqUo/ZAl7ZiP1+0LzZ
	lekiQqhIIciOfFotlHUvPrJvlVbcuIPHfNglIomMJaalScN/zQb/OZ06XZMCtPngRiYmME1GE7Z53
	hkvNJtMtrzpD1O/jfSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUaE-009mE9-Jt; Tue, 22 Mar 2022 02:49:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUaA-009mCt-Nn
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:49:17 +0000
Received: by mail-pl1-x633.google.com with SMTP id i11so13632999plr.1
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=54lx3anSvHU8zNxE3mHWLM2bGAsQ9YpvqZlOWx8YeIA=;
 b=LtwobuA36KRtNKc+oTz1V7RjskiU7j+cG86e/9jG37okEGu11UOaVgMzuHeRO6OpTl
 2RA7IZRdKnDufPI5M0hCrrk4rkU8Q9EyuBTKhJs79TIkRNUzNfXExkV7VYLuZRKAnHQH
 MstdFQbA4rxouCpLlO7XrlOJFTyHRjA2V5ojpZuc9kUDYecnM4p1+iPkG8nOgKBpMeld
 rciu0aYMHWo4VU3Q/mzIq3Va/6dOrEP+YjyG5YkTqCIRIfHQ6z4rAa2IotKAKF+nBst5
 QeV5sTgvDYtKu1XJJd3MntmjJyV5yc0qjs1i44WYnebtWJyX4ZDpRZGB4oPtRdZyz7s/
 c6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=54lx3anSvHU8zNxE3mHWLM2bGAsQ9YpvqZlOWx8YeIA=;
 b=0AHvrLAC9OzKxQCLI1EqG6lxQpdecgXyBjT97dpeXbAoS0HVg777dHP+3HXMXdgXTW
 Nen/L/2Q4OTcBNPBswDbXpinGISehQlVMgOggtEsbrCjgqXROlHGelXkSHNxRb9wkqz2
 wWbkdPR38de+s7aNyWfAcFLayXq76B27HzeYm9Wpoit/CdUYnpzFTYdRWhkdIPPxL2JG
 e90D5U8J/29Mv5Mdji2bePdw1vZ1upZQhdcGwTRs4Y1YsXC97l4fQBTAHvO7VHwXV6nE
 zrm1cfnnHC8sVeKpypIX1hhBZFa4Vd86uGQATaTXrkJvHGSPKlcjc0VNPNzYJTyQP77R
 VaBw==
X-Gm-Message-State: AOAM530dEe1qdFZc689y0HF0T7mEwzFocvt7EMzOvCHAYIM3kbsIvzTT
 smQj/OpVnyWmVBsgr24bOm4=
X-Google-Smtp-Source: ABdhPJzMssKrUjUoshJuCIJz519Vh3hllw08sufUIjgReljk1VAYTOMBrev1yDwYqNXDUVm/TN5kgw==
X-Received: by 2002:a17:90b:38d2:b0:1c7:1326:ec98 with SMTP id
 nn18-20020a17090b38d200b001c71326ec98mr2433826pjb.18.1647917353527; 
 Mon, 21 Mar 2022 19:49:13 -0700 (PDT)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116]) by smtp.gmail.com with ESMTPSA id
 kk11-20020a17090b4a0b00b001c73933d803sm741128pjb.10.2022.03.21.19.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 19:49:13 -0700 (PDT)
Message-ID: <e4142a59-6193-8dd9-0562-fd3310067b09@gmail.com>
Date: Tue, 22 Mar 2022 11:49:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com> <20220316182100.6e2e5876@xps13>
 <01fed0aa-8844-1db9-f167-e7e7944bc092@ti.com>
 <201907b1-c43a-8c45-7ab1-4a4606591bef@pengutronix.de>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <201907b1-c43a-8c45-7ab1-4a4606591bef@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_194914_820646_38F66881 
X-CRM114-Status: GOOD (  22.91  )
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

Hi Ahmad-san,

On 2022/03/17 23:16, Ahmad Fatoum wrote:
> Hello Vignesh,
>
> On 17.03.22 11:01, Vignesh Raghavendra wrote:
>>
>> On 16/03/22 10:51 pm, Miquel Raynal wrote:
>>> Hi Tokunori,
>>>
>>> ikegami.t@gmail.com wrote on Thu, 17 Mar 2022 00:54:54 +0900:
>>>
>>>> As pointed out by this bug report [1], buffered writes are now broken on
>>>> S29GL064N. This issue comes from a rework which switched from using chip_good()
>>>> to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
>>>> returned by chip_good().
>>> Vignesh, I believe you understand this issue better than I do, can you
>>> propose an improved commit log?
>> How about:
>>
>> Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
>> check correct value") buffered writes fail on S29GL064N. This is
>> because, on S29GL064N, reads return 0xFF at the end of DQ polling for
>> write completion, where as, chip_good() check expects actual data
>> written to the last location to be returned post DQ polling completion.
>> Fix is to revert to using chip_good() for S29GL064N which only checks
>> for DQ lines to settle down to determine write completion.
> Message sounds good to me with one remark: The issue is independent of
> whether buffered writes are used or not. It's just because buffered writes
> are the default, that it was broken by dfeae1073583 ("mtd: cfi_cmdset_0002:
> Change write buffer to check correct value"). The word write case was broken
> by 37c673ade35c ("mtd: cfi_cmdset_0002: Use chip_good() to retry in
> do_write_oneword()"), so the commit message should probably reference
> both. as this commit indeed fixes both FORCE_WORD_WRITE == 0 and == 1.

Is this really caused the error on do_write_oneword by the changed?
Actually it was changed to use chip_good instead of chip_ready.
But before the change still do_write_oneword uses both chip_ready and 
chip_good.
So it seems that it is possible to be caused the error before the change 
also.

By the way could you please try to test the version 5 patches again?

Regards,
Ikegami

>
> Thanks,
> Ahmad
>
>
>>>> One way to solve the issue is to revert the change
>>>> partially to use chip_ready for S29GL064N.
>>>>
>>>> [1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>>
>>>> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>>>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>>>> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>> Cc: stable@vger.kernel.org
>>>> ---
>>>>   drivers/mtd/chips/cfi_cmdset_0002.c | 25 +++++++++++++++++++++----
>>>>   1 file changed, 21 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
>>>> index e68ddf0f7fc0..6c57f85e1b8e 100644
>>>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>>>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>>>> @@ -866,6 +866,23 @@ static int __xipram chip_check(struct map_info *map, struct flchip *chip,
>>>>   		chip_check(map, chip, addr, &datum); \
>>>>   	})
>>>>   
>>>> +static bool __xipram cfi_use_chip_ready_for_write(struct map_info *map)
>>> At the very least I would call this function:
>>> cfi_use_chip_ready_for_writes()
>>>
>>> Yet, I still don't fully get what chip_ready is versus chip_good.
>>>
>>>> +{
>>>> +	struct cfi_private *cfi = map->fldrv_priv;
>>>> +
>>>> +	return cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01;
>>>> +}
>>>> +
>>>> +static int __xipram chip_good_for_write(struct map_info *map,
>>>> +					struct flchip *chip, unsigned long addr,
>>>> +					map_word expected)
>>>> +{
>>>> +	if (cfi_use_chip_ready_for_write(map))
>>>> +		return chip_ready(map, chip, addr);
>>> If possible and not too invasive I would definitely add a "quirks" flag
>>> somewhere instead of this cfi_use_chip_ready_for_write() check.
>>>
>>> Anyway, I would move this to the chip_good() implementation directly so
>>> we partially hide the quirks complexity from the core.
>> Yeah, unfortunately this driver does not use quirk flags and tends to
>> hide quirks behind bool functions like above
>>
>> Regards
>> Vignesh
>>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
