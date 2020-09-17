Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6089AC2BBD1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057532076D
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DA3Bpql5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 057532076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pn6baOkJnLCG65RMiC45iqofmKWNuvS2zy3xL4F+x08=; b=DA3Bpql5muB12/P7B5klSgAo3
	RpPWJk9SF1zfOpZ1IIShpxoOTtjnkaUfRbRXKdhoYWQGI8/VPYlUpkx4nuB28aZNRwBsvpZIBvdxU
	ViHtROknLHLBk9esxTeRAXpsrxDQSDbw2pw6oONJSAGak1xVBxqcjy2HZZnuDj1YskjqbFCF7BiaR
	JQdseERVzZLExW6fjCCa6VDUXMRti8FuEwmPfwkODfBbOS8372eThxQ744ln0fB/vrz0hrLWQkeW9
	7BJPbZbqToovhCGUUkOiWKZDk+SJ7qo0Yw0t9EdGIdtzH7HlINbGJYD+/jdPE1dQqG+Vq7I4wCNQQ
	WZa9UcSXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqKx-0002dI-Qz; Thu, 17 Sep 2020 09:36:19 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqKu-0002bv-Bv
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:36:17 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED480B13B;
 Thu, 17 Sep 2020 09:36:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E128D1E12E1; Thu, 17 Sep 2020 11:36:14 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:36:14 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/12] bdi: remove BDI_CAP_SYNCHRONOUS_IO
Message-ID: <20200917093614.GF7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-9-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_053616_627887_BFC633D7 
X-CRM114-Status: GOOD (  28.54  )
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

