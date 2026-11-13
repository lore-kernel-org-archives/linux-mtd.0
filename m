Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FCF606A323
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ho1H+ura;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=ioMmpLVr;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9ZDId9b8;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=ioMmpLVr;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9ZDId9b8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b6nBs52wUc2e1CRJdkKI4gPknhf/PWH5VKkRUCclONs=; b=Ho1H+uragKHX1j28FihF6gSDmU
	OtzuSQgy2emmKbddUzZgJmpevEGsxCEPO5J6JbffGmn2URvoN6dJQH8gfRhl+j60kODE8QgPwSq1g
	Ot4Zt3EKJvjREfYIZFsXdR9/HMR/qi1WEb6oVhimkAGHm20/3EtK5AERzx/zWgS9KxDr4/Mnpodl7
	2ra8xpehHdEjk6PNMqHNimgMV4qpSO22gPEY40pj4rM/UgT4Ut95iLfU6nn/cpb+NF9F0BxLzTrgs
	oOgpczoaYUCHYc6+E4WNfSnEIvWhZPxLtFYQiJ1GdYVNAf4q7qeNdldZYITWfmgcg8EMVM91VPkTi
	+vjTai3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsf7-0000000DG1e-07DC;
	Fri, 13 Nov 2026 14:53:57 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsf2-0000000DFzr-1bzX
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 14:53:56 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5FB0421FAC;
	Fri, 13 Nov 2026 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794581630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=395YDkxERGkERftBnzeIEZcPQVVqMstX985T2iiyf8A=;
	b=ioMmpLVrVycBwQTgA9eNAfyAsyyURDxmI0Fpb2RpBJ61iKIAJ/x5mT8/Jnn0mFbn1SRP4q
	anRnd1zCml/8FXpIsmG31jBvjpFU+3Belrk3hBl0C8Vs7RQ5C3Jb4qyE1TOJACDnbLkyOR
	ZHp4pK+r/vBBUm5kRz6IJSUnHsKLA5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794581630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=395YDkxERGkERftBnzeIEZcPQVVqMstX985T2iiyf8A=;
	b=9ZDId9b8i3xRqf/vzV+Qe7ixhSr62gcfP9QE5YMJXMpSIhCGDx5uqBSpMJWsnQhjaZ2AmU
	qi7hnDqlbKzvp6BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ioMmpLVr;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=9ZDId9b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794581630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=395YDkxERGkERftBnzeIEZcPQVVqMstX985T2iiyf8A=;
	b=ioMmpLVrVycBwQTgA9eNAfyAsyyURDxmI0Fpb2RpBJ61iKIAJ/x5mT8/Jnn0mFbn1SRP4q
	anRnd1zCml/8FXpIsmG31jBvjpFU+3Belrk3hBl0C8Vs7RQ5C3Jb4qyE1TOJACDnbLkyOR
	ZHp4pK+r/vBBUm5kRz6IJSUnHsKLA5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794581630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=395YDkxERGkERftBnzeIEZcPQVVqMstX985T2iiyf8A=;
	b=9ZDId9b8i3xRqf/vzV+Qe7ixhSr62gcfP9QE5YMJXMpSIhCGDx5uqBSpMJWsnQhjaZ2AmU
	qi7hnDqlbKzvp6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38DC6134C3;
	Fri, 13 Nov 2026 14:53:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gu/ZB34k92oEFQAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 13 Nov 2026 14:53:50 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id B81542396C; Fri, 13 Nov 2026 15:53:49 +0100 (CET)
Date: Fri, 13 Nov 2026 15:53:49 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-mm@kvack.org, ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3 05/33] fs: add a generic emergency read-only state
Message-ID: <wpmkheecl35h56u4zadxrg67ysjowyahmcgjgftch3l2yxwkso@4vq74eptdmmd>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-5-0be92bb73709@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-5-0be92bb73709@kernel.org>
X-Rspamd-Queue-Id: 5FB0421FAC
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-11.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	URIBL_BLOCKED(0.00)[suse.com:email,suse.cz:dkim,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim,suse.cz:email]
X-Spam-Score: -11.51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065352_591787_F312AE0D 
X-CRM114-Status: GOOD (  27.23  )
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

