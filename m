Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8F9C76188
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OX++PhvwWkJJf+QBblNE2+G06cj7mPfFvgaQDFbdgi0=; b=LmOIA5fGisEknL
	W5ll+D6sn8YLQAaO7PQLLzJO4jOCLUVBdu2c7/dTIw7fusj6/Wxziq/6vBNGXL6bv6/RZ/b/xuvTU
	tw+fbQF+GdTuGmXGCMczMEwwTbpH+YHSFqQm0HftgTbCq6Xy6IvIllfpyvo6kX22G4Qdsv4FiYtXV
	wvApScj9I1vYtft7ND0hc6QqjOZvZKJMdIl2cy33ngOJOaVLAoaxoWydIn9MvuiIaMwaG9VrU7mPw
	ERYwGsb8SiQah67ifL+pu0oGz7mqeChyJopU8qAgIg9Rqr5DJ8yIlHz1zzT+ofwRgABMKYw2XNwsO
	BgUle4LeH44XP3TeyLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ8j-00GSmw-2o;
	Mon, 03 Apr 2023 19:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ8g-00GSj5-1t
	for linux-mtd@bombadil.infradead.org;
	Mon, 03 Apr 2023 19:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=saRy5bN2BBw7e6DjrP+4ch9mKV8iqsg01XFF6Ty59io=; b=g1XSpqJiQwO6UkHKW+xgB6Xjll
	4ha/mZc0/fTj3wFJLYULV9L9dTS20z3JH7SydmLjVjXGZ9TsgzDmj95SUt+1SahR1LJJydNMGC1xy
	c1J7UKvRu/cdSr0B+0NT0F7GvQGvMTHIEEH0xTOieuLA+kQb8jAJc6vUWiAhV7gQiPXjRunFF8Izf
	NEdP8CtYT13CM2d7cs6WlV6ovbSImOs7LKk2Qxw98KKYM6yp+ANtQ3WmkmvipmpbVTqwXbdJvHnBx
	hQHWVTvOURH3QcUnGoxTwvEFsVrSpHkj395Zts/g+iIWJTZuSyizpV0uE5IAHAItS0SBYiBEn/s5P
	M5pBIUdg==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMag-008vMF-0v
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 15:59:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id er13so78292466edb.9
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680537567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saRy5bN2BBw7e6DjrP+4ch9mKV8iqsg01XFF6Ty59io=;
        b=RzY5JC0JEGebh9/aSL1pfT0pQGg+71SMiy7gslNhyaBMEtnaQkIiTT9kXA6H5FVUIW
         /XvgwJPnZenHKpW0G23adQYuPYfxp9xIrsrzEtaQjY13Ks2HjxabkzujiTPEKZ/mLSY3
         azCSZHpcmh6zpcF4wZhzZEW5NK0qr+rjjqbepnHydFm9QLUrKxCWNHHyfh/L6MOXQc6Y
         Up+ca+fEeSxGfCAWsZqRV+//I5LkmwB4S2bEhnW83/r1ir6+BjdqJYwTogOzQ1FYN/LZ
         oiCMIYtVUyjd/tDhC+/5QK8/7FHlMbmpt8QsU9URUutsB2427BViCyfBEWwFTjc8kS+F
         bx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680537567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=saRy5bN2BBw7e6DjrP+4ch9mKV8iqsg01XFF6Ty59io=;
        b=OVwTb60bzNyaX4GTTsfb6dp3Dem46PYoees94XJGWUsRy/kBkLtQo/wMVuLziUpJyW
         kld9Pl2pobMf63/Mr4ovdyvrcRSdJKrz/5Jo1TwgaoqQMFYJHBPCmnK5Cvjtod8MWxk4
         ATvMY6ZJr+2OXFOFouEVs+4gTBNcUME0IjxNpRKtYqF890Kgm0qAiz+qs1nKI9N8IGGe
         F5lSMyS8BU3KzhART4/UqXj3sQT/XpQ9SPg5iy9Dw12acwlwTnpq251CjIU9G5l6o2Tt
         iD7XNswWcKZyU+6XwLa1gwvHh4KQSFX58TubV4rkApPK65rcJgM8YvSWfuK4oTw108kZ
         WTMg==
X-Gm-Message-State: AAQBX9eiKdrBRePhzdk1O6DVLvoRbebq4v1GMyfb7KaRpkMauEfp+lU4
	p0Gq7AoEIbB2zl0jr7cPSMpXDg==
X-Google-Smtp-Source: AKy350aQcHncdcI4TxOMlz1QMff6413AEju2Nw0qMZ/RWvoMAa5/YEF/VDEIuDq4GRJRTGciwZAvIA==
X-Received: by 2002:a05:6402:14c4:b0:501:d3a0:30d9 with SMTP id f4-20020a05640214c400b00501d3a030d9mr17547618edx.7.1680537567076;
        Mon, 03 Apr 2023 08:59:27 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906711000b008e53874f8d8sm4687611ejj.180.2023.04.03.08.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:59:26 -0700 (PDT)
Message-ID: <153f586a-7ea8-7700-3909-e353bef69ee5@linaro.org>
Date: Mon, 3 Apr 2023 16:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/2] mtd: spi-nor: Delay the initialization of
 bank_size
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230331194620.839899-1-miquel.raynal@bootlin.com>
 <5c851822-1e14-f002-3224-738e10d478d1@linaro.org>
 <20230403173158.42426b9d@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230403173158.42426b9d@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_165930_511034_EC05DB6F 
X-CRM114-Status: GOOD (  20.38  )
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



On 4/3/23 16:31, Miquel Raynal wrote:
> Hi Tudor,
> 

Hi!

> tudor.ambarus@linaro.org wrote on Mon, 3 Apr 2023 09:23:24 +0100:
> 
>> On 3/31/23 20:46, Miquel Raynal wrote:
>>> Bank size is derived from the chip's size, which in
>>> spi_nor_init_default_params() can still be zero if the size is not
>>> hardcoded in a table (eg. sfdp parsing). We need to delay the
>>> initialization of this field in the "late" helpers.
>>>
>>> Based on the fact that RWW compatible devices will use the bank_size to
>>> derive in which bank an access is made, we absolutely want to avoid
>>> divisions by 0. Right now there is no such opportunity between
>>> spi_nor_init_default_params() and spi_nor_late_init_params() but it is
>>> probably safer to enforce a default value (assuming 1 bank) as early as
>>> possible, just in case some day code using this variable is moved
>>> earlier than expected.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>> I made the choice to keep a default value, to be honest this is not
>>> actually needed today, so feel free to drop the line if you don't like
>>> it, both choices seem reasonable to me.
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 9e6a0730cdb8..f436395ca489 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2882,6 +2882,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>>  	 */
>>>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>>>  		spi_nor_init_default_locking_ops(nor);
>>> +
>>> +	nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
>>>  }
>>>  
>>>  /**
>>> @@ -2948,7 +2950,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>>>  	/* Set SPI NOR sizes. */
>>>  	params->writesize = 1;
>>>  	params->size = (u64)info->sector_size * info->n_sectors;
>>> -	params->bank_size = div64_u64(params->size, info->n_banks);
>>> +	params->bank_size = params->size;  
>>
>> I'll get rid of this line entirely as you overwrite it anyway in
>> late_init and it's not used in between.
> 
> Yes, as said above, I'm fine with both approaches. Shall I resend or
> will you edit when applying?
> 

I'll handle it.

ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
