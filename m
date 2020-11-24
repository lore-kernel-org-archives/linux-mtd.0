Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6B5C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 19:38:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602F7206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 19:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LdMP1OUr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5LkT6+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 602F7206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uGdreTl3hvW29xbAKHdJuYgPKM6Dos9yyugDX629Z2c=; b=LdMP1OUrk8d17Gqf/fF0NRdZR
	r5U/98a4+zFn2EmsLfIWQosd+ULCGpxtKJUP8e7RuMiWaBA8s0rniqdB9l7YgHkZViSFi6aULhCKI
	94RDTGw1dZwr2YMHgVBhVa7TtAFsCtvKcxmT58rtVDmn27P1l7crlXb2e3J2rrK0GFTJdy8+oayRS
	EcIrifsySpJ6iVj7msQQtPWGZ//AdSIJUrD4YclfVPZSijNu2jUEfTIQgAFJKQeN7aH4ULuStpeNz
	VNqfnSNUXiDt5fl7PGnDy0rYxhRAnx/QU9OhG1VKHMRoffcaendV/BVfvo9eN7PEdffgz7NJK4Hf+
	IF3XNzLKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khe85-0007MI-1a; Tue, 24 Nov 2020 19:37:33 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khe81-0007LQ-NC
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 19:37:30 +0000
Received: by mail-qt1-x841.google.com with SMTP id p12so16966382qtp.7
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 11:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MOALJb5ZWPUh3aGAOfM0OVshborSGP7hJGfOxgGOGv8=;
 b=F5LkT6+P6W0m+3hlLX1OTdLAaWDWNPd5qU0zVXgoS6irqhQG1KPClCgLDacxdrz201
 tuSkOD3Pi7npw/jwH1Nvh11d7rq8LRNxgjQNm41OqnMYV7uCJqaXEwyai41Uj47dAbX3
 JK7du1QUlRFM6taLlQQ447SfHtDJsH8zezvU1GOUPlebgL174F6/7EsV7OtuCUoF3f9x
 Bkfc9gd/0KWs5FVV7usVufNl9+blVTvGwiyUy7osMlVAVbdFXgSTZohKeNl02jc4WQz4
 A0OAp0Qtsho7RAxf4m3roj9E2ZLkZ4zwUy7kn8kRWPQltha8Qf/YzRNO/2ELqU44tB/d
 HyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=MOALJb5ZWPUh3aGAOfM0OVshborSGP7hJGfOxgGOGv8=;
 b=ISwZIBP3rx80Ju66Cc7OvRFEgz15F2D9cKTb18it8BI1siajU0jrdDQ0psT5nwW0SM
 LvcPaRU55T+XtzreSyp6gkNJNnn+CMEybPlt3vxMl5dOzX0od2TrmEQXGWSLkd7u2ZqL
 NW5CzaOJuE9XjXUnaV+BoR+jx7mHIIHdCD2KgS9czPAM9PGJyLzxWm4sgWxyD7fyrkuz
 sP8V4WWAgoYit2kAyo8e6NzIwRqRCBb14jcPxCiWyxzRgOp5rvckALXR8Ww8s7nEluKe
 1/qYisT9+LAoBURQOTHonSunbikSMfsHaATjmErQ3DcQ3E89RJ+ejRZH2jRjMeyCuEB+
 lu3w==
X-Gm-Message-State: AOAM533aa9RRxNG87xp4vX4TviJ0wlOnepGMT/4qhbsfmClidysEv5hE
 iwzVa4Yr//d7/QtOXSOr940=
X-Google-Smtp-Source: ABdhPJybxY5/E0+KDq94c9P/N9IKjFDU+Ct8NW6WiHsGOrtJ7iW5aHJE2Msrh+VJOHLo1ru6UJnxSg==
X-Received: by 2002:ac8:7192:: with SMTP id w18mr6129290qto.149.1606246647881; 
 Tue, 24 Nov 2020 11:37:27 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id t126sm68819qkh.133.2020.11.24.11.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:37:27 -0800 (PST)
Date: Tue, 24 Nov 2020 14:37:05 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 23/45] block: remove i_bdev
Message-ID: <X71g4Tm+3RiRg4Gf@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-24-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-24-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_143729_839675_1C38444E 
X-CRM114-Status: GOOD (  19.78  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:29PM +0100, Christoph Hellwig wrote:
> Switch the block device lookup interfaces to directly work with a dev_t
> so that struct block_device references are only acquired by the
> blkdev_get variants (and the blk-cgroup special case).  This means that
> we not don't need an extra reference in the inode and can generally
     ^
     now
> simplify handling of struct block_device to keep the lookups contained
> in the core block layer code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
...
> @@ -1689,14 +1599,12 @@ static int blkdev_open(struct inode * inode, struct file * filp)
>  	if ((filp->f_flags & O_ACCMODE) == 3)
>  		filp->f_mode |= FMODE_WRITE_IOCTL;
>  
> -	bdev = bd_acquire(inode);
> -	if (bdev == NULL)
> -		return -ENOMEM;
> -
> +	bdev = blkdev_get_by_dev(inode->i_rdev, filp->f_mode, filp);
> +	if (IS_ERR(bdev))
> +		return PTR_ERR(bdev);
>  	filp->f_mapping = bdev->bd_inode->i_mapping;
>  	filp->f_wb_err = filemap_sample_wb_err(filp->f_mapping);
> -
> -	return blkdev_get(bdev, filp->f_mode, filp);
> +	return 0;
>  }

I was wondering whether losing the stale bdev flushing in bd_acquire() would
cause user-visible behavior changes but can't see how it would given that
userland has no way of holding onto a specific instance of block inode.
Maybe it's something worth mentioning in the commit message?

Other than that, for the block part:

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
