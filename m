Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8315C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:51:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17AF7204FD
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5DDdOmC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17AF7204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S65qM5SLicDvRRfCFEKEOD2B0x6E2FNDALN/Aq8xBRk=; b=h5DDdOmCIDmrGJueICGJOQEjA
	xAGv7RJZCyYrg0dGpkalR8qOGyTcK2Cm0AcSMCabxFFoKP3zyWRMa1C4zbCX4AeHDPLa3h4alNb5k
	k5gVjZi7RA2Lp/zaYmgSQjeMTQEufSZZ5Iy8sbX7xnlCEMghE40Kx6WQ3T1p+opNl0TESmZ41eoNE
	tGEPxD1DE0CJ1rLPK6o9k2Z5Mqjqx+Wkof69m4C/Xota3L/7Rnyw5sdd5kkI2/xACum2gq8qTBsch
	yNOuwtPRMcjrEx8mMqv7AFjamFSPF5+v4ulEhrgMX9Qu1tTGtJZZo0oW6BS1mcwbQOZvNx4BXs/EK
	NHVjvvU/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKTh-00039u-TY; Thu, 26 Nov 2020 16:50:41 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKTe-000393-P5
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 16:50:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C2ECACE0;
 Thu, 26 Nov 2020 16:50:37 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id BAA6A1E10D0; Thu, 26 Nov 2020 17:50:36 +0100 (CET)
Date: Thu, 26 Nov 2020 17:50:36 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 29/44] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201126165036.GO422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-30-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-30-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_115038_953674_48CB3B39 
X-CRM114-Status: GOOD (  24.57  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Chao Yu <yuchao0@huawei.com>,
 Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
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

On Thu 26-11-20 14:04:07, Christoph Hellwig wrote:
> Now that the hd_struct always has a block device attached to it, there is
> no need for having two size field that just get out of sync.
> 
> Additional the field in hd_struct did not use proper serializiation,
   ^^ Additionaly					^^^ serialization

> possibly allowing for torn writes.  By only using the block_device field
> this problem also gets fixed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Coly Li <colyli@suse.de>			[bcache]
> Acked-by: Chao Yu <yuchao0@huawei.com>			[f2fs]

Nice, just two nits below.

> @@ -47,18 +57,22 @@ static void disk_release_events(struct gendisk *disk);
>  bool set_capacity_and_notify(struct gendisk *disk, sector_t size)
>  {
>  	sector_t capacity = get_capacity(disk);
> +	char *envp[] = { "RESIZE=1", NULL };
>  
>  	set_capacity(disk, size);
> -	revalidate_disk_size(disk, true);
> -
> -	if (capacity != size && capacity != 0 && size != 0) {
> -		char *envp[] = { "RESIZE=1", NULL };
> -
> -		kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> -		return true;
> -	}
>  
> -	return false;
> +	/*
> +	 * Only print a message and send a uevent if the gendisk is user visible
> +	 * and alive.  This avoids spamming the log and udev when setting the
> +	 * initial capacity during probing.
> +	 */
> +	if (size == capacity ||
> +	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> +		return false;
> +	pr_info("%s: detected capacity change from %lld to %lld\n",
> +		disk->disk_name, size, capacity);
> +	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);

I think we don't want to generate resize event for changes from / to 0...
Also the return value of this function is now different.

> diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
> index 4e37fa9b409d52..a70c33c49f0960 100644
> --- a/drivers/target/target_core_pscsi.c
> +++ b/drivers/target/target_core_pscsi.c
> @@ -1027,12 +1027,7 @@ static u32 pscsi_get_device_type(struct se_device *dev)
>  
>  static sector_t pscsi_get_blocks(struct se_device *dev)
>  {
> -	struct pscsi_dev_virt *pdv = PSCSI_DEV(dev);
> -
> -	if (pdv->pdv_bd && pdv->pdv_bd->bd_part)
> -		return pdv->pdv_bd->bd_part->nr_sects;
> -
> -	return 0;
> +	return bdev_nr_sectors(PSCSI_DEV(dev)->pdv_bd);

I pdv_bd guaranteed to be non-NULL in pscsi_dev_virt?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
