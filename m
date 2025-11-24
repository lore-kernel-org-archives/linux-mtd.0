Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCD1CFD317
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff19UQHjZDDUMvJPuI8XCjICF1TBpBpRB9n4bWlooEQ=; b=ASy/zsjQCYD0Ew
	L+9ZFmoQGWGsVsSyccHF9fwPZs4obCMoffy4ASRvEgE48t6Wk+GtCaK4qHja4b6nanOmEHXyIZIH1
	235GiPmbRJdOau1347Qc4/Cxec6qe9F/dxnHkjfbgJhlVzHGnJX3Pvo75Tuupc/Pv5aEm0jhAv4mW
	k/XSQbHl3a3GylgAjba3MQKSM5YA0g2GqRnyaLsBwbfhFLirJXdxN694Ho0ttl3AtkkEid0Y1P1Qh
	gPiqF7Z/NC+VD0Fg3qZkdxHdx/k9//rym12oeHryp1+IB8g5V5MHDlCdkbrdd3cBGeliSr/JlrRVP
	lgT4y2+OJcs4T/YcQZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWXB-0000000BjFT-1BiT;
	Mon, 24 Nov 2025 13:23:13 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWX4-0000000Bj8t-1Fsu
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 13:23:07 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44DA122439;
	Mon, 24 Nov 2025 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763990584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FPNZIZGEngYR7OWv1Yo0iyX474sGJnGUprBV/QxqdPE=;
	b=ap9z4K9hzosFq0AwJa+fOE2AS3tDIUXpoKhxLaJuQNbFAhf1GuHf4i90s05tM1v+p1hT/1
	TFZPBO+rkFoyIrNXpugfwsfZkcQjPFH8/59AB6a5vw9UHpWWDJjh3RqxUwRy4rcClTaSWb
	ejjNnhti15Vz94OomuuhECLZsLp3ES0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763990584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FPNZIZGEngYR7OWv1Yo0iyX474sGJnGUprBV/QxqdPE=;
	b=SBeLE8V5C8vimCF6tacHZDiXrpV+wgqP3Xoj2dmoCAMSLwKqmQqfzPMiZDRYQYcLLhPfQC
	H2zGWBLQDfPoLwCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ap9z4K9h;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=SBeLE8V5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763990584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FPNZIZGEngYR7OWv1Yo0iyX474sGJnGUprBV/QxqdPE=;
	b=ap9z4K9hzosFq0AwJa+fOE2AS3tDIUXpoKhxLaJuQNbFAhf1GuHf4i90s05tM1v+p1hT/1
	TFZPBO+rkFoyIrNXpugfwsfZkcQjPFH8/59AB6a5vw9UHpWWDJjh3RqxUwRy4rcClTaSWb
	ejjNnhti15Vz94OomuuhECLZsLp3ES0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763990584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FPNZIZGEngYR7OWv1Yo0iyX474sGJnGUprBV/QxqdPE=;
	b=SBeLE8V5C8vimCF6tacHZDiXrpV+wgqP3Xoj2dmoCAMSLwKqmQqfzPMiZDRYQYcLLhPfQC
	H2zGWBLQDfPoLwCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38F783EA64;
	Mon, 24 Nov 2025 13:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vuvmDThcJGkaUAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 13:23:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id D1748A0A04; Mon, 24 Nov 2025 14:22:59 +0100 (CET)
Date: Mon, 24 Nov 2025 14:22:59 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 09/14] fs: factor out a mark_inode_dirty_time helper
Message-ID: <fbym7i2zelbatxbhy5eeffwpa3ni7bstjddbf7ran7djzthwjo@kfxj3wrxeuou>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-10-hch@lst.de>
X-Rspamd-Queue-Id: 44DA122439
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim,lst.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_052306_636236_C8BAA71D 
X-CRM114-Status: GOOD (  26.98  )
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

On Fri 14-11-25 07:26:12, Christoph Hellwig wrote:
> Factor out the inode dirtying vs lazytime logic from generic_update_time
> into a new helper so that it can be reused in file system methods.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/fs-writeback.c  | 15 +++++++++++++++
>  fs/inode.c         | 14 +++-----------
>  include/linux/fs.h |  3 ++-
>  3 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index 2b35e80037fe..930697f39153 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -2671,6 +2671,21 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>  }
>  EXPORT_SYMBOL(__mark_inode_dirty);
>  
> +void mark_inode_dirty_time(struct inode *inode, unsigned int flags)

What I find a bit concerning here is that mark_inode_dirty_time() takes a
different kind of flags than __mark_inode_dirty() so it's relatively easy
to confuse. Proper typing of 'flags' would be nice here but it's a bit
cumbersome to do in C so I'm not sure if it's worth it for this relatively
limited use. So I guess feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> +{
> +	if (inode->i_sb->s_flags & SB_LAZYTIME) {
> +		int dirty_flags = 0;
> +
> +		if (flags & (S_ATIME | S_MTIME | S_CTIME))
> +			dirty_flags = I_DIRTY_TIME;
> +		if (flags & S_VERSION)
> +			dirty_flags |= I_DIRTY_SYNC;
> +		__mark_inode_dirty(inode, dirty_flags);
> +	} else {
> +		mark_inode_dirty_sync(inode);
> +	}
> +}
> +
>  /*
>   * The @s_sync_lock is used to serialise concurrent sync operations
>   * to avoid lock contention problems with concurrent wait_sb_inodes() calls.
> diff --git a/fs/inode.c b/fs/inode.c
> index 57c458ee548d..559ce5c07188 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2095,17 +2095,9 @@ EXPORT_SYMBOL(inode_update_timestamps);
>   */
>  int generic_update_time(struct inode *inode, int flags)
>  {
> -	int updated = inode_update_timestamps(inode, flags);
> -	int dirty_flags = 0;
> -
> -	if (!updated)
> -		return 0;
> -
> -	if (updated & (S_ATIME|S_MTIME|S_CTIME))
> -		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
> -	if (updated & S_VERSION)
> -		dirty_flags |= I_DIRTY_SYNC;
> -	__mark_inode_dirty(inode, dirty_flags);
> +	flags = inode_update_timestamps(inode, flags);
> +	if (flags)
> +		mark_inode_dirty_time(inode, flags);
>  	return 0;
>  }
>  EXPORT_SYMBOL(generic_update_time);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index c1077ae7c6b2..5c762d80b8a8 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2608,7 +2608,8 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
>  	};
>  }
>  
> -extern void __mark_inode_dirty(struct inode *, int);
> +void mark_inode_dirty_time(struct inode *inode, unsigned int flags);
> +void __mark_inode_dirty(struct inode *inode, int flags);
>  static inline void mark_inode_dirty(struct inode *inode)
>  {
>  	__mark_inode_dirty(inode, I_DIRTY);
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
