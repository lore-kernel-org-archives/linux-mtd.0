Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4478FC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 12:32:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B865A206E5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 12:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ky4Tf8V6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B865A206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dDvMDki+y62xnxFxOpngECqpxK6FQi2iuvqRIEvInLA=; b=ky4Tf8V64H7tccXKrMrd4G2b6
	HoOHBUJpHJ/HVVAM6UHneiPemFP49Tkpwo7q46dqiRybE3cNduxxMTL3mpRqo5p0yAeNjzge32mu0
	ps5+Xx8akJJFjfROcq7zJZbUMXspaEG8Zpami8t0g5BNZVi7AKoG8ll/wC+b5+ZAOg5CmxAVKAOQB
	NjaSs4MaCzT3BZ/06Sc4OMtTqJz1iUMt13cRqF08cF4VO+/rAQuoPlPjuMpNzvfSEzGxBR3VSIJiX
	WTZcdVFqiM6CFOFoQ4qxeJa9ExLlggWvaINtzxrdOaV+MpLA6WjyGsHjwUEygc/vwY9AGc7hBohz2
	OiEVy8LmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khtxR-0001nk-FA; Wed, 25 Nov 2020 12:31:37 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khtxO-0001mW-Di
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 12:31:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A34EAF0E;
 Wed, 25 Nov 2020 12:31:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 3DD711E130F; Wed, 25 Nov 2020 13:31:33 +0100 (CET)
Date: Wed, 25 Nov 2020 13:31:33 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/45] mtip32xx: remove the call to fsync_bdev on removal
Message-ID: <20201125123133.GI16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_073134_630341_C677DD67 
X-CRM114-Status: GOOD (  25.54  )
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
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 24-11-20 14:27:11, Christoph Hellwig wrote:
> del_gendisk already calls fsync_bdev for every partition, no need
> to do this twice.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Makes sense to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/mtip32xx/mtip32xx.c | 15 ---------------
>  drivers/block/mtip32xx/mtip32xx.h |  2 --
>  2 files changed, 17 deletions(-)
> 
> diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
> index 153e2cdecb4d40..53ac59d19ae530 100644
> --- a/drivers/block/mtip32xx/mtip32xx.c
> +++ b/drivers/block/mtip32xx/mtip32xx.c
> @@ -3687,7 +3687,6 @@ static int mtip_block_initialize(struct driver_data *dd)
>  	/* Enable the block device and add it to /dev */
>  	device_add_disk(&dd->pdev->dev, dd->disk, NULL);
>  
> -	dd->bdev = bdget_disk(dd->disk, 0);
>  	/*
>  	 * Now that the disk is active, initialize any sysfs attributes
>  	 * managed by the protocol layer.
> @@ -3721,9 +3720,6 @@ static int mtip_block_initialize(struct driver_data *dd)
>  	return rv;
>  
>  kthread_run_error:
> -	bdput(dd->bdev);
> -	dd->bdev = NULL;
> -
>  	/* Delete our gendisk. This also removes the device from /dev */
>  	del_gendisk(dd->disk);
>  
> @@ -3804,14 +3800,6 @@ static int mtip_block_remove(struct driver_data *dd)
>  	blk_mq_tagset_busy_iter(&dd->tags, mtip_no_dev_cleanup, dd);
>  	blk_mq_unquiesce_queue(dd->queue);
>  
> -	/*
> -	 * Delete our gendisk structure. This also removes the device
> -	 * from /dev
> -	 */
> -	if (dd->bdev) {
> -		bdput(dd->bdev);
> -		dd->bdev = NULL;
> -	}
>  	if (dd->disk) {
>  		if (test_bit(MTIP_DDF_INIT_DONE_BIT, &dd->dd_flag))
>  			del_gendisk(dd->disk);
> @@ -4206,9 +4194,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
>  	} while (atomic_read(&dd->irq_workers_active) != 0 &&
>  		time_before(jiffies, to));
>  
> -	if (!dd->sr)
> -		fsync_bdev(dd->bdev);
> -
>  	if (atomic_read(&dd->irq_workers_active) != 0) {
>  		dev_warn(&dd->pdev->dev,
>  			"Completion workers still active!\n");
> diff --git a/drivers/block/mtip32xx/mtip32xx.h b/drivers/block/mtip32xx/mtip32xx.h
> index e22a7f0523bf30..88f4206310e4c8 100644
> --- a/drivers/block/mtip32xx/mtip32xx.h
> +++ b/drivers/block/mtip32xx/mtip32xx.h
> @@ -463,8 +463,6 @@ struct driver_data {
>  
>  	int isr_binding;
>  
> -	struct block_device *bdev;
> -
>  	struct list_head online_list; /* linkage for online list */
>  
>  	struct list_head remove_list; /* linkage for removing list */
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
