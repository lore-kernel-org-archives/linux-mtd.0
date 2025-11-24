Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F02CFD313
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 11:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwHVGKTGAzBoJUX0Yzd+DqzEP0frG9RvDRwVDwkQJZg=; b=zqbHVntKKDSPUR
	yI8Vx3WVMYSDOuHt8oJHVQ9bA8QRNXqTLPUKOvfOSL0G5ztZOfk0f0pDBYPQbnnH89Q8S/zm9wlZt
	mRfSWGR8zJPERR/XzeLQgpOKcfSEKW+31q/GuZqsSKQ/MkYtsM/hzq4Y/MnI8b2OqYbTJxYhMRG7n
	YjJgS/ysYZZNktxIc26oiQVspCrD077m13r32Hs9TEUsHmJp5WaKwltQSBB4UZor2y8GtPD0ARLtp
	tRcKAoRJR6a34QXliCSxWbypQht4DvMg0D35AeBzphGGdxsQ7Vf2fSSLIhW0XMXM4md5wfkslJulX
	Z9CRqdhQkMYBAkuwdfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV6w-0000000BaOt-0JEZ;
	Mon, 24 Nov 2025 11:52:02 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV6s-0000000BaOI-3n1f
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 11:52:00 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0C9E5BE36;
	Mon, 24 Nov 2025 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763985115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tI75RvvoW7MumU/x2+w7sCIYpG0FwZeE5DdxBpUhg+Q=;
	b=Sbi0gwbyCpaVKMQV2UlM0psMLoVhGtmKpxAUCXn7wFzHzKEu4mvu2dD1IYZR7uYfvXKCZv
	aVBNe4DLiH7bbHqlEVUkPCT3v5xDNv1/SCw6soMuFa6l5vdISLiOHWDFHVUMnOqKYP+wzW
	dZtl+qIGQ2sNM7Rm0w3nYa+92Pu8azY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763985115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tI75RvvoW7MumU/x2+w7sCIYpG0FwZeE5DdxBpUhg+Q=;
	b=AahnnYaPxgqzkVL8HD5p5Di5BmAY/Q/Cc5jrQ1C6V9F6dAFKDbzvRRT9JtN3VKTwr4DuJP
	7Z8GnhV+KEtKCvBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=relb+CRX;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=HfDUfosQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763985113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tI75RvvoW7MumU/x2+w7sCIYpG0FwZeE5DdxBpUhg+Q=;
	b=relb+CRXtEMRjoh8RhBPFCKFui+e77Q7FEA5WcpJPj5RdICSoJAQSj13ppULOLxlb9bsn9
	X7xoa+VXS6MezxqCZK354/5mR0uvwhHyWnke5glOVhzl9lZyEjoPdBkLQSGLh4JdHWXCAa
	9+zYR2e/am2fmynL9UVWYVF6I7eIqeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763985113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tI75RvvoW7MumU/x2+w7sCIYpG0FwZeE5DdxBpUhg+Q=;
	b=HfDUfosQhYbNz2pBMQmIkOXp2ggPjlZ6CWKuEXm51mN8e2Qy0+37pBYppqBKO/iGOarrg7
	W58dF9BxphmMNfAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD3483EA61;
	Mon, 24 Nov 2025 11:51:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8DYpLtlGJGkXdgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 11:51:53 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 032FEA0A04; Mon, 24 Nov 2025 12:51:48 +0100 (CET)
Date: Mon, 24 Nov 2025 12:51:48 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 01/14] fs: refactor file timestamp update logic
Message-ID: <muv2257pdsdqq3mfqay72rgxgiklnbmcj545tcq5tx3ap4hhue@rccqkibodbv3>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-2-hch@lst.de>
X-Rspamd-Queue-Id: D0C9E5BE36
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,suse.com:email,suse.cz:dkim,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_THREE(0.00)[3];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_035159_095254_A8D8F337 
X-CRM114-Status: GOOD (  27.55  )
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