On Thu 10-09-20 16:48:28, Christoph Hellwig wrote:
> BDI_CAP_SYNCHRONOUS_IO is only checked in the swap code, and used to
> decided if ->rw_page can be used on a block device.  Just check up for
> the method instead.  The only complication is that zram needs a second
> set of block_device_operations as it can switch between modes that
> actually support ->rw_page and those who don't.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/brd.c           |  1 -
>  drivers/block/zram/zram_drv.c | 19 +++++++++++++------
>  drivers/nvdimm/btt.c          |  2 --
>  drivers/nvdimm/pmem.c         |  1 -
>  include/linux/backing-dev.h   |  9 ---------
>  mm/swapfile.c                 |  2 +-
>  6 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/block/brd.c b/drivers/block/brd.c
> index 2723a70eb85593..cc49a921339f77 100644
> --- a/drivers/block/brd.c
> +++ b/drivers/block/brd.c
> @@ -403,7 +403,6 @@ static struct brd_device *brd_alloc(int i)
>  	disk->flags		= GENHD_FL_EXT_DEVT;
>  	sprintf(disk->disk_name, "ram%d", i);
>  	set_capacity(disk, rd_size * 2);
> -	brd->brd_queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
>  
>  	/* Tell the block layer that this is not a rotational device */
>  	blk_queue_flag_set(QUEUE_FLAG_NONROT, brd->brd_queue);
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index a356275605b104..1b51bb664f91f5 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -52,6 +52,9 @@ static unsigned int num_devices = 1;
>   */
>  static size_t huge_class_size;
>  
> +static const struct block_device_operations zram_devops;
> +static const struct block_device_operations zram_wb_devops;
> +
>  static void zram_free_page(struct zram *zram, size_t index);
>  static int zram_bvec_read(struct zram *zram, struct bio_vec *bvec,
>  				u32 index, int offset, struct bio *bio);
> @@ -408,8 +411,7 @@ static void reset_bdev(struct zram *zram)
>  	zram->backing_dev = NULL;
>  	zram->old_block_size = 0;
>  	zram->bdev = NULL;
> -	zram->disk->queue->backing_dev_info->capabilities |=
> -				BDI_CAP_SYNCHRONOUS_IO;
> +	zram->disk->fops = &zram_devops;
>  	kvfree(zram->bitmap);
>  	zram->bitmap = NULL;
>  }
> @@ -528,8 +530,7 @@ static ssize_t backing_dev_store(struct device *dev,
>  	 * freely but in fact, IO is going on so finally could cause
>  	 * use-after-free when the IO is really done.
>  	 */
> -	zram->disk->queue->backing_dev_info->capabilities &=
> -			~BDI_CAP_SYNCHRONOUS_IO;
> +	zram->disk->fops = &zram_wb_devops;
>  	up_write(&zram->init_lock);
>  
>  	pr_info("setup backing device %s\n", file_name);
> @@ -1819,6 +1820,13 @@ static const struct block_device_operations zram_devops = {
>  	.owner = THIS_MODULE
>  };
>  
> +static const struct block_device_operations zram_wb_devops = {
> +	.open = zram_open,
> +	.submit_bio = zram_submit_bio,
> +	.swap_slot_free_notify = zram_slot_free_notify,
> +	.owner = THIS_MODULE
> +};
> +
>  static DEVICE_ATTR_WO(compact);
>  static DEVICE_ATTR_RW(disksize);
>  static DEVICE_ATTR_RO(initstate);
> @@ -1946,8 +1954,7 @@ static int zram_add(void)
>  	if (ZRAM_LOGICAL_BLOCK_SIZE == PAGE_SIZE)
>  		blk_queue_max_write_zeroes_sectors(zram->disk->queue, UINT_MAX);
>  
> -	zram->disk->queue->backing_dev_info->capabilities |=
> -			(BDI_CAP_STABLE_WRITES | BDI_CAP_SYNCHRONOUS_IO);
> +	zram->disk->queue->backing_dev_info->capabilities |= BDI_CAP_STABLE_WRITES;
>  	device_add_disk(NULL, zram->disk, zram_disk_attr_groups);
>  
>  	strlcpy(zram->compressor, default_compressor, sizeof(zram->compressor));
> diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
> index 0d710140bf93be..12ff6f8784ac11 100644
> --- a/drivers/nvdimm/btt.c
> +++ b/drivers/nvdimm/btt.c
> @@ -1537,8 +1537,6 @@ static int btt_blk_init(struct btt *btt)
>  	btt->btt_disk->private_data = btt;
>  	btt->btt_disk->queue = btt->btt_queue;
>  	btt->btt_disk->flags = GENHD_FL_EXT_DEVT;
> -	btt->btt_disk->queue->backing_dev_info->capabilities |=
> -			BDI_CAP_SYNCHRONOUS_IO;
>  
>  	blk_queue_logical_block_size(btt->btt_queue, btt->sector_size);
>  	blk_queue_max_hw_sectors(btt->btt_queue, UINT_MAX);
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 140cf3b9000c60..1711fdfd8d2816 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -475,7 +475,6 @@ static int pmem_attach_disk(struct device *dev,
>  	disk->queue		= q;
>  	disk->flags		= GENHD_FL_EXT_DEVT;
>  	disk->private_data	= pmem;
> -	disk->queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
>  	nvdimm_namespace_disk_name(ndns, disk->disk_name);
>  	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
>  			/ 512);
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 52583b6f2ea05d..860ea33571bce5 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -122,9 +122,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>   * BDI_CAP_NO_WRITEBACK:   Don't write pages back
>   * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
>   * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
> - *
> - * BDI_CAP_SYNCHRONOUS_IO: Device is so fast that asynchronous IO would be
> - *			   inefficient.
>   */
>  #define BDI_CAP_NO_ACCT_DIRTY	0x00000001
>  #define BDI_CAP_NO_WRITEBACK	0x00000002
> @@ -132,7 +129,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>  #define BDI_CAP_STABLE_WRITES	0x00000008
>  #define BDI_CAP_STRICTLIMIT	0x00000010
>  #define BDI_CAP_CGROUP_WRITEBACK 0x00000020
> -#define BDI_CAP_SYNCHRONOUS_IO	0x00000040
>  
>  #define BDI_CAP_NO_ACCT_AND_WRITEBACK \
>  	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY | BDI_CAP_NO_ACCT_WB)
> @@ -174,11 +170,6 @@ static inline int wb_congested(struct bdi_writeback *wb, int cong_bits)
>  long congestion_wait(int sync, long timeout);
>  long wait_iff_congested(int sync, long timeout);
>  
> -static inline bool bdi_cap_synchronous_io(struct backing_dev_info *bdi)
> -{
> -	return bdi->capabilities & BDI_CAP_SYNCHRONOUS_IO;
> -}
> -
>  static inline bool bdi_cap_stable_pages_required(struct backing_dev_info *bdi)
>  {
>  	return bdi->capabilities & BDI_CAP_STABLE_WRITES;
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 12f59e641b5e29..986fe5aad30e18 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3237,7 +3237,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	if (bdi_cap_stable_pages_required(inode_to_bdi(inode)))
>  		p->flags |= SWP_STABLE_WRITES;
>  
> -	if (bdi_cap_synchronous_io(inode_to_bdi(inode)))
> +	if (p->bdev && p->bdev->bd_disk->fops->rw_page)
>  		p->flags |= SWP_SYNCHRONOUS_IO;
>  
>  	if (p->bdev && blk_queue_nonrot(bdev_get_queue(p->bdev))) {
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
