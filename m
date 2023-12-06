Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB8BC4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 06:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LW0i+A1DYM7W5U6hgFf9olNsdhVa8CFjj4RvGdXQ4g=; b=4EMi2zViOKcYjH
	zDTBYr5OuJDEWYY6indvspLbLrSV+oBP3ZA+Uv1OJodeV95+Kmx8kfMC9opNhGH5aFrE3h9/dsDh6
	/W7rCi1BkNh0lEcmFhrgS79O2PYSrnV2liEpLnhlQ5lSwGgW+CP3GrW93ZEIBWlsRA+V/s1Vl67Ww
	6YSxPyidp1trUj8gOTL0ojH69QUdIKMqIDihxlkMMLms0sMn4lGZywMgbrohlezjEOvBCCkQcMQlH
	EjnrxtVcVMybRONxVDGIV8JzLQkIUu2m8FeZnBifZwpDWytM6A9UticTLhL/Gd5j89s9UEV0qXV/6
	v+zBX+7n6c2yeLS/usIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlAZ-009B1q-2c;
	Wed, 06 Dec 2023 06:14:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlAW-009B0t-1J;
	Wed, 06 Dec 2023 06:14:00 +0000
Date: Tue, 5 Dec 2023 22:14:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Message-ID: <ZXARKD0OmjLrvHmU@infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205123728.1866699-2-yukuai1@huaweicloud.com>
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

> +void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
> +			   pgoff_t end)
> +{
> +	invalidate_mapping_pages(bdev->bd_inode->i_mapping, start, end);
> +}
> +EXPORT_SYMBOL_GPL(invalidate_bdev_range);

All these could probably use kerneldoc comments.

For this one I really don't like it existing at all, but we'll have to
discuss that in the btrfs patch.

> +loff_t bdev_size(struct block_device *bdev)
> +{
> +	loff_t size;
> +
> +	spin_lock(&bdev->bd_size_lock);
> +	size = i_size_read(bdev->bd_inode);
> +	spin_unlock(&bdev->bd_size_lock);
> +
> +	return size;
> +}
> +EXPORT_SYMBOL_GPL(bdev_size);

No need for this one.  The callers can simply use bdev_nr_bytes.

> +struct folio *bdev_read_folio(struct block_device *bdev, pgoff_t index)
> +{
> +	return read_mapping_folio(bdev->bd_inode->i_mapping, index, NULL);
> +}
> +EXPORT_SYMBOL_GPL(bdev_read_folio);
> +
> +struct folio *bdev_read_folio_gfp(struct block_device *bdev, pgoff_t index,
> +				  gfp_t gfp)
> +{
> +	return mapping_read_folio_gfp(bdev->bd_inode->i_mapping, index, gfp);
> +}
> +EXPORT_SYMBOL_GPL(bdev_read_folio_gfp);

I think we can just drop bdev_read_folio_gfp. Half of the callers simply
pass GPK_KERNEL, and the other half passes GFP_NOFS and could just use
memalloc_nofs_save().

> +void bdev_balance_dirty_pages_ratelimited(struct block_device *bdev)
> +{
> +	return balance_dirty_pages_ratelimited(bdev->bd_inode->i_mapping);
> +}
> +EXPORT_SYMBOL_GPL(bdev_balance_dirty_pages_ratelimited);

Hmm, this is just used for block2mtd, and feels a little too low-level
to me, as block2mtd really should be using the normal fileread/write
APIs.  I guess we'll have to live with it for now if we want to expedite
killing off bd_inode.

> +void bdev_correlate_mapping(struct block_device *bdev,
> +			    struct address_space *mapping)
> +{
> +	mapping->host = bdev->bd_inode;
> +}
> +EXPORT_SYMBOL_GPL(bdev_correlate_mapping);

Maybe associated insted of correlate?  Either way this basically
fully exposes the bdev inode again :(

> +gfp_t bdev_gfp_constraint(struct block_device *bdev, gfp_t gfp)
> +{
> +	return mapping_gfp_constraint(bdev->bd_inode->i_mapping, gfp);
> +}
> +EXPORT_SYMBOL_GPL(bdev_gfp_constraint);

The right fix here is to:

 - use memalloc_nofs_save in extet instead of using
   mapping_gfp_constraint to clear it from the mapping flags
 - remove __ext4_sb_bread_gfp and just have buffer.c helper that does
   the right thing (either by changing the calling conventions of an
   existing one, or adding a new one).

> +/*
> + * The del_gendisk() function uninitializes the disk-specific data
> + * structures, including the bdi structure, without telling anyone
> + * else.  Once this happens, any attempt to call mark_buffer_dirty()
> + * (for example, by ext4_commit_super), will cause a kernel OOPS.
> + * This is a kludge to prevent these oops until we can put in a proper
> + * hook in del_gendisk() to inform the VFS and file system layers.
> + */
> +int bdev_ejected(struct block_device *bdev)
> +{
> +	struct backing_dev_info *bdi = inode_to_bdi(bdev->bd_inode);
> +
> +	return bdi->dev == NULL;
> +}
> +EXPORT_SYMBOL_GPL(bdev_ejected);

And this code in ext4 should just go away entirely.  The bdi should
always be valid for a live bdev for years.

> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -1119,6 +1119,7 @@ void bio_add_folio_nofail(struct bio *bio, struct folio *folio, size_t len,
>  	WARN_ON_ONCE(off > UINT_MAX);
>  	__bio_add_page(bio, &folio->page, len, off);
>  }
> +EXPORT_SYMBOL_GPL(bio_add_folio_nofail);

How is this realted?  The export is fine, but really should be a
separate, well-documented commit.

>  
> +static inline u8 block_bits(struct block_device *bdev)
> +{
> +	return bdev->bd_inode->i_blkbits;
> +}

Not sure we should need this.  i_blkbits comes from the blocksize
the fs set, so it should have other ways to get at it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
