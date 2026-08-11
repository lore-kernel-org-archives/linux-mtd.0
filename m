Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25905C5CFCF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1CIfb3FLiwYy0jN5s3UnYS8FNGMJvqXGd74wIdMyHA=; b=nZj/txIzqhCPxv
	d3N6+HQjSt7t3EbJQnz5tppzwmcjTOUdEpWfPdwzdiFHaz8D/gFfbZuOYm6XDLD+C2CHrcy652WvE
	rf8FepPbpbNWN4gSAska1wzUm/kWkTgaU2gc7942gln0iSOBfGD6ZXj/JWrQfgsifHzynhF95CLKg
	j4ZImCMV+fCFm6mKwGESzHPLITS7IIeohTnsWURMHiYdV0dlUlu4TZg8t+5XBhYbryN4n5aFaX0Dr
	XXp6IMvPcNxm/2bxdwHM0gYexbBehy2wZ/wylkp8vsAbMhPRl0PeTPl7gSTBTKvOZnjua3fhbSQpJ
	cGjgZUPXROI7EzOPB/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjwA-0000000Ds0B-1h6c;
	Tue, 11 Aug 2026 10:42:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjw7-0000000Drzp-1UZ5
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 10:42:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so40679295e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786444941; x=1787049741; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOccx3o7YzspIOPN4VOMh1mmGB1X25Vq6yEwYlGFjto=;
        b=KW/hjHjaDp4MAFABcPRn/pX6AZRRSIAdUsnH9rT78teE2eBgpAa8Avibp8DjFHq2HR
         tiDRX/gwaVz9H1x5q+8+bqzXoZdh0AAj57uqoOZpERFJEAR/PCT/Si4PeGLT15v9Oz6f
         0UysPoBuDIrvkYiwwnPC//ZMeV/a1BHF54mE4f7VcnZCbVvnebcu8urDsz5eYvhvMwvj
         Hbt+Z6KX1z6NkLRVPjdI89xqeGWY5Q+pfFLoI3j+H/vzL9nxm0farHnWf6N/fL/oJGcn
         Te/Nqsn84V4tXspBK183YlZLxSZOacE/zwPmxw8BvQr+t16Wp/H9ZBzp8tIPw93dy0Ci
         V9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444941; x=1787049741;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOccx3o7YzspIOPN4VOMh1mmGB1X25Vq6yEwYlGFjto=;
        b=IscRSJxYIoHfqlzTmgp7mLNEKmUIy7d46FUDIe9ISUgBYfK0dDBqYGB+Is6VGqV5O8
         AHAaXFqdN0tNOw2ZP0gu39ezajuBX19eS0ajv+J2pnB7yZjrEBopwybu1HXp8Zm8+V3d
         FtjT916L4k/sLyjeEvFo4oelFxImqRgRbu5Xf98zxpSM/2tfqzQNm6CAdxVdfLkPkWia
         pDbfNhl7gFlLIrxd7GHkQEFBSpzAfrM/0rb/fU/cc5rObI0QccpPjq8wA0j3ngLynea6
         7dKntjTU0qW+SMfEq35SMMAsZt6mv/45YdEybA4XhbPc17fRtGM/Le3Jci0F1WGF11c8
         oMyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ83lVLnMBI7P/hOcTORLoZHI4YBkJy8r3wORyUV5bWBUdbdhJ+1HCvkt6bgRX2UG/24T4Ip3EEks=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhpikM+f0lIoUEUjZVMci95UAmfMuFXAC/6E9IljxxMEcdLjZg
	f6OXInQ0BhB45tqF6x0OxUmFtidh3hHSdSh3NiXu70ieaWIVoBkMgr0cAcm2QQBsOLUFe/J3Bt2
	7JOwVQVs=
