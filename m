Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6154AC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 06:09:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEC72075A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 06:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AjMa46L0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCEC72075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JGLu5e4fdDfLRzIBB7iR6+KreU/jupJHKdMtLJHr5sc=; b=AjMa46L0FpNAx0xjVQI/70gBT
	fjmb7j39bTdoY2ndg2LXuVCbgFQz9Tk4kGVZ4L6PM1+k3G6GjV6wH43pOe8T1xGGXcFKssun1cdZF
	eIERb1ADz18+cYmNiQ/hsvNGSW6vEVOGXd8bbSeVuNcXCwK/j+R1GJW1BXtoGT7qxcwIx0U1QeFr0
	qr9LdVqFwsofjMSKe0M6POeJHxHLOjlDcfEU8h5JZ2Uq8pbZPd3ycMguP8LLA+glbPONTlFEMlcFt
	MzWzYpkR5S5ROcDGMf31V3QTckpCCzgtLPHvQmwD62ms270mjQnzF9S2XLntuUSziZaNfe3uq9siT
	vxEYyH6wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khnyK-00006e-MM; Wed, 25 Nov 2020 06:08:08 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khnyG-00005k-In
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 06:08:06 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cgr5m3R7Vzhh8Q;
 Wed, 25 Nov 2020 14:07:40 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:07:42 +0800
Subject: Re: [PATCH 04/45] fs: simplify freeze_bdev/thaw_bdev
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-5-hch@lst.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4ae2d8ca-e858-e5df-67ef-d14852978976@huawei.com>
Date: Wed, 25 Nov 2020 14:07:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-5-hch@lst.de>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_010804_892517_9EFC516E 
X-CRM114-Status: GOOD (  12.71  )
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
> Store the frozen superblock in struct block_device to avoid the awkward
> interface that can return a sb only used a cookie, an ERR_PTR or NULL.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> ---
>   drivers/md/dm-core.h      |  5 -----
>   drivers/md/dm.c           | 20 ++++++--------------
>   fs/block_dev.c            | 39 ++++++++++++++++-----------------------
>   fs/buffer.c               |  2 +-
>   fs/ext4/ioctl.c           |  2 +-
>   fs/f2fs/file.c            | 14 +++++---------

For f2fs part,

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>   fs/xfs/xfs_fsops.c        |  7 ++-----
>   include/linux/blk_types.h |  1 +
>   include/linux/blkdev.h    |  4 ++--
>   9 files changed, 34 insertions(+), 60 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
