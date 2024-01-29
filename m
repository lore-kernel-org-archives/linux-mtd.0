Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64FAC47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p52C4l8uXZusF65CPDJiDOdbxObZt5yOBwEM2NgI9AM=; b=UtySW6btoAdSob
	6gb13wuV+T6mDvMoo6xHqtCoOVBGscfwVo5KZ8vUxHfC0aaXLq5w3p4p2ZByVa4yC3PT56gomVtJb
	+PJSS0byNkVarkDSva2FtPzQUcxAz9EicDmjV6PxUMxqpdT2TvvoLf9VuwfFXJbii8EQOZ45eKRQ5
	16we+5R1JMDOt+3jFGg/PF1AKt7Tm8i1om6/uOXvWLuKLmKGVLIdLszlF5uB44CiEfYGry/6QggXX
	IQg3/5DE8Ud7/+CfOhUgrdxarKuLX45GOaQzkI2W60epUuCoteMOAsKFZZSehyLF6Fb7dxo3lf2Rz
	v0pPYVtVpGVznpS29bLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURg5-0000000CrQa-1t53;
	Mon, 29 Jan 2024 13:27:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURg1-0000000CrP1-3sMJ
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:27:55 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55790581457so2961105a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2024 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706534872; x=1707139672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SvkwZXsYxPu3g0WrMtrLcpdJEvY5sTv7TKTF9i+RZnU=;
        b=MK8fLU0r1UApfFADXti/uEp5MVCUjaXGBl/r8hQxsO4QIAVBlKkHejCbSbhUPmbZnd
         OCgv3BxMGViUmRIAJfhhzcuIusj8EhodH8ucWg8kLBTVkbQ9ROXz0NgaSyM87iN915xP
         OYY5CtVHmTa5YIjPtM7H9t4JrNpfGOAGStV80Ssh/+3TuH9mYZ2skGrPCDP31zsa4NwL
         709gExd224vSpv3PGx33o7hFAQl3n2CvKuD9shVySB+sq7saLV1KMHR3t/IjaaKUq40c
         ShcD6rTCmp4ymiJDvkXEY6IPcqHcYnqNLHdohREttqaeC0Vd4tL7UvoE/hJ7vi5rF3xI
         b+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706534872; x=1707139672;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvkwZXsYxPu3g0WrMtrLcpdJEvY5sTv7TKTF9i+RZnU=;
        b=lq36yd/HJC1lMOtBmih07hgzOPLKbgQWI195FRPh+Cni86CmaGvyjsmwo0Bk/Ivh6N
         yprAx7f7Xdei2CXEeNNaV9XYtdz/XrFYkJRUTwQlf3BnqOuE+ZgrQvFOh1NwXDFNdkac
         hWONpe0L303OHwPUhfFMiqUmwGtucRglqpm0xk+TAJdWa6mcgKxrhK6LDVG+R2gkEk2y
         wDQDYEe38uXXcV7P/WFPM/B6Gg7GQ8OdJ2Sw5cbOI7yoz55MpKAVL7obivqrWihybRf+
         uXWI1OCjVttaXLq+MT7Gc72V3S4bw8ZI2JKj1xCQAsLbLlIFXxTabIwjBe4fF0fT+zIK
         H84g==
X-Gm-Message-State: AOJu0YxAizyTocficL+KNNoatBS87onhlM0P8z1AWhHFW6+IuNxKWjPm
	XTGnq9kXtC43R8qoRFN04jZHEWsUA94sitzxXiG20Gv1VIkiyCH040AmZo/DXfc=
X-Google-Smtp-Source: AGHT+IFnx1q5hL4nHDdmXKFiDszwxY6FzyveSXwDW9rfgUz0h6+gSYZlzeffKj30ObxZrGj6146rIg==
X-Received: by 2002:a05:6402:1285:b0:55e:f71c:c47d with SMTP id w5-20020a056402128500b0055ef71cc47dmr1944387edv.25.1706534872147;
        Mon, 29 Jan 2024 05:27:52 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id es19-20020a056402381300b0055cffd3fd32sm3773362edb.68.2024.01.29.05.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 05:27:51 -0800 (PST)
Message-ID: <99babcb3-770d-487c-a297-beea2f6f8e9e@linaro.org>
Date: Mon, 29 Jan 2024 13:27:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: spi-nor: drop superfluous debug prints
Content-Language: en-US
To: Pratyush Yadav <pratyush@kernel.org>
Cc: michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
 <20231215082138.16063-5-tudor.ambarus@linaro.org>
 <120bf090-0c07-4971-a18a-a1b326f1b139@linaro.org>
 <mafs0v87cs238.fsf@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0v87cs238.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_052754_017589_A46E6789 
X-CRM114-Status: GOOD (  10.30  )
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



On 1/29/24 13:26, Pratyush Yadav wrote:
> On Fri, Dec 15 2023, Tudor Ambarus wrote:
> 
>> I missed to drop some unused variables. Will drop them if everything
>> else is fine.
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index a708c3448809..92c992eb73d5 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3492,9 +3492,7 @@ int spi_nor_scan(struct spi_nor *nor, const char
>> *name,
>>  {
>>         const struct flash_info *info;
>>         struct device *dev = nor->dev;
>> -       struct mtd_info *mtd = &nor->mtd;
>>         int ret;
>> -       int i;
>>
>>         ret = spi_nor_check(nor);
>>         if (ret)
> 
> 
> With these, 
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> 
Hi, Pratyush,

All in these series were already applied, as I specified in a reply.
Please check patchwork for patches that are not yet handled.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
