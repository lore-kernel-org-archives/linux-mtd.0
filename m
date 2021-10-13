Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5380AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:00:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA5560D42
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBA5560D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xccYSMWx957sPUk9mG9Div0Og+20kJlBeGJj1iU0dFc=; b=nSIg4HMiocvZ1X
	JjtRrL3sFyk80B19NCiq+UR7DeugMqylj8fynGriF/6hhCG/OvPCDbODha62JFCh2IxTcxSlbVA8s
	wcoAjru81aOwK9MbhnzeU2QJu7ZGZayi+TvKGipJfcEX67nDsSjhFrGnNS5Ei0VVciCJnq0kqxa8f
	jGd42Xg6GNpJWDgfXMB+lKWsgDoiC0hjVWz888bqk42HHjWbtS9pstx2OqCrs5CK1+WaUq2uuF7LN
	yvcwsE2Xhu+Xf0yl6M0lHDXhXzsB9kNy4384DiBYOTIec1Kp1k2HyppMFKd4NoIK6OFj5hdsiu+k1
	uAAo3Ld/Aygbm0B2OCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZAd-00FU0D-M8; Wed, 13 Oct 2021 07:59:28 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXp5-00FA3Y-Aa
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:33:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so3649628pjb.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WOss03228JS+U0E2OXL79/LG2Z2ctX8IyohOEDd3STQ=;
 b=SG8eTx4PGHBkPjipBIRHezrGg40X7FKDH3dcqzGEh0ZG/tSW8qND+TAMrNp3f/wqwx
 MhgHQ6qj4VZF73LZ68/IqBwYNjD0oJqF3VY+z4T9q23FV/6ltSnjivxfcuufOGGKlehP
 NgIRnRpzLQoV7Ik4Dnr+7MYlEdDMy98DEnQAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WOss03228JS+U0E2OXL79/LG2Z2ctX8IyohOEDd3STQ=;
 b=NTgj1pwiLqabhzdSFeLZShDuK2ppOMDCL5JSioZ7YyOHm0MPB+6MZHoZtScto+CLBy
 yDFsdOo12q+PB0nlVmGGU1FRf2XZ5ppZQXGYSSBkh0UMS4OkvSlEMyAbu/rIvU6ITYhr
 JA+z80whiXsOA/flhzBTRG2DUhYzKIzIMj0fG2gjpk0Qic5ziMe0fI9YWKP3T73eUScT
 kaky0y9h/ggMJv5EEuvCYX7UcOzLV6FBOJnU4FT81iADozxGdLf/zoqg23OG9t0lgrLO
 hH9/MfqLdTQXPDPdZKrM3sB4vkvHGDRXwpbbIdPMSuaY/wgaXN7yVTJtyoEAnLhFYIRU
 QQPw==
X-Gm-Message-State: AOAM531bzH3c1FzirpHJ0D3sznHj+LrC5B6qnChBzQPQzZKsmq+0eZAy
 sPSqimUMWdW8n9T1LuEdOvnjaA==
X-Google-Smtp-Source: ABdhPJznx7wYhVexbMFNDV4dCepvElOzihP1I4t7IwLHfcLc7mdWs+S7z03dgD05iBEaGZ31xHHwig==
X-Received: by 2002:a17:90b:368a:: with SMTP id
 mj10mr2200890pjb.201.1634106786111; 
 Tue, 12 Oct 2021 23:33:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r31sm4746519pjg.28.2021.10.12.23.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:33:05 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:33:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
 Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
 David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Theodore Ts'o <tytso@mit.edu>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Dave Kleikamp <shaggy@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH 27/29] ntfs: use sb_bdev_nr_blocks
Message-ID: <202110122332.53B5925A@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-28-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-28-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_233307_433242_ED0CF616 
X-CRM114-Status: GOOD (  23.13  )
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

On Wed, Oct 13, 2021 at 07:10:40AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ntfs/super.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 0d7e948cb29c9..5ae8de09b271b 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -2772,13 +2772,12 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
>  	ntfs_debug("Set device block size to %i bytes (block size bits %i).",
>  			blocksize, sb->s_blocksize_bits);
>  	/* Determine the size of the device in units of block_size bytes. */
> -	if (!i_size_read(sb->s_bdev->bd_inode)) {
> +	vol->nr_blocks = sb_bdev_nr_blocks(sb);
> +	if (!vol->nr_blocks) {

I might be worth mentioning in the commit log why this is safe (i.e. the
"side effect" of the assignment doesn't need to be delayed since it will
be thrown away in the failure path).

>  		if (!silent)
>  			ntfs_error(sb, "Unable to determine device size.");
>  		goto err_out_now;
>  	}
> -	vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
> -			sb->s_blocksize_bits;
>  	/* Read the boot sector and return unlocked buffer head to it. */
>  	if (!(bh = read_ntfs_boot_sector(sb, silent))) {
>  		if (!silent)
> @@ -2816,8 +2815,7 @@ static int ntfs_fill_super(struct super_block *sb, void *opt, const int silent)
>  			goto err_out_now;
>  		}
>  		BUG_ON(blocksize != sb->s_blocksize);
> -		vol->nr_blocks = i_size_read(sb->s_bdev->bd_inode) >>
> -				sb->s_blocksize_bits;
> +		vol->nr_blocks = sb_bdev_nr_blocks(sb);
>  		ntfs_debug("Changed device block size to %i bytes (block size "
>  				"bits %i) to match volume sector size.",
>  				blocksize, sb->s_blocksize_bits);

Reviewed-by: Kees Cook <keescook@chromium.org>


> -- 
> 2.30.2
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
