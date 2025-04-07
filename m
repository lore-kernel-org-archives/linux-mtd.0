Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B4C369A3
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epCUjFe0XVS6HCUtEvCDkJb0ZE4vfIjSn1MP6Bm/qik=; b=m97xdVijBMHZvV
	t1JQscELhaHsiQAlk3z6hWvUn+hVdP9NhqEUDeYbzXioWOEFQ0wsTOkcf4+5CSd8vNQDQCFprbh8j
	T4EVUo9r/0U6MeH66I2y5wDmrTKKLs1zxteHHhRZPEginzi6zR1pHRuKm86a7vmrI8NZX29LQeOlE
	I1XF1CAXdqLdkSUIwpcWHhPqo+/6aJXQiG+9dA5cGQjxXSx/4QUPPNXRUAS6XF1qbEV0ES+22P8Rc
	MPt8SKvf7tSxynNwcJ8gQWAwOUjauOAYsEvSJS9Pr7diH7XXRbvHFKvn4KYahxdGwsnrD7VcsQrn1
	ahj0flsKwNJ7p9prnp4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o9S-00000000toi-38Bi;
	Mon, 07 Apr 2025 15:12:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n0W-00000000dEI-2EVH
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Apr 2025 13:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b+p7u5FdlfThNBRjpUxwLrX7JQ4X7Ee79QhKDIgPRZs=; b=SHdOVxK4cLm3ijaI91O3uHO4ja
	xYsEC4++5cjn/M+Zh8UXpKJof7CpnlZAO4BWj9P6efBA3ZNb5mfxybRaHqmuM1ABHlDjwuAZZ6Aqk
	1h5Fe+pDV4ghAlSK4H7X5UcqrGHlYdGVw7DP3gNCu2pdnkYosrUPsCU+ooZTNB8YMT+NOdWTv0/RO
	cHcXZ7mElBfoS26yqi4zHhF7wiRUmoe5kyG0uF434k+yqccWtDKM1lvWEffembkHrxKhGphn+9XDm
	kTrtA2YveQe42TGhuhPDhc1n+7E3EQ+OiLuxd3FZf57i6GVKH+z/PRYAGKd6uGzYLkwx7/WerWCda
	+6INjGLA==;
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n0T-00000007xo7-2ADr
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 13:59:23 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6eedceb2e7eso7515266d6.3
        for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2025 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744034358; x=1744639158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+p7u5FdlfThNBRjpUxwLrX7JQ4X7Ee79QhKDIgPRZs=;
        b=PtijQ1LQwaCIFgvOxLFfTy7M/wzneNzCtpU6DG3bi3L5KDjaO4IeXLmnS/qILGx04P
         d2Z0B2KxkGwNaVAxfHk0zcxbxa/tdQfGTEwvPk6sRfXWNbNqPYwAPPYYIYJV68P+hlK5
         K1safGnGbpLe1TSGxflJitjbEL7W1ROhcM/om0/f/Jz0b5GARP0j0g6ORV5fcdhGT6ZE
         fKdS/go6lQjYrjRJvmjGo16WNHd79j51oO2APLU3HlgUqFOe1fMc/tVubSu9pccUZ2k/
         oaR5GTTPGtt1HphRESlpEETl8ouNc/o1n6Q+dex0hEDdCpEfe4Kg/+ZBM8zylWBrDicX
         gGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034358; x=1744639158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+p7u5FdlfThNBRjpUxwLrX7JQ4X7Ee79QhKDIgPRZs=;
        b=QL/5TTW18BTWP8htBDfqaMdUhRmd2kALkPllUF/d9gjHufUOeV2MbYjZDSQTaSvdke
         1Ha95/tH8wl1rc9JNECPTI4kmU4dv79RnOxFnj2KflCBbfXuhFlP8KFLnjQb+tyaZiQo
         xhueWaPNF45TUnsf/GqvprXiL5CfjfYFhiEqkkFcwikTXr1qxjf0i3xduh2vPyKSjXDH
         DKoBzQPi5Bb7WlK2AFKTp5PZREQf05LOcUla0pdO0agbu0dXjLgx/HqZBkpHGMBImk+l
         c0UWFEJDhbYT49VDFKIWk9slCWn4kxqi2hx5gRbTDx9Kdgmtcor+zIQ7tkFDH3OoaGN9
         4z5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzGEwFN/2CMZt1JToppg6TgqsxIaBF7xnWwsb3YdhuvzzS7NIvmGg0AuzvJ3QHwRQnqdf+qIj4nus=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWfUgc6L9T5cZFatNBkmPFSB9U6sI71MedXUeuWyOD/W1T0f+v
	aTG0gVl63xt9kFVw6TH3aExzg9AZsfvsT/A1/0VQxs19N9Y0G+vM
X-Gm-Gg: ASbGncvgPuiz4kyU6SmgWtI61wvpaZp146kZSXGg/eaqQZ2T24GrzTxz07svDdNUPyZ
	wVCAkmijC22RQIQsk+LGqcbIIsVSIkzOIIs9izHAefFOPV6Y5jcIbywEWABCzNleOOcrnS4D7vt
	RvnSYIWuaP2qj1FmDt7uN46W7ijB1luM9Q7yEw/u9uqy7gJ0AZKLdf766pV1r2C0VBeaEBDEw9N
	yv4NrpsffkXQAHGStTUa7Tux6GXFnvqlXVj0Lv/BKBm2l8EfqVtyevd504cCLGtqpHfTA/YsJZX
	+Zsi1jBAz7cF6auN+4Npo5wF6wAG8+82ZAk9yUpSIcZrgmoQmxDLBTskbMIIXisJlYFZ9pXXy1P
	4eLReNqti4qPE7j5R8uN/
