Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB4C83F01
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRqGfdwZxcp7rGHmsD2scMGdpsxRMmCFuPxiiJcr4iE=; b=pycF9C8GjQ8Rs9
	9ixzsbEHjgRY0MX3AtiB7RabD06CKn9OYCJrSG4IC4uTEZ1tJn3PompNnstaOUUBvmNs8+9+CKH/B
	psfi+ixhCe8zH5cx4//e9Cd3z6Ftr6hOLPtf0qctlYrZfEj9zIVxtl7Wvs0+tVghB9EaSfQ70sgKU
	bPgwzoeDDG81svFLDcx6GhetMr6hqLbRUI4eCraV1I3QXeIovgeeZkaexvFg3V9kn1OpenYWex5W3
	BLxaXmsd2HF1DGSpiUR6jaLChFS3CI3nNwQeO2dSVjCWPGDBrDnNo8jmWZoQ4giosEpuNfwHHyt5O
	aX5omKTtgyhNnitmIYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbICE-00DC8U-3A;
	Wed, 30 Aug 2023 10:13:11 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbICB-00DC78-0C
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 10:13:09 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20A93211E1;
	Wed, 30 Aug 2023 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693390385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4RZYr12XYKhx7m5xqnky46/M/Bfz+VwYtiBseYjQkQ=;
	b=hbc4oyhKyut4pfgsoSe9T3m4Ls7Tn8d5VaC9z+nDv7/Zp0o+vvAK8LulsFm5kO+hxEsMaf
	HRIpLtPGZSt/Tv8KCWHAoqmWxN1VnH08Ub0DGPoZC5Jlg1oYdnmeEhJMCA937wP/fGK6DZ
	gvkAv5pfc1DBnP0VMRRBasJ8pSjwav8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693390385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4RZYr12XYKhx7m5xqnky46/M/Bfz+VwYtiBseYjQkQ=;
	b=IErakzCm89yuW9pDhGt/aHEEQwBARP8LNFEllb2YYY35CXhjils6OrmaMpL1Q0H1veiTe8
	CIyX2SN8DF293pBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FAD11353E;
	Wed, 30 Aug 2023 10:13:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hzTMAzEW72R8OgAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 30 Aug 2023 10:13:05 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7D237A0774; Wed, 30 Aug 2023 12:13:04 +0200 (CEST)
Date: Wed, 30 Aug 2023 12:13:04 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: key superblock by device number
Message-ID: <20230830101304.vq6atu2rclpxiinw@quack3>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-2-fecb572e5df3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829-vfs-super-mtd-v1-2-fecb572e5df3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_031307_378074_DA8CB9BC 
X-CRM114-Status: GOOD (  33.92  )
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

On Tue 29-08-23 17:23:57, Christian Brauner wrote:
> The mtd driver has similar problems than the one that was fixed in
> commit dc3216b14160 ("super: ensure valid info").
> 
> The kill_mtd_super() helper calls shuts the superblock down but leaves
> the superblock on fs_supers as the devices are still in use but puts the
> mtd device and cleans out the superblock's s_mtd field.
> 
> This means another mounter can find the superblock on the list accessing
> its s_mtd field while it is curently in the process of being freed or
> already freed.
> 
> Prevent that from happening by keying superblock by dev_t just as we do
> in the generic code.
> 
> Link: https://lore.kernel.org/linux-fsdevel/20230829-weitab-lauwarm-49c40fc85863@brauner
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/mtd/mtdsuper.c | 45 +++++++++++----------------------------------
>  1 file changed, 11 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
> index 5ff001140ef4..b7e3763c47f0 100644
> --- a/drivers/mtd/mtdsuper.c
> +++ b/drivers/mtd/mtdsuper.c
> @@ -19,38 +19,6 @@
>  #include <linux/fs_context.h>
>  #include "mtdcore.h"
>  
> -/*
> - * compare superblocks to see if they're equivalent
> - * - they are if the underlying MTD device is the same
> - */
> -static int mtd_test_super(struct super_block *sb, struct fs_context *fc)
> -{
> -	struct mtd_info *mtd = fc->sget_key;
> -
> -	if (sb->s_mtd == fc->sget_key) {
> -		pr_debug("MTDSB: Match on device %d (\"%s\")\n",
> -			 mtd->index, mtd->name);
> -		return 1;
> -	}
> -
> -	pr_debug("MTDSB: No match, device %d (\"%s\"), device %d (\"%s\")\n",
> -		 sb->s_mtd->index, sb->s_mtd->name, mtd->index, mtd->name);
> -	return 0;
> -}
> -
> -/*
> - * mark the superblock by the MTD device it is using
> - * - set the device number to be the correct MTD block device for pesuperstence
> - *   of NFS exports
> - */
> -static int mtd_set_super(struct super_block *sb, struct fs_context *fc)
> -{
> -	sb->s_mtd = fc->sget_key;
> -	sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, sb->s_mtd->index);
> -	sb->s_bdi = bdi_get(mtd_bdi);
> -	return 0;
> -}
> -
>  /*
>   * get a superblock on an MTD-backed filesystem
>   */
> @@ -62,8 +30,7 @@ static int mtd_get_sb(struct fs_context *fc,
>  	struct super_block *sb;
>  	int ret;
>  
> -	fc->sget_key = mtd;
> -	sb = sget_fc(fc, mtd_test_super, mtd_set_super);
> +	sb = sget_dev(fc, MKDEV(MTD_BLOCK_MAJOR, mtd->index));
>  	if (IS_ERR(sb))
>  		return PTR_ERR(sb);
>  
> @@ -77,6 +44,16 @@ static int mtd_get_sb(struct fs_context *fc,
>  		pr_debug("MTDSB: New superblock for device %d (\"%s\")\n",
>  			 mtd->index, mtd->name);
>  
> +		/*
> +		 * Would usually have been set with @sb_lock held but in
> +		 * contrast to sb->s_bdev that's checked with only
> +		 * @sb_lock held, nothing checks sb->s_mtd without also
> +		 * holding sb->s_umount and we're holding sb->s_umount
> +		 * here.
> +		 */
> +		sb->s_mtd = mtd;
> +		sb->s_bdi = bdi_get(mtd_bdi);
> +
>  		ret = fill_super(sb, fc);
>  		if (ret < 0)
>  			goto error_sb;
> 
> -- 
> 2.34.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
