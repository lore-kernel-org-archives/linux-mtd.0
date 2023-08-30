Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D5C83F14
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMnm1O2C77i+cqOI3c1fZuu4Oix/HYFM2SzqSfq7Vrk=; b=z4kLPb9IqZTfzi
	R8xPnftvRPuzgbzx55cavoOe7phNpzQvPtqP6EYHjONjwmIl6k+35uvcpUayuB0mQuTk1IQi2akSF
	jYFUcCfvwNqn74Hu09oPi/rS2xRyAQjagu182mV7XuJPsTnBR717lkYqUfdS7V8RrgxgYjeXT8bRg
	9MQ7VjFfkV8iI15tghpftcuqiFizKFOlqdJKksFv8sd5Sinz1LbCtmAWzOZ/WLWPAxPWXkUViRJHI
	7JLs4LBv7J8A4CAraQF26+k4eKOtKiijFA+iIQYgvy2doDEmyQHt9ztPC1D0buJCYfNCzoKIEA5RW
	2SlI1Bx/VkESc6++FPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbI9t-00DBxG-01;
	Wed, 30 Aug 2023 10:10:45 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbI9q-00DBwv-0Y
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 10:10:43 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37D1E211E1;
	Wed, 30 Aug 2023 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693390240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sWcIaA9ejPY4FXfFgWa11Au1TnUC8MeMG9lKaUHHzTI=;
	b=xsHjbUdDeMOSu2HiZz76MqG4UdUK7U9OBUfepcRRrPvtsg10FeWxAuuU+2KXyWZQmMfqas
	Y7PbKcuZc+OFJ2DlMAWsuEjgrPAmot6hjo4p+4QvoHMkArzE6ehIyPUQbORgxz86rfJoW6
	UR38ocfYBM0MM2+tnXhnsrqIdgCieUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693390240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sWcIaA9ejPY4FXfFgWa11Au1TnUC8MeMG9lKaUHHzTI=;
	b=3BWB5U8My/Q3noPoV/ZOh/wGi0pI7UTlAIuEVWwOFIzUynNlneKsJCNPJM6g1wIPI+L4mI
	0LBa5BJonR/erZAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 275B21353E;
	Wed, 30 Aug 2023 10:10:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1AmTCaAV72TMOAAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 30 Aug 2023 10:10:40 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 63B8FA0774; Wed, 30 Aug 2023 12:10:39 +0200 (CEST)
Date: Wed, 30 Aug 2023 12:10:39 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830101039.hzdmauupushpdws6@quack3>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
 <20230830061409.GB17785@lst.de>
 <20230830-befanden-geahndet-2f084125d861@brauner>
 <20230830093851.uwdgpt645niysuji@quack3>
 <20230830-ohnedies-umland-fb2b1a45db10@brauner>
 <20230830-theater-quizsendung-4ba64e87df36@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830-theater-quizsendung-4ba64e87df36@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_031042_356718_3F47B154 
X-CRM114-Status: GOOD (  25.66  )
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

On Wed 30-08-23 12:02:47, Christian Brauner wrote:
> > Yeah, good point. Done.
> 
> From fe40c7fe1a87814f92f9b1d0b9fb78ac69404c33 Mon Sep 17 00:00:00 2001
> From: Christian Brauner <brauner@kernel.org>
> Date: Tue, 29 Aug 2023 15:05:28 +0200
> Subject: [PATCH 1/2] fs: export sget_dev()
> 
> They will be used for mtd devices as well.
> 
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/super.c         | 64 ++++++++++++++++++++++++++++++++--------------
>  include/linux/fs.h |  1 +
>  2 files changed, 46 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/super.c b/fs/super.c
> index ad7ac3a24d38..d27d80bf7c43 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -1371,6 +1371,50 @@ int get_tree_keyed(struct fs_context *fc,
>  }
>  EXPORT_SYMBOL(get_tree_keyed);
>  
> +static int set_bdev_super(struct super_block *s, void *data)
> +{
> +	s->s_dev = *(dev_t *)data;
> +	return 0;
> +}
> +
> +static int super_s_dev_set(struct super_block *s, struct fs_context *fc)
> +{
> +	return set_bdev_super(s, fc->sget_key);
> +}
> +
> +static int super_s_dev_test(struct super_block *s, struct fs_context *fc)
> +{
> +	return !(s->s_iflags & SB_I_RETIRED) &&
> +		s->s_dev == *(dev_t *)fc->sget_key;
> +}
> +
> +/**
> + * sget_dev - Find or create a superblock by device number
> + * @fc: Filesystem context.
> + * @dev: device number
> + *
> + * Find or create a superblock using the provided device number that
> + * will be stored in fc->sget_key.
> + *
> + * If an extant superblock is matched, then that will be returned with
> + * an elevated reference count that the caller must transfer or discard.
> + *
> + * If no match is made, a new superblock will be allocated and basic
> + * initialisation will be performed (s_type, s_fs_info, s_id, s_dev will
> + * be set). The superblock will be published and it will be returned in
> + * a partially constructed state with SB_BORN and SB_ACTIVE as yet
> + * unset.
> + *
> + * Return: an existing or newly created superblock on success, an error
> + *         pointer on failure.
> + */
> +struct super_block *sget_dev(struct fs_context *fc, dev_t dev)
> +{
> +	fc->sget_key = &dev;
> +	return sget_fc(fc, super_s_dev_test, super_s_dev_set);
> +}
> +EXPORT_SYMBOL(sget_dev);
> +
>  #ifdef CONFIG_BLOCK
>  /*
>   * Lock a super block that the callers holds a reference to.
> @@ -1429,23 +1473,6 @@ const struct blk_holder_ops fs_holder_ops = {
>  };
>  EXPORT_SYMBOL_GPL(fs_holder_ops);
>  
> -static int set_bdev_super(struct super_block *s, void *data)
> -{
> -	s->s_dev = *(dev_t *)data;
> -	return 0;
> -}
> -
> -static int set_bdev_super_fc(struct super_block *s, struct fs_context *fc)
> -{
> -	return set_bdev_super(s, fc->sget_key);
> -}
> -
> -static int test_bdev_super_fc(struct super_block *s, struct fs_context *fc)
> -{
> -	return !(s->s_iflags & SB_I_RETIRED) &&
> -		s->s_dev == *(dev_t *)fc->sget_key;
> -}
> -
>  int setup_bdev_super(struct super_block *sb, int sb_flags,
>  		struct fs_context *fc)
>  {
> @@ -1523,8 +1550,7 @@ int get_tree_bdev(struct fs_context *fc,
>  	}
>  
>  	fc->sb_flags |= SB_NOSEC;
> -	fc->sget_key = &dev;
> -	s = sget_fc(fc, test_bdev_super_fc, set_bdev_super_fc);
> +	s = sget_dev(fc, dev);
>  	if (IS_ERR(s))
>  		return PTR_ERR(s);
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index ca8ceccde3d6..8a8d1cd5b0a9 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2274,6 +2274,7 @@ struct super_block *sget(struct file_system_type *type,
>  			int (*test)(struct super_block *,void *),
>  			int (*set)(struct super_block *,void *),
>  			int flags, void *data);
> +struct super_block *sget_dev(struct fs_context *fc, dev_t dev);
>  
>  /* Alas, no aliases. Too much hassle with bringing module.h everywhere */
>  #define fops_get(fops) \
> -- 
> 2.34.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
