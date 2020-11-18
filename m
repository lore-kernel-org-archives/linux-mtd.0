Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3FAC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:56:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 657622158C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ub1PR5dz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 657622158C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/dzur8VqD0JSQH+gmUq7ap+aHdNcsuZJ5YDp7F6BPC8=; b=Ub1PR5dzDlCj6mgcQhGm/u9IE
	j2+zMkvvco5z4vEKevegrI6vFLbS4R2BELi/+gt8GNq6AH83m6lKp1ivf+6Ifc+U1wkacmtMSr7py
	Ux6qg2NvA2AGuSuOCLml16myRelZYOE3TwikFILLDJHJykDfRdhrLnQVr1N7t+86fZ/V33VvZkGbI
	bm0Bkcsqm3kMQNiKNJA8sTX3ivgD+wNaS9wJMCvUF1pC/FgDqMqV6CJ5qFMKpBcVDo7DynpzBu2Qu
	kTZwtpU9Iy8XcWov+AxfOtzu0ldKmfWVhP/UlCnwKil3u3KHvoFGmDbPD/mzhkRH9iqAGZ3h4786d
	NOeqweK9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJF9-0003Bp-8d; Wed, 18 Nov 2020 08:55:11 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJEz-00032c-8o
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 08:55:04 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65CA0AD45;
 Wed, 18 Nov 2020 08:54:57 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-20-hch@lst.de>
From: Coly Li <colyli@suse.de>
Subject: Re: [PATCH 19/20] bcache: remove a superflous lookup_bdev all
Message-ID: <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
Date: Wed, 18 Nov 2020 16:54:51 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118084800.2339180-20-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_035501_487179_284C2764 
X-CRM114-Status: GOOD (  21.76  )
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
Cc: linux-bcache@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/18/20 4:47 PM, Christoph Hellwig wrote:
> Don't bother to call lookup_bdev for just a slightly different error
> message without any functional change.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>ist

Hi Christoph,

NACK. This removing error message is frequently triggered and observed,
and distinct a busy device and an already registered device is important
(the first one is critical error and second one is not).

Remove such error message will be a functional regression.

Coly Li

> ---
>  drivers/md/bcache/super.c | 44 +--------------------------------------
>  1 file changed, 1 insertion(+), 43 deletions(-)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index e5db2cdd114112..5c531ed7785280 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -2380,40 +2380,6 @@ kobj_attribute_write(register,		register_bcache);
>  kobj_attribute_write(register_quiet,	register_bcache);
>  kobj_attribute_write(pendings_cleanup,	bch_pending_bdevs_cleanup);
>  
> -static bool bch_is_open_backing(struct block_device *bdev)
> -{
> -	struct cache_set *c, *tc;
> -	struct cached_dev *dc, *t;
> -
> -	list_for_each_entry_safe(c, tc, &bch_cache_sets, list)
> -		list_for_each_entry_safe(dc, t, &c->cached_devs, list)
> -			if (dc->bdev == bdev)
> -				return true;
> -	list_for_each_entry_safe(dc, t, &uncached_devices, list)
> -		if (dc->bdev == bdev)
> -			return true;
> -	return false;
> -}
> -
> -static bool bch_is_open_cache(struct block_device *bdev)
> -{
> -	struct cache_set *c, *tc;
> -
> -	list_for_each_entry_safe(c, tc, &bch_cache_sets, list) {
> -		struct cache *ca = c->cache;
> -
> -		if (ca->bdev == bdev)
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
> -static bool bch_is_open(struct block_device *bdev)
> -{
> -	return bch_is_open_cache(bdev) || bch_is_open_backing(bdev);
> -}
> -
>  struct async_reg_args {
>  	struct delayed_work reg_work;
>  	char *path;
> @@ -2535,15 +2501,7 @@ static ssize_t register_bcache(struct kobject *k, struct kobj_attribute *attr,
>  				  sb);
>  	if (IS_ERR(bdev)) {
>  		if (bdev == ERR_PTR(-EBUSY)) {
> -			bdev = lookup_bdev(strim(path));
> -			mutex_lock(&bch_register_lock);
> -			if (!IS_ERR(bdev) && bch_is_open(bdev))
> -				err = "device already registered";
> -			else
> -				err = "device busy";
> -			mutex_unlock(&bch_register_lock);
> -			if (!IS_ERR(bdev))
> -				bdput(bdev);
> +			err = "device busy";
>  			if (attr == &ksysfs_register_quiet)
>  				goto done;
>  		}
> 




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
