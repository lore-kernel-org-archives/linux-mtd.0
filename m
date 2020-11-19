Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB134C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 09:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B94024686
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 09:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ay55ncuO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B94024686
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g69KBq8N0Tk+/hRkuJoQZq+A/whHJgksTnhQwR1eE1g=; b=ay55ncuOITNEsqjwYBwZC5DlX
	/4llFuMvby36sS/A7Y8dI4bLmoL9IPZr9sV+0adG7IZBmzqpx7BPZd+R4GbCs7PlMjto1y2qO6vmj
	wjYl72o3bmIvYH5J+wFNT04RTSa2aB3G5xaSNeu3yOx4vj8ADn7zIXq3U6XQ80DEThwWkjC/kMCla
	k+F3yXKZdbj8riNAXsD8/6K7tqjTXgyigsCRnHZmH4GgYBf2NmuDJeV/uySG0eKqXSxdG5+Y4eswn
	excptQHlwOTpt6DaTcplY/kmGnb/MGjrasOjWVPesNfUCqIsP2mBG/sji+KEGo5+2bm2dLRIBj/ex
	ArrvcXxOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfgS1-0002hM-TA; Thu, 19 Nov 2020 09:42:01 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfgRy-0002fy-Vn
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 09:41:59 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3791AC98;
 Thu, 19 Nov 2020 09:41:57 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 286A51E1303; Thu, 19 Nov 2020 10:41:57 +0100 (CET)
Date: Thu, 19 Nov 2020 10:41:57 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <20201119094157.GT1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-12-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_044159_166828_53C50D98 
X-CRM114-Status: GOOD (  24.73  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed 18-11-20 09:47:51, Christoph Hellwig wrote:
> To simplify block device lookup and a few other upcomdin areas, make sure
> that we always have a struct block_device available for each disk and
> each partition.  The only downside of this is that each device and
> partition uses a little more memories.  The upside will be that a lot of
				^^^ memory

> code can be simplified.
> 
> With that all we need to look up the block device is to lookup the inode
> and do a few sanity checks on the gendisk, instead of the separate lookup
> for the gendisk.
> 
> As part of the change switch bdget() to only find existing block devices,
> given that we know that the block_device structure must be allocated at
> probe / partition scan time.
> 
> blk-cgroup needed a bit of a special treatment as the only place that
> wanted to lookup a gendisk outside of the normal blkdev_get path.  It is
> switched to lookup using the block device hash now that this is the
> primary lookup path.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me and I like the simplifications! I've found just
one small issue below.

> @@ -1748,16 +1600,18 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
>  	if (!disk)
>  		return NULL;
>  
> +	disk->part0.bdev = bdev_alloc(disk, 0);
> +	if (!disk->part0.bdev)
> +		goto out_free_disk;
> +
>  	disk->part0.dkstats = alloc_percpu(struct disk_stats);
>  	if (!disk->part0.dkstats)
> -		goto out_free_disk;
> +		goto out_bdput;
>  
>  	init_rwsem(&disk->lookup_sem);
>  	disk->node_id = node_id;
> -	if (disk_expand_part_tbl(disk, 0)) {
> -		free_percpu(disk->part0.dkstats);
> -		goto out_free_disk;
> -	}
> +	if (disk_expand_part_tbl(disk, 0))
> +		goto out_free_bdstats;
>  
>  	ptbl = rcu_dereference_protected(disk->part_tbl, 1);
>  	rcu_assign_pointer(ptbl->part[0], &disk->part0);
> @@ -1772,8 +1626,10 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
>  	 * converted to make use of bd_mutex and sequence counters.
>  	 */
>  	hd_sects_seq_init(&disk->part0);
> -	if (hd_ref_init(&disk->part0))
> -		goto out_free_part0;
> +	if (hd_ref_init(&disk->part0)) {
> +		hd_free_part(&disk->part0);

Aren't you missing kfree(disk) here?

> +		return NULL;
> +	}
>  
>  	disk->minors = minors;
>  	rand_initialize_disk(disk);

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
