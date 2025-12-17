Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C488DD65559
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Dec 2025 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XBjVKdEvQ6Xf4AMtX/31REH60TDsn4ckdNrdPqNAlA=; b=3BAb4icQHzU62y
	lN+tkR7vB8Iw0iKEn586PJDDDC8u3T0ubezHpkNEnUfi7G6Sz2lccWtcugaTRIOFwU63ECOqPBuoh
	5WJT6ZNFXWTCvfPjgZTOOC655vj/JWLq6RhEZj5yvlDkOqMrPdIVF5U2d3fjI/d61gLNyV1fN/PuM
	3ssGXHIRl4hHCATGyUArv5d5cE8kbziCiYUd/vjToli63IgGkPUPLZImUvhfanszzrX/bcfl3Mk4e
	A6K1lzKngDtut6vRMeS3a08bv9lnUoDtVdGMGm0x5ojSqVo5a5uAoKCZ4mqfrcGyHRLB+/2gQzq7d
	VQ8Ax6+LWFjmuoR2qSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqrP-00000006nP8-1R6N;
	Wed, 17 Dec 2025 12:42:31 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqrM-00000006nOb-26Uo
	for linux-mtd@lists.infradead.org;
	Wed, 17 Dec 2025 12:42:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 186F85BCF8;
	Wed, 17 Dec 2025 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1765975345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MvZL3WPwwLagDUEBdiS3N24cxsJRy97UBGLmu0SgiWg=;
	b=a56aVGMj0kst528k5fM83MBSiUUP1ExJ6+hm7lKF4DuthbszXMhLRK/4prA/Xi3veetPsL
	1FxXQGEYI6xeyYruR72CLCodkv7S0DG7gCJocLY2hiU3g32mscOCAVLKTQfytgbtlvc/h3
	N3zyCJl7agpHI8TlOxMklJ9D7MzAOPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1765975345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MvZL3WPwwLagDUEBdiS3N24cxsJRy97UBGLmu0SgiWg=;
	b=EM2At4C2BKWwLeD76Gc7lnI11b5w81+nDNLjgylvh8PQ29xLBA5OEhNJCJw0CzZQrz9PFD
	EowZTDQSfM684EDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=a56aVGMj;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=EM2At4C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1765975345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MvZL3WPwwLagDUEBdiS3N24cxsJRy97UBGLmu0SgiWg=;
	b=a56aVGMj0kst528k5fM83MBSiUUP1ExJ6+hm7lKF4DuthbszXMhLRK/4prA/Xi3veetPsL
	1FxXQGEYI6xeyYruR72CLCodkv7S0DG7gCJocLY2hiU3g32mscOCAVLKTQfytgbtlvc/h3
	N3zyCJl7agpHI8TlOxMklJ9D7MzAOPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1765975345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MvZL3WPwwLagDUEBdiS3N24cxsJRy97UBGLmu0SgiWg=;
	b=EM2At4C2BKWwLeD76Gc7lnI11b5w81+nDNLjgylvh8PQ29xLBA5OEhNJCJw0CzZQrz9PFD
	EowZTDQSfM684EDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E58B43EA63;
	Wed, 17 Dec 2025 12:42:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZTlhNzClQmnEJQAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 17 Dec 2025 12:42:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 3CC90A0927; Wed, 17 Dec 2025 13:42:20 +0100 (CET)
Date: Wed, 17 Dec 2025 13:42:20 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	gfs2@lists.linux.dev, io-uring@vger.kernel.org, devel@lists.orangefs.org, 
	linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 08/10] fs: add support for non-blocking timestamp updates
Message-ID: <2hnq54zc4x2fpxkpuprnrutrwfp3yi5ojntu3e3xfcpeh6ztei@2fwwsemx4y5z>
References: <20251217061015.923954-1-hch@lst.de>
 <20251217061015.923954-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251217061015.923954-9-hch@lst.de>
X-Rspamd-Queue-Id: 186F85BCF8
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim,lst.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_044228_693319_762559DB 
X-CRM114-Status: GOOD (  22.70  )
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

On Wed 17-12-25 07:09:41, Christoph Hellwig wrote:
> Currently file_update_time_flags unconditionally returns -EAGAIN if any
> timestamp needs to be updated and IOCB_NOWAIT is passed.  This makes
> non-blocking direct writes impossible on file systems with granular
> enough timestamps.
> 
> Add a S_NOWAIT to ask for timestamps to not block, and return -EAGAIN in
> all methods for now.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>

...

> @@ -2110,12 +2110,26 @@ int inode_update_timestamps(struct inode *inode, int *flags)
>  		now = inode_set_ctime_current(inode);
>  		if (!timespec64_equal(&now, &ctime))
>  			updated |= S_CTIME;
> -		if (!timespec64_equal(&now, &mtime)) {
> -			inode_set_mtime_to_ts(inode, now);
> +		if (!timespec64_equal(&now, &mtime))
>  			updated |= S_MTIME;
> +
> +		if (IS_I_VERSION(inode)) {
> +			if (*flags & S_NOWAIT) {
> +				/*
> +				 * Error out if we'd need timestamp updates, as
> +				 * the generally requires blocking to dirty the
> +				 * inode in one form or another.
> +				 */
> +				if (updated && inode_iversion_need_inc(inode))
> +					goto bail;

I'm confused here. What the code does is that if S_NOWAIT is set and
i_version needs increment we bail. However the comment as well as the
changelog speaks about timestamps needing update and not about i_version.
And intuitively I agree that if any timestamp is updated, inode needs
dirtying and thus we should bail regardless of whether i_version is updated
as well or not. What am I missing?

								Honza

> +			} else {
> +				if (inode_maybe_inc_iversion(inode, updated))
> +					updated |= S_VERSION;
> +			}
>  		}
> -		if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, updated))
> -			updated |= S_VERSION;
> +
> +		if (updated & S_MTIME)
> +			inode_set_mtime_to_ts(inode, now);
>  	} else {
>  		now = current_time(inode);
>  	}
> @@ -2131,6 +2145,9 @@ int inode_update_timestamps(struct inode *inode, int *flags)
>  
>  	*flags = updated;
>  	return 0;
> +bail:
> +	*flags = 0;
> +	return -EAGAIN;
>  }
>  EXPORT_SYMBOL(inode_update_timestamps);
>  
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
