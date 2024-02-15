Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC3EC48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRinCNC5n04Orxkm+0vVwTz9JrQb1pucavPWsg6xglw=; b=0X6R/r+lKmFYAS
	77UsZkUtbS0Qs9KFWQ1vvKFxOJA1rOmLj4dYkoOF0cagRvjXf66IDZXzqdWubS1vTSRbwy7KNwnND
	rZb9XC9zajpM3R/miYmMXww6Y+jCSnpm8vQcuLFx8/6ozwgk5m82HlPg+0+meXLhf/f1tsyMelaks
	EUVdDvMYf1enCemqwP3D0aorahzBeaALYX8wKH0yfwV3C8hZUxlFbOC+CPAb2Fl3GTcPSsX6hCXkI
	dIKL1P8+zo/5g5vIBUjh/DW8OxKhr/qg/9fxDjTuVKfPa6lv2qWBRCCBs7n2mRQCjHnrh59F04AeI
	YF9NsTNaBDrvGuPdnrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raena-0000000H1BK-0JWT;
	Thu, 15 Feb 2024 16:41:22 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raenW-0000000H17Q-33Ul
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 16:41:20 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-607e41efcf1so4785327b3.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708015274; x=1708620074; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4Op1mHkAoDc0mHLSW+FBWR2Je9xZ4vfS+3TMPGtYlI=;
        b=A745ZkX5hGM03GRjl7wFZ2TkfnZn0/SXvB0en6mJIEZbqVtGV4yVMIMaQWmgSHIFxH
         lWV/KymC0m+Fh5lmlErCasJvWJzDt7GsKjfaHvNQ0tL255tCSsod1TPHkTKvaGWsRZx/
         YGho3sTJBxdBXrd6U8Xh179TvH26kCl7dy/fBPGrw748hdX1PYpTIPgn/DQ9SjkNoQmC
         oIUvlXWWvMddRKXuO7K95AHafEYYRWNJb7twe2TOISpCQtRznjQmNWTD6m3pBm8LzWc2
         xpU4Ym8lmoMnHhIjZ+LQGSh7mANyw/shYQtl7YmZLSvWeFbZjRRq5GHXwwY6SnMhWcm1
         6E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015274; x=1708620074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4Op1mHkAoDc0mHLSW+FBWR2Je9xZ4vfS+3TMPGtYlI=;
        b=HGQfLkYI8z1RDrBP3KrfN4LaHHo4ZdUSLDG0lIQAEv604QDuiBPgzeGP0nwG4eCECi
         bdAOuJAPQ+mWSzTkxSL+Gfbssm2Up5Id6tTN+NSbFBj4hTvcsNOLFVDwmoL5DSn5IyeD
         aP8W5iBD9othu4obFomXLvNy0J/ySvqYtegJXrDzt4dgBBxVw68YH3EvM89OPyIZWpFc
         wbavw3+SVJ0KiAyjv/FZvghatnafJLohOJHJiCeuIsDTDtuCOCN+3tyPdB4xz0LdjlH4
         DeVL753iPhD4P2Il9skZWQXe9AsBoW33KHTpjiSv4oJ/himZnwraUvTEZgwtbNnCEjrq
         dkhA==
X-Forwarded-Encrypted: i=1; AJvYcCWyMYgus0GRQ9eQevebPTb+zgWIK/wM+sTM7ebvcWaWS7x6iDjWX8H2zELJoqvcf7cE30jVCWovDplUe0lTHDjKjd4VA5jDH6LXkMi/og==
X-Gm-Message-State: AOJu0YzduzRy92mCMbgJ1i2MViABa/uSSn3Sf5hNHX6BXnhKE28xIJJE
	dAfKps1C86FCIeoP56iVrG5UmxoyrfXNBDQS8zzQpdic+OUBiUMzsEYT8LMOEQJm4yl45+bO+Ff
	Z9qjPyrUpoFbOZ9aIgSWyg+V3jAtEdjfQXYuq7Q==
X-Google-Smtp-Source: AGHT+IFKk2OJo3wt7UAgLQt1W8r38i0clrc+x8E5AwuuzUAnApHg2BAocf9JmfWpH758YmJPnpp1To3HfbUpjO81kIA=
X-Received: by 2002:a81:8492:0:b0:607:abfe:e82b with SMTP id
 u140-20020a818492000000b00607abfee82bmr2204534ywf.49.1708015273570; Thu, 15
 Feb 2024 08:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
In-Reply-To: <20240215070300.2200308-18-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Feb 2024 17:40:37 +0100
Message-ID: <CAPDyKFqPnC9jwWnoVz+UVJJ_SGYnB4CrB8jmJOSxCnT7AYQrKg@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_084118_805995_1B18ABC4 
X-CRM114-Status: GOOD (  26.92  )
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

On Thu, 15 Feb 2024 at 08:04, Christoph Hellwig <hch@lst.de> wrote:
>
> Pass the queue limit set at initialization time directly to
> blk_mq_alloc_disk instead of updating it right after the allocation.
>
> This requires refactoring the code a bit so that what was mmc_setup_queue
> before also allocates the gendisk now and actually sets all limits.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks like $subject patch, patch11 and patch12  have already been
queued up as they are cooking linux-next. Normally I prefer to funnel
these via my mmc tree, to avoid potential conflicts (mostly for mmc,
where more active developments are ongoing).

Let's leave this as is for the moment, but if we encounter non-trivial
conflicts, I assume you can drop the patches from your tree?

Kind regards
Uffe