X-Google-Smtp-Source: AGHT+IEcQkEG7UiDHZ8FfbWwLtLbiboJYSgLM4hyRK7ffo3V8W1s4yWgT3tOy+x7J0LtvNUUUMS1zQ==
X-Received: by 2002:a05:6214:2486:b0:6e8:f589:ee3c with SMTP id 6a1803df08f44-6f00deee8admr57938826d6.4.1744034358460;
        Mon, 07 Apr 2025 06:59:18 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-176-137.washdc.fios.verizon.net. [108.48.176.137])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f1501ccsm58215336d6.118.2025.04.07.06.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:59:18 -0700 (PDT)
Message-ID: <28cd9608-5c62-7acc-ed52-41c9a74e8724@gmail.com>
Date: Mon, 7 Apr 2025 09:59:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: bio segment constraints
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <Z_N5nxLDOBb5NDAM@infradead.org>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <Z_N5nxLDOBb5NDAM@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_145921_717641_8D82DB7F 
X-CRM114-Status: GOOD (  38.10  )
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

On 4/7/25 03:07, Christoph Hellwig wrote:
> On Sun, Apr 06, 2025 at 03:40:04PM -0400, Sean Anderson wrote:
>> Hi all,
>>
>> I'm not really sure what guarantees the block layer makes regarding the
>> segments in a bio as part of a request submitted to a block driver. As
>> far as I can tell this is not documented anywhere. In particular,
> 
> First you need to define what segment you mean.  We have at least two and
> a half historical uses of the name.  One is for each bio_vec attached to
> the bio, either directly as submitted into ->submit_bio for bio based
> drivers (case 1a), or generated by bio_split_to_limits (case 1b), which
> is called for every blk-mq driver before calling into ->queue_rq(s) or
> explicitly called by a few bio based driver.
> 
> The other is the bio-vec synthesized by bio_for_each_segment (case 2).

I'm referring to the bio_vecs you get from queue_mq. Which I think is the
latter.

>> - Is bv_len aligned to SECTOR_SIZE?
> 
> Yes.
> 
>> - To logical_sector_size?
> 
> Yes.

OK, but...

>> - What if logical_sector_size > PAGE_SIZE?
> 
> Still always aligned to logical_sector_size.
> 
>> - What about bv_offset?
> 
> bv_offset is a memory offset and must only be aligned to the
> dma_alignment limit.
> 
>> - Is it possible to have a bio where the total length is a multiple of
>>    logical_sector_size, but the data is split across several segments
>>    where each segment is a multiple of SECTOR_SIZE?
> 
> Yes.

...if this is the case, then for some of those segments wouldn't bv_len
not be a multiple of logical_sector_size?

>> - Is is possible to have segments not even aligned to SECTOR_SIZE?
> 
> No.
> 
>> - Can I somehow request to only get segments with bv_len aligned to
>>    logical_sector_size?
> 
> For drivers that use bio_split_to_limits implicitly or explicitly you can
> do that by setting the right seg_boundary_mask.

Is that the right knob? It operates on the physical address, so it looked
more like something for broken DMA engines. For example (if I recall correctly)
MMC SDMA can't cross a page boundary, so you could use seg_boundary_mask to
enforce that.

>> make some big assumptions (which might be bugs?) For example, in
>> drivers/mtd/mtd_blkdevs.c, do_blktrans_request looks like:
> 
>> - There is only one bio in a request. This one is a bit of a soft
>>    assumption since we should only flush the pages in the bio and not the
>>    whole request otherwise.
> 
> It always operates on the first bio in the request and then uses
> blk_update_request to move the context past that.  It is an old
> and somewhat arkane way to write drivers, but should work.  The
> rq_for_each_segment looks do call flush_dcache_page look horribly
> wrong for this model, though.
> 
>> - The data is in lowmem OR bv_offset + bv_len <= PAGE_SIZE. kmap() only
>>    maps a single page, so if we go past one page we end up in adjacent
>>    kmapped pages.
> 
> Yes, this looks broken.
> 
>> Am I missing something here? Handling highmem seems like a persistent
>> issue. E.g. drivers/mtd/ubi/block.c doesn't even bother doing a kmap.
>> Should both of these have BLK_FEAT_BOUNCE_HIGH?
> 
> BLK_FEAT_BOUNCE_HIGH needs to go away rather sooner than later.
> 
> in the short run the best fix would be to synthesized a
> bio_for_each_segment like bio_vec that stays inside a single page
> using bio_iter_iovec) at the top of do_blktrans_request and use
> that for all references to the data.
> 

OK, but if you have to stay inside a single page couldn't you end up
with a sector spanning a page boundary due to only being aligned to
dma_alignment? Or maybe we set seg_boundary_mask to PAGE_MASK to enforce that?

--Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
