Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C3EC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:08:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB6F20B80
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cMQuSyDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB6F20B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TnmlUOewJ0i/rT0XeOEIh7zNV54L3DHqISYv3PC627U=; b=cMQuSyDEVcKv2TY+zb5O5O441
	PheOwIYvM3FnpGyvk/UeMiOzsAC7PHimFLv26T98XveDuvdh+gQaDGggyKPdiP0abBBRB2Ko4hqs6
	18XKG0Oa7FY2jU6uRnmKoxryzAkA16qLpYp5piHuwGoUXqDWdd4T3RXLW5Qf7O9ocINHzaHZPtOgB
	vHGcpthQ9iMYDvfAL/gSZ2QLpt+4wAeyRW30bZiLHP2UyAVHiYSsL67Opm74HfZaoapT7CBwsfY3R
	uSQmh9j9nUSBNa6GSMFqaaNe1prXcdegJB0px+DNTddHAZfEXdOd1+zT9EuXM0+CVKw3RcTAdjw8P
	w/sdI31yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiIsJ-0000uu-De; Thu, 26 Nov 2020 15:07:59 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiIsG-0000tj-GK
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 15:07:57 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E206ACE0;
 Thu, 26 Nov 2020 15:07:55 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2EBF11E10D0; Thu, 26 Nov 2020 16:07:55 +0100 (CET)
Date: Thu, 26 Nov 2020 16:07:55 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 22/44] block: opencode devcgroup_inode_permission
Message-ID: <20201126150755.GI422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-23-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-23-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_100756_674304_4B42A67C 
X-CRM114-Status: GOOD (  20.44  )
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

On Thu 26-11-20 14:04:00, Christoph Hellwig wrote:
> Just call devcgroup_check_permission to avoid various superflous checks
> and a double conversion of the access flags.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Tejun Heo <tj@kernel.org>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/block_dev.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index d0783c55a0ce65..b12ab68297baf3 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1516,15 +1516,13 @@ static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
>  	struct block_device *claiming;
>  	bool unblock_events = true;
>  	struct gendisk *disk;
> -	int perm = 0;
>  	int partno;
>  	int ret;
>  
> -	if (mode & FMODE_READ)
> -		perm |= MAY_READ;
> -	if (mode & FMODE_WRITE)
> -		perm |= MAY_WRITE;
> -	ret = devcgroup_inode_permission(bdev->bd_inode, perm);
> +	ret = devcgroup_check_permission(DEVCG_DEV_BLOCK,
> +			imajor(bdev->bd_inode), iminor(bdev->bd_inode),
> +			((mode & FMODE_READ) ? DEVCG_ACC_READ : 0) |
> +			((mode & FMODE_WRITE) ? DEVCG_ACC_WRITE : 0));
>  	if (ret)
>  		goto bdput;
>  
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
