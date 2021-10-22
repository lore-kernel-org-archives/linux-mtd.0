Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20EFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 09:02:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8016560F8F
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 09:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8016560F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLxi56v0gXB5FyWk4nFyITb/3VdfW2hkNEnoulUYdzM=; b=rha6FCzJwMJvqz
	MmruWGzVWfRDJNurjBkgjNQUXNetHtzObyJFzdSzI0Ng0bsCUDFm4g6bGN4Mf/DNsy+vWxiCjRDrt
	KjfdI5oH6AhzlBSzhoTPvMTml4RkLffGnj7jH4DLRTpgQoVQNJOwuR+qALbWdD04FIoSszEn+ptK5
	wd8edmm84rMlTKi92W3SQCMo+7clitTV+aEmQvn8vhbgPhELFDJ52IYXFUk5xKMWcWgpNQDWRSXFz
	6+h8rHaaugMB/OLX8cKAD0+kw3O1cH7jpi8zhY4kMGHMALx6I69wZTKJMVxjtXxio/jM5bGkBFMCB
	ksk88v3df2/yQSR8t5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqRD-00AIct-Ds; Fri, 22 Oct 2021 09:02:07 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqRA-00AIbg-V8
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 09:02:06 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A00702197A;
 Fri, 22 Oct 2021 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634893323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zL5TWf1TslKGkjBeFt55t2zjOugZfLksrwBt6Qx+crs=;
 b=JiyKm3wkru6q+8Sl1zyDZDaPoX98q1e/E+OBkJT480GzmUF/rvqlet0yPPj5PJFnGSA9ro
 stFezVkwiI3fEkal/AZdSa4uLIq1TTOMe19wWTrN0J/aCqJXSEwQ9A/gWmnIbdqNpHtXh6
 sm6oqmUAGtv1NaYtHuLseYQ83vUuB5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634893323;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zL5TWf1TslKGkjBeFt55t2zjOugZfLksrwBt6Qx+crs=;
 b=YWsU14voVP1mjzOhYe/BxIGTGGFVknMqTV95LiG6RpNDCX5NwIeRkzDkLfbVGlR9j9JGAD
 wEsSLINUXc/zg2Dw==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 7047DA3B81;
 Fri, 22 Oct 2021 09:02:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 23CD51E11B6; Fri, 22 Oct 2021 11:02:03 +0200 (CEST)
Date: Fri, 22 Oct 2021 11:02:03 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jan Kara <jack@suse.cz>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 5/5] mm: simplify bdi refcounting
Message-ID: <20211022090203.GF1026@quack2.suse.cz>
References: <20211021124441.668816-1-hch@lst.de>
 <20211021124441.668816-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021124441.668816-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_020205_179651_73F57F45 
X-CRM114-Status: GOOD (  24.16  )
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

On Thu 21-10-21 14:44:41, Christoph Hellwig wrote:
> Move grabbing and releasing the bdi refcount out of the common
> wb_init/wb_exit helpers into code that is only used for the non-default
> memcg driven bdi_writeback structures.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Can we perhaps add a comment to struct bdi_writeback definition (or maybe
wb_init()?) mentioning that it holds a reference to 'bdi' if it is
bdi_writeback struct for a cgroup? I don't see it mentioned anywhere and
now that you've changed the code, it isn't that obvious from the code
either... Otherwise the patch looks good so feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  mm/backing-dev.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index 768e9ae489f66..5ccb250898083 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -291,8 +291,6 @@ static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
>  
>  	memset(wb, 0, sizeof(*wb));
>  
> -	if (wb != &bdi->wb)
> -		bdi_get(bdi);
>  	wb->bdi = bdi;
>  	wb->last_old_flush = jiffies;
>  	INIT_LIST_HEAD(&wb->b_dirty);
> @@ -316,7 +314,7 @@ static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
>  
>  	err = fprop_local_init_percpu(&wb->completions, gfp);
>  	if (err)
> -		goto out_put_bdi;
> +		return err;
>  
>  	for (i = 0; i < NR_WB_STAT_ITEMS; i++) {
>  		err = percpu_counter_init(&wb->stat[i], 0, gfp);
> @@ -330,9 +328,6 @@ static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
>  	while (i--)
>  		percpu_counter_destroy(&wb->stat[i]);
>  	fprop_local_destroy_percpu(&wb->completions);
> -out_put_bdi:
> -	if (wb != &bdi->wb)
> -		bdi_put(bdi);
>  	return err;
>  }
>  
> @@ -373,8 +368,6 @@ static void wb_exit(struct bdi_writeback *wb)
>  		percpu_counter_destroy(&wb->stat[i]);
>  
>  	fprop_local_destroy_percpu(&wb->completions);
> -	if (wb != &wb->bdi->wb)
> -		bdi_put(wb->bdi);
>  }
>  
>  #ifdef CONFIG_CGROUP_WRITEBACK
> @@ -397,6 +390,7 @@ static void cgwb_release_workfn(struct work_struct *work)
>  	struct bdi_writeback *wb = container_of(work, struct bdi_writeback,
>  						release_work);
>  	struct blkcg *blkcg = css_to_blkcg(wb->blkcg_css);
> +	struct backing_dev_info *bdi = wb->bdi;
>  
>  	mutex_lock(&wb->bdi->cgwb_release_mutex);
>  	wb_shutdown(wb);
> @@ -416,6 +410,7 @@ static void cgwb_release_workfn(struct work_struct *work)
>  
>  	percpu_ref_exit(&wb->refcnt);
>  	wb_exit(wb);
> +	bdi_put(bdi);
>  	WARN_ON_ONCE(!list_empty(&wb->b_attached));
>  	kfree_rcu(wb, rcu);
>  }
> @@ -497,6 +492,7 @@ static int cgwb_create(struct backing_dev_info *bdi,
>  	INIT_LIST_HEAD(&wb->b_attached);
>  	INIT_WORK(&wb->release_work, cgwb_release_workfn);
>  	set_bit(WB_registered, &wb->state);
> +	bdi_get(bdi);
>  
>  	/*
>  	 * The root wb determines the registered state of the whole bdi and
> @@ -528,6 +524,7 @@ static int cgwb_create(struct backing_dev_info *bdi,
>  	goto out_put;
>  
>  err_fprop_exit:
> +	bdi_put(bdi);
>  	fprop_local_destroy_percpu(&wb->memcg_completions);
>  err_ref_exit:
>  	percpu_ref_exit(&wb->refcnt);
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
