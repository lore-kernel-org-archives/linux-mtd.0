Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA2AC46CD2
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWLhIm4fsW7P3EDibfm+tklPGFCAxmzlsE0yiQQi3zE=; b=wJJhO2ijhH7P8h
	O2LQfgBkg993mbjUkEyaNdXNTe+PhR9XzQE5/B205RB7x0hMEJ7Qh/PBf+3BFAsD0oaL7YYDUlPlf
	R0wv0PEaIjwRFQabs+pfEr5NzjOk+3tFIMRTEg7BsM7Ieax5K6vrQut5zuXw/aJgbP6nUf0pl3J3K
	UzXj+jE6xowg/86OBij88/49J3F+9tkjySK1LrHAQI52R2Lg59ocAzdVeADMTppKrRBWJGyFDVdC7
	SLMJjbeYxfiZtwab7kT+jPS5pn7ncQnS6Ry1AmFEngCVM21Rfai0BueFT4xxXNsE+cs7iXCg7zQGF
	K8Bzk1ziyry47xPUa77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgzZ-008Pal-1Z;
	Tue, 02 Jan 2024 15:47:45 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgzW-008PZz-1W
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 15:47:43 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-360576be804so41225ab.0
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2024 07:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1704210459; x=1704815259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySBFOJIM0DSvIVDKhQcLqvBT2yyLab4gqIewIhfdbtY=;
        b=UbR5ql4lmhqDS68ixIqn5BKAK1SDQnFR2/tzDbUyoqlvpvG0GrM8mosW9M/z/n2e3c
         Y4EMv80KNfBRf8OFIPUy0RmJJVsRn/P6rTVWa031Ym9Uvvry1q7CI79iEyMQGyWy+Oue
         VISsUAHl1unepuwktHAHbJ/bv0rGISwhr5WdTQhitWmIuX/81Eh/qCTnu05Tfpqh+h++
         D04ocsWuWyd0iWFjvFDSOIRsHgn48aN93eQLquGxOWHBlDbnWg784nY/n1q2RfrCMmrV
         b+7/rVNwzneHiGmeJbN+/UNw6wohqGlSoIDTJTx2+TRlqmg1x/ms605/Xfj1x2G4R8aN
         zVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704210459; x=1704815259;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySBFOJIM0DSvIVDKhQcLqvBT2yyLab4gqIewIhfdbtY=;
        b=pLfeBsy/uvcAyy0PIwqXfHZh2WnHkInBYO/1Hinmq4hUh5IFe/b4Eo96S19M7oAgwv
         Mu0skTRZShpoKXB7J6ItKMuKBZl1nhbHn89lVbWnXxI4R+5w6GH+aTSm37v/vfqXcQql
         C7fw//+s0SpFEV0X2VexUHqwIjPLcCZ8hRK9PksBtu1EQPaCxFHgmn5UndMFjuV6NB6D
         MNqxpg4uHOc8CTrmPSduAECHMJseEQB3L9uXtY0UPS8oss1ztF25/JdDZp5zFvKDXQ/P
         ByalnGb7FUS8jnEhN1e/n/cRVjyUpOLCB3xVsNMo2xyTyqIEn/HPo9sZGwA9UApTyvIW
         nbUQ==
X-Gm-Message-State: AOJu0YyzNnLo/TIQ+k2axnnrBkLFxbP/djN6UIcdkMkbBaZpE5hFnXvE
	KHbFLb/fu9Bbpy+yA+IVo5XKMXofve7gcA==
X-Google-Smtp-Source: AGHT+IFs9GZ/Ey7ptKHRHLLO93hZlIAauQjofaYqCnhw5oeOlPvARiPsQn3KTgYcoEx49b9b2zgL8Q==
X-Received: by 2002:a92:c26f:0:b0:35f:efdc:7738 with SMTP id h15-20020a92c26f000000b0035fefdc7738mr26703798ild.2.1704210459220;
        Tue, 02 Jan 2024 07:47:39 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id cb6-20020a056e02318600b0036003f7ce61sm5383610ilb.87.2024.01.02.07.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:47:38 -0800 (PST)
Message-ID: <92011368-a4a5-428b-9801-26a6a6a96752@kernel.dk>
Date: Tue, 2 Jan 2024 08:47:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] zram: use the default discard granularity
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
 Coly Li <colyli@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20231228075545.362768-1-hch@lst.de>
 <20231228075545.362768-8-hch@lst.de> <20240102011543.GA21409@google.com>
 <400dbdbf-e99e-4747-94db-54fb6674fdd5@kernel.dk>
 <f3758a5a-986f-485c-9a6b-c11af20c3aa5@kernel.dk>
In-Reply-To: <f3758a5a-986f-485c-9a6b-c11af20c3aa5@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_074742_555548_DCA9452E 
X-CRM114-Status: GOOD (  12.39  )
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

On 1/2/24 8:44 AM, Jens Axboe wrote:
> On 1/2/24 8:40 AM, Jens Axboe wrote:
>> On 1/1/24 6:15 PM, Sergey Senozhatsky wrote:
>>> On (23/12/28 07:55), Christoph Hellwig wrote:
>>>>
>>>> The discard granularity now defaults to a single sector, so don't set
>>>> that value explicitly
>>>
>>> Hmm, but sector size != PAGE_SIZE
>>>
>>> [..]
>>>
>>>> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>>>>  					ZRAM_LOGICAL_BLOCK_SIZE);
>>>>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>>>>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
>>>> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;
>>
>> Yep, that does indeed look buggy.
> 
> Ah no it's fine, it'll default to the sector size of the device, which
> is set before the discard limit/granularity. So should work fine as-is.

Replying to myself again... It does then default it to the logical block
size, not the physical one. Which does look odd, seems like that should
be the physical size?

In any case, this does change behavior for zram.

Christoph?

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
