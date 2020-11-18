Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B911C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885F4246CE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 21:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0gxTYp2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 885F4246CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2fHbI4TKrrt4oHsFYI5CIY9qJ2XZb5Rm38TzEtfS8kM=; b=g0gxTYp27Xj/l2QYECRcLDe0e
	qLbG2f2zVe02DHYRpBWt3nd3E6bCnzHFTtwumNFsQIXlIWqY5poh0YmfiE2cpIXU+7yJJtFc13taa
	tsESLiUaXcxHpNKoIEYemJWwuz1P8+CtLuAqb6CmsNnwAtLXX9xVXo+UnZaCco6wUvZb27dmk0t4Z
	44VUYT3QPM/EmMTkoV7JZypZ0JSS9JTFuwnPvmMQ4E1u7km0HHJ1SxHSiFnzeubAoJWiab7K1oBpt
	AW8pjzdrtM3QgskWhWrAMLuN30yojyhyCDSSYbvJLGhL05hgY7gtnibWSn2S9f5kvSOFB0GakpcDA
	oNncgQOhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfV6H-0003JF-Hk; Wed, 18 Nov 2020 21:34:49 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfV5u-00039H-HT
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 21:34:31 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D032B009;
 Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D003A1E1316; Wed, 18 Nov 2020 15:18:00 +0100 (CET)
Date: Wed, 18 Nov 2020 15:18:00 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/20] block: add a bdev_kobj helper
Message-ID: <20201118141800.GH1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_163427_007063_EE1F7F13 
X-CRM114-Status: GOOD (  23.98  )
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

On Wed 18-11-20 09:47:43, Christoph Hellwig wrote:
> Add a little helper to find the kobject for a struct block_device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/md/bcache/super.c |  7 ++-----
>  drivers/md/md.c           |  4 +---
>  fs/btrfs/sysfs.c          | 15 +++------------
>  include/linux/blk_types.h |  3 +++
>  4 files changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 46a00134a36ae1..a6a5e21e4fd136 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1447,8 +1447,7 @@ static int register_bdev(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
>  		goto err;
>  
>  	err = "error creating kobject";
> -	if (kobject_add(&dc->disk.kobj, &part_to_dev(bdev->bd_part)->kobj,
> -			"bcache"))
> +	if (kobject_add(&dc->disk.kobj, bdev_kobj(bdev), "bcache"))
>  		goto err;
>  	if (bch_cache_accounting_add_kobjs(&dc->accounting, &dc->disk.kobj))
>  		goto err;
> @@ -2342,9 +2341,7 @@ static int register_cache(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
>  		goto err;
>  	}
>  
> -	if (kobject_add(&ca->kobj,
> -			&part_to_dev(bdev->bd_part)->kobj,
> -			"bcache")) {
> +	if (kobject_add(&ca->kobj, bdev_kobj(bdev), "bcache")) {
>  		err = "error calling kobject_add";
>  		ret = -ENOMEM;
>  		goto out;
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index b2edf5e0f965b5..7ce6047c856ea2 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -2414,7 +2414,6 @@ EXPORT_SYMBOL(md_integrity_add_rdev);
>  static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
>  {
>  	char b[BDEVNAME_SIZE];
> -	struct kobject *ko;
>  	int err;
>  
>  	/* prevent duplicates */
> @@ -2477,9 +2476,8 @@ static int bind_rdev_to_array(struct md_rdev *rdev, struct mddev *mddev)
>  	if ((err = kobject_add(&rdev->kobj, &mddev->kobj, "dev-%s", b)))
>  		goto fail;
>  
> -	ko = &part_to_dev(rdev->bdev->bd_part)->kobj;
>  	/* failure here is OK */
> -	err = sysfs_create_link(&rdev->kobj, ko, "block");
> +	err = sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "block");
>  	rdev->sysfs_state = sysfs_get_dirent_safe(rdev->kobj.sd, "state");
>  	rdev->sysfs_unack_badblocks =
>  		sysfs_get_dirent_safe(rdev->kobj.sd, "unacknowledged_bad_blocks");
> diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
> index 279d9262b676d4..24b6c6dc69000a 100644
> --- a/fs/btrfs/sysfs.c
> +++ b/fs/btrfs/sysfs.c
> @@ -1232,8 +1232,6 @@ int btrfs_sysfs_add_space_info_type(struct btrfs_fs_info *fs_info,
>  
>  void btrfs_sysfs_remove_device(struct btrfs_device *device)
>  {
> -	struct hd_struct *disk;
> -	struct kobject *disk_kobj;
>  	struct kobject *devices_kobj;
>  
>  	/*
> @@ -1243,11 +1241,8 @@ void btrfs_sysfs_remove_device(struct btrfs_device *device)
>  	devices_kobj = device->fs_info->fs_devices->devices_kobj;
>  	ASSERT(devices_kobj);
>  
> -	if (device->bdev) {
> -		disk = device->bdev->bd_part;
> -		disk_kobj = &part_to_dev(disk)->kobj;
> -		sysfs_remove_link(devices_kobj, disk_kobj->name);
> -	}
> +	if (device->bdev)
> +		sysfs_remove_link(devices_kobj, bdev_kobj(device->bdev)->name);
>  
>  	if (device->devid_kobj.state_initialized) {
>  		kobject_del(&device->devid_kobj);
> @@ -1353,11 +1348,7 @@ int btrfs_sysfs_add_device(struct btrfs_device *device)
>  	nofs_flag = memalloc_nofs_save();
>  
>  	if (device->bdev) {
> -		struct hd_struct *disk;
> -		struct kobject *disk_kobj;
> -
> -		disk = device->bdev->bd_part;
> -		disk_kobj = &part_to_dev(disk)->kobj;
> +		struct kobject *disk_kobj = bdev_kobj(device->bdev);
>  
>  		ret = sysfs_create_link(devices_kobj, disk_kobj, disk_kobj->name);
>  		if (ret) {
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index d9b69bbde5cc54..0069bee992063e 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -48,6 +48,9 @@ struct block_device {
>  	struct mutex		bd_fsfreeze_mutex;
>  } __randomize_layout;
>  
> +#define bdev_kobj(_bdev) \
> +	(&part_to_dev((_bdev)->bd_part)->kobj)
> +
>  /*
>   * Block error status values.  See block/blk-core:blk_errors for the details.
>   * Alpha cannot write a byte atomically, so we need to use 32-bit value.
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
