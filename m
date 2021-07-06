Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB2CC07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 18:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59A05613C8
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 18:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59A05613C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nz/WROQH22v95V6vPhhOKOOsRAe9SIiQvUBt013jyto=; b=Rc5fZCnMUG41rHUiYQS6AuNdzx
	JHk+eVy+Xiy51vyKufGx1risa1j7c/Jf4jsSRpSJyxLPb2JcIkFlQbVk4XKkFD76AaznIq/Ziyb7k
	SGNCtsP1G7FkLy4DOpzS3XIcvX08aAOy+gj0W/YjFVnr1CUkGXqIP+Tnmv78XLUhIHeWPUlEFPqdU
	DxebYw0GVVgGbH/U7BydkqLBjrh1VJh0ub8jq00fNZAvr1mwgAg8bj7s9bV0XJSG+tX3H0BcqdT69
	1NNtDG9Vg9ll9R3dWlA62u3Tbhpwok0yOxwfWojoflwfcUbLrdTyT3cBEmftHUsLNMipqM7OhS5Xk
	T4DTf8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0piU-00CYnq-Cw; Tue, 06 Jul 2021 18:22:42 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0piS-00CYnX-Ah
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 18:22:41 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 d27-20020a05683018fbb02904ae64d1b56bso1787896otf.9
 for <linux-mtd@lists.infradead.org>; Tue, 06 Jul 2021 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OK8/u6FR6IpmADEYbANCYO9TQlI0qE21fTDfkShK+ww=;
 b=i2uwcoMcfmddzZeAHZK1nfTlzTrcH3Xa0nFzzRahmaAfnFbZ68H1NXl7/68l7dEhM3
 RL8FkYrZANRxwovACIlM2R3e1/MjAAIMfE9j8tCNZk7dABUspRv6crMr60ddwmIPY8is
 Q2DruqlbI4mA+yQxIGeRMloOxy3Y8SbM3f8rm9UflLj3/nFp724kbXxYscvaX166X8hC
 Xcvdf/qNTBIXFRlu8+Nof/UF6+rFu/j1Xdv4hyiduIjZVtdd1UBSgaTCw6lCn1hvkQA5
 DEEYYhnOaKQz9hTKpSbIQOnesyFVkzOreospuF8amsijc1r3K/9HmpKT9baHkWXl8qz5
 tBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OK8/u6FR6IpmADEYbANCYO9TQlI0qE21fTDfkShK+ww=;
 b=ZSyG0fyFZjTGdQJ7O4UndyYdLYoT9A0ecCQcy59B+hTxz+s/33nyCSswDPqdQaYGNq
 UCLSvrNChvXTnqXVUcO1uGZrSTiLVK8K9RzXW9Bi3hq5yrL4UoTjmlQwMzPBwSKWPfXN
 rwbsoQwKMcWqr1kElezAUSFdhlq4KYNtnBCQ1q9IZoHZnLZuWVwJVwAXOgu01JDy59Tm
 OX0l3P4hSYCWIBj8oHRN1H+yEYQkUuORMtCepmZIquR5c0dsT1mStL4sQMemMCHXY6Rq
 +6zUqPR4gHYynf+T1d95ywTuXSHgXOjBYlLL4fljl7knOMu3t0GGtasismxzKFupKkDh
 vy8w==
X-Gm-Message-State: AOAM532K9hzEPR9iDUdJUEs54CwhOwfFzxsRY0FtMobhUpgHpG4YP2NE
 9fq9xuJfhtbhcU9uStQ5Itg=
X-Google-Smtp-Source: ABdhPJy1ILFMoHId2malZq/x/NjqLyJnNQQy1RJyU1KDpdtikVIydjlZPxQ8diM4yNY23veWaMIYMw==
X-Received: by 2002:a9d:73c1:: with SMTP id m1mr13047814otk.162.1625595759545; 
 Tue, 06 Jul 2021 11:22:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p26sm1640176otp.59.2021.07.06.11.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 11:22:38 -0700 (PDT)
