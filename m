Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA08C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 06:12:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08F4F208CA
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 06:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="asuFyRd2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08F4F208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7phfA2qbI+EnxcgLhXgflAa4bWDwPLJQuMa9JSHK3eM=; b=asuFyRd2H1V9Kk5nEvhYs5xwc
	filfOrInlvIPFFJlXW49ntK58ZoaFV8P5Bse32T5m5YlNIYC8ltpnSsIWf+UJguGXxyqwrqrB20wn
	03FBOI4LqTXs4V07RsXjFc8QaZl6W8jmH/2+xdaTinoCJl/YEpB2ScA/waUfVkH0JVZ4AiiJNQKGZ
	nKxiJStkjlmcFP1iMyRHmihLkenaI6PF6KHE97XqQeV1onsxOrrRqbheJ74L6lUNugqXKTppc0X8+
	9YD/boY4zelyRsmy0G9mWgPYj3Qy3xh93sJE1yJbt3ud4AP5a6DccjJ1YMois9iJm1DWdTr80yHXW
	pYViR5MGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kho1q-0000Uk-Uv; Wed, 25 Nov 2020 06:11:47 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kho1n-0000So-L1
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 06:11:44 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CgrB346lSzhfQ7;
 Wed, 25 Nov 2020 14:11:23 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:11:36 +0800
Subject: Re: [PATCH 38/45] block: switch partition lookup to use struct
 block_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-39-hch@lst.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fec5c478-c7cb-ce29-a35d-3474fae1c96d@huawei.com>
Date: Wed, 25 Nov 2020 14:11:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-39-hch@lst.de>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_011144_012398_BE8AC44B 
X-CRM114-Status: GOOD (  12.48  )
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
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/11/24 21:27, Christoph Hellwig wrote:
> Use struct block_device to lookup partitions on a disk.  This removes
> all usage of struct hd_struct from the I/O path, and this allows removing
> the percpu refcount in struct hd_struct.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> ---
>   block/bio.c                        |  4 +-
>   block/blk-core.c                   | 66 ++++++++++++++----------------
>   block/blk-flush.c                  |  2 +-
>   block/blk-mq.c                     |  9 ++--
>   block/blk-mq.h                     |  7 ++--
>   block/blk.h                        |  4 +-
>   block/genhd.c                      | 56 +++++++++++++------------
>   block/partitions/core.c            |  7 +---
>   drivers/block/drbd/drbd_receiver.c |  2 +-
>   drivers/block/drbd/drbd_worker.c   |  2 +-
>   drivers/block/zram/zram_drv.c      |  2 +-
>   drivers/md/bcache/request.c        |  4 +-
>   drivers/md/dm.c                    |  4 +-
>   drivers/md/md.c                    |  4 +-
>   drivers/nvme/target/admin-cmd.c    | 20 ++++-----
>   fs/ext4/super.c                    | 18 +++-----
>   fs/ext4/sysfs.c                    | 10 +----
>   fs/f2fs/f2fs.h                     |  2 +-
>   fs/f2fs/super.c                    |  6 +--

For f2fs part,

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>   include/linux/blkdev.h             |  8 ++--
>   include/linux/genhd.h              |  4 +-
>   include/linux/part_stat.h          | 17 ++++----
>   22 files changed, 120 insertions(+), 138 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
