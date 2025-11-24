Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F392BCFD313
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UArTDzldrWLZbTr9lFBgEThBAiZB4dy2R9C+u/dVCo=; b=FBRV7YjQxP5DCF
	Tr9JQwOQDLYurCMAa/SbJvX2D0O/HOwv9zCr62mQFYRNBBGK18n8JKWK53EwKIyOP7gXShYsQH7fu
	RUFb3g78aPPHRldzhnfjKDwnninheo/ooC52Yp/+fv+7d6iQViarTFeZsMltytvVrdwVbSiBdRwT1
	KG5PzKsXlUYvJC93cEoja5zy5pAVHpfw3irAqy1S/zbwRrmUZ+SXOhJffjyf4JmY0qCH2TnMn3MQ4
	Rg7RccAHZjwntiMywe0yOP++FEGLfFObOGVfyWGsA97ssRDecr9+i793T4bvwpR9LetqU9qqpeN7E
	5wAcsGxPAOfjuyfjJWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWME-0000000Bi9A-2O7N;
	Mon, 24 Nov 2025 13:11:54 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWMC-0000000Bi8p-04iT
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 13:11:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E33CA222C7;
	Mon, 24 Nov 2025 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0lsXEAdncHKC+iIvFZWpZzizDLjJ9+9d0rHHBMqqOXM=;
	b=gPx+Dhom9+iDOEc/TSup2qzPx7cy/l17rb6LruIyeTd4EIY2Vv/C/do3MBWfDB3vkliBJ2
	LgBcPf7CjxmVMX1Fyzwh9QaPcE/w2wokAT64byZ9JzAig//swPOThW868+3DED7he8oGoc
	TmUkaSY6ldyeoUQcdNZ25Tnji396yhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0lsXEAdncHKC+iIvFZWpZzizDLjJ9+9d0rHHBMqqOXM=;
	b=4haRJEW17Kyv8sAgkxnqEnDSrzjB5a9hf8+hPzzVfE+bwRZ3Z1mwlJRFavfwxm8xBy1Nxr
	MCHgeGRmtIpW1PAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=rqzBLbAr;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=lJHobCq9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0lsXEAdncHKC+iIvFZWpZzizDLjJ9+9d0rHHBMqqOXM=;
	b=rqzBLbArP5u6nTdRRT+u3I1rMQcFYJ+EWaoTTUBX/Js5toMb99Vf3jjP8WIqNOXzGmLocX
	nl87VW3mmCZQuSyaTG1zUMCQLTdGW2B9RcgHmbdtYlDVaroXXnxC48TSNLfVRU9JZ6jzU9
	qeNkETY3kbCN3SFJHBv0vMrAUOB8aX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0lsXEAdncHKC+iIvFZWpZzizDLjJ9+9d0rHHBMqqOXM=;
	b=lJHobCq9ur5+oUO7lAdlCx/OuCP6bm35B5HwT0ctjaGHH3lCWUV/KHMv3M+kTyeCHJqoz+
	7Q0aU6eA5dZmAiDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8ACE3EA61;
	Mon, 24 Nov 2025 13:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A2fjNJVZJGk3RAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 13:11:49 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 8B407A0A04; Mon, 24 Nov 2025 14:11:49 +0100 (CET)
Date: Mon, 24 Nov 2025 14:11:49 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 08/14] fs: exit early in generic_update_time when there
 is no work
Message-ID: <znjzumoxtj77t5aaaogfzr6ypreal5djcjl4uf537i66ge6gss@si5pk32ogsx3>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-9-hch@lst.de>
X-Rspamd-Queue-Id: E33CA222C7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.cz:email,suse.cz:dkim]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_051152_372630_8F3A839A 
X-CRM114-Status: GOOD (  20.27  )
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

On Fri 14-11-25 07:26:11, Christoph Hellwig wrote:
> Exit early if not attributes are to be updated, to avoid a spurious call
		^^ no

> to __mark_inode_dirty which can turn into a fairly expensive no-op due to
> the extra checks and locking.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 74e672dd90aa..57c458ee548d 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2098,6 +2098,9 @@ int generic_update_time(struct inode *inode, int flags)
>  	int updated = inode_update_timestamps(inode, flags);
>  	int dirty_flags = 0;
>  
> +	if (!updated)
> +		return 0;
> +
>  	if (updated & (S_ATIME|S_MTIME|S_CTIME))
>  		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
>  	if (updated & S_VERSION)
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
