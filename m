Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCF9C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:46:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C7521D40
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C5PlJvL0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C7521D40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1/fEWhWgBXz3uiA8i60MW/WW9Dj5v/pyBeUoRF5nq10=; b=C5PlJvL02NpgW/Pasg0brpogn
	R+RZzKRR87Sg5oPxIIUnULo5GqRCMmfZc5ZbeVRRKa4/eB3a557w8lVb/AzM/BeB1SYNmRvtsk2NF
	iFaTuooZqn6b4t6H9dW+JNDE27FrAMSXtfH8r8oz8wZHmoYvAZmuhMpcP37IqS0kd39PxB63rODKn
	yFTATGt41lTn5BfMwq/rOcRMR9SD8TbSEd3x5/6KGEYguU/QkBJLiXeYIbT5pp9QoXEKjgQ7ZEfdk
	r4mLWY0tk3CXkT1ns4aSLtrVO0aCEt/tjAkSZkrkX2WuMuJwWo5oavijjAhO0UrhOBqAVDGvdYJD0
	jdsy48o2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiJSd-0006PX-3T; Thu, 26 Nov 2020 15:45:31 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiJSb-0006P5-An
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 15:45:30 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41B9FAD20;
 Thu, 26 Nov 2020 15:45:28 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C71901E10D0; Thu, 26 Nov 2020 16:45:27 +0100 (CET)
Date: Thu, 26 Nov 2020 16:45:27 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 23/44] block: remove i_bdev
Message-ID: <20201126154527.GJ422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-24-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-24-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_104529_545362_38E8657A 
X-CRM114-Status: GOOD (  22.48  )
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
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 26-11-20 14:04:01, Christoph Hellwig wrote:
> Switch the block device lookup interfaces to directly work with a dev_t
> so that struct block_device references are only acquired by the
> blkdev_get variants (and the blk-cgroup special case).  This means that
> we now don't need an extra reference in the inode and can generally
> simplify handling of struct block_device to keep the lookups contained
> in the core block layer code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Tejun Heo <tj@kernel.org>
> Acked-by: Coly Li <colyli@suse.de>		[bcache]

Looks good to me. Just two nits about comments below. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

>  /**
> - * blkdev_get - open a block device
> - * @bdev: block_device to open
> + * blkdev_get_by_dev - open a block device by device number
> + * @dev: device number of block device to open
>   * @mode: FMODE_* mask
>   * @holder: exclusive holder identifier
>   *
> - * Open @bdev with @mode.  If @mode includes %FMODE_EXCL, @bdev is
> - * open with exclusive access.  Specifying %FMODE_EXCL with %NULL
> - * @holder is invalid.  Exclusive opens may nest for the same @holder.
> + * Open the block device described by device number @dev.  If @mode includes
> + * If @mode includes %FMODE_EXCL, the block device is opened with exclusive
      ^^^ twice "If @mode includes" - here and on previous line...

...
> @@ -776,19 +770,6 @@ struct super_block *__get_super(struct block_device *bdev, bool excl)
>  	return NULL;
>  }
>  
> -/**
> - *	get_super - get the superblock of a device
> - *	@bdev: device to get the superblock for
> - *
> - *	Scans the superblock list and finds the superblock of the file system
> - *	mounted on the device given. %NULL is returned if no match is found.
> - */

I think it would be nice to preserve this comment?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
