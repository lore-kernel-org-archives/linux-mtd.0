Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50CFCFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 13:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RDbKM2+drxZuutkMYWVzKrsEpLlhQTUCBzTTbbmLCc=; b=clcCCVWFVuv45a
	mcJ8TC0wOVDde8/hq+eCu/XadIBHYWlkfgFjQFmLfBkmgMN57qiI0ytgAfw0KKzQYwXB3SFojXxgk
	Cz7ZexXlXzWoCKfGjFDxfwzLT5g3s1SrbeZJxuWxGORVHhLk20c+QCvVgcdRTLak0U8knKGGmHtoE
	0QWGYwPyD7n7GycnnwgnTRjphGD/QMz+H+Ca8AVgcsmeSNZR2pheg/3EWpytJH+ClAX9WnJ7FBW2g
	hqDsYxmAR1iGQET0afbnTpGHpuwLpHid43rGKYK60NWhEOy89PrMLrPC5Amal8wlb4rmPbNHJL9YM
	G7sTmM1ZU2piUn+scj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWGr-0000000BhWb-1VTu;
	Mon, 24 Nov 2025 13:06:21 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWGn-0000000BhW6-3Jfs
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 13:06:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E6FA2231C;
	Mon, 24 Nov 2025 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74e8psc+UdHqbFgTyHbnbjvHEv2YFEnPp1D+PqYJh3E=;
	b=NlxUqhDCuBuA6uMwTyci7XV0Tqb0Ly+IfXX3l+0+Ks+k1YYMaki51EZHX4d0ZF8PhrhYui
	0YRFCPyRLzQQHLDqWTpi1i8DgY+ykBXlomCEI1stugOlcdGOlJpf7xL/XDYbZ4E6yVRySu
	2ka8nB5Z0qvUlTozia0O1ayxEFFLyXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74e8psc+UdHqbFgTyHbnbjvHEv2YFEnPp1D+PqYJh3E=;
	b=q+Veo1nG6ng22fQU6XhFbLrbVowG+EKhP9KRiaE8lMHQQeQNm1Eb5aT43r9Aam4X24zqdL
	NPQcSHNLrYYUq+Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=NlxUqhDC;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=q+Veo1nG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74e8psc+UdHqbFgTyHbnbjvHEv2YFEnPp1D+PqYJh3E=;
	b=NlxUqhDCuBuA6uMwTyci7XV0Tqb0Ly+IfXX3l+0+Ks+k1YYMaki51EZHX4d0ZF8PhrhYui
	0YRFCPyRLzQQHLDqWTpi1i8DgY+ykBXlomCEI1stugOlcdGOlJpf7xL/XDYbZ4E6yVRySu
	2ka8nB5Z0qvUlTozia0O1ayxEFFLyXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74e8psc+UdHqbFgTyHbnbjvHEv2YFEnPp1D+PqYJh3E=;
	b=q+Veo1nG6ng22fQU6XhFbLrbVowG+EKhP9KRiaE8lMHQQeQNm1Eb5aT43r9Aam4X24zqdL
	NPQcSHNLrYYUq+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F3D13EA61;
	Mon, 24 Nov 2025 13:06:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zycMH0dYJGkQPgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 13:06:15 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 110D8A0A04; Mon, 24 Nov 2025 14:06:15 +0100 (CET)
Date: Mon, 24 Nov 2025 14:06:15 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 05/14] fs: remove inode_update_time
Message-ID: <5usxhyehesfb7kwlxnaojzxmumx3twxgmdgg6e45lk3kke6oji@qu7poaekacre>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-6-hch@lst.de>
X-Rspamd-Queue-Id: 8E6FA2231C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_050617_995918_7CB483F8 
X-CRM114-Status: GOOD (  23.90  )
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

On Fri 14-11-25 07:26:08, Christoph Hellwig wrote:
> The only external user is gone now, open code it in the two VFS
> callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c         | 23 ++++++++---------------
>  include/linux/fs.h |  1 -
>  2 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 24dab63844db..d3edcc5baec9 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2107,19 +2107,6 @@ int generic_update_time(struct inode *inode, int flags)
>  }
>  EXPORT_SYMBOL(generic_update_time);
>  
> -/*
> - * This does the actual work of updating an inodes time or version.  Must have
> - * had called mnt_want_write() before calling this.
> - */
> -int inode_update_time(struct inode *inode, int flags)
> -{
> -	if (inode->i_op->update_time)
> -		return inode->i_op->update_time(inode, flags);
> -	generic_update_time(inode, flags);
> -	return 0;
> -}
> -EXPORT_SYMBOL(inode_update_time);
> -
>  /**
>   *	atime_needs_update	-	update the access time
>   *	@path: the &struct path to update
> @@ -2187,7 +2174,10 @@ void touch_atime(const struct path *path)
>  	 * We may also fail on filesystems that have the ability to make parts
>  	 * of the fs read only, e.g. subvolumes in Btrfs.
>  	 */
> -	inode_update_time(inode, S_ATIME);
> +	if (inode->i_op->update_time)
> +		inode->i_op->update_time(inode, S_ATIME);
> +	else
> +		generic_update_time(inode, S_ATIME);
>  	mnt_put_write_access(mnt);
>  skip_update:
>  	sb_end_write(inode->i_sb);
> @@ -2342,7 +2332,10 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
>  
>  	if (mnt_get_write_access_file(file))
>  		return 0;
> -	ret = inode_update_time(inode, sync_mode);
> +	if (inode->i_op->update_time)
> +		ret = inode->i_op->update_time(inode, sync_mode);
> +	else
> +		generic_update_time(inode, sync_mode);
>  	mnt_put_write_access_file(file);
>  	return ret;
>  }
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index c895146c1444..a09cebdb4881 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2665,7 +2665,6 @@ enum file_time_flags {
>  
>  extern bool atime_needs_update(const struct path *, struct inode *);
>  extern void touch_atime(const struct path *);
> -int inode_update_time(struct inode *inode, int flags);
>  
>  static inline void file_accessed(struct file *file)
>  {
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
