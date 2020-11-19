Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC29C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 10:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38E422202
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 10:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DGEsP3O7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38E422202
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M50O34Bo+4/stE+aNMBFMeyab+J/5wyror3QFbguwTQ=; b=DGEsP3O7vImzVSMdxXkREEHx/
	f36xJKNdq2pUS7so4P2M2+gcmuFnAhrV+N0tr/JudRO5LWHhRVz7Nx+GLsKKET0NGPzhwWtrz7ATc
	e5YhgA+kqOQiqV9ppZQ575Oua0wUJNII1u4KqXnw3TRODgGRPhxJbgYkwiKRDiBQTF9+cDL5d5LAY
	HH6GpoMbozW0Z4KgZVdcKMMKyro2DcNvdgtLS3GjBrEzeX1tsaTy8BEJa2JGJxH+RtSSyHwSi0Rd7
	s9O8yI0l9TO0AgvOVv/k9tjwMDF1lwS8rHXE05Y36LDw3o8OjmFkHPlEDjSgMftbyOCmO+Nw+M+Mm
	SWDJJzQeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfhFK-0008Cu-8M; Thu, 19 Nov 2020 10:32:58 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfhFI-0008Br-1z
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 10:32:56 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3937FACBA;
 Thu, 19 Nov 2020 10:32:54 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D5CBE1E130B; Thu, 19 Nov 2020 11:32:53 +0100 (CET)
Date: Thu, 19 Nov 2020 11:32:53 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/20] block: remove ->bd_contains
Message-ID: <20201119103253.GV1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-14-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-14-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_053256_248570_4CAB121B 
X-CRM114-Status: GOOD (  22.17  )
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

On Wed 18-11-20 09:47:53, Christoph Hellwig wrote:
> Now that each hd_struct has a reference to the corresponding
> block_device, there is no need for the bd_contains pointer.  Add
> a bdev_whole() helper to look up the whole device block_device
> struture instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Just two nits below. Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

> @@ -1521,7 +1510,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
>  		if (bdev->bd_bdi == &noop_backing_dev_info)
>  			bdev->bd_bdi = bdi_get(disk->queue->backing_dev_info);
>  	} else {
> -		if (bdev->bd_contains == bdev) {
> +		if (!bdev->bd_partno) {

This should be !bdev_is_partition(bdev) for consistency, right?

>  			ret = 0;
>  			if (bdev->bd_disk->fops->open)
>  				ret = bdev->bd_disk->fops->open(bdev, mode);
...
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 0069bee992063e..453b940b87d8e9 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -32,7 +32,6 @@ struct block_device {
>  #ifdef CONFIG_SYSFS
>  	struct list_head	bd_holder_disks;
>  #endif
> -	struct block_device *	bd_contains;
>  	u8			bd_partno;
>  	struct hd_struct *	bd_part;
>  	/* number of times partitions within this device have been opened. */
> @@ -48,6 +47,9 @@ struct block_device {
>  	struct mutex		bd_fsfreeze_mutex;
>  } __randomize_layout;
>  
> +#define bdev_whole(_bdev) \
> +	((_bdev)->bd_disk->part0.bdev)
> +
>  #define bdev_kobj(_bdev) \
>  	(&part_to_dev((_bdev)->bd_part)->kobj)

I'd somewhat prefer if these helpers could actually be inline functions and
not macros. I guess they are macros because hd_struct isn't in blk_types.h.
But if we moved helpers to blkdev.h, we'd have all definitions we need...
Is that a problem for some users?

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
