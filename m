Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F31CCFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=te4lXKbdfG+oeMsXQe/418Rn4UtYv8NsfJYPSICuZl0=; b=o2UCmQRaLyF2Kn
	FpcuiW87fAetaBegQOE3yM7ilICldvS/PuihFH3utO/5LlgMyqYLAXPymw8W+cOG1A8nz7m4YSdCB
	m0KQmin7x9j6Mpoeek+bSNPCfShZhnNHuee6xyzUyR5yxBFNp79f72fvydfSKyqh+53Eg48JCBJmC
	KGH3igfF52oOd7u1+S7vqlBIKb6SjvrqRgSd6KAIKYyGkWFOCuowV8UsMMxwNsYnCUmAIXeAuGj2h
	yaRVhSmcVxuYRQvEmvFlQYK5q0MOPk3VFzpDY6e/2Yu9XGhfvTJ5S4/FgMO0JrQE82X/p8i4gR/f5
	q6x+r0vb16eedCaMf85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWL0-0000000Bhzm-2Sz5;
	Mon, 24 Nov 2025 13:10:38 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWKx-0000000BhzI-1rKM
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 13:10:37 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1C6E5BED0;
	Mon, 24 Nov 2025 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9jDV8KGRUw6lUVv2vjHXgGxcuigsjgB3zkzS2kSogY=;
	b=qkeNiljPRctzzY6ar9Vl5AlTW2RVj/E6HUjC/5bLNJgu3jDIzKbpNVTSS/KKBo4pa0pGXU
	FdWOt66eMwwwIu/mRnEPEupFSkDIMVoKe0w/CAZk0nMJs7abDuFJlutqR2XoImkFmVzaDR
	vMiM7E4Uf2m6qumPf5Is3WcXWJ1adQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9jDV8KGRUw6lUVv2vjHXgGxcuigsjgB3zkzS2kSogY=;
	b=nCaUcsL4efjbxwPziMlivvNYYKBM0iU/pW4SdJfaRLoui3uhTC2rp6wWuydtDAUVLYky0J
	XuVTasIJtww2V4Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9jDV8KGRUw6lUVv2vjHXgGxcuigsjgB3zkzS2kSogY=;
	b=qkeNiljPRctzzY6ar9Vl5AlTW2RVj/E6HUjC/5bLNJgu3jDIzKbpNVTSS/KKBo4pa0pGXU
	FdWOt66eMwwwIu/mRnEPEupFSkDIMVoKe0w/CAZk0nMJs7abDuFJlutqR2XoImkFmVzaDR
	vMiM7E4Uf2m6qumPf5Is3WcXWJ1adQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r9jDV8KGRUw6lUVv2vjHXgGxcuigsjgB3zkzS2kSogY=;
	b=nCaUcsL4efjbxwPziMlivvNYYKBM0iU/pW4SdJfaRLoui3uhTC2rp6wWuydtDAUVLYky0J
	XuVTasIJtww2V4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93C213EA61;
	Mon, 24 Nov 2025 13:10:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kf4hJElZJGmzQgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 13:10:33 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 52B53A0A04; Mon, 24 Nov 2025 14:10:29 +0100 (CET)
Date: Mon, 24 Nov 2025 14:10:29 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 07/14] fs: return a negative error from
 generic_update_time
Message-ID: <6epbyvds7hmypmk6qfsmnvevbnt2msdbudknnn3ryx6szl5lwn@a2ydspgd2cd6>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-8-hch@lst.de>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.cz:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_051036_204353_CC7FACB9 
X-CRM114-Status: GOOD (  27.61  )
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

On Fri 14-11-25 07:26:10, Christoph Hellwig wrote:
> Now that no caller looks at the updated flags, switch generic_update_time
> to the same calling convention as the ->update_time method and return 0
> or a negative errno.
> 
> This prepares for adding non-blocking timestamp updates that could return
> -EAGAIN.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/gfs2/inode.c    | 3 +--
>  fs/inode.c         | 6 +++---
>  fs/ubifs/file.c    | 6 ++----
>  fs/xfs/xfs_iops.c  | 6 ++----
>  include/linux/fs.h | 2 +-
>  5 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 8a7ed80d9f2d..601c14a3ac77 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2242,8 +2242,7 @@ static int gfs2_update_time(struct inode *inode, int flags)
>  		if (error)
>  			return error;
>  	}
> -	generic_update_time(inode, flags);
> -	return 0;
> +	return generic_update_time(inode, flags);
>  }
>  
>  static const struct inode_operations gfs2_file_iops = {
> diff --git a/fs/inode.c b/fs/inode.c
> index d3edcc5baec9..74e672dd90aa 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2091,7 +2091,7 @@ EXPORT_SYMBOL(inode_update_timestamps);
>   * or S_VERSION need to be updated we attempt to update all three of them. S_ATIME
>   * updates can be handled done independently of the rest.
>   *
> - * Returns a S_* mask indicating which fields were updated.
> + * Returns a negative error value on error, else 0.
>   */
>  int generic_update_time(struct inode *inode, int flags)
>  {
> @@ -2103,7 +2103,7 @@ int generic_update_time(struct inode *inode, int flags)
>  	if (updated & S_VERSION)
>  		dirty_flags |= I_DIRTY_SYNC;
>  	__mark_inode_dirty(inode, dirty_flags);
> -	return updated;
> +	return 0;
>  }
>  EXPORT_SYMBOL(generic_update_time);
>  
> @@ -2335,7 +2335,7 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
>  	if (inode->i_op->update_time)
>  		ret = inode->i_op->update_time(inode, sync_mode);
>  	else
> -		generic_update_time(inode, sync_mode);
> +		ret = generic_update_time(inode, sync_mode);
>  	mnt_put_write_access_file(file);
>  	return ret;
>  }
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index ca41ce8208c4..3e119cb93ea9 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1379,10 +1379,8 @@ int ubifs_update_time(struct inode *inode, int flags)
>  			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
>  	int err, release;
>  
> -	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT)) {
> -		generic_update_time(inode, flags);
> -		return 0;
> -	}
> +	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
> +		return generic_update_time(inode, flags);
>  
>  	err = ubifs_budget_space(c, &req);
>  	if (err)
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index caff0125faea..0ace5f790006 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -1197,10 +1197,8 @@ xfs_vn_update_time(
>  
>  	if (inode->i_sb->s_flags & SB_LAZYTIME) {
>  		if (!((flags & S_VERSION) &&
> -		      inode_maybe_inc_iversion(inode, false))) {
> -			generic_update_time(inode, flags);
> -			return 0;
> -		}
> +		      inode_maybe_inc_iversion(inode, false)))
> +			return generic_update_time(inode, flags);
>  
>  		/* Capture the iversion update that just occurred */
>  		log_flags |= XFS_ILOG_CORE;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index a09cebdb4881..c1077ae7c6b2 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2823,7 +2823,7 @@ extern int current_umask(void);
>  extern void ihold(struct inode * inode);
>  extern void iput(struct inode *);
>  int inode_update_timestamps(struct inode *inode, int flags);
> -int generic_update_time(struct inode *, int);
> +int generic_update_time(struct inode *inode, int flags);
>  
>  /* /sys/fs */
>  extern struct kobject *fs_kobj;
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
