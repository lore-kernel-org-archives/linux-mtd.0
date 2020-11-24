Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4B1C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:01:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E579206D8
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pCKuhy0z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkS1IsRK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E579206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qPLzBA4KSwzQ6F0FTcRGx9WFXLwksTSNcMD31GP14Go=; b=pCKuhy0zbBnp9wGb/OrLS/MFN
	0yA0muHRNPzyQP+hW8WvrlGVobpMETCJ2WH0TAHtjAjCAy1MHLdWgNuQpAUW3geG7nL9QU76704kK
	CEVYTFJ50aidcy5PUNaKrUeKpkf+1p8mhQ9MqzxUtIh7OgjFTGepC9AQ9jOFC9/FKxCd//uVT2fjw
	8XhtJ7LTFzaIFbA3DPSvLzILrPsAfpNpPrGyhhWNgRaKI37jUT1qTffgtXID06RMUlXGUF9thWCuX
	nWd4vBeEOvOpxhkUBtZS5DSzg1P95FwybFgWWgg9ypBUhxqoTRT5fwlG1kb4sDhbOq59xxHIppL0g
	5PAMmdSYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khbfw-0006IP-3R; Tue, 24 Nov 2020 17:00:20 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khbfq-0006FY-DP
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:00:18 +0000
Received: by mail-qt1-x843.google.com with SMTP id v11so16515082qtq.12
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fWmahOo+BxCVV9NEre8zWFBYKORZfhSvfmLWizAk7Sk=;
 b=pkS1IsRKMFFQKIiQOFY8WLSirKTKy5vlf5vBnIHJQYY8QvEC/15BTkG00rjnGztDPS
 MPnwXECAwJubj26/AKIoLsOqJXTzH20co1dwm6n/ihZPA8R/GncgR5Nn7BAW2WaJHH5L
 tpbCDHrNvMRBQDAisHHKNo7eGDqcuHeaFIgkH8ZC9CSiQc7xH6mkLcfA+jtEEIACMHfa
 u3OVfgqj6hqatE6LBJWSWupUvafe+983boP6OtbOOXJy3CJYXaRV2xsgTTuY8gHl3o7O
 iFEoPfxU2lYaOEolDJw8+Asj3AIZ8QN2eniPlD554d4692r1CYqrwtcGwNWS1nLFzZNO
 sY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=fWmahOo+BxCVV9NEre8zWFBYKORZfhSvfmLWizAk7Sk=;
 b=RKWHTqbkE9a2FjNw25xEOSEvpB2Zu5RQWOaSrH4P+Ca7Boyzn7BKFoZP1KaIxcfTHe
 Dip4HFDGF/nuQORMC2r1GLar67DHVWs0steb4zPRUwEqrRKxo9ZoVlc2m0qtySUk6ZvM
 /V4v8tiOb8SSmR9vn0JA4Y965RZWTu4L9IcRwkw5Vk5XDSxkoJrqP09720TvunFjnFvR
 DVbujkUiWnaXoWdTlD2GqeDNPqc3dQkJe2Phso/ODrgJEnm9FElvDhzuyWLFQO9yGkGn
 3v41YMWADtajJG4Xx8n9bjL/X+XiIc9yyq//6SloCN3HhSpR3jCiXakcM7e9gzNYGz6Q
 /KRA==
X-Gm-Message-State: AOAM5329pN8A+uG/gdHrBu3SC6gLPQG90wpI/goSuRscH5T/it4fN0Jm
 hGmdH5+0fxiQfs+K2pc7J4c=
X-Google-Smtp-Source: ABdhPJw9lXoUdb+9nSlmHwoziLxai+Rt3I7zgIJ1oTBqcvjWZC4/0fG7FN8qIJjp6NzaYQdsfu0bWw==
X-Received: by 2002:a05:622a:18d:: with SMTP id
 s13mr5279508qtw.306.1606237211875; 
 Tue, 24 Nov 2020 09:00:11 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id q20sm13543500qke.0.2020.11.24.09.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:00:11 -0800 (PST)
