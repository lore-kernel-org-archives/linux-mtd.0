Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1717C74A5B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Mar 2023 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae92jpI8fosscSDR2mfReju09aol233BP0/RnyHn33Y=; b=n+aw/Q+GXgoBhM
	UvwYAoTYPwsQ+9lfkBePcXi6bV+8vDVSa0EzHScsqSY0Uv/ZlIFXwUfxCY2li0cdEl5/f5hrHTHNg
	rNesOXJ0OlK8ta1pZ0kKtoh/K/PJ5HsvQoWj38lND6n9jwZptvvq3c9Kzw14DbDd3AerpnUzLGJ1F
	DIIkOcrbSVNI9hIqNWGO3P0oYvHNE597+9pjT1Ad1Lqmh3gdjJ1j1P9OjMGb5ahGMecFcWJE0Mmm/
	tp1Rjx3W8wpmFLmHNXZ28KXCQIVFFY/j9nV2hYHRff7ByN2nc6wWp0KpOUTPsWvjZH0e8MBnzqUzb
	Eo5U79zUAgVy8QlyJQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebDi-00CLeD-2J;
	Tue, 21 Mar 2023 12:36:06 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pebDf-00CLdX-2o
	for linux-mtd@lists.infradead.org;
	Tue, 21 Mar 2023 12:36:05 +0000
Received: by mail-lj1-x22e.google.com with SMTP id q14so961702ljm.11
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679402161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaOgQv9hj9r2/QbqDUaMqLSxNFT2w+RtR+peTdsko08=;
        b=EfVatuoGmeKmw+tg47gsp8+eB/BnCEEzUWp5kZfsYG8mXJdxOEXKHMfRpcGalOFSWB
         WJZRcLzKGlvTsYXnJeEjuHH7n/lpciuoFbonq2rOcecIOKDPO6CLDKxbntfZDB83pORg
         d/uwKTwQ7soXjJFzDP++vlgqHxZ7OnzEUte3djXDattOYHDgZgdP03ey1q21wOhXtZ6d
         wssLb3GGF3QCh37GimZhzgwJYL2vrDM04j2K4ssICIZtbrUGuMA4JXrydw23EV7SAx+f
         VvmpUzWGYwkiOnczCdlruZqA5BlSyl19EBWKQ3bF91wYIGyR6CKGqaEQuyJjy2Wc7jQu
         wR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679402161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LaOgQv9hj9r2/QbqDUaMqLSxNFT2w+RtR+peTdsko08=;
        b=qQKwTUK/K+e47QNnDGJW+W+clx7GBVtJlFv5zi64VY2tCdfq4QpmFb3gSprNU3qUXp
         bVM7FC31KaMAe8Dn40TqIfOa/9Rubeibj0DpgsqgQE2PbuInZMhk8Ce2M2PmjNWzCUBU
         sbDmNxFkVav+OeDPu1SUzaEAbypxeiNd0KD2CUhnDRGigPW0bxYhWyiQTMmyA2lzyfS3
         KWWNMd3Zq1rqDGWbSUgKNATayXIA9FexcYGRpPSV53+0DzB/Vo/gQDWuXEO45bi0qsLy
         CAMwy7hdh8jGe0B4Sx6KEjTgacndJ5XHNUe2DePDA8cyKysujasqoIV0Yj8AHKCr5jN6
         Cp1g==
X-Gm-Message-State: AO0yUKU0b3UQxEv20kexQEYE3WsTOOcakyNLDSXiuSscUlLoxi4pjKc1
	FygHmUf30Z2XbTYMl0jRpGPiku8S6cU=
X-Google-Smtp-Source: AK7set+avIZ1f/y14jRoIZ3s8oFum4K9NRCu07H9DkGs4C9Zjx6DkvOxXQIHhQVgP2rLwvruu2WhNg==
X-Received: by 2002:a2e:9f4c:0:b0:29b:6ead:6d8a with SMTP id v12-20020a2e9f4c000000b0029b6ead6d8amr848015ljk.50.1679402161140;
        Tue, 21 Mar 2023 05:36:01 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id y3-20020a2e9d43000000b0029347612e94sm2192197ljj.123.2023.03.21.05.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 05:36:00 -0700 (PDT)
Message-ID: <72667dd3-b139-0474-920d-9f36159c673f@gmail.com>
Date: Tue, 21 Mar 2023 13:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2] mtd: Avoid printing error messages on probe deferrals
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
References: <20230307192506.439532-1-miquel.raynal@bootlin.com>
 <b12a0baf-b7a0-80a2-fe78-08b3b227e0c5@gmail.com>
 <20230320122321.052d58bf@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230320122321.052d58bf@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_053603_910595_A3947A01 
X-CRM114-Status: GOOD (  18.19  )
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

On 20.03.2023 12:23, Miquel Raynal wrote:
> zajec5@gmail.com wrote on Mon, 20 Mar 2023 12:17:12 +0100:
> 
>> On 7.03.2023 20:25, Miquel Raynal wrote:
>>> There is no reason to complain about probe errors in case of deferrals.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>> Changes in v2:
>>> * Use of dev_err_probe().
>>>
>>>    drivers/mtd/mtdcore.c | 9 ++++-----
>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>>> index 0feacb9fbdac..e4e102585021 100644
>>> --- a/drivers/mtd/mtdcore.c
>>> +++ b/drivers/mtd/mtdcore.c
>>> @@ -536,12 +536,11 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>>>    	mtd->nvmem = nvmem_register(&config);
>>>    	if (IS_ERR(mtd->nvmem)) {
>>>    		/* Just ignore if there is no NVMEM support in the kernel */
>>> -		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
>>> +		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
>>>    			mtd->nvmem = NULL;
>>> -		} else {
>>> -			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
>>> -			return PTR_ERR(mtd->nvmem);
>>> -		}
>>> +		else
>>> +			return dev_err_probe(&mtd->dev,	PTR_ERR(mtd->nvmem),
>>> +					     "Failed to register NVMEM device\n");
>>
>> Even one more improvement request possibility and request from me:
>> "Failed to register NVMEM device: %d\n"
> 
> I get the request, but as I was saying in the other thread, isn't this
> already handled?
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L4961

Oh, looks good, ignore my previous request.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
