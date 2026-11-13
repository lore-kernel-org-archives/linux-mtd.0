Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AECF606A332
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hhYNE+bt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=HbiPobah;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QBNwugyQ;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=HbiPobah;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QBNwugyQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2+U4/Es3VemFAvc6hiW7Q3hDF6jQ6drzh9KZoXNJA44=; b=hhYNE+btp3aiQIpnp9wnUzNLj1
	tdcV44Fi3uevA8+FbHNEnmADCo8Yk8Sd2ZZaNQzYz06nT5TGMbKoaC+/nhJC1ONwip0L3EJC/JkfL
	DhfSFeCigNNREDws5WM7kav4BfTZWMqdqSpH+QBxmmWmUbRTcz5OIvHkkrqMOdjygygZl/wppS7aY
	PcZaeWyhZ5lGCNgQf8v8bp/Rn5HLWctevTFDuSaqS3BqOJcjQq6LK3ROkZ5QtGpnPZqUtNF/Y3n33
	+oIqSxvxE5OocwdeV7amiHTbwA7C51P7tYjXLzXRkMOH5QScyoIHK6CUyjbM2Fo0qqRSc0d3/zGSs
	Ui103NGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsg6-0000000DGNH-38fr;
	Fri, 13 Nov 2026 14:54:58 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsfz-0000000DGIv-3mrJ
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 14:54:57 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0100E1F76B;
	Fri, 13 Nov 2026 14:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794581690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLg1wy+Nl3hNJVUViyQU914DrXr8uKXxDSBe+HH3+OI=;
	b=HbiPobahhoFdy1JualtlCQSG5WiHGbYkeN97T1slq4syz8ydxAAmyFBMnw9wIWMymvWQBA
	OibY1yJc8woYnm917MtaAgfxA3/FGLQWnqOg9S4/Gje0GR/2m8TO3d0XcGyF5ZnSISlDva
	Pm+cC9vb75/3LpW2TrEGkQOayOm27Hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794581690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLg1wy+Nl3hNJVUViyQU914DrXr8uKXxDSBe+HH3+OI=;
	b=QBNwugyQn7fvnUpfJc61DDJ3B5ezL3Vu/dwAt7y/gE33yL9lBDupL5AB9JAf8phimNZdBs
	djr90So7chpqQRAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794581690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLg1wy+Nl3hNJVUViyQU914DrXr8uKXxDSBe+HH3+OI=;
	b=HbiPobahhoFdy1JualtlCQSG5WiHGbYkeN97T1slq4syz8ydxAAmyFBMnw9wIWMymvWQBA
	OibY1yJc8woYnm917MtaAgfxA3/FGLQWnqOg9S4/Gje0GR/2m8TO3d0XcGyF5ZnSISlDva
	Pm+cC9vb75/3LpW2TrEGkQOayOm27Hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794581690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLg1wy+Nl3hNJVUViyQU914DrXr8uKXxDSBe+HH3+OI=;
	b=QBNwugyQn7fvnUpfJc61DDJ3B5ezL3Vu/dwAt7y/gE33yL9lBDupL5AB9JAf8phimNZdBs
	djr90So7chpqQRAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBF48134C3;
	Fri, 13 Nov 2026 14:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hybEI7kk92pSFgAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 13 Nov 2026 14:54:49 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 50A352396E; Fri, 13 Nov 2026 15:54:49 +0100 (CET)
Date: Fri, 13 Nov 2026 15:54:49 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH v3 06/33] ext2: don't set SB_RDONLY after filesystem
 errors
