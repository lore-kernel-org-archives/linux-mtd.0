Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C86CFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0FkAh0r01jHssQHRXvLp+3HxQpLsb3g10ZZ0/Q3ZZw=; b=nVlH5KuKEQsrkP
	W0aHnCGIePaoz6c7PQRs+Hte8CelJ/ZvIjqT+nCfFU5fk8x/P2pBdP1nycLdL/SNW1KnsKZQzhpnP
	ogVLIAFAxWEN5x11x+nBqvbhigWre+kSB/BtpptILnoXwm8JP5w2HtDAA37fXUvrR50F5QwrUHPbq
	kqJM4LtIt6TLv9DqV37YH52X3jjgK+QDLT7j+bqzqyiK2r8+M1DCvXltB0GaCN+Qn6ri9BpRnwI6U
	iac7kKrAF0hfiMvCRmeeQdq8iP1Iva0MCA8a6JXxtihSIpXBpt+E8lD2ukS6+uhEPJRHeuzd4kG5T
	/EKASlDIlW+SsKCNo8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWJh-0000000Bhpp-0peq;
	Mon, 24 Nov 2025 13:09:17 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWJe-0000000Bhp7-3z2U
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 13:09:16 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CCD9E5BEC6;
	Mon, 24 Nov 2025 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB0YWuicgvPXomxR6M3TVXBKU7YurqUsSFo/jqmDaMc=;
	b=fbhNrGX8iw/PHX6sS3H2xeeJMdajfdjijZLWe++SFm07Hi4duhNv0HZ595X3L8bR6WXkfH
	9U2irAC1bj2tDXyEIersW84iRp+iNybn6lWkU2CeuVf+GTqaO5NpCGaMtzDjPok/+4UiTF
	yHgp0XXCadbh2mEjrZB/8X922UZiKu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB0YWuicgvPXomxR6M3TVXBKU7YurqUsSFo/jqmDaMc=;
	b=nVxXFIXT/hWIoCrRL67P4yeF3FV240AIGWiH/yaN4JA33x/la/yoQS0VZV8HQhbcMXv7K2
	uiqISbLaoFMHycBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="XgH/QFAa";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2d8GVMTF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1763989752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB0YWuicgvPXomxR6M3TVXBKU7YurqUsSFo/jqmDaMc=;
	b=XgH/QFAaCf3U8ALq4ZpE8y1ovZzgIRoiXeN2u7xxh8m4dyyI1kNbGX4/H9LdxHdtzgsRKo
	SPpcChg16jsLf1gE0UNGhvAqPO11Uqy78vqy/1K2oI2SGpTSInFvHgHg0vdbseDk5CT7V2
	MqYxJ12BKJ7+EwnwoHbt+K1xQ6dqQ9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1763989752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB0YWuicgvPXomxR6M3TVXBKU7YurqUsSFo/jqmDaMc=;
	b=2d8GVMTFLI1AnHz8T/C8QD1pWEemj67sPdQQdlaCPIO8OwPG4dlm/UKkmaQrYisooKfUGv
	04B4Or7QA9fCzdBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C143C3EA61;
	Mon, 24 Nov 2025 13:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gPkuL/hYJGlVQQAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 24 Nov 2025 13:09:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 694B9A0A04; Mon, 24 Nov 2025 14:09:12 +0100 (CET)
Date: Mon, 24 Nov 2025 14:09:12 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
	io-uring@vger.kernel.org, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 06/14] organgefs: use inode_update_timestamps directly
Message-ID: <sdgytii6x2ccqsxkocafhojt6h75n3e4kjdofasgo53mcgfc53@um6nkgxw2wt2>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-7-hch@lst.de>
X-Rspamd-Queue-Id: CCD9E5BEC6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_050915_155301_B8C92B18 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri 14-11-25 07:26:09, Christoph Hellwig wrote:
> Orangefs has no i_version handling and __orangefs_setattr already
> explicitly marks the inode dirty.  So instead of the using
> the flags return value from generic_update_time, just call the
> lower level inode_update_timestamps helper directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Besides the typo the change looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/orangefs/inode.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index a01400cd41fd..55f6c8026812 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -878,7 +878,9 @@ int orangefs_update_time(struct inode *inode, int flags)
>  
>  	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
>  	    get_khandle_from_ino(inode));
> -	flags = generic_update_time(inode, flags);
> +
> +	flags = inode_update_timestamps(inode, flags);
> +
>  	memset(&iattr, 0, sizeof iattr);
>          if (flags & S_ATIME)
>  		iattr.ia_valid |= ATTR_ATIME;
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