> ---
>  drivers/mmc/core/queue.c | 97 +++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index 67ad186d132a69..2ae60d208cdf1e 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -174,8 +174,8 @@ static struct scatterlist *mmc_alloc_sg(unsigned short sg_len, gfp_t gfp)
>         return sg;
>  }
>
> -static void mmc_queue_setup_discard(struct request_queue *q,
> -                                   struct mmc_card *card)
> +static void mmc_queue_setup_discard(struct mmc_card *card,
> +               struct queue_limits *lim)
>  {
>         unsigned max_discard;
>
> @@ -183,15 +183,17 @@ static void mmc_queue_setup_discard(struct request_queue *q,
>         if (!max_discard)
>                 return;
>
> -       blk_queue_max_discard_sectors(q, max_discard);
> -       q->limits.discard_granularity = card->pref_erase << 9;
> -       /* granularity must not be greater than max. discard */
> -       if (card->pref_erase > max_discard)
> -               q->limits.discard_granularity = SECTOR_SIZE;
> +       lim->max_hw_discard_sectors = max_discard;
>         if (mmc_can_secure_erase_trim(card))
> -               blk_queue_max_secure_erase_sectors(q, max_discard);
> +               lim->max_secure_erase_sectors = max_discard;
>         if (mmc_can_trim(card) && card->erased_byte == 0)
> -               blk_queue_max_write_zeroes_sectors(q, max_discard);
> +               lim->max_write_zeroes_sectors = max_discard;
> +
> +       /* granularity must not be greater than max. discard */
> +       if (card->pref_erase > max_discard)
> +               lim->discard_granularity = SECTOR_SIZE;
> +       else
> +               lim->discard_granularity = card->pref_erase << 9;
>  }
>
>  static unsigned short mmc_get_max_segments(struct mmc_host *host)
> @@ -341,40 +343,53 @@ static const struct blk_mq_ops mmc_mq_ops = {
>         .timeout        = mmc_mq_timed_out,
>  };
>
> -static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
> +static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
> +               struct mmc_card *card)
>  {
>         struct mmc_host *host = card->host;
> -       unsigned block_size = 512;
> +       struct queue_limits lim = { };
> +       struct gendisk *disk;
>
> -       blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
> -       blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
>         if (mmc_can_erase(card))
> -               mmc_queue_setup_discard(mq->queue, card);
> +               mmc_queue_setup_discard(card, &lim);
>
>         if (!mmc_dev(host)->dma_mask || !*mmc_dev(host)->dma_mask)
> -               blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
> -       blk_queue_max_hw_sectors(mq->queue,
> -               min(host->max_blk_count, host->max_req_size / 512));
> -       if (host->can_dma_map_merge)
> -               WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
> -                                                       mmc_dev(host)),
> -                    "merging was advertised but not possible");
> -       blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
> -
> -       if (mmc_card_mmc(card) && card->ext_csd.data_sector_size) {
> -               block_size = card->ext_csd.data_sector_size;
> -               WARN_ON(block_size != 512 && block_size != 4096);
> -       }
> +               lim.bounce = BLK_BOUNCE_HIGH;
> +
> +       lim.max_hw_sectors = min(host->max_blk_count, host->max_req_size / 512);
> +
> +       if (mmc_card_mmc(card) && card->ext_csd.data_sector_size)
> +               lim.logical_block_size = card->ext_csd.data_sector_size;
> +       else
> +               lim.logical_block_size = 512;
> +
> +       WARN_ON_ONCE(lim.logical_block_size != 512 &&
> +                    lim.logical_block_size != 4096);
>
> -       blk_queue_logical_block_size(mq->queue, block_size);
>         /*
> -        * After blk_queue_can_use_dma_map_merging() was called with succeed,
> -        * since it calls blk_queue_virt_boundary(), the mmc should not call
> -        * both blk_queue_max_segment_size().
> +        * Setting a virt_boundary implicity sets a max_segment_size, so try
> +        * to set the hardware one here.
>          */
> -       if (!host->can_dma_map_merge)
> -               blk_queue_max_segment_size(mq->queue,
> -                       round_down(host->max_seg_size, block_size));
> +       if (host->can_dma_map_merge) {
> +               lim.virt_boundary_mask = dma_get_merge_boundary(mmc_dev(host));
> +               lim.max_segments = MMC_DMA_MAP_MERGE_SEGMENTS;
> +       } else {
> +               lim.max_segment_size =
> +                       round_down(host->max_seg_size, lim.logical_block_size);
> +               lim.max_segments = host->max_segs;
> +       }
> +
> +       disk = blk_mq_alloc_disk(&mq->tag_set, &lim, mq);
> +       if (IS_ERR(disk))
> +               return disk;
> +       mq->queue = disk->queue;
> +
> +       if (mmc_host_is_spi(host) && host->use_spi_crc)
> +               blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
> +       blk_queue_rq_timeout(mq->queue, 60 * HZ);
> +
> +       blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
> +       blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
>
>         dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
>
> @@ -386,6 +401,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
>         init_waitqueue_head(&mq->wait);
>
>         mmc_crypto_setup_queue(mq->queue, host);
> +       return disk;
>  }
>
>  static inline bool mmc_merge_capable(struct mmc_host *host)
> @@ -447,18 +463,9 @@ struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
>                 return ERR_PTR(ret);
>
>
> -       disk = blk_mq_alloc_disk(&mq->tag_set, NULL, mq);
> -       if (IS_ERR(disk)) {
> +       disk = mmc_alloc_disk(mq, card);
> +       if (IS_ERR(disk))
>                 blk_mq_free_tag_set(&mq->tag_set);
> -               return disk;
> -       }
> -       mq->queue = disk->queue;
> -
> -       if (mmc_host_is_spi(host) && host->use_spi_crc)
> -               blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
> -       blk_queue_rq_timeout(mq->queue, 60 * HZ);
> -
> -       mmc_setup_queue(mq, card);
>         return disk;
>  }
>
> --
> 2.39.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
