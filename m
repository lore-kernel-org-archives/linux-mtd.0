Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A2606A32D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNfJUjkV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=r58BF0D8;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=15TlV9Nr;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=r58BF0D8;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=15TlV9Nr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L5B3nhpjsO9eziC/9qwXqU9oPEZzYSmjRSWmQ62dnWo=; b=HNfJUjkV4c4isTrLDYqpjSdStR
	MphXrJ7iaWtQnrwuZI6iy02yQMdBjPte/5jsZ4Ub39UHLeDdQ96BKfXAwDuik3RWo/f9TRHx/nUVX
	gPJWg7D+eve4ROJcgdHyMVcOJb1ydgBkiB2o229ta6leoQd2qBjBwwwDbXKV+HQZePrRATKzYfwYG
	55NY81LPMfKxD9bFsVuG7cu5is5ikPMudzbU+wS3ID8d6U19WqovVdKRHXE4g3z1YOlYGYikz03af
	QkMDXCfE+b0lm5fRWmGhJFpq3LyXlb43TZLCIPaF3DSFRTdaizuD8qS3HYlj0aDTvIaTqxPw3Dn4C
	uRusaaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR96c-00000006vU6-27WG;
	Wed, 11 Nov 2026 14:15:18 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR96Z-00000006vTl-2dFy
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 14:15:16 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 09F3E22A5E;
	Wed, 11 Nov 2026 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794406512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iEM9kPeISwrg1hp3zFsHM5gU3S8hitOkRPQJum2vFMU=;
	b=r58BF0D8W8gzgIAphVb7+yXG4Wp0CzJfQUUtsAILSsDExswBBX2Vz1DZhrqDcoIpRX0ZTt
	0gBD9RMFaruNOsM+g+SXe7YVni3W376lEjHWkMsC8cv+03B46mcbwzWMdN6eutgUbVcR1I
	skb2yG6nBdMmWTQD7PkbKOeYbn2js8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794406512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iEM9kPeISwrg1hp3zFsHM5gU3S8hitOkRPQJum2vFMU=;
	b=15TlV9Nrfb6fbwPB+XQGAF9gQF4YSshvgg4Qr4JwuaNYvo4isPqFDJlR8PRYTR3/TFQArE
	KUe4A2NvjL7x2ZAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=r58BF0D8;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=15TlV9Nr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794406512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iEM9kPeISwrg1hp3zFsHM5gU3S8hitOkRPQJum2vFMU=;
	b=r58BF0D8W8gzgIAphVb7+yXG4Wp0CzJfQUUtsAILSsDExswBBX2Vz1DZhrqDcoIpRX0ZTt
	0gBD9RMFaruNOsM+g+SXe7YVni3W376lEjHWkMsC8cv+03B46mcbwzWMdN6eutgUbVcR1I
	skb2yG6nBdMmWTQD7PkbKOeYbn2js8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794406512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iEM9kPeISwrg1hp3zFsHM5gU3S8hitOkRPQJum2vFMU=;
	b=15TlV9Nrfb6fbwPB+XQGAF9gQF4YSshvgg4Qr4JwuaNYvo4isPqFDJlR8PRYTR3/TFQArE
	KUe4A2NvjL7x2ZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD61B134E5;
	Wed, 11 Nov 2026 14:15:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oMu1Jm949GpWAQAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 11 Nov 2026 14:15:11 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 475D422933; Wed, 11 Nov 2026 15:15:11 +0100 (CET)
Date: Wed, 11 Nov 2026 15:15:11 +0100
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH v2 04/34] ext2: don't set SB_RDONLY after filesystem
 errors
Message-ID: <za33axmgzmuzsj3zmfeh43fkphtcsqtkhhrauwuvs7aiftelgp@dzl6z322st5f>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-4-2f44f64f0b66@kernel.org>
 <5qefa4mracb3x2z4vsdejmkyyfrhdcrixmmnooz4rzwcdfoejm@mqkvixj6afwp>
 <20261110-kargheit-impfen-pausieren-881763d28b19@brauner>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110-kargheit-impfen-pausieren-881763d28b19@brauner>
X-Rspamd-Queue-Id: 09F3E22A5E
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-11.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_THREE(0.00)[3];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,vger.kernel.org,suse.com,zeniv.linux.org.uk,lists.sourceforge.net,lists.linux.dev,kvack.org,lists.infradead.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim]
X-Spam-Score: -11.51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_061515_841375_691CFA13 
X-CRM114-Status: GOOD (  22.54  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue 10-11-26 22:50:47, Christian Brauner wrote:
> On Thu, Nov 05, 2026 at 10:22:07AM +0100, Jan Kara wrote:
> > So shouldn't we just modify the sb_rdonly() check in sync_filesystem() to
> > use also sb_emergency_ro() and don't bother with modifying individual
> > filesystems?
> 
> The VFS patch I posted in v1 thread did that. I dropped it because
> of jfs. jfs keeps anonymous tlocks for every allocation that writeback
> hasn't committed yet. If sync_filesystem() bails after the error nothing
> commits them before evict_inodes() and jfs_evict_inode() hits the
> BUG_ON() for a non-empty anon_inode_list on umount.
> 
> Which is what happened before the series because the error set
> SB_RDONLY. jfs_reconfigure() relies on the same sync_filesystem() call
> when going read-only after the error.
> 
> jfs could commit them itself before evict_inodes() but that means a
> ->kill_sb() wrapper and a txQuiesce()-like walk over the global
> anon_list filtered by superblock. I don't think that's worth it.

OK, so instead of BUGing in jfs_evict_inode(), shouldn't JFS just do
something like:

-	BUG_ON(!list_empty(&ji->anon_inode_list));
+	if (!list_empty(&ji->anon_inode_list)) {
+		WARN_ON_ONCE(!sb_emergency_ro(inode->i_sb));
+		/* This needs helper in fs/jfs/jfs_txnmgr.c */
+		TXN_LOCK();
+		list_del_init(&ji->anon_inode_list);
+		TXN_UNLOCK();
+	}

So that JFS doesn't block everybody else? Because conceptually, once sb is
marked as emergency read-only, we really want to stop writeback so letting
sync_inodes() run seems moot.

> > Is this really needed? All the xattr operations go through mnt_want_write()
> > / mnt_want_write_file() so this should be caught in VFS...
> 
> Not the ones ecryptfs does on the lower filesystem...
> Hm, maybe we should make ecryptfs get write access to the lower mount
> instead and drop the xattr checks from the filesystems. Not sure.

Argh, also NFS I assume. OK, that won't be easy to get rid of AFAICT (we
generally don't have mount available there).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
