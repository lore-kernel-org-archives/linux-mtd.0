Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1497C46CD2
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1DVzawNmBICLLKbI89bvA3jHDd5qE3W+v8KVKc8f+Q=; b=vNz/oB9qmyY53U
	38hf+JfCQl2b0V9H2v7iwOfqLJSvRloJ3DmoodOmVrE2EEOZ9keGfwIXZhfujoKPv0SOoYJZ7WdkB
	xK3d6Bjmdei2lY8P0cEfir10GfFVHts23Hfo7LN8gnCHWyJ1erUpODRFEz+USt3tN0mdcNZMt97tb
	KJ4kFeWsUaxo82n0zPXcQdV5oZ8Wib25O2UIsShnxE/YN06LuUvasAG0Net06QVUtU808WDmINFVW
	imCMWcTO+hXdxU9QNHN1EHZUwH4q05Plx9gWjI0h5+gZWT92vC1C19N0N8oTrshw0iRbk2e6u4gS6
	hfsaU/qPpxCD86rEabJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgw8-008PKo-3D;
	Tue, 02 Jan 2024 15:44:13 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgw5-008PK5-1m
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 15:44:10 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7b8529ce303so122841939f.1
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2024 07:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1704210248; x=1704815048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9QVj7o90tQS3H4SwYTPIYauXLnJ6OU7xRh/0KG0CF0=;
        b=pIvJbtzCAKIXEAWfXXyOMykX0bPYi0gC9Cj356oYDSwFDCh6NNXR9cnU7DgcSLOgeK
         5+3W4UWndGLd08twxSMP0L9UKBX3qe3V1nCd4tNBKqDqOs0mEil9RHxc8QxUObJaIpLQ
         qe63dLXj+YsP7cSMSNSB9Rcv3PZWc/5swkSlC796D58sXE0cZv5QsHpzVh+R8ASQwEw3
         NU0KTcjfWYO9Qvep0wRNhQlAJmqzHJdmmYk6ZLkXZfTnee66mIBCAiRtKht2KTL47x7y
         NFKDh1CWYjyqOxAj3Ml142Zi1zSbxfjaj1lognSdcQZKF9uyfURYaSNBun6SYKADBoGW
         Mk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704210248; x=1704815048;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9QVj7o90tQS3H4SwYTPIYauXLnJ6OU7xRh/0KG0CF0=;
        b=bVpgRo16HuJzm2YWt4VjLZ17ekaE9njJ4mLcHzoS8FChG1T+Gw2l7IYWdyRgmSeEuQ
         PoCX5nB/4o9zOS7yxm6siTn8Os/75tZ8z0qbSBisDlPu2jqBybbhsA5j0A6rwIwk1b7q
         jWJoHc2bGjum/BMfhzKwbeqfzyjRnezwzNdML4tcy+dMbrzQfEh2pzRe+TNUiPJ8w59F
         OMLi6Y1clCtdtSl2WoSCK8TWD7Ln909J+XKZ2pANRZIsqpLzbxz9fka5uhmYFGyQGrBK
         /6pusL5ZOmp1JpLrFtUTtcXm0/MBjTsjNshgqHm1WhblwBXf8fzIjum7S5iFzOtGfLph
         iDeA==
X-Gm-Message-State: AOJu0YzKw4075O46MM1wVSy7Sje+C14tHdzbliUJEdbF75szyUEEkf3Y
	WrTxLMz7e7ksDAAu/MjueXPgS+wMHb1VwA==
X-Google-Smtp-Source: AGHT+IFaAhZehoDkL/Lq9ymm1RdzzKN/67q+7aSVQpGW7QGqOVV9a9BjzLBm4rE1KB/JklVJV2PhvA==
X-Received: by 2002:a6b:e916:0:b0:7ba:9b40:2648 with SMTP id u22-20020a6be916000000b007ba9b402648mr24056653iof.1.1704210248423;
        Tue, 02 Jan 2024 07:44:08 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca16-20020a0566381c1000b0046dcfbc1bc4sm496784jab.79.2024.01.02.07.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:44:07 -0800 (PST)
Message-ID: <f3758a5a-986f-485c-9a6b-c11af20c3aa5@kernel.dk>
Date: Tue, 2 Jan 2024 08:44:05 -0700
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
In-Reply-To: <400dbdbf-e99e-4747-94db-54fb6674fdd5@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_074409_656122_BB54BD90 
X-CRM114-Status: GOOD (  11.60  )
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

On 1/2/24 8:40 AM, Jens Axboe wrote:
> On 1/1/24 6:15 PM, Sergey Senozhatsky wrote:
>> On (23/12/28 07:55), Christoph Hellwig wrote:
>>>
>>> The discard granularity now defaults to a single sector, so don't set
>>> that value explicitly
>>
>> Hmm, but sector size != PAGE_SIZE
>>
>> [..]
>>
>>> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>>>  					ZRAM_LOGICAL_BLOCK_SIZE);
>>>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>>>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
>>> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;
> 
> Yep, that does indeed look buggy.

Ah no it's fine, it'll default to the sector size of the device, which
is set before the discard limit/granularity. So should work fine as-is.

-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