Date: Tue, 24 Nov 2020 11:59:49 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <X708BTJ5njtbC2z1@mtj.duckdns.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-12-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_120014_694933_F5694D97 
X-CRM114-Status: GOOD (  22.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This is great. So much simpler & better. Some nits below.

> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index a02e224115943d..0ba0bf44b88af3 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -340,12 +340,11 @@ void delete_partition(struct hd_struct *part)
>  	device_del(part_to_dev(part));
>  
>  	/*
> -	 * Remove gendisk pointer from idr so that it cannot be looked up
> -	 * while RCU period before freeing gendisk is running to prevent
> -	 * use-after-free issues. Note that the device number stays
> -	 * "in-use" until we really free the gendisk.
> +	 * Remove the block device from the inode hash, so that it cannot be
> +	 * looked up while waiting for the RCU grace period.
>  	 */
> -	blk_invalidate_devt(part_devt(part));
> +	remove_inode_hash(part->bdev->bd_inode);

I don't think this is necessary now that the bdev and inode lifetimes are
one. Before, punching out the association early was necessary because we
could be in a situation where we can successfully look up a part from idr
and then try to pin the associated disk which may already be freed. With the
new code, the lookup is through the inode whose lifetime is one and the same
with gendisk, so use-after-free isn't possible and __blkdev_get() will
reliably reject such open attempts.

...
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 4c4d6c30382c06..e94633dc6ad93b 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -870,34 +870,50 @@ void __init bdev_cache_init(void)
>  	blockdev_superblock = bd_mnt->mnt_sb;   /* For writeback */
>  }
>  
> -static struct block_device *bdget(dev_t dev)
> +struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
>  {
>  	struct block_device *bdev;
>  	struct inode *inode;
>  
> -	inode = iget_locked(blockdev_superblock, dev);
> +	inode = new_inode(blockdev_superblock);
>  	if (!inode)
>  		return NULL;
>  
> -	bdev = &BDEV_I(inode)->bdev;
> +	bdev = I_BDEV(inode);
> +	spin_lock_init(&bdev->bd_size_lock);
> +	bdev->bd_disk = disk;
> +	bdev->bd_partno = partno;
> +	bdev->bd_contains = NULL;
> +	bdev->bd_super = NULL;
> +	bdev->bd_inode = inode;
> +	bdev->bd_part_count = 0;
> +
> +	inode->i_mode = S_IFBLK;
> +	inode->i_rdev = 0;
> +	inode->i_bdev = bdev;
> +	inode->i_data.a_ops = &def_blk_aops;

Missing the call to mapping_set_gfp_mask().

>  
> -	if (inode->i_state & I_NEW) {
> -		spin_lock_init(&bdev->bd_size_lock);
> -		bdev->bd_contains = NULL;
> -		bdev->bd_super = NULL;
> -		bdev->bd_inode = inode;
> -		bdev->bd_part_count = 0;
> -		bdev->bd_dev = dev;
> -		inode->i_mode = S_IFBLK;
> -		inode->i_rdev = dev;
> -		inode->i_bdev = bdev;
> -		inode->i_data.a_ops = &def_blk_aops;
> -		mapping_set_gfp_mask(&inode->i_data, GFP_USER);
> -		unlock_new_inode(inode);
> -	}
>  	return bdev;
>  }
...
>  /**
>   * bdgrab -- Grab a reference to an already referenced block device
>   * @bdev:	Block device to grab a reference to.
> @@ -957,6 +973,10 @@ static struct block_device *bd_acquire(struct inode *inode)
>  		bd_forget(inode);
>  
>  	bdev = bdget(inode->i_rdev);
> +	if (!bdev) {
> +		blk_request_module(inode->i_rdev);
> +		bdev = bdget(inode->i_rdev);
> +	}

One side effect here is that, before, a device which uses the traditional
consecutive devt range would reserve all minors for the partitions whether
they exist or not and fail open requests without requesting the matching
module. After the change, trying to open an non-existent partition would
trigger module probe. I don't think the behavior change is consequential in
any sane not-crazily-arcane setup but it might be worth mentioning in the
commit log.

Thank you.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
