Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFB0C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:54:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB0D560462
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB0D560462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCR+Aoog71dZBOp4HzRWj1S4PweUj+NJCqbF9SHkTcw=; b=PU4LKPqSAZY3TR
	AqmgVIMFWCTVKhbFwJvmbAeGE21SDerQe9BfWpkrFKu3kt+WZ3QiK2s4LJqGCK4aC+qZcuH8KY6US
	Dakp0D74o92aMTw3nFzaJ7sEu9zciIb+zc4I2fzbjA7ak0WKKQtPZx8Jz9d7KLYAzM6HyxR/vOgIv
	UvcH71pY4Z9HeUy6xa7ji8DVk3lCfkIGF0vpy5HMyzvFiJvGWX5GZ+RAqDY6yYuCA1wpPZ88sgH8+
	Yl3RfYTNRT+0FrJ0qAlAckaw5rBdukB2XnOXUMIntxij7ON7ePKM6/t7NaVZzr0bJ5MODqTv8Fe1y
	5bF4n+mHTFbjtLkRIhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZ5W-00FT9Z-3O; Wed, 13 Oct 2021 07:54:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXmn-00F9de-MO
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:30:47 +0000
Received: by mail-pg1-x52d.google.com with SMTP id f5so1317943pgc.12
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VuQ9K07zKhFVmW27yAURvZgXNg5Kde2VB7A9n6/jcRM=;
 b=UofdAPLwzqN9irjKYpz7rqdpJba6YSanghzltJ7hygDQHnFxjoYnCn4YD0xclCWyyn
 1QGVCjAoCfMyHBxT5bED+JODP9R8TqKO5BZ3Ypckfrxuser3a0TwMhxL4/T0VMAtKJpU
 VKx0vRkqgm8Bnukgx8yTpvFmvLGoFoDP/yYAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VuQ9K07zKhFVmW27yAURvZgXNg5Kde2VB7A9n6/jcRM=;
 b=NwAZpvOwdes7hawDZaIlJ70aF0/Z6/2yPSBxsEASD7dUZiMcvb6pdff+2J295tS3nB
 JI4Q1p1iC9AVB58pFYJdsTu4QnbzuNCkirSgEpwh8zK1yQo1/yqBU12n55RqPSqaiRld
 uNyRMk6OmkA+ltZ/7TumyHAneWmw0tnH84XWM9r7jmUonT2Xwwq4/QsjojhjjYDTMcUU
 XDO0HGMM5YDP9kZAKnpII0iE74siOHYcGQC1CDiIz7QNKr6MhbLGUI5azWvPbHEqk+Hp
 Mjy06LwrHdKJ8JRClPv7iELYA1uXyOKLZi3GYkew7QBX4JpuROpuVRv1ZkpT4/qY/vW+
 8iOw==
X-Gm-Message-State: AOAM533cR1z7ElJIitr179i3V7OOVs3YsGkC/4HtoyVN3oLyP3gtZEUO
 78jMc2et5pK3glZuwzIMAk4dMw==
X-Google-Smtp-Source: ABdhPJxi3MilTVqoy9Kf7ydXOCYXbOlyCyon1KO3ew5UZssKOax53PkSESvwHqWMi+XXw8wleT4Yrw==
X-Received: by 2002:a05:6a00:ccb:b0:44c:eb4b:f24e with SMTP id
 b11-20020a056a000ccb00b0044ceb4bf24emr25691167pfv.16.1634106644424; 
 Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z10sm12678073pfn.70.2021.10.12.23.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:30:43 -0700
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
Subject: Re: [PATCH 25/29] ext4: use sb_bdev_nr_blocks
Message-ID: <202110122330.6E549D2@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-26-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-26-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_233045_805079_B2E4C27E 
X-CRM114-Status: GOOD (  18.89  )
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

On Wed, Oct 13, 2021 at 07:10:38AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 0775950ee84e3..3dde8be5df490 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4468,7 +4468,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		goto cantfind_ext4;
>  
>  	/* check blocks count against device size */
> -	blocks_count = sb->s_bdev->bd_inode->i_size >> sb->s_blocksize_bits;
> +	blocks_count = sb_bdev_nr_blocks(sb);

Wait, my bad. Yes, this is fine. It's going through two helpers. :)

Reviewed-by: Kees Cook <keescook@chromium.org>


>  	if (blocks_count && ext4_blocks_count(es) > blocks_count) {
>  		ext4_msg(sb, KERN_WARNING, "bad geometry: block count %llu "
>  		       "exceeds size of device (%llu blocks)",
> -- 
> 2.30.2
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