Message-ID: <wsdk673ps54ncvmj7xvgzghgcf7y27uw4w7ahrgbytdy6tdxg3@ldvmi2yk3lm7>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-6-0be92bb73709@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-6-0be92bb73709@kernel.org>
X-Spamd-Result: default: False [-11.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,zeniv.linux.org.uk,lists.sourceforge.net,lists.linux.dev,kvack.org,lists.infradead.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.30
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065456_089318_19836C02 
X-CRM114-Status: GOOD (  28.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri 13-11-26 12:59:02, Christian Brauner wrote:
> With errors=remount-ro ext2_error() sets SB_RDONLY from whatever context
> hit the error and without holding s_umount. That races with everyone
> else changing sb->s_flags and it breaks freezing. If it happens while
> the filesystem is frozen thaw_super() sees a read-only superblock and
> leaves the s_writers rwsems locked so every writer hangs. A lookup in a
> corrupted directory is enough. Karl proposed teaching thaw_super() about
> it but Jan preferred fixing the filesystems (cf. [1]) like ext4 and f2fs
> already did.
> 
> So call sb_set_emergency_ro() instead and let the VFS refuse
> modifications. ext2 still refuses allocations and ext2_xattr_set()
> itself, ecryptfs calls the latter without write access on the lower
> mount. Unlinked inodes are left to e2fsck. ext2_write_inode() keeps
> working because writeback still writes data, bitmaps, indirect and
> directory blocks after the error and they'd be lost without the inode.
> A thaw after an error while frozen still writes the superblock but
> EXT2_ERROR_FS stays set in it.
> 
> After a remount to read-only a remount to read-write fails until umount.
> A plain remount to read-write right after the error succeeds but the
> filesystem stays read-only. Writes through file descriptors opened
> before the error fail with EROFS.
> 
> [1]: https://lore.kernel.org/r/hyhuckyohsabx2suvq3z7uy3pbgmihva6wgzxr3op7pzcrlu33@p7zzlgp2ehjf
> 
> Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
> Link: https://lore.kernel.org/r/20260903060855.4610-1-kmehltretter@gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext2/balloc.c |  5 +++++
>  fs/ext2/ialloc.c |  2 ++
>  fs/ext2/inode.c  |  4 +++-
>  fs/ext2/super.c  | 13 ++++++++-----
>  fs/ext2/xattr.c  |  2 ++
>  5 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
> index 80acc1e193871..77f2ed5a76a28 100644
> --- a/fs/ext2/balloc.c
> +++ b/fs/ext2/balloc.c
> @@ -1236,6 +1236,11 @@ ext2_fsblk_t ext2_new_blocks(struct inode *inode, ext2_fsblk_t goal,
>  	*errp = -ENOSPC;
>  	sb = inode->i_sb;
>  
> +	if (sb_emergency_ro(sb)) {
> +		*errp = -EROFS;
> +		return 0;
> +	}
> +
>  	/*
>  	 * Check quota for allocation of this block.
>  	 */
> diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
> index bf21b57cf98cd..2741ecd2b94fc 100644
> --- a/fs/ext2/ialloc.c
> +++ b/fs/ext2/ialloc.c
> @@ -433,6 +433,8 @@ struct inode *ext2_new_inode(struct inode *dir, umode_t mode,
>  	int err;
>  
>  	sb = dir->i_sb;
> +	if (sb_emergency_ro(sb))
> +		return ERR_PTR(-EROFS);
>  	inode = new_inode(sb);
>  	if (!inode)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
> index 12ac4cfe15003..dd28637c60737 100644
> --- a/fs/ext2/inode.c
> +++ b/fs/ext2/inode.c
> @@ -71,7 +71,9 @@ void ext2_evict_inode(struct inode * inode)
>  	struct ext2_block_alloc_info *rsv;
>  	int want_delete = 0;
>  
> -	if (!inode->i_nlink && !is_bad_inode(inode)) {
> +	/* After an error made us read-only the inode is left to e2fsck. */
> +	if (!inode->i_nlink && !is_bad_inode(inode) &&
> +	    !sb_emergency_ro(inode->i_sb)) {
>  		want_delete = 1;
>  		dquot_initialize(inode);
>  	} else {
> diff --git a/fs/ext2/super.c b/fs/ext2/super.c
> index fb217ef2d69f0..10d5165459749 100644
> --- a/fs/ext2/super.c
> +++ b/fs/ext2/super.c
> @@ -53,7 +53,7 @@ void ext2_error(struct super_block *sb, const char *function,
>  	struct ext2_sb_info *sbi = EXT2_SB(sb);
>  	struct ext2_super_block *es = sbi->s_es;
>  
> -	if (!sb_rdonly(sb)) {
> +	if (!sb_rdonly_any(sb)) {
>  		spin_lock(&sbi->s_lock);
>  		sbi->s_mount_state |= EXT2_ERROR_FS;
>  		es->s_state |= cpu_to_le16(EXT2_ERROR_FS);
> @@ -73,11 +73,11 @@ void ext2_error(struct super_block *sb, const char *function,
>  
>  	if (test_opt(sb, ERRORS_PANIC))
>  		panic("EXT2-fs: panic from previous error\n");
> -	if (!sb_rdonly(sb) && test_opt(sb, ERRORS_RO)) {
> +	/* SB_RDONLY needs s_umount, see sb_set_emergency_ro(). */
> +	if (!sb_rdonly(sb) && test_opt(sb, ERRORS_RO) &&
> +	    sb_set_emergency_ro(sb))
>  		ext2_msg(sb, KERN_CRIT,
>  			     "error: remounting filesystem read-only");
> -		sb->s_flags |= SB_RDONLY;
> -	}
>  }
>  
>  static void ext2_msg_fc(struct fs_context *fc, const char *prefix,
> @@ -179,7 +179,7 @@ static void ext2_put_super (struct super_block * sb)
>  	ext2_xattr_destroy_cache(sbi->s_ea_block_cache);
>  	sbi->s_ea_block_cache = NULL;
>  
> -	if (!sb_rdonly(sb)) {
> +	if (!sb_rdonly_any(sb)) {
>  		struct ext2_super_block *es = sbi->s_es;
>  
>  		spin_lock(&sbi->s_lock);
> @@ -1360,6 +1360,9 @@ static int ext2_reconfigure(struct fs_context *fc)
>  	if ((bool)(flags & SB_RDONLY) == sb_rdonly(sb))
>  		goto out_set;
>  	if (flags & SB_RDONLY) {
> +		/* After an error nothing may be written, just go read-only. */
> +		if (sb_emergency_ro(sb))
> +			goto out_set;
>  		if (le16_to_cpu(es->s_state) & EXT2_VALID_FS ||
>  		    !(sbi->s_mount_state & EXT2_VALID_FS))
>  			goto out_set;
> diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
> index 8f608930a48c6..12dfffff189cb 100644
> --- a/fs/ext2/xattr.c
> +++ b/fs/ext2/xattr.c
> @@ -429,6 +429,8 @@ ext2_xattr_set(struct inode *inode, int name_index, const char *name,
>  	ea_idebug(inode, "name=%d.%s, value=%p, value_len=%ld",
>  		  name_index, name, value, (long)value_len);
>  
> +	if (sb_emergency_ro(sb))
> +		return -EROFS;
>  	if (value == NULL)
>  		value_len = 0;
>  	if (name == NULL)
> 
> -- 
> 2.53.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
