Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FC6C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:55:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADBB206B5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtv5rM6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADBB206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6GJYUW5hGsgeBq8UR8CGRtPfZxYPL+CY+8Y/C/6ioSc=; b=qtv5rM6Beqj+cwfkEoYMLdWNM
	qKDyx3n/0JdFCrfB049DO5rHQIDyvDJz2htXLKH0kLpS1nd8GOh0tWqftoWbwA9e2v1xuyUKbw/4l
	HsiWkttlk6Dr+0SShifhsvyhf+twPGp3HSkJ5iFS4qlyjBwMrvRezfFn9gJSLXUYXnDXQTNo2jS5K
	EgQx9+4Npcuv5DC0J46YdRrq3UtidA6+7MhPkJ5JwOwvBS0eeTBUjlY8MhSi6DWyjrW+sj4ai512x
	2FsN6dU/LsuAJxjMw1bQaY9ibfbOHuWBoK5yFbr1suQxKp40b3QtxuHjanXQVPznGcn3L4Ue/cVSi
	8kyY7V7Jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqdD-0006dj-EZ; Thu, 17 Sep 2020 09:55:11 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqdA-0006cf-Iu
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:55:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40398AEC8;
 Thu, 17 Sep 2020 09:55:41 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0A4781E12E1; Thu, 17 Sep 2020 11:55:07 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:55:07 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/12] drbd: remove RB_CONGESTED_REMOTE
Message-ID: <20200917095507.GJ7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_055508_743142_ADFE2B56 
X-CRM114-Status: GOOD (  19.92  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:23, Christoph Hellwig wrote:
> This case isn't ever used.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Are you sure it's never used? As far as I'm reading drdb code the contents
of the disk_conf structure seems to be received through netlink (that code
is really a macro hell) and so read_balancing attribute passed to
remote_due_to_read_balancing() can have any value userspace passed to it.

								Honza

> ---
>  drivers/block/drbd/drbd_req.c | 4 ----
>  include/linux/drbd.h          | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
> index 5c975af9c15fb8..481bc34fcf386a 100644
> --- a/drivers/block/drbd/drbd_req.c
> +++ b/drivers/block/drbd/drbd_req.c
> @@ -901,13 +901,9 @@ static bool drbd_may_do_local_read(struct drbd_device *device, sector_t sector,
>  static bool remote_due_to_read_balancing(struct drbd_device *device, sector_t sector,
>  		enum drbd_read_balancing rbm)
>  {
> -	struct backing_dev_info *bdi;
>  	int stripe_shift;
>  
>  	switch (rbm) {
> -	case RB_CONGESTED_REMOTE:
> -		bdi = device->ldev->backing_bdev->bd_disk->queue->backing_dev_info;
> -		return bdi_read_congested(bdi);
>  	case RB_LEAST_PENDING:
>  		return atomic_read(&device->local_cnt) >
>  			atomic_read(&device->ap_pending_cnt) + atomic_read(&device->rs_pending_cnt);
> diff --git a/include/linux/drbd.h b/include/linux/drbd.h
> index 5755537b51b114..6a8286132751df 100644
> --- a/include/linux/drbd.h
> +++ b/include/linux/drbd.h
> @@ -94,7 +94,6 @@ enum drbd_read_balancing {
>  	RB_PREFER_REMOTE,
>  	RB_ROUND_ROBIN,
>  	RB_LEAST_PENDING,
> -	RB_CONGESTED_REMOTE,
>  	RB_32K_STRIPING,
>  	RB_64K_STRIPING,
>  	RB_128K_STRIPING,
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