X-Gm-Gg: AR+sD10bMZxpX+UMpmRGJ4TX6NGfSB4na/3Vpo/+Ed8qp/ZaK6vhlB1d2q9Di3VXCkU
	D+yNTr4ndRI2xbvLkU9jeJ6LX/TgADRMuLaULIiJIY9hfRXGb185aP5bIqLoQ6dOyGmtw49bF2d
	+dNCpqn91YjVJTgC7tNuID8Q+QkeHTwaMn/DvCMXbQr4ImyS2x3EwIsGraDK8rDKYQWRpLYe3eH
	J/BhBpC+wNOs/k4R4/lU6o3A8eJUSlpP0O1YyDTTYqePsdhKwcr92xF9SBk9cD2B9PD3TMREFP9
	lZKC+cm8ght5EPW/SSdMrYVTxCaoqNpSbkqrxwSvUANOxhlFIsIl4Q+eGxpphS4iRU46KwDpQfO
	eMfcK9yMfYwTykU4B7ITxi1IV48rKZB4o5+JoKK8aoW6ms8ExRt7jkRa38hcK0oTcva6zc2/uhk
	zyrjPhpfRxOpibih6xBfbBAjZJzLqq/b3wtDhpPe4/AD99UhgOeDy9DHR/Y0tq2P2DCZJHvnQ=
X-Received: by 2002:a05:600c:4753:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49978437740mr26481275e9.6.1786444940360;
        Tue, 11 Aug 2026 03:42:20 -0700 (PDT)
Received: from [192.168.0.252] ([79.115.156.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977e57785sm37389935e9.2.2026.08.11.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:42:19 -0700 (PDT)
Message-ID: <56991b48-cbe9-45bf-a24c-d7aa771c55d2@linaro.org>
Date: Tue, 11 Aug 2026 13:42:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: spi-nor: use guard() in
 spi_nor_rww_start_exclusive
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, jianhao.xu@seu.edu.cn
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
 <20260811083111.403453-1-runyu.xiao@seu.edu.cn>
 <0ff8afdc-7a11-4a6c-9f62-6f8ba712c4ac@linaro.org>
Content-Language: en-US
In-Reply-To: <0ff8afdc-7a11-4a6c-9f62-6f8ba712c4ac@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_034223_436407_DB2BD180 
X-CRM114-Status: GOOD (  20.48  )
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

Hi, Runyu, Miquel,

On 8/11/26 1:11 PM, Tudor Ambarus wrote:
> 
> 
> On 8/11/26 11:31 AM, Runyu Xiao wrote:
>> Commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
>> helpers") converted the RWW start helpers to scoped mutex cleanup, but
>> left spi_nor_rww_start_exclusive() using a plain mutex_lock().
>>
>> spi_nor_rww_start_exclusive() is used as a wait_event_killable()
>> condition. When it returns false on the busy path, the raw mutex_lock()
>> leaves nor->lock held and blocks the operation that must clear the RWW
>> state in spi_nor_rww_end_exclusive().
>>
>> Use guard(mutex) here as well so this helper matches the other RWW
>> start helpers and releases nor->lock on the false return path.
>>
>> Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
> 
> The fixes tag is wrong. The blamed commit did not change the functionality
> of the code, while yours does.
> 
> You shall instead blame the commit that failed to release the lock in the
> first place. But then if you want to have this backported to stable kernels
> you may want to add 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex
> cleanup helpers") as a prerequisite patch, as it includes <linux/cleanup.h>.
> 

Runyu, please also update the commit subject, the point of the patch is
that it fixes a mutex leak, thus I suggest to reword it with something like
"mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()"

>> Cc: stable@vger.kernel.org
>> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
>> ---
>> Changes in v3:
>> - Reframe the changelog around the scoped-helper conversion that missed
>>   spi_nor_rww_start_exclusive().
>>
>> Changes in v2:
>> - Replace the analysis-style explanation with a short maintainer-facing
>>   description of the busy-path lock hold.
>> - Keep the fix focused on using guard(mutex) so the mutex is released on
>>   both paths.
>>
>> drivers/mtd/spi-nor/core.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index ccf4396cdcd0..8bc117b46e02 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
>>  {
>>  	struct spi_nor_rww *rww = &nor->rww;
>>  
>> -	mutex_lock(&nor->lock);
>> +	guard(mutex)(&nor->lock);
>>  

Miquel,

Have you seen sashiko's review at 
https://sashiko.dev/#/patchset/20260811083111.403453-1-runyu.xiao%40seu.edu.cn?

Both concerns look valid to me. Do you think you can allocate time to fix them?

Cheers,
ta

>>  	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
>>  		return false;
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