On Fri 13-11-26 12:59:01, Christian Brauner wrote:
> ext4 and f2fs don't set SB_RDONLY after errors anymore and refuse
> modifications themselves. Doing that in all the other filesystems means
> the same checks in ->open, ->setattr, ->fsync, the directory and quota
> operations and ->reconfigure everywhere. Jan suggested a flag in the
> superblock instead so the VFS can do it once (cf. [1]).
> 
> So add sb->s_state with SB_STATE_EMERGENCY_RO. It's only ever set and
> never cleared and SB_RDONLY stays untouched. A filesystem calls
> sb_set_emergency_ro() where it used to set SB_RDONLY and the VFS refuses
> modifications wherever sb_rdonly() would:
> 
> - __mnt_is_readonly() and sb_permission(), so everything that takes
>   write access through mnt_want_write(), mnt_want_write_file() or
>   mnt_get_write_access()
> - notify_change(), rw_verify_area(), remap_verify_area(),
>   vfs_fallocate(), vfs_fsync_range() and do_page_mkwrite() for files
>   opened before the error
> - reconfigure_super() going read-write
> - the dquot code and quotactl(2)
> - sync_filesystem() and the per-superblock passes of sync(2)
> 
> sb_rdonly_any() is true for a read-only mount and for the emergency
> state so nobody has to open-code the pair.
> 
> So umount and the ->reconfigure() implementations that sync first don't
> write such a superblock anymore either. syncfs(2) and Q_SYNC fail with
> EROFS so userspace learns that nothing was written. Jan suggested that
> (cf. [2]).
> 
> freeze_super() refuses a new freeze with EROFS. Nothing is synced
> anymore so the flusher would keep writing to the frozen filesystem.
> Joining a freeze that's already in effect still works and thaw_super()
> is unchanged so an error while frozen is undone cleanly. FIFREEZE and dm
> suspend with lockfs fail on an errored filesystem now, like they already
> did for ext4.
> 
> /proc/mounts, statmount() and statfs() report the superblock as
> read-only. "emergency_ro" isn't shown as a mount option because remount
> helpers pass the shown options back.
> 
> The filesystem still has to refuse what doesn't go through the VFS: its
> allocators, its journal and deleting unlinked inodes. Writeback isn't
> stopped. The flusher, sync_bdevs() in sync(2) and sync_blockdev() in
> kill_block_super() keep writing, so the filesystem decides what its
> writeback still writes. Without a journal refusing only part of it
> leaves the disk inconsistent. ext4 refuses data writeback in that state,
> jfs commits the allocations writeback hasn't committed yet. The VFS
> can't decide that.
> 
> [1]: https://lore.kernel.org/r/my2k7257m265fp5ad77n5hfndl23i56gsog3jwnsyocp3yxbnj@aphfqdiej2hs
> [2]: https://lore.kernel.org/r/5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp
> 
> Suggested-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Just one nit below. Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

> diff --git a/fs/quota/quota.c b/fs/quota/quota.c
> index 33bacd7075800..b488fb1f9cc44 100644
> --- a/fs/quota/quota.c
> +++ b/fs/quota/quota.c
> @@ -783,6 +783,19 @@ static int do_quotactl(struct super_block *sb, int type, int cmd, qid_t id,
>  	if (ret < 0)
>  		return ret;
>  
> +	/* An error made the filesystem read-only. */
> +	if (sb_emergency_ro(sb)) {
> +		switch (cmd) {
> +		case Q_QUOTAON:
> +		case Q_SETINFO:
> +		case Q_SETQUOTA:
> +		case Q_XQUOTAON:
> +		case Q_XQUOTARM:
> +		case Q_XSETQLIM:
> +			return -EROFS;
> +		}

I'd use existing quotactl_cmd_write() helper for this.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
