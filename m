Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598C4C47077
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 12:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpuulFL1gjtxsY6nq//kWTGUqoK4+dhoHKhA7Bk53Z4=; b=kbzEQVOl+BGKJA
	zo6IVDtPyw4zkbJoJ419sqe5V+4gxdJMcu2iTBkkj+5QrANVu3H9MvA5/O4IsubvtCAJfZPd2887+
	bbB0D0uX4TZpl8L6gBz4n29YonylOD3AJYvS1KLfi0OXAGx8t6ymnAR3wVyVR53IdX9EJQPEjfNf4
	XsbnkTaD3Tn5KDqAKgM3kgS+LrzE3VNOliUjs0Mtr1g13WH0Oq8LqtkARDGXb7UkNppIpJCS7AAET
	bW9H0Z4fNXUutSXBubh35l3Z28g8siwZkI5Vl//q9hIeVwo8YEsD8F2ch1+qiZHaPBUV6f3aJfNF9
	UjkLMKddFx6GJE6WDpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMQQ-00DuNb-0f;
	Thu, 04 Jan 2024 12:02:14 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMQL-00DuML-1z
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 12:02:12 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC0A11F805;
	Thu,  4 Jan 2024 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704369727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWvdmjnCrvMMkEad6Bqg+px5xJk89umEnoKGFgsKrCs=;
	b=mA9MLCSZPk9YYyGvchTGE7QGfjuvAxQPIOB5bSqI0ShVGuX15p8YvfG4RITiIv4B9Dzufr
	pBagJPjiR4Z4ZPrR4rSg3y7kRhQxg3YLJt/5Wk5xAtOKY9ZIcCpHalmOrCoqz7gQD2Ger5
	HIfrPy1FJ1h/ozC1qSJjAvouN5/Df8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704369727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWvdmjnCrvMMkEad6Bqg+px5xJk89umEnoKGFgsKrCs=;
	b=jRA844eLB6Y1ZxCGnb1N6KdOvFnePFHAQGW/vxMgV1qx9TUjHNv+uXe5govpUflqSIzCOd
	q/MKgsENsW38BEBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704369727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWvdmjnCrvMMkEad6Bqg+px5xJk89umEnoKGFgsKrCs=;
	b=mA9MLCSZPk9YYyGvchTGE7QGfjuvAxQPIOB5bSqI0ShVGuX15p8YvfG4RITiIv4B9Dzufr
	pBagJPjiR4Z4ZPrR4rSg3y7kRhQxg3YLJt/5Wk5xAtOKY9ZIcCpHalmOrCoqz7gQD2Ger5
	HIfrPy1FJ1h/ozC1qSJjAvouN5/Df8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704369727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWvdmjnCrvMMkEad6Bqg+px5xJk89umEnoKGFgsKrCs=;
	b=jRA844eLB6Y1ZxCGnb1N6KdOvFnePFHAQGW/vxMgV1qx9TUjHNv+uXe5govpUflqSIzCOd
	q/MKgsENsW38BEBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA856137E8;
	Thu,  4 Jan 2024 12:02:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B2+aKT+elmXdDwAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 04 Jan 2024 12:02:07 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 46F2EA07EF; Thu,  4 Jan 2024 13:02:07 +0100 (CET)
Date: Thu, 4 Jan 2024 13:02:07 +0100
From: Jan Kara <jack@suse.cz>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, jack@suse.com, konishi.ryusuke@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 11/17] erofs: use bdev api
Message-ID: <20240104120207.ig7tfc3mgckwkp2n@quack3>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085826.1768395-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221085826.1768395-1-yukuai1@huaweicloud.com>
X-Spamd-Bar: +++++
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mA9MLCSZ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=jRA844eL
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [5.59 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLhr85cyeg3mfw7iggddtjdkgs)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.cz:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[48];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[kernel.dk,citrix.com,suse.de,gmail.com,lazybastard.org,bootlin.com,nod.at,ti.com,linux.ibm.com,oracle.com,fb.com,toxicpanda.com,suse.com,zeniv.linux.org.uk,kernel.org,fluxnic.net,mit.edu,dilger.ca,infradead.org,linux-foundation.org,samsung.com,vger.kernel.org,lists.xenproject.org,lists.infradead.org,lists.ozlabs.org,huawei.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: BC0A11F805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_040209_804382_9535E8CE 
X-CRM114-Status: GOOD (  20.92  )
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

On Thu 21-12-23 16:58:26, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Avoid to access bd_inode directly, prepare to remove bd_inode from
> block_device.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

I'm not erofs maintainer but IMO this is quite ugly and grows erofs_buf
unnecessarily. I'd rather store 'sb' pointer in erofs_buf and then do the
right thing in erofs_bread() which is the only place that seems to care
about the erofs_is_fscache_mode() distinction... Also blkszbits is then
trivially sb->s_blocksize_bits so it would all seem much more
straightforward.

								Honza

> ---
>  fs/erofs/data.c     | 18 ++++++++++++------
>  fs/erofs/internal.h |  2 ++
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index c98aeda8abb2..bbe2fe199bf3 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -32,8 +32,8 @@ void erofs_put_metabuf(struct erofs_buf *buf)
>  void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
>  		  enum erofs_kmap_type type)
>  {
> -	struct inode *inode = buf->inode;
> -	erofs_off_t offset = (erofs_off_t)blkaddr << inode->i_blkbits;
> +	u8 blkszbits = buf->inode ? buf->inode->i_blkbits : buf->blkszbits;
> +	erofs_off_t offset = (erofs_off_t)blkaddr << blkszbits;
>  	pgoff_t index = offset >> PAGE_SHIFT;
>  	struct page *page = buf->page;
>  	struct folio *folio;
> @@ -43,7 +43,9 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
>  		erofs_put_metabuf(buf);
>  
>  		nofs_flag = memalloc_nofs_save();
> -		folio = read_cache_folio(inode->i_mapping, index, NULL, NULL);
> +		folio = buf->inode ?
> +			read_mapping_folio(buf->inode->i_mapping, index, NULL) :
> +			bdev_read_folio(buf->bdev, offset);
>  		memalloc_nofs_restore(nofs_flag);
>  		if (IS_ERR(folio))
>  			return folio;
> @@ -67,10 +69,14 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
>  
>  void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
>  {
> -	if (erofs_is_fscache_mode(sb))
> +	if (erofs_is_fscache_mode(sb)) {
>  		buf->inode = EROFS_SB(sb)->s_fscache->inode;
> -	else
> -		buf->inode = sb->s_bdev->bd_inode;
> +		buf->bdev = NULL;
> +	} else {
> +		buf->inode = NULL;
> +		buf->bdev = sb->s_bdev;
> +		buf->blkszbits = EROFS_SB(sb)->blkszbits;
> +	}
>  }
>  
>  void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index b0409badb017..c9206351b485 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -224,8 +224,10 @@ enum erofs_kmap_type {
>  
>  struct erofs_buf {
>  	struct inode *inode;
> +	struct block_device *bdev;
>  	struct page *page;
>  	void *base;
> +	u8 blkszbits;
>  	enum erofs_kmap_type kmap_type;
>  };
>  #define __EROFS_BUF_INITIALIZER	((struct erofs_buf){ .page = NULL })
> -- 
> 2.39.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
