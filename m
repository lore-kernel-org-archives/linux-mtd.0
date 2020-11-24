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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008DAC56201
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:46:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0C72083E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:46:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ux888eff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0C72083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sob29vukJPJ+ttddISKqak4tDehAD3rmqAnGeCeg2wI=; b=Ux888effZsmNyyt9TH0yd2dAn
	/7A/KYx9Yid+GcY8Y/bL4V8AxxWI7UIV82PRSYKwTFGFipBL5G8ohntYFhQLz/nqnOKWJ1XtYr8TJ
	dDCnO/w6H6JE4YxX9krYhSL6tlU8hLzR+b+TM2SQ5dfX3Ldett46q7Pp8e0NsJ0iNWAq+CORhFO0y
	tj5WZuMbQy9jmxhhy5HWjUKc6RjI34RGC+mTGAln/qi3jvIywI/4+0LqVrcIFVdwsbxVdXBf+BZVp
	kTN45PvfOepz54VxqLKSyZcTDvotgZq7S2tJ96cM05+wXbr7xS2rlI7h2ZOETfWilggMWsjKq0YpL
	V4Cq8cQJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYcy-000350-5q; Tue, 24 Nov 2020 13:45:04 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYUe-0002hk-6x
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 13:36:29 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61EB5AF33;
 Tue, 24 Nov 2020 13:34:22 +0000 (UTC)
Subject: Re: [PATCH 30/45] block: remove the nr_sects field in struct hd_struct
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-31-hch@lst.de>
From: Coly Li <colyli@suse.de>
Message-ID: <044dd4ec-c64d-3c5d-cf54-a4ca665b8912@suse.de>
Date: Tue, 24 Nov 2020 21:34:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-31-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_083628_434834_83071C60 
X-CRM114-Status: GOOD (  21.70  )
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
> Now that the hd_struct always has a block device attached to it, there is
> no need for having two size field that just get out of sync.
> 
> Additional the field in hd_struct did not use proper serializiation,
> possibly allowing for torn writes.  By only using the block_device field
> this problem also gets fixed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

For the bcache part, Acked-by: Coly Li <colyli@suse.de>

Thanks.

Coly Li

> ---
>  block/bio.c                        |  4 +-
>  block/blk-core.c                   |  2 +-
>  block/blk.h                        | 53 ----------------------
>  block/genhd.c                      | 55 +++++++++++-----------
>  block/partitions/core.c            | 17 ++++---
>  drivers/block/loop.c               |  1 -
>  drivers/block/nbd.c                |  2 +-
>  drivers/block/xen-blkback/common.h |  4 +-
>  drivers/md/bcache/super.c          |  2 +-
>  drivers/s390/block/dasd_ioctl.c    |  4 +-
>  drivers/target/target_core_pscsi.c |  7 +--
>  fs/block_dev.c                     | 73 +-----------------------------
>  fs/f2fs/super.c                    |  2 +-
>  fs/pstore/blk.c                    |  2 +-
>  include/linux/genhd.h              | 29 +++---------
>  kernel/trace/blktrace.c            |  2 +-
>  16 files changed, 60 insertions(+), 199 deletions(-)
> 
[snipped]

> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index c55d3c58a7ef55..04fa40868fbe10 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1408,7 +1408,7 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
>  			q->limits.raid_partial_stripes_expensive;
>  
>  	ret = bcache_device_init(&dc->disk, block_size,
> -			 dc->bdev->bd_part->nr_sects - dc->sb.data_offset,
> +			 bdev_nr_sectors(dc->bdev) - dc->sb.data_offset,
>  			 dc->bdev, &bcache_cached_ops);
>  	if (ret)
>  		return ret;
[snipped]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
