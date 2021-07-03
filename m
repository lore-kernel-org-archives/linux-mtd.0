Return-Path: <SRS0=26vX=L3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC54C07E97
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 17:27:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A316192B
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 17:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A316192B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8+SElNzD/0R9mBq2z0Kk0foWu+T5/kFRtjNbNUAUzE=; b=XjDrrOLjNkgtuDoOIP3RYUqCTn
	syDGo+CDa6gUojsCwDfLWc1xbZq5aMHXoemrwP5GZ8wvigE/oCup9iV4oHiboMYlLQ4yhPp5855hv
	Pf6fMsGZEK6Td5dd7MOpSFMl2tFCF0X6i7ZsfmVkdlnOCiUoHye4e+8xrhoeiFOvZGc5dcQTB7Thr
	DLAvWMS1IUk9UB9jOMspnJuPWgpKmDLj8cfcGGc8GCJ+1U0gvnXNdBN2CUNuCrMVak6SHoVPk55/4
	s/0jBj5hu8/yyP9C22XuuvfcNj67nOx255jPi9NQkvF0ZgKtgFiUKctfJ9wZMwfChWS7UzLBQkrjC
	tSeqZ+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzjPB-005AWR-Ri; Sat, 03 Jul 2021 17:26:13 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzjP9-005AW1-08
 for linux-mtd@lists.infradead.org; Sat, 03 Jul 2021 17:26:12 +0000
Received: by mail-oi1-x229.google.com with SMTP id h9so15541302oih.4
 for <linux-mtd@lists.infradead.org>; Sat, 03 Jul 2021 10:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ntrdXoUnRsaJbvopMZjndYtHLvb7fmdkPnczq42fWHQ=;
 b=L9PNt0QIYb09GdqPpUNIgRTIBn8uUQX6k7NVA3DE1XT1xsbtgd/WVMIARyS9HpAtnS
 30d3LndMMnzXUWepD+5YsiEIyktXWwgnIcEsVqRyt79CFw3wp+ejkhECwD+rdUU1zBz9
 3dF7GmZyfJVbh8TiNiAFwVxZp16mwkS+lCutORJ/KOTY2StSHFawBynJxWqx4HH6G2x8
 +jsPix+uZ6ORnfd+xZcs/wfwHEHO3jM+Xgrgx+09wjcrOk2XUsWO8u1g7zqIo2BHRxgG
 q55+0lenZRxVfKTNyT4FebXDfhExkqptoIEKHCDGjEz/mU2nEHtWYVWHB1afDfaajlAD
 11Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ntrdXoUnRsaJbvopMZjndYtHLvb7fmdkPnczq42fWHQ=;
 b=kKVasdTI2I9HmhI9aKDoATRiTDMh9NQX0DYgeFeqVJvbACpfjW1tbhMfbSlWm7huCm
 04a94x6wC8Hl1eVLhBIwDRhNBkWyqFZGdOjKYolqwMx8P/dKJyHenhcNm43nI2MytbQd
 ykUZExLjq2pxvU/RhubtvYA2MGoTEAMgQaGUi9DrqwR4kP73A0bQxgG34prZNzN1g3oa
 QVQDd2WsAkyuvWzYGqEmvF2ruX7Ude6JcVMqauIfcd7+ZUQdzGf3QSrzEjzFhRS+w+js
 fVUB+SpUy3vGnENS9W8iDwrxz3eT3Y9AAX+xao0d1ZjUAZLXHKA7UCQSJyM9k8MEYTiG
 xTnA==
X-Gm-Message-State: AOAM530jwaJ7qaDZtJdpCXl7jIQKdMVuHrIiIhvaeGo26oO40A4Bm6yL
 pQtKWrA9MwsnCmimr9LZJl0=
X-Google-Smtp-Source: ABdhPJwgzhlOdZO7WyJ7Mjyp5s6uc9BM0e6v3VNydi2hmunRH4+jI4CS7fwofWQ3VVqdEww4+19erw==
X-Received: by 2002:a05:6808:8a:: with SMTP id
 s10mr4453972oic.70.1625333169468; 
 Sat, 03 Jul 2021 10:26:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o45sm1350377ota.59.2021.07.03.10.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 10:26:08 -0700 (PDT)
Subject: Re: [PATCH] mtd: core: handle flashes without OTP gracefully
To: Tudor.Ambarus@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20210702093841.32307-1-michael@walle.cc>
 <9bb2acac-aeb8-d2b2-8df0-9acfd972ec5d@microchip.com>
 <9F46D75C-D00D-4577-A337-7411049EC7D9@walle.cc>
 <8da3d84e-dfbf-2030-98b4-148362d22f52@microchip.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2716acf0-fcf1-d2ef-83be-152d0300d687@roeck-us.net>
Date: Sat, 3 Jul 2021 10:26:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8da3d84e-dfbf-2030-98b4-148362d22f52@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_102611_104414_BB6F66A1 
X-CRM114-Status: GOOD (  23.77  )
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

On 7/3/21 9:42 AM, Tudor.Ambarus@microchip.com wrote:
> On 7/3/21 7:08 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Am 3. Juli 2021 11:56:14 MESZ schrieb Tudor.Ambarus@microchip.com:
>>> On 7/2/21 12:38 PM, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>> know the content is safe
>>>>
>>>> There are flash drivers which registers the OTP callbacks although
>>> the
>>>> flash doesn't support OTP regions and return -ENODATA for these
>>>> callbacks if there is no OTP. If this happens, the probe of the whole
>>>
>>> why do they register the OTP callback if they don't support OTP?
>>
>> I don't know. But I certainly won't touch that code :p
> 
> why? :D
> 
>>
>>
>>>> flash will fail. Fix it by handling the ENODATA return code and skip
>>>> the OTP region nvmem setup.
>>>>
>>>> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
>>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>>> Signed-off-by: Michael Walle <michael@walle.cc>
>>>> ---
>>>>   drivers/mtd/mtdcore.c | 10 ++++++++--
>>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>>>> index b5ccd3037788..6881d1423dd6 100644
>>>> --- a/drivers/mtd/mtdcore.c
>>>> +++ b/drivers/mtd/mtdcore.c
>>>> @@ -880,7 +880,10 @@ static int mtd_otp_nvmem_add(struct mtd_info
>>> *mtd)
>>>>
>>>>          if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
>>>>                  size = mtd_otp_size(mtd, true);
>>>> -               if (size < 0)
>>>> +               /* ENODATA means there is no OTP region */
>>>> +               if (size == -ENODATA)
>>>
>>> If no OTP data, maybe it's more appropriate for the clients to just
>>> return a retlen of 0.
>>
>> you mean already checking ENODATA in mtd_otp_size() and return 0. That would also make the hunk below unnecessary. I'll change it.
> 
> I've thought about:
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 54f92d09d9cf..9419b33d7238 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2314,7 +2314,7 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
>   
>          /* Check that we actually have some OTP registers */
>          if (!extp || !(extp->FeatureSupport & 64) || !extp->NumProtectionFields)
> -               return -ENODATA;
> +               return 0;
> 

There are various places where this is called, including code returning information
to userspace. That means you'd be changing the ABI to userspace which would now suddenly
return 0 instead of -ENODATA.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
