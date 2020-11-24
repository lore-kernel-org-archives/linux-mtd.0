Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFE1C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA9020872
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zi9xTlF8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XH4Pzcmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA9020872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jm0eAQjwdVp2EWjras/+mTfo8H7HJ1PmhiImw/3Qxhw=; b=zi9xTlF82AqtxNhlbfe8f39Ou
	NN9r9JEcNvJZHLPIckCiHVr+ZycNnM3erIZQ2GZmmr7PTqH49Hrky9sDFhUBs6Dq4akDZbDBHdzAA
	WPG6Cep4LI//T+tbFksPsQrSIvqZfP8agA7nC69KHJoOzjVuG+n77NVTyQy5tTcloXrwf2lcBppNU
	hfhGB8FjbfYbw6EzWdRwDjti00jmu46Dg7mdH+gtjbyA+iHyRf5uiyZBYwqAUm2JZDGzR3QUfjo2t
	UcOLJHC/gqKAfIDUSybkNLRwEZM6E8fTXsRZUOQANyWHpgmKBLtv40QZ8Kpzh+nhNlpYgSOtg6lyt
	EhBUwf0tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYij-0006VY-8b; Tue, 24 Nov 2020 13:51:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYYn-0000w7-FM
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=un9DEyVUx37cpbJb/awlWHqCuQcbNt/G4bo3/tFS5os=; b=XH4PzcmhnZakepLm64Y2ujWq/p
 2QDs+K1FadhHSgOLF64B17bC51RtNm05QjGEYwo07tc+RXQdlRhx9F8KEJKIErhAPkENv9NqUGNGs
 JosFASvpKWX87Qbhupc7iZPUCNXAlNwjIhDOKIuUiPUV6eUYiqtOandgVlchKRk5SNlnhymPYNYth
 PXmuAxh+uEm5r47XBuI53vQKXesCsj66Kgm/jx3zHyoxC16PCxBhVar8jbqSZAwkdLqyLrcRL4C4U
 tPN4/8SkUkhAEqzL8RTckeIPnqgxz3Dwqpfp419fCnrhKC99wdC9YessR+o9BJiOiW1w4QbjOMdZO
 qKOofsYw==;
Received: from mx2.suse.de ([195.135.220.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYYi-00089s-UZ
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 13:40:43 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8E43AC2D;
 Tue, 24 Nov 2020 13:38:37 +0000 (UTC)
Subject: Re: [PATCH 23/45] block: remove i_bdev
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-24-hch@lst.de>
From: Coly Li <colyli@suse.de>
Message-ID: <bbb4130b-6848-f2ed-b7e0-c86b68c2663a@suse.de>
Date: Tue, 24 Nov 2020 21:38:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-24-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_134041_217444_5ED06AC9 
X-CRM114-Status: GOOD (  22.50  )
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/24/20 9:27 PM, Christoph Hellwig wrote:
> Switch the block device lookup interfaces to directly work with a dev_t
> so that struct block_device references are only acquired by the
> blkdev_get variants (and the blk-cgroup special case).  This means that
> we not don't need an extra reference in the inode and can generally
> simplify handling of struct block_device to keep the lookups contained
> in the core block layer code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For the bcache part, Acked-by: Coly Li <colyli@suse.de>

Thanks.

Coly Li

> ---
>  block/ioctl.c                                |   3 +-
>  drivers/block/loop.c                         |   8 +-
>  drivers/md/bcache/super.c                    |  20 +-
>  drivers/md/dm-table.c                        |   9 +-
>  drivers/mtd/mtdsuper.c                       |  17 +-
>  drivers/target/target_core_file.c            |   6 +-
>  drivers/usb/gadget/function/storage_common.c |   8 +-
>  fs/block_dev.c                               | 195 +++++--------------
>  fs/btrfs/volumes.c                           |  13 +-
>  fs/inode.c                                   |   3 -
>  fs/internal.h                                |   7 +-
>  fs/io_uring.c                                |  10 +-
>  fs/pipe.c                                    |   5 +-
>  fs/quota/quota.c                             |  19 +-
>  fs/statfs.c                                  |   2 +-
>  fs/super.c                                   |  37 ++--
>  include/linux/blkdev.h                       |   2 +-
>  include/linux/fs.h                           |   1 -
>  18 files changed, 114 insertions(+), 251 deletions(-)
> 

[snipped]

> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index a6a5e21e4fd136..c55d3c58a7ef55 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -2380,38 +2380,38 @@ kobj_attribute_write(register,		register_bcache);
>  kobj_attribute_write(register_quiet,	register_bcache);
>  kobj_attribute_write(pendings_cleanup,	bch_pending_bdevs_cleanup);
>  
> -static bool bch_is_open_backing(struct block_device *bdev)
> +static bool bch_is_open_backing(dev_t dev)
>  {
>  	struct cache_set *c, *tc;
>  	struct cached_dev *dc, *t;
>  
>  	list_for_each_entry_safe(c, tc, &bch_cache_sets, list)
>  		list_for_each_entry_safe(dc, t, &c->cached_devs, list)
> -			if (dc->bdev == bdev)
> +			if (dc->bdev->bd_dev == dev)
>  				return true;
>  	list_for_each_entry_safe(dc, t, &uncached_devices, list)
> -		if (dc->bdev == bdev)
> +		if (dc->bdev->bd_dev == dev)
>  			return true;
>  	return false;
>  }
>  
> -static bool bch_is_open_cache(struct block_device *bdev)
> +static bool bch_is_open_cache(dev_t dev)
>  {
>  	struct cache_set *c, *tc;
>  
>  	list_for_each_entry_safe(c, tc, &bch_cache_sets, list) {
>  		struct cache *ca = c->cache;
>  
> -		if (ca->bdev == bdev)
> +		if (ca->bdev->bd_dev == dev)
>  			return true;
>  	}
>  
>  	return false;
>  }
>  
> -static bool bch_is_open(struct block_device *bdev)
> +static bool bch_is_open(dev_t dev)
>  {
> -	return bch_is_open_cache(bdev) || bch_is_open_backing(bdev);
> +	return bch_is_open_cache(dev) || bch_is_open_backing(dev);
>  }
>  
>  struct async_reg_args {
> @@ -2535,9 +2535,11 @@ static ssize_t register_bcache(struct kobject *k, struct kobj_attribute *attr,
>  				  sb);
>  	if (IS_ERR(bdev)) {
>  		if (bdev == ERR_PTR(-EBUSY)) {
> -			bdev = lookup_bdev(strim(path));
> +			dev_t dev;
> +
>  			mutex_lock(&bch_register_lock);
> -			if (!IS_ERR(bdev) && bch_is_open(bdev))
> +			if (lookup_bdev(strim(path), &dev) == 0 &&
> +			    bch_is_open(dev))
>  				err = "device already registered";
>  			else
>  				err = "device busy";
[snipped]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