Subject: Re: [PATCH] mtd: core: handle flashes without OTP gracefully
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor.Ambarus@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, richard@nod.at,
 vigneshr@ti.com
References: <20210702093841.32307-1-michael@walle.cc>
 <9bb2acac-aeb8-d2b2-8df0-9acfd972ec5d@microchip.com>
 <9F46D75C-D00D-4577-A337-7411049EC7D9@walle.cc>
 <8da3d84e-dfbf-2030-98b4-148362d22f52@microchip.com>
 <2716acf0-fcf1-d2ef-83be-152d0300d687@roeck-us.net>
 <20210706182908.3cf82669@xps13>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d35a1f0d-5a26-82d5-c051-3d9094449602@roeck-us.net>
Date: Tue, 6 Jul 2021 11:22:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706182908.3cf82669@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_112240_432108_0655EA94 
X-CRM114-Status: GOOD (  23.67  )
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

On 7/6/21 9:29 AM, Miquel Raynal wrote:
> Hi Guenter,
> 
> Guenter Roeck <linux@roeck-us.net> wrote on Sat, 3 Jul 2021 10:26:06
> -0700:
> 
>> On 7/3/21 9:42 AM, Tudor.Ambarus@microchip.com wrote:
>>> On 7/3/21 7:08 PM, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Am 3. Juli 2021 11:56:14 MESZ schrieb Tudor.Ambarus@microchip.com:
>>>>> On 7/2/21 12:38 PM, Michael Walle wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>> know the content is safe
>>>>>>
>>>>>> There are flash drivers which registers the OTP callbacks although
>>>>> the
>>>>>> flash doesn't support OTP regions and return -ENODATA for these
>>>>>> callbacks if there is no OTP. If this happens, the probe of the whole
>>>>>
>>>>> why do they register the OTP callback if they don't support OTP?
>>>>
>>>> I don't know. But I certainly won't touch that code :p
>>>
>>> why? :D
>>>    
>>>>
>>>>   
>>>>>> flash will fail. Fix it by handling the ENODATA return code and skip
>>>>>> the OTP region nvmem setup.
>>>>>>
>>>>>> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
>>>>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>>>>> Signed-off-by: Michael Walle <michael@walle.cc>
>>>>>> ---
>>>>>>    drivers/mtd/mtdcore.c | 10 ++++++++--
>>>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>>>>>> index b5ccd3037788..6881d1423dd6 100644
>>>>>> --- a/drivers/mtd/mtdcore.c
>>>>>> +++ b/drivers/mtd/mtdcore.c
>>>>>> @@ -880,7 +880,10 @@ static int mtd_otp_nvmem_add(struct mtd_info
>>>>> *mtd)
>>>>>>
>>>>>>           if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
>>>>>>                   size = mtd_otp_size(mtd, true);
>>>>>> -               if (size < 0)
>>>>>> +               /* ENODATA means there is no OTP region */
>>>>>> +               if (size == -ENODATA)
>>>>>
>>>>> If no OTP data, maybe it's more appropriate for the clients to just
>>>>> return a retlen of 0.
>>>>
>>>> you mean already checking ENODATA in mtd_otp_size() and return 0. That would also make the hunk below unnecessary. I'll change it.
>>>
>>> I've thought about:
>>>
>>> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
>>> index 54f92d09d9cf..9419b33d7238 100644
>>> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
>>> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
>>> @@ -2314,7 +2314,7 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
>>>    >          /* Check that we actually have some OTP registers */
>>>           if (!extp || !(extp->FeatureSupport & 64) || !extp->NumProtectionFields)
>>> -               return -ENODATA;
>>> +               return 0;
>>>    
>>
>> There are various places where this is called, including code returning information
>> to userspace. That means you'd be changing the ABI to userspace which would now suddenly
>> return 0 instead of -ENODATA.
> 
> Yeah let's avoid this if possible, even though I liked Tudor's approach.
> 
> Would Michael proposal of checking it in mtd_otp_size() still affect
> userspace? If not, having a single check over the -ENODATA return code
> seems attractive.
> 

The check in mtd_otp_nvmem_add() does not affect userspace.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
