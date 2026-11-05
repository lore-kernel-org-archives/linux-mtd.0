Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968C606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qnFGRgwK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=n50o8Nho;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vEObjVwj;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=2cOYoXtK;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xNpdsHrD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WxzOsb1j9CjvhDThigLOdDHhnkVpC5ko4BXmjVXOIDc=; b=qnFGRgwK8IR+bHnUCTWNs5AmlJ
	HMgxw31F29DLyu7POa9y8oGKLsoWl/EHLFb6CFV1r6CGkJf0g/ObQpqG8+YbQ1rtXCR/7FRx6x88p
	3O739petBPUn0jTj+Q7aMNDtcTF6Hnli8UGbI6dS+KZtDBitbgE7SrwgBQ7we5aZS3W6UTrNzQdEq
	dm+RZCfs9PT1CICKSmEaMeRm3ITufiH+dg3Hx9xxgiwpNlS5F3ooI/fqXxUB4SbK6xPkMB8bv5qWj
	7WE0DVU1U3JH98rSQPTG6fmHM7ukzZjtVo+0aq5lN7gw9dLuGJUfxrxXuyThPkuer6K1V2qBnKLSC
	N5WiZuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtfl-00000008HZ4-3Lwl;
	Thu, 05 Nov 2026 09:22:17 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtfe-00000008HXc-2EBq
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 09:22:16 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F1BB621E6B;
	Thu,  5 Nov 2026 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793870529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTIcajMvJ+OWgJyNOSohDPENY0WS7vKpG0J7UU3y4=;
	b=n50o8NhoUcr4RCi/B4rIsia/X2BPL0xvAZqFp6JcVaXbZfzT/RTxiBntW4h00kVQGa6Adw
	BoZgFvLF8XedTFomzkc3T1PyMdrQx7jS1R9+mgt1K6CyVCzEcEHQMaqYV1coIn8BosvIE6
	1mdP0qlalo/s/vwRKzpCaU5hyRKm15E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793870529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTIcajMvJ+OWgJyNOSohDPENY0WS7vKpG0J7UU3y4=;
	b=vEObjVwj9IoYCWGtblG300EgQss9NlqG2oQadAEYX85TWpmXLFO3Kp4hDBJ5PF1rLfqJsZ
	UQBKm7Amz6f/XsBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793870528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTIcajMvJ+OWgJyNOSohDPENY0WS7vKpG0J7UU3y4=;
	b=2cOYoXtKQsnGxKetXHmlYmsgdtzx4dKmzc4TKkHro1fVmuXVkT6aeMOQnia12G6yDV2PP8
	3d1d5nW7OM8023OYjhcxzn4r5MBadUUW/5fKMphJggjyFhvt6zOxv0YmYZBEEwDfWpx6eG
	o2RmagT5J5MIADePkoerRdmpGGEJ0aw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793870528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ORTIcajMvJ+OWgJyNOSohDPENY0WS7vKpG0J7UU3y4=;
	b=xNpdsHrD+svQDtDWU8bkw0RsFYdBqvO0lz4aSu1a0Q9BoRVeC++GKGYW8dvo9pxsLw8pv9
	oK8gPfGxFQDXWCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C188F134F4;
	Thu,  5 Nov 2026 09:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0RUpJ79K7GoMZQAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 05 Nov 2026 09:22:07 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 52E39B65F; Thu, 05 Nov 2026 10:22:07 +0100 (CET)
Date: Thu, 5 Nov 2026 10:22:07 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH v2 04/34] ext2: don't set SB_RDONLY after filesystem
 errors
Message-ID: <5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-4-2f44f64f0b66@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-4-2f44f64f0b66@kernel.org>
X-Spamd-Result: default: False [-11.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,zeniv.linux.org.uk,lists.sourceforge.net,lists.linux.dev,kvack.org,lists.infradead.org,gmail.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.30
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_012210_723757_43877D88 
X-CRM114-Status: GOOD (  24.35  )
X-Spam-Score: -4.4 (----)
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

On Thu 29-10-26 17:06:55, Christian Brauner wrote:
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
> modifications. ext2 still refuses allocations, ext2_write_inode(),
> ext2_sync_fs() and ext2_xattr_set() itself. The superblock isn't written
> after the error is recorded and unlinked inodes are left to e2fsck.
> ext2_handle_dirsync() treats EROFS as success in that state because the
> entry was already changed.
> 
> A remount to read-write fails until umount and writes through file
> descriptors opened before the error fail with EROFS.
> 
> [1]: https://lore.kernel.org/r/hyhuckyohsabx2suvq3z7uy3pbgmihva6wgzxr3op7pzcrlu33@p7zzlgp2ehjf
> 
> Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
> Link: https://lore.kernel.org/r/20260903060855.4610-1-kmehltretter@gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Nothing critical but couple of points for discussion:

> @@ -1287,6 +1287,10 @@ static int ext2_sync_fs(struct super_block *sb, int wait)
>  	struct ext2_sb_info *sbi = EXT2_SB(sb);
>  	struct ext2_super_block *es = EXT2_SB(sb)->s_es;
>  
> +	/* Nothing may be written after an error made us read-only. */
> +	if (sb_emergency_ro(sb))
> +		return 0;
> +

So shouldn't we just modify the sb_rdonly() check in sync_filesystem() to
use also sb_emergency_ro() and don't bother with modifying individual
filesystems?

> @@ -1307,6 +1311,9 @@ static int ext2_freeze(struct super_block *sb)
>  {
>  	struct ext2_sb_info *sbi = EXT2_SB(sb);
>  
> +	if (sb_emergency_ro(sb))
> +		return 0;
> +

Also if we have the check in sync_filesystem(), then freeze_super() is
generally going to fail so this check could trigger only if
sb_emergency_ro() was set after sync_filesystem() ran and before we called
->freeze_fs(). Since sb_emergency_ro() checking is pretty much guaranteed
to be racy (it is just a best effort framework to limit damage), we
probably don't have to bother with checking in ->freeze_fs() handlers.

> @@ -1349,7 +1356,9 @@ static int ext2_reconfigure(struct fs_context *fc)
>  	int flags = fc->sb_flags;
>  	int err;
>  
> -	sync_filesystem(sb);
> +	/* Nothing may be written after an error made us read-only. */
> +	if (!sb_emergency_ro(sb))
> +		sync_filesystem(sb);

If there's a check in sync_filesystem(), this change can go away.

> diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
> index 8f608930a48c..12dfffff189c 100644
> --- a/fs/ext2/xattr.c
> +++ b/fs/ext2/xattr.c
> @@ -429,6 +429,8 @@ ext2_xattr_set(struct inode *inode, int name_index, const char *name,
>  	ea_idebug(inode, "name=%d.%s, value=%p, value_len=%ld",
>  		  name_index, name, value, (long)value_len);
>  
> +	if (sb_emergency_ro(sb))
> +		return -EROFS;

Is this really needed? All the xattr operations go through mnt_want_write()
/ mnt_want_write_file() so this should be caught in VFS...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