On Fri 14-11-25 07:26:04, Christoph Hellwig wrote:
> Currently the two high-level APIs use two helper functions to implement
> almost all of the logic.  Refactor the two helpers and the common logic
> into a new file_update_time_flags routine that gets the iocb flags or
> 0 in case of file_update_time passed so that the entire logic is
> contained in a single function and can be easily understood and modified.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c | 54 +++++++++++++++++-------------------------------------
>  1 file changed, 17 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index ec9339024ac3..4884ffa931e7 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2310,10 +2310,12 @@ struct timespec64 current_time(struct inode *inode)
>  }
>  EXPORT_SYMBOL(current_time);
>  
> -static int inode_needs_update_time(struct inode *inode)
> +static int file_update_time_flags(struct file *file, unsigned int flags)
>  {
> +	struct inode *inode = file_inode(file);
>  	struct timespec64 now, ts;
> -	int sync_it = 0;
> +	int sync_mode = 0;
> +	int ret = 0;
>  
>  	/* First try to exhaust all avenues to not sync */
>  	if (IS_NOCMTIME(inode))
> @@ -2323,29 +2325,23 @@ static int inode_needs_update_time(struct inode *inode)
>  
>  	ts = inode_get_mtime(inode);
>  	if (!timespec64_equal(&ts, &now))
> -		sync_it |= S_MTIME;
> -
> +		sync_mode |= S_MTIME;
>  	ts = inode_get_ctime(inode);
>  	if (!timespec64_equal(&ts, &now))
> -		sync_it |= S_CTIME;
> -
> +		sync_mode |= S_CTIME;
>  	if (IS_I_VERSION(inode) && inode_iversion_need_inc(inode))
> -		sync_it |= S_VERSION;
> +		sync_mode |= S_VERSION;
>  
> -	return sync_it;
> -}
> -
> -static int __file_update_time(struct file *file, int sync_mode)
> -{
> -	int ret = 0;
> -	struct inode *inode = file_inode(file);
> +	if (!sync_mode)
> +		return 0;
>  
> -	/* try to update time settings */
> -	if (!mnt_get_write_access_file(file)) {
> -		ret = inode_update_time(inode, sync_mode);
> -		mnt_put_write_access_file(file);
> -	}
> +	if (flags & IOCB_NOWAIT)
> +		return -EAGAIN;
>  
> +	if (mnt_get_write_access_file(file))
> +		return 0;
> +	ret = inode_update_time(inode, sync_mode);
> +	mnt_put_write_access_file(file);
>  	return ret;
>  }
>  
> @@ -2365,14 +2361,7 @@ static int __file_update_time(struct file *file, int sync_mode)
>   */
>  int file_update_time(struct file *file)
>  {
> -	int ret;
> -	struct inode *inode = file_inode(file);
> -
> -	ret = inode_needs_update_time(inode);
> -	if (ret <= 0)
> -		return ret;
> -
> -	return __file_update_time(file, ret);
> +	return file_update_time_flags(file, 0);
>  }
>  EXPORT_SYMBOL(file_update_time);
>  
> @@ -2394,7 +2383,6 @@ EXPORT_SYMBOL(file_update_time);
>  static int file_modified_flags(struct file *file, int flags)
>  {
>  	int ret;
> -	struct inode *inode = file_inode(file);
>  
>  	/*
>  	 * Clear the security bits if the process is not being run by root.
> @@ -2403,17 +2391,9 @@ static int file_modified_flags(struct file *file, int flags)
>  	ret = file_remove_privs_flags(file, flags);
>  	if (ret)
>  		return ret;
> -
>  	if (unlikely(file->f_mode & FMODE_NOCMTIME))
>  		return 0;
> -
> -	ret = inode_needs_update_time(inode);
> -	if (ret <= 0)
> -		return ret;
> -	if (flags & IOCB_NOWAIT)
> -		return -EAGAIN;
> -
> -	return __file_update_time(file, ret);
> +	return file_update_time_flags(file, flags);
>  }
>  
>  /**
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
