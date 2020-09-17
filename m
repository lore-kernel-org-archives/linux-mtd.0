Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14930C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:46:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AAF120838
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fWIdLKZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AAF120838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PYGEhmTGp1KQr1KQHkwYERzfSgcDCN6JTwae3qTCwpk=; b=fWIdLKZwR/KDshMv0pHAXnSe6
	W4/eQP0hJDBO7g3hJ2RUtOOyYOAtTOXg/XnmHqu9PiVAywWkE0I/S9vMukHVTnHkRSbiLv1ezXfwH
	Da2iTWuHzKBk9VmJm01/gE/tVpPjMwiTw3PxXVJvTQwO4VmGg7wEJxMTypjFQwhAotUjFwKJ8utQY
	E50fZwFFUN22xB2hKYDSyh8hhE388dto+nn7zm5wTT2IyPvgWufFIu1Dz6XyWFRANbb45ULTi1Wu/
	qRvZYVki7xtt+4i/MINgRRe7OSERbEiM5tlF0Brq6D7uF7qwd4pHzuR0aLS67uryI+yrBw5CRcSvH
	bn1Fy40/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqUd-00058k-Uu; Thu, 17 Sep 2020 09:46:20 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqUa-00057U-Q0
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:46:17 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D705AFE5;
 Thu, 17 Sep 2020 09:46:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 5E80E1E12E1; Thu, 17 Sep 2020 11:46:15 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:46:15 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/12] drbd: remove dead code in device_to_statistics
Message-ID: <20200917094615.GI7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_054616_973358_98A53B29 
X-CRM114-Status: GOOD (  19.47  )
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
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:22, Christoph Hellwig wrote:
> Ever since the switch to blk-mq, a lower device not used for VM
> writeback will not be marked congested, so the check will never
> trigger.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/drbd/drbd_nl.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index 43c8ae4d9fca81..aaff5bde391506 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -3370,7 +3370,6 @@ static void device_to_statistics(struct device_statistics *s,
>  	if (get_ldev(device)) {
>  		struct drbd_md *md = &device->ldev->md;
>  		u64 *history_uuids = (u64 *)s->history_uuids;
> -		struct request_queue *q;
>  		int n;
>  
>  		spin_lock_irq(&md->uuid_lock);
> @@ -3384,11 +3383,6 @@ static void device_to_statistics(struct device_statistics *s,
>  		spin_unlock_irq(&md->uuid_lock);
>  
>  		s->dev_disk_flags = md->flags;
> -		q = bdev_get_queue(device->ldev->backing_bdev);
> -		s->dev_lower_blocked =
> -			bdi_congested(q->backing_dev_info,
> -				      (1 << WB_async_congested) |
> -				      (1 << WB_sync_congested));
>  		put_ldev(device);
>  	}
>  	s->dev_size = drbd_get_capacity(device->this_bdev);
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
