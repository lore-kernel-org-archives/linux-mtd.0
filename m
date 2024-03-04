Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326B3C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HALyhfrGfXfxj3X//xTD2BuVTihwTfmsRXdU9RtT6s=; b=sCYkehU0pSOZxV
	WEkp0yIIHvUSuDqeNsOk13wcZ+hsKsy8o97+V8IHe55PDbGif01+g1TBlCkhiKaRpGuJlzEqsrqqA
	niXYH5kLPb3x9L9rHUO7xnySbGkSTZ8S/e6dIMjsmQezE+cq4PXZpW3mHcTRiyK+8yEnNJ6OBvckv
	iVsOLKncoO7uBpvzkjhcd+dcE+nHHD8JA9bZNTV+hd93etZkUQX2aIJvVxeO2O5CNPulMxN5qvPl4
	FrSMwTkEWTmFOkHESpwa4sJPNJPM29GHLE2qHON7CyR3B8BJsiPib31+paWLmPRF3LVZ9ZqXHnR/Z
	xZxk/Cu4y6Na/scXVf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh36n-000000081Bt-1MDc;
	Mon, 04 Mar 2024 07:51:37 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh36i-000000081AT-22xH
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 07:51:33 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d24a727f78so50101721fa.0
        for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2024 23:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709538688; x=1710143488; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWvU3Y40gzx94WbLTxYgWZzKcXstQArKnjMG7cs8mWk=;
        b=gzNY/gGJydFiDwprMU7nc874fuxL6G0qjjrNTNW4moAcP38YQOgHTc0r6DF0gf+bfT
         O+uhBkUcDbO1CxjfhkFD7k171pVzUFvk+3cyiRANN5m1evbuT1WUJUqBRJmZIRKLOf68
         ATwvjDVi6f/kbniU8+74AkDWB1BIMUDrtszh5ENok/g5sD8rjgGofFujYpsFQXJEZOVp
         M1tLl7xpH/R6xIUnf7zeMxFUy7bpvbKYka3I1x6tYyJ1/SfIPN6xBjgm2rKi60j1TeIY
         KX75CexOfsy41hxMyEt8HL98Rn0Klj8XP3u+dI0nw99j6RgNlbctUOkIZNX9waDf3GzC
         zqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709538688; x=1710143488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWvU3Y40gzx94WbLTxYgWZzKcXstQArKnjMG7cs8mWk=;
        b=DUHS5+XjatAIbOYb0/wBPc+AIqJ59maw/jUXZlDizb0mMkLqr6XyVovB/rp+d2//aW
         zQjFtQOG6lJAbNfJtqZ0goex/b1qg9lFDb0JWgwdwl8DEEP3FKTCl9e3WYfaahNgZqmB
         iEl+3s1KaEm5B0gHDjEpk6YCUYiKXD/xXBq5a3doGF4FKedzu4vM/LMrG1aLesw4u/WD
         K8hz5cJY5jPPSB6+2YQyOx7BXL+lrz13T/EBZTsJ5lg+zqTFWC/d+b+YUeK65rrStOR5
         9mZ8/86hpaet4eWV6IQJFtWkGp9ooPZDW8GvoUZG4xMwpC9ax3096ky9LZUBhAomsLJA
         +AlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD5AosYcQeNqLIQZ7va27t2ylMz96e6XFrRBtdKiHAzZd292ykbYeuB5Y5nFfFMixRSSKMQY4RWDY7aN/KbN8TuqGxO9LGY/FoVptdhA==
X-Gm-Message-State: AOJu0YyZgDWBiGOhH3i0YqAi5mJYONb6S7n2gs5UnuLz62wf6qsokB9e
	9pOmsIvxfOpNojynso9YxB5lAwmMmY8qO5fWpW1oCVKSVLavEUfqi3KjVILftMM=
X-Google-Smtp-Source: AGHT+IEUICwfJIiBbierTI0MhAjTfQX5+cl2OonSg/acMJtoHZl/Brk4/Jj3JhOx9JLBQPKMiSjqWg==
X-Received: by 2002:ac2:5e35:0:b0:513:2347:4b57 with SMTP id o21-20020ac25e35000000b0051323474b57mr4460752lfg.66.1709538688355;
        Sun, 03 Mar 2024 23:51:28 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id g3-20020adfe403000000b0033af3a43e91sm11481037wrm.46.2024.03.03.23.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 23:51:27 -0800 (PST)
Message-ID: <713393d5-13ef-4891-bf7c-d835edacef8a@linaro.org>
Date: Mon, 4 Mar 2024 07:51:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
 <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_235132_582079_2BB9ABDB 
X-CRM114-Status: GOOD (  16.93  )
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



On 3/1/24 15:04, Michael Walle wrote:
> Hi,
> 
> On Fri Mar 1, 2024 at 3:45 PM CET, Muhammad Usama Anjum wrote:
>> The i should be signed to find out the end of the loop. Otherwise,
>> i >= 0 is always true and loop becomes infinite.
>>
>> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 65b32ea59afc6..46bc45b80883f 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3373,7 +3373,7 @@ static u32
>>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>>  			     const struct spi_nor_erase_type *erase_type)
>>  {
>> -	u8 i;
>> +	s8 i;
> 
> Can we just have an "int" here. So we don't shoot ourselves in the

Muhammad, do you care to resubmit using int? Would be better indeed.

> foot again. I'm really no friend of these kind of micro
> optimizations, it should have been int in the first place IMHO.
> 
> -michael
> 
>>  
>>  	if (region->overlaid)
>>  		return region->size;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
