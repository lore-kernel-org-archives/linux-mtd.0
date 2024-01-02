Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD7DC46CD2
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVLh+ugtt/MvzVc/a4UEs7qcWmORjCEKxP/6F87C45o=; b=lJjh//8ogZRGYr
	ddvKkzbWVQeS+q/OrXYKHbK6kXbhdQsnwn8+Le0KmvvH4T5G+L0vZCDsuapjIYmFfa0Jhyhhxilqg
	kcKg/fffVVZFIyKZnIgnCtvlw2JBV5Dx9aUJy7PNVIb9tQktjI2acIe35BT/BrNYk+qpDzCD4ifep
	10mGLv1CuNhw7qxEJstZy0qa4udhHhHsnBW2cHfrFFrQAjS9xuUqhUb7/RMqD5R1oBtvl7tyclOS+
	rQlbLnyXpMEd7djHUBiXwjO5veMmmaGCmAvzm+Zmkl9cX2sZ5ML4CQAMRav34OT9pXOYHwPMMW214
	gL89OX9PeQSflgRRrUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgsn-008Oz1-21;
	Tue, 02 Jan 2024 15:40:45 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgsj-008OyC-1m
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 15:40:44 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7bb06f56fe9so67769939f.0
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2024 07:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1704210040; x=1704814840; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yW0MzlHZomB+YZkCH4YUGFwdNBjbNMVw3h7xePuFXBw=;
        b=n5t/HpsQCg8uyryU7VFUSfyryzIYeHYIY2JWkrdsY2i+To3Ck/qWTw5BG7xzt6sS84
         bN6vy1HxmjwJTXeSnVVlgf54357UpO4dwpqEgroXB0P2LRk2YitjJozS6+qksM1RrLYE
         Uj/cuGeqct4NHz0iAMxdzyrrXr8shLGFwdPoFjBDpar+e+JEuA9KE9OiOk1JkdKQZlcm
         dJv14rLglcM356I4DXlgSe4tSiBEMHdla1fn9rKSPaZexVA7p8UGXssPBXaQNWT/Rudl
         OJv9YRNGA9f6HDQFe4CYjSLRExc4+bVPuep/Ul8+115ZTng1ySBwVPVDUtMRyEw4cctG
         Krgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704210040; x=1704814840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yW0MzlHZomB+YZkCH4YUGFwdNBjbNMVw3h7xePuFXBw=;
        b=Lohn7EvJM6SZbsXXm0ctibz1o+ihSpwkmEZ/ymBVEhie1kOiF9khznypn40fq2f6mi
         RGNLeFX+Ffv3nu3fyMFVOr6SogJhI0PepPkj66UeIum3OQYGoZSXogkDTJbxYGNpp5Y4
         zHFXFiwioHuTPCLSivjSCtdY/QHwVqeVwWl1PRRQG6fN/6Q+i6rdkWDN3+Ee4z9oJTuI
         2KRawEJdfobNiHkKHXc0QYqCAscywDIS3Jm/Hmy3xLGG+kBV5NWtqo6cNEMyZyoGomV4
         yrr2CJ+xZninChrSxFsjDKnQMhUYENBPGsT9+uLFk+7S6xjh0xUps7ICAetFmm3opqEL
         Hrpw==
X-Gm-Message-State: AOJu0YyoIzqboYvUJAW1WrVs8BK1EOq7y6hjRpAgfW4VMPqizxAkISCb
	HLELCk4xQGJVx++rz+avj2uCyn79S9EbqQ==
X-Google-Smtp-Source: AGHT+IEwoDpWa3DPCL2q3LLo73FXUxeDnS1RhrchV5t+VIVuVtSvXaa44wpnDuL6ftiaSS1FPUs3jg==
X-Received: by 2002:a05:6e02:20c5:b0:35f:ff56:c40a with SMTP id 5-20020a056e0220c500b0035fff56c40amr22286643ilq.0.1704210039707;
        Tue, 02 Jan 2024 07:40:39 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id f12-20020a056e020b4c00b0036002c8127asm5354004ilu.5.2024.01.02.07.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:40:39 -0800 (PST)
Message-ID: <400dbdbf-e99e-4747-94db-54fb6674fdd5@kernel.dk>
Date: Tue, 2 Jan 2024 08:40:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] zram: use the default discard granularity
Content-Language: en-US
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
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240102011543.GA21409@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_074041_831821_BA308957 
X-CRM114-Status: GOOD (  10.83  )
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

On 1/1/24 6:15 PM, Sergey Senozhatsky wrote:
> On (23/12/28 07:55), Christoph Hellwig wrote:
>>
>> The discard granularity now defaults to a single sector, so don't set
>> that value explicitly
> 
> Hmm, but sector size != PAGE_SIZE
> 
> [..]
> 
>> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>>  					ZRAM_LOGICAL_BLOCK_SIZE);
>>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
>> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;

Yep, that does indeed look buggy.

-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
